# docker for acme

[How to use DNS API](https://github.com/Neilpang/acme.sh/blob/master/dnsapi/README.md)

`https://github.com/Neilpang/acme.sh/wiki/Run-acme.sh-in-docker`
```
docker run --rm -it \
-e Ali_Key= \
-e Ali_Secret= \
-v $PWD/acme:/acme.sh  \
neilpang/acme.sh --issue --dns dns_ali -d *.stevie.top

docker run --rm -it \
-e Ali_Key= \
-e Ali_Secret= \
-v $PWD:/acme.sh  \
neilpang/acme.sh --issue --dns dns_ali -d *.d.flyyweb.com

docker run --rm -it \
-v $PWD:/acme.sh \
neilpang/acme.sh --renew --force -d *.d.flyyweb.com
```