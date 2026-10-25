#!/bin/bash
Backup_Folder="/root/Backup"
Current_Folder="/root/nomadFile"
List_files=`ls $Current_Folder/*.nomad`
echo "$List_files"
