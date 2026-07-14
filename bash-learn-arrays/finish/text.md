# Arrays & string manipulation

Arrays: `arr=(a b c)`, index `${arr[1]}`, length `${#arr[@]}`, all elements
`"${arr[@]}"`, append `arr+=(d)`. Always quote `"${arr[@]}"` so elements with
spaces stay intact. String ops via parameter expansion — `${v,,}`/`${v^^}`
change case, `${v#p}`/`${v%s}` strip a prefix/suffix, and `${v/old/new}` replaces
text — reshape strings with zero external commands.
