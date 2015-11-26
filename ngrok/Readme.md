> http://www.tuicool.com/articles/ZraURrq

host aad
```
192.168.99.100	ngrok.me
192.168.99.100	a.ngrok.me
```

run /ngrok/bin/ngrokd -domain ngrok.me

run ngrok -config=ngrok.cfg -subdomain a 8080
