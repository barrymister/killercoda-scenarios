# Loops need a moving target

An infinite loop almost always means the loop variable never moves toward the
exit condition. Always mutate it in the body — `i=$((i+1))` — or use a C-style
`for ((i=1; i<=5; i++))` loop, which advances the counter for you. And when
testing something that might hang, wrap it in `timeout N cmd` so a stuck run
can't lock up your terminal.
