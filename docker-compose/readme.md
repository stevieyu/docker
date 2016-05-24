```yml
version: '2'
services:
  app:
    build: .
    ports:
      - "3000:3000"
    volumes:
      - .:/docker_example
    environment:
      - DATABASE_URL=//db:5432/docker-example
      - DATABASE_USER=docker-example
    links:
      - db
    depends_on:
      - db
  db-data:
    image: busybox
    volumes:
      - /var/lib/postgresql
  db:
    image: postgres:9.3
    ports:
      - "5432"
    volumes_from:
      - db-data
```