pkg install -y openssh jq vim git curl;
curl https://raw.githubusercontent.com/yeltnar/custom_bashrc/master/setup.sh | bash;
mkdir -p ~/.termux/tasker;
cat /sdcard/Tasker/cp_files.sh | bash;
bash;
