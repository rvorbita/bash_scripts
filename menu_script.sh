#! /bin/bash
# menu - interactive menu 


DELAY=3

while true; do

    clear
    cat <<- _EOF_

        Welcome to Interactive Menu

        Please select:
        1. Display System Information
        2. Display System Disk space
        3. Display Home Disk space
        0. Quit

_EOF_


    read -p "Enter Selection [0-3] > " REPLY

    if [[ $REPLY =~ ^[0-3]$ ]]; then
    
        if [[ $REPLY == 1 ]]; then
            echo "System Information > ($HOSTNAME)"
            uptime
            sleep $DELAY
            continue
        fi
        
        if [[ $REPLY == 2 ]]; then
            echo "System Disk space > ($HOSTNAME)"
            df -h
            sleep $DELAY
            continue
        fi
        
        if [[ $REPLY == 3 ]]; then
            if [ $(id -u) -eq 0 ]; then
                echo "System Home Disk space (ALL USERS)"
                du -sh /Users/*
            else
                echo "System Home Disk space > ($USER)"
                du -sh /Users/raymart
            fi
            sleep $DELAY
            continue
        fi

        if [[ $REPLY == 0 ]]; then
            echo "Goodbye."
            break
        fi

        else
        
        echo "Invalid input"
        sleep $DELAY
    fi

done
echo "Program Terminated"
