#!/bin/bash
apt-get install -y cron >/dev/null 2>&1 || true
service cron start >/dev/null 2>&1 || systemctl start cron >/dev/null 2>&1 || true
printf '#!/bin/bash\ndate >> /root/beat.log\n' > /root/beat.sh
chmod +x /root/beat.sh
# Broken: only 4 time fields instead of 5, so cron rejects/ignores the line
( echo '*/1 * * * /root/beat.sh' ) | crontab -
