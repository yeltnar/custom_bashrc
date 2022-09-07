if [ -z "$log_out_folder" ]; then echo "log_out_folder is not defined"; exit; fi;
if [ -z "$log_out_file" ]; then echo "log_out_file is not defined"; exit; fi;
if [ -z "$log_stdout_file" ]; then echo "log_stdout_file is not defined"; exit; fi;
if [ -z "$remote_dir" ]; then echo "remote_dir is not defined"; exit; fi;
if [ -z "$remote_host" ]; then echo "remote_host is not defined"; exit; fi;
if [ -z "$remote_user" ]; then echo "remote_user is not defined"; exit; fi;
if [ -z "$remote_ssh_port" ]; then echo "remote_ssh_port is not defined"; exit; fi;
if [ -z "$local_dir" ]; then echo "local_dir is not defined"; exit; fi;

mkdir -p "$log_out_folder"

rsync -v -a --delete \
--log-file="$log_out_folder/$log_out_file" \
-e "ssh -p $remote_ssh_port" \
"$remote_user"@"$remote_host":"$remote_dir" \
$local_dir/ 2>&1 > \
$log_stdout_file
