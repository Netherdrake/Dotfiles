#!/bin/sh

battery_path=""

for supply in /sys/class/power_supply/*; do
    [ -r "$supply/type" ] || continue

    if [ "$(cat "$supply/type")" = "Battery" ]; then
        battery_path="$supply"
        break
    fi
done

while true; do
    ram_free="$(
        awk '
            /^MemAvailable:/ {
                printf "%.1f", $2 / 1024 / 1024
                exit
            }
        ' /proc/meminfo
    )"

    battery=""

    if [ -n "$battery_path" ] && [ -r "$battery_path/capacity" ]; then
        battery="$(cat "$battery_path/capacity")% | "
    fi

    printf '%s~%s GB | %s\n' \
        "$battery" \
        "$ram_free" \
        "$(date +'%a %Y-%m-%d %T')"

    sleep 1
done
