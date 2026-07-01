# The site shows the wrong page

We mounted a custom `index.html` into an nginx container, but
`http://localhost:8080` still shows the default nginx welcome page instead of
our content. The file is there; it isn't landing where nginx looks. Move on.
