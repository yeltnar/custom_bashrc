#!/usr/bin/env bash

if [ -e "$bashrc_folder/gitignore/uptimekuma_report.env" ]; then
  echo '$bashrc_folder/gitignore/uptimekuma_report.env is not defined; exiting'
  exit 1
fi

source $bashrc_folder/gitignore/uptimekuma_report.env

if [ -z $host ]; then
  echo '$host is not defined; exiting'
  exit 1
fi
if [ -z $ping_id ]; then
  echo '$ping_id is not defined; exiting'
  exit 1
fi
if [ -z $status ]; then
  echo '$status is not defined; exiting'
  exit 1
fi
if [ -z "$msg" ]; then
  echo '$msg is not defined; exiting'
  exit 1
fi
log_path="$HOME/cron"
log_file="$log_path/uptimekuma.log"

mkdir -p "$log_path"

curl "$host/api/push/$ping_id?status=$status&msg=$msg&ping=" > "$log_file"

