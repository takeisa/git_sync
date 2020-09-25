# git_sync
Script to synchronize the git repository

## Usage

(1) Clone your git repository as ~/sync_files
Note: Use public key authentication or an access token so that you don't need a password for git pull and git push.
(2) Run the sync.bash script.

## What does the script do?

What the script does is very simple.
(1) It checks to see if the state of the repository has changed as a result of a file being updated, added or deleted.
(2) Git add, git commit, and git push if they have been changed.
(3) pull git pull and merge the changes into the original clone repository.
(4) Wait for the specified time.

## Customization

If you look at the script, you'll see that

```
# Synchronization directory
sync_dir=~/sync_files

# Time to wait before checking next time (sec.)
interval_sec=15
```

## points to note

(1)Only one repository can be monitored. I didn't need to monitor multiple repositories at the same time for my purposes.
(2)If you need multiple monitoring, run two scripts or modify the script to allow multiple monitoring.
