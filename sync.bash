#!/usr/bin/env bash

sync_dir=~/sync_files
interval_sec=30

log () {
    local date=$(date +"%Y-%m-%d %T.%3N")
    local message=$1
    echo "$date $message"
}

cd $sync_dir

log "sync ${sync_dir}"

while : ;
do
    log "check status"
    status_count=$(git status --porcelain=v1 | wc -l)
    if [[ $status_count > 0 ]] ; then
        log "update"
        git add .
        log "commit"
        git commit -m "update files"
        log "push"
        git push
        notify-send "sync push"
    fi

    log "pull"
    git pull

    sleep $interval_sec
done
