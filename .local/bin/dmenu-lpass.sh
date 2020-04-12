#!/bin/bash

if ! lpass status -q; then
    username=`echo "" | dmenu -p "LastPass username: "`
    if ! test -z "$username"; then
        lpass login --trust $username
    fi
fi

if lpass status -q; then
    selection=`echo -e $(lpass ls | awk -F '[/[]' '{print $(NF-1)"\\\n"}') | dmenu -l 5 -p "Select account: "`

    if [ "$selection" != "" ]; then
        name=`echo -e $(lpass show --name $selection)`
        notify-send -i edit-paste "$name" `echo -e $(lpass show --username $selection)` &
        lpass show -c --password $selection &
    fi
fi
