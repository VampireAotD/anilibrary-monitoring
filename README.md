# Anilibrary Monitoring

Monitoring all **Anilibrary** services.

---

## Build and deployment

Before launching **Monitoring**, you need to fill all required environment variables which will be located in
`.env`. The recommended way to obtain it is to use command:

```sh
make install
```

This command will create `.env`, build and launch all images for **Monitoring** to work.

Or make it manually from `.env.example`:

```sh
cp .env.example .env
```

### Variables

| Name                          | Default value | Description                                   |
|-------------------------------|---------------|-----------------------------------------------|
| `GRAFANA_VERSION`             | 11.1.0        | The version of Grafana to be used.            |
| `GRAFANA_PORT`                | 3000          | The port Grafana will be accessible on.       |
| `GRAFANA_ADMIN_USER`          |               | The username for Grafana admin login.         |
| `GRAFANA_ADMIN_PASSWORD`      |               | The password for Grafana admin login.         |
| `TEMPO_VERSION`               | latest        | The version of Tempo to be used.              |
| `TEMPO_PORT`                  | 3200          | The port Tempo will be accessible on.         |
| `TEMPO_OTLP_HTTP_PORT`        | 4318          | The OTLP HTTP port for Tempo.                 |
| `TEMPO_LOG_SPANS`             | false         | Whether Tempo distributor should log spans.   |
| `PROMETHEUS_VERSION`          | v2.53.1       | The version of Prometheus to be used.         |
| `PROMETHEUS_PORT`             | 9090          | The port Prometheus will be accessible on.    |
| `ALERTMANAGER_VERSION`        | v0.27.0       | The version of Alertmanager to be used.       |
| `ALERTMANAGER_PORT`           | 9093          | The port Alertmanager will be accessible on.  |
| `TELEGRAM_BOT_TOKEN`          |               | The token for the Telegram bot.               |
| `TELEGRAM_CHAT_ID`            |               | The chat ID for the Telegram bot.             |
| `MAIL_HOST`                   |               | The SMTP host for email notifications.        |
| `MAIL_SENDER`                 |               | The email address to send notifications from. |
| `MAIL_RECEIVER`               |               | The email address to receive notifications.   |
| `MAIL_USERNAME`               |               | The username for the email account.           |
| `MAIL_PASSWORD`               |               | The password for the email account.           |
| `ELASTICSEARCH_EXPORTER_PORT` | 9114          | The port for Elasticsearch Exporter.          |
| `ELASTICSEARCH_URL`           |               | The URL for Elasticsearch.                    |

### Launch

**Monitoring** reads and visualises metrics and traces from all **Anilibrary** services, to fully use it check other
services:

1. [`Anilibrary`](https://github.com/VampireAotD/anilibrary) - main service.
2. [`Scraper`](https://github.com/VampireAotD/anilibrary-scraper) - a service that allows you to scrape anime data from
   different sites.
3. [`ELK`](https://github.com/VampireAotD/anilibrary-elk) - service that is used for advanced logging and search.

To launch **Monitoring** use command:

```sh
make up
```

It will launch all containers except for **Alertmanager**. To launch it and exporters for alerts use command:

```sh
make alerts
```
