# README

```
openssl req -x509 -sha256 -nodes -newkey rsa:2048 -keyout localhost.key -out localhost.crt -subj "/CN=localhost" -days 365
```

```
rails s -b "ssl://localhost:3000?key=config/ssl/localhost.key&cert=config/ssl/localhost.crt"
```