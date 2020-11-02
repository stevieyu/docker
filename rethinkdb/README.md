# rethinkdb

## build 
```sh
docker build -t rethinkdb .
```

---

## run server
```sh
docker run -d -p 28015:28015 -p 29015:29015 -p 8080:8080 --name rethinkdb rethinkdb
```