#!/bin/bash

# Path to the AC adapter directory
AC_ADAPTER_DIR="/sys/class/power_supply/AC"

# Check if the AC adapter is online
if cat "$AC_ADAPTER_DIR/online" | grep -q "^1$"; then
    echo "ac"
else
    echo "battery"
fi
