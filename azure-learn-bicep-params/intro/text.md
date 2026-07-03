# Parameters and the Bicep linter

Hard-coding values (and worse, secrets) into templates is an anti-pattern the
exam loves to test. Bicep uses **parameters** for per-environment inputs and the
**`@secure()`** decorator so secret parameters never land in logs or outputs.
`az bicep lint` (and `build`) flags problems. You'll parameterise a template and
get it building clean.
