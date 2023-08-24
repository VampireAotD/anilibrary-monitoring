# Anilibrary Monitoring

---

## Build and deployment

### Config

To start working with monitoring, you need to fill environmental variables which will be located in **.env** in root
directory. To acquire this file your best options are:

- Fill all variables in **.env.example** and copy it as **.env**.
- Just fill all variables in **.env.example** and use `make install` which will create **.env** with your data
  automatically.

After configuring monitoring you can start it using `make up`. This will launch everything except
for [Alertmanager](https://github.com/prometheus/alertmanager). If you want to start monitoring with everything
including Alertmanager with its exporters, use `make up-alertmanager`.

## Issues

Alertmanager [cannot read environment variables in config](https://github.com/prometheus/alertmanager/issues/2917),
so a little workaround has been made. The config in this repository is a template where you can place variable
placeholders as usual, the config itself will be generated using `make alertmanager-config` or by
using `make up-alertmanager` which will generate config automatically.