# docker for acme

[How to use DNS API](https://github.com/Neilpang/acme.sh/blob/master/dnsapi/README.md)

`https://github.com/Neilpang/acme.sh/wiki/Run-acme.sh-in-docker`

```
# 第一步
docker run --rm -it \
-v $PWD/acme:/acme.sh  \
neilpang/acme.sh --register-account  -m myemail@example.com --server zerossl

# 接下来
docker run --rm -it \
-e Ali_Key= \
-e Ali_Secret= \
-v $PWD/acme:/acme.sh  \
neilpang/acme.sh --issue --dns dns_ali --dnssleep 30 --ocsp --days 30 --keylength 2048 \
-d *.surge.stevie.top -d surge.stevie.top

docker run --rm -it \
-e Ali_Key= \
-e Ali_Secret= \
-v $PWD:/acme.sh  \
neilpang/acme.sh --issue --dns dns_ali -d *.d.flyyweb.com

docker run --rm -it \
-v $PWD:/acme.sh \
neilpang/acme.sh --renew --force -d *.d.flyyweb.com

docker run --rm -it -e Ali_Key= -e Ali_Secret= neilpang/acme.sh sh
acme.sh --register-account -m yzm791@qq.com
acme.sh --issue --dns dns_ali --ocsp --keylength ec-256 -d stevie.top -d *.stevie.top -d *.surge.stevie.top
```
