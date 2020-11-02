caddy 0.10.11

`https://caddyserver.com/download/linux/amd64?plugins=http.cache,http.cors,http.expires,http.git,http.minify&license=personal`
`curl https://getcaddy.com | bash -s personal http.cache,http.cors,http.expires,http.git,http.minify`

```sh
docker run --rm -it -p 8000:8000 -v $PWD/Caddyfile:/etc/Caddyfile caddy
```