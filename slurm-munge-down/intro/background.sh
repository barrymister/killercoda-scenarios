#!/bin/bash
# --- Bring up a real single-node Slurm cluster on the ubuntu backend ---
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq >/dev/null 2>&1 || true
apt-get install -y -qq slurm-wlm munge >/dev/null 2>&1 || true

# munge shared-secret auth
if [ ! -s /etc/munge/munge.key ]; then
  /usr/sbin/create-munge-key -f >/dev/null 2>&1 || dd if=/dev/urandom of=/etc/munge/munge.key bs=1024 count=1 >/dev/null 2>&1
fi
chown munge:munge /etc/munge/munge.key 2>/dev/null || true
chmod 400 /etc/munge/munge.key 2>/dev/null || true

CPUS=$(nproc)
mkdir -p /etc/slurm /etc/slurm-llnl /var/spool/slurmctld /var/spool/slurmd
cat >/etc/slurm/slurm.conf <<CONF
ClusterName=devbench
SlurmctldHost=localhost
AuthType=auth/munge
ProctrackType=proctrack/linuxproc
ReturnToService=2
SlurmUser=slurm
StateSaveLocation=/var/spool/slurmctld
SlurmdSpoolDir=/var/spool/slurmd
SlurmctldPidFile=/run/slurmctld.pid
SlurmdPidFile=/run/slurmd.pid
SchedulerType=sched/backfill
SelectType=select/cons_tres
SelectTypeParameters=CR_Core
NodeName=localhost CPUs=${CPUS} RealMemory=500 State=UNKNOWN
PartitionName=debug Nodes=ALL Default=YES MaxTime=INFINITE State=UP
CONF
cp /etc/slurm/slurm.conf /etc/slurm-llnl/slurm.conf 2>/dev/null || true
chown -R slurm: /var/spool/slurmctld /var/spool/slurmd 2>/dev/null || true

# Start munge + Slurm daemons (systemd if present, else run directly)
systemctl enable --now munge     >/dev/null 2>&1 || service munge start >/dev/null 2>&1 || (sudo -u munge /usr/sbin/munged >/dev/null 2>&1 || /usr/sbin/munged --force >/dev/null 2>&1)
systemctl enable --now slurmctld >/dev/null 2>&1 || slurmctld >/dev/null 2>&1 || true
systemctl enable --now slurmd    >/dev/null 2>&1 || slurmd    >/dev/null 2>&1 || true
sleep 3
scontrol update nodename=localhost state=resume >/dev/null 2>&1 || true

# FAULT: stop munge so all Slurm auth fails
systemctl stop munge >/dev/null 2>&1 || pkill -x munged >/dev/null 2>&1 || true
rm -f /run/munge/munge.socket.2 2>/dev/null || true
