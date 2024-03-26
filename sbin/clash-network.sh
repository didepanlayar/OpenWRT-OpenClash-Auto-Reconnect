#!/bin/bash

# Font Color
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Env
HOST=${1:-"google.com"}
COUNT=0
WAIT_TIME=10

start_openclash() {
    if [[ -f /etc/init.d/openclash ]] && [[ $(uci -q get openclash.config.enable) == "0" ]]; then
        echo -e "[`date +%Y-%m-%d' '%H:%M:%S`] ${YELLOW}Info!${NC} Starting OpenClash."
        uci -q set openclash.config.enable=1
        uci commit
        /etc/init.d/openclash restart >/dev/null 2>&1 &
    else
        echo -e "[`date +%Y-%m-%d' '%H:%M:%S`] ${YELLOW}Info!${NC} OpenClash has started."
    fi
}

stop_openclash() {
    if [[ -f /etc/init.d/openclash ]] && [[ $(uci -q get openclash.config.enable) == "1" ]]; then
        echo -e "[`date +%Y-%m-%d' '%H:%M:%S`] ${YELLOW}Info!${NC} Stopping OpenClash."
        uci -q set openclash.config.enable=0
        uci commit
        /etc/init.d/openclash stop >/dev/null 2>&1 &
    else
        echo -e "[`date +%Y-%m-%d' '%H:%M:%S`] ${YELLOW}Info!${NC} OpenClash has stopped."
    fi
}

enable_airplane_mode() {
    echo -e "[`date +%Y-%m-%d' '%H:%M:%S`] ${YELLOW}Info!${NC} Enable Airplane Mode."
    adb shell cmd connectivity airplane-mode enable
    sleep $WAIT_TIME
}

disable_airplane_mode() {
    echo -e "[`date +%Y-%m-%d' '%H:%M:%S`] ${YELLOW}Info!${NC} Disable Airplane Mode."
    adb shell cmd connectivity airplane-mode disable
    sleep $WAIT_TIME
}

get_internet() {
    local HOST="$1"
    while true; do
        if wget -q --spider -T 10 "$HOST"; then
            COUNT=0
            echo -e "[`date +%Y-%m-%d' '%H:%M:%S`] ${GREEN}Success!${NC} Connect with ${YELLOW}$HOST${NC}."
        else
            COUNT=$((COUNT + 1))
            echo -e "[`date +%Y-%m-%d' '%H:%M:%S`] ${RED}Error!${NC} Disconnect from ${YELLOW}$HOST${NC}."
            if [ $COUNT -ge 5 ]; then
                echo -e "[`date +%Y-%m-%d' '%H:%M:%S`] ${RED}Error!${NC} Failed to connect to the internet."
                # Stop OpenClash
                stop_openclash
                # Enable Airplane
                enable_airplane_mode
                # Disable Airplance
                disable_airplane_mode
                # Start OpenClash
                start_openclash
                $COUNT=0
            fi
        fi
        sleep $WAIT_TIME
    done
}

get_internet "$HOST"