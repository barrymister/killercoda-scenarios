# The cron job isn't firing

A cron entry is supposed to run `/root/beat.sh` every minute, which appends a
timestamp to `/root/beat.log`. But the log never grows — the job simply isn't
running. Find out why and fix the schedule.
