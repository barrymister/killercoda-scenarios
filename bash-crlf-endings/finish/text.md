# LF, not CRLF

Windows editors end lines with `\r\n`; Unix wants `\n`. The stray `\r` becomes
part of the shebang path (`/bin/bash\r`), so the kernel can't find the
interpreter — "bad interpreter: No such file or directory". `cat -A` shows `^M$`;
`dos2unix` or `sed -i 's/\r$//'` fixes it. Set your editor to LF for shell files.
