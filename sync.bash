#!/usr/bin/env bash

sync_dir=~/sync_files
interval_sec=15

cd $sync_dir

echo "sync ${sync_dir}"

while : ;
do
    echo "== check status"
    status_count=$(git status --porcelain=v1 | wc -l)
    if [[ $status_count > 0 ]] ; then
        echo "== update"
        git add .
        echo "== commit"
        git commit -m "update files"
        echo "== push"
        git push
        notify-send "sync push"
    fi

    echo "== pull"
    git pull

    sleep $interval_sec
done
