Uniqush Push
==============

This image is the uniqush push server, includes: redis, monit

## Build

```
docker build -t dtthaison/uniqush-push:<version> .
```

## Versions

- `2.1.0`[(Dockerfile)](https://github.com/dtthaison/docker-uniqush-push/blob/2.1.0/Dockerfile)

## Configuration

This image runs [uniqush-push][uniqush-push] with monit.

Besides, you can customize the configuration in several ways:

### Default Configuration

Uniqush Push is installed with the default configuration and some parameters can be overrided with env variables:

- UNIQUSH_LOG_FILE=${UNIQUSH_LOG_FILE:-"/var/log/uniqush"}
- UNIQUSH_PORT=${PORT:-"9898"}
- UNIQUSH_DB_ENGINE=${UNIQUSH_DB_ENGINE:-"redis"}
- UNIQUSH_DB_PORT=${UNIQUSH_DB_PORT:-"6379"}
- UNIQUSH_DB_NAME=${UNIQUSH_DB_NAME:-"0"}
- UNIQUSH_DB_CACHE_SIZE=${UNIQUSH_DB_CACHE_SIZE:-"1024"}

[uniqush-push]: https://uniqush.org/
