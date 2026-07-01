# Space reclaimed

`df -h` shows a full disk; `du -sh *` and `find -size +100M` pinpoint the hog.
The fix is to remove or truncate the offending file (`rm`, or `: > file` to
truncate a log an app still has open) — never blindly `rm -rf` a whole folder.
Real fix long-term: log rotation.
