#!/usr/bin/env sh

CONFIG_FILE=/etc/monit/conf.d/monit-service.conf
UNIQUSH_PORT=${PORT:-"9898"}
UNIQUSH_DB_PORT=${UNIQUSH_DB_PORT:-"6379"}

cat << EOF > ${CONFIG_FILE}

check process uniqush-push matching "uniqush-push"
  start program = "/etc/init.d/uniqush-push start"
  stop program = "/etc/init.d/uniqush-push stop"
  if failed host 127.0.0.1 port ${UNIQUSH_PORT} then restart

check process redis-server matching "redis-server"
  start program = "/etc/init.d/redis-server start"
  stop program = "/etc/init.d/redis-server stop"
  if 2 restarts within 3 cycles then timeout
  if totalmem > 100 Mb then alert
  if children > 255 for 5 cycles then stop
  if cpu usage > 95% for 3 cycles then restart
  if failed host 127.0.0.1 port ${UNIQUSH_DB_PORT} then restart
  if 5 restarts within 5 cycles then timeout
EOF

