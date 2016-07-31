
```
docker run --name=mongo -d -p 27017:27017 mongo
docker run --link mongo:mongo -e "MONGO_URL=mongodb://mongo" -p 3000:3000 --rm -it meteor bash

```