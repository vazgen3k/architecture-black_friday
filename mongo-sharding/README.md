# pymongo-api

## Как запустить

Запускаем mongodb и приложение

```shell
docker compose up -d
```

Подключитесь к серверу конфигурации и сделайте инициализацию:
```shell
./scripts/init-configsrv.sh
```
Инициализируйте шарды:
```shell
./scripts/init-shards.sh
```
Инцициализируйте роутер:
```shell
./scripts/init-router.sh
```

Наполните его тестовыми данными:
```shell
./scripts/mongo-init.sh
```