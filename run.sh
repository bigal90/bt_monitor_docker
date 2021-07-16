#!/bin/bash
set -e

# inspired from https://github.com/moby/moby/issues/16208#issuecomment-161770118
service bluetooth stop
service dbus start
service bluetooth start
bluetoothctl power on
hciconfig hci0 up

exec "$@"
