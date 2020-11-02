```sh
docker run -it --rm --name certbot \
            -v "$PWD/etc:/etc/letsencrypt" \
            -v "$PWD/lib:/var/lib/letsencrypt" \
            certbot/certbot certonly
```