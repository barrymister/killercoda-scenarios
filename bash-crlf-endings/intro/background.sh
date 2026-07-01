#!/bin/bash
# Write the script with CRLF (\r\n) line endings — the classic Windows-edit bug.
printf '#!/bin/bash\r\necho ok > /root/build.done\r\n' > /root/build.sh
chmod +x /root/build.sh
rm -f /root/build.done
