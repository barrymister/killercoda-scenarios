# A name won't resolve

An app on this box needs to reach `api.bench.local`, but every attempt fails with
`Name or service not known`. The address was supposed to be pinned locally so it
would always resolve. Something's wrong with the mapping — find it and fix it so
`api.bench.local` resolves to `10.0.0.50`.
