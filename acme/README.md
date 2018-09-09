# docker for acme

[How to use DNS API](https://github.com/Neilpang/acme.sh/blob/master/dnsapi/README.md)

`https://github.com/Neilpang/acme.sh/wiki/Run-acme.sh-in-docker`
```
docker run --rm -it \
-e Ali_Key=9RaC1IMSBx7LQcBM \
-e Ali_Secret=UNdm8OS8nXyMlKTvjD9X6sRMU0hbte \
-v $PWD:/acme.sh  \
neilpang/acme.sh --issue --dns dns_ali -d *.stevie.top

docker run --rm -it \
-e Ali_Key=LTAImSnSXHS6kB11 \
-e Ali_Secret=OafFLRpNqhgepAG9QuQSlhtMIGbbYM \
-v $PWD:/acme.sh  \
neilpang/acme.sh --issue --dns dns_ali -d *.flyyweb.com

docker run --rm -it \
-v $PWD:/acme.sh \
neilpang/acme.sh --install-cert -d *.flyyweb.com --key-file /acme.sh/ssl/flyyweb.com.key --fullchain-file /acme.sh/ssl/flyyweb.com.cer

docker run --rm -it \
-v $PWD:/acme.sh \
neilpang/acme.sh --renew --force -d *.stevie.top -d *.flyyweb.com
```