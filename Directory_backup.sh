#!/bin/bash
#Creating a script for taking backup of files or directories
exec >> /root/Backup/backup.log 2>&1
src=/root/nomadFile
dest=/root/Backup
timestamp=`date "+%H%M-%F"`
src_basename="$(basename "$src")" #/root/nomadFile -> nomadFile is basename -> after forward / whatever name is there then that is basename
src_dirname="$(dirname "$src")"   #/root/nomadFile -> /root is dirname -> Parent directory of file or dir
Backup_tar=""$src_basename"_"$timestamp".tar.gz"
if [ -e "$src" ] && [ -e "$dest" ]; then
        echo -e "The $src and $dest is available \nBackup Started"
        tar -czf $dest/$Backup_tar -C $src_dirname $src_basename
        if [ "$?" = 0 ]; then
		echo -e "Backup of $src_basename successfully done, Listing the tar files \n$(ls $dest/$Backup_tar)"
        else
		echo "Backup failed"
                exit 1
        fi
        else
                echo "The $src and $dest files or directory does not exist, So backup is not completed"

fi

