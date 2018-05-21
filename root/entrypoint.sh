#!/bin/ash

# Check for user data
[ -f /user-data.sh ] && sh /user-data.sh

# generate host keys if not present
ssh-keygen -A

# do not detach (-D), log to stderr (-e), passthrough other arguments
exec /usr/sbin/sshd -D -E /var/log/auth.log "$@"
