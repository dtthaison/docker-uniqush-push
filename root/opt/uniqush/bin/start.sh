#!/usr/bin/env sh

# Generate /etc/uniqush/uniqush-push.conf
/opt/uniqush/bin/uniqush-push.conf.sh

# Generate /etc/monit/conf.d/monit-service.conf
/opt/monit/bin/monit-service.conf.sh

# Start monit
monit -I
