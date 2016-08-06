#!/usr/bin/env sh

CONFIG_FILE=/etc/uniqush/uniqush-push.conf
UNIQUSH_LOG_FILE=${UNIQUSH_LOG_FILE:-"/var/log/uniqush"}
UNIQUSH_PORT=${PORT:-"9898"}
UNIQUSH_DB_ENGINE=${UNIQUSH_DB_ENGINE:-"redis"}
UNIQUSH_DB_PORT=${UNIQUSH_DB_PORT:-"6379"}
UNIQUSH_DB_NAME=${UNIQUSH_DB_NAME:-"0"}
UNIQUSH_DB_CACHE_SIZE=${UNIQUSH_DB_CACHE_SIZE:-"1024"}

cat << EOF > ${CONFIG_FILE}

logfile=${UNIQUSH_LOG_FILE}

[WebFrontend]
log=on
loglevel=standard
addr=0.0.0.0:${UNIQUSH_PORT}

[AddPushServiceProvider]
log=on
loglevel=standard

[RemovePushServiceProvider]
log=on
loglevel=standard

[PSPs]
log=on
loglevel=standard

[Subscribe]
log=on
loglevel=standard

[Unsubscribe]
log=on
loglevel=standard

[Push]
log=on
loglevel=standard

[Subscriptions]
log=on
loglevel=standard

[Services]
log=on
loglevel=standard

[Database]
engine=${UNIQUSH_DB_ENGINE}
port=${UNIQUSH_DB_PORT}
name=${UNIQUSH_DB_NAME}
everysec=600
leastdirty=10
cachesize=${UNIQUSH_DB_CACHE_SIZE}

EOF
