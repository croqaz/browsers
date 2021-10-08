#!/bin/bash

create_user() {
    if [ -z "$1" ]; then
        name="user"
    else
        name="$1"
    fi
    groupadd --gid 1000 $name
    useradd --no-log-init --system -u 1000 -g 1000 -G users,audio,video --home-dir /home -s /bin/bash $name
    passwd -d $name
    chown -R $name:$name /home
}
