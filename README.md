# Anilibrary-monitoring

Microservice for scraping metrics from all Anilibrary microservices

---

## Config

Copy `.env.example` to `.env` and fill the values.

---

## Build
With docker:

```shell
make up # docker-compose up --build
```

### Ports

* `9090` - **Prometheus**
* `3005` - **Grafana**

---