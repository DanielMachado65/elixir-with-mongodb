# PhxMongo Example

Simple Phoenix + MongoDB project with Docker.

## Setup

```bash
# build and start
docker-compose up --build
```

App will be available on http://localhost:4000

## Example API calls

Create user:
```bash
curl -X POST http://localhost:4000/api/users \
  -H 'Content-Type: application/json' \
  -d '{"name":"Bob","email":"bob@example.com","password":"secret"}'
```

Login:
```bash
curl -X POST http://localhost:4000/api/login \
  -H 'Content-Type: application/json' \
  -d '{"email":"bob@example.com","password":"secret"}'
```
