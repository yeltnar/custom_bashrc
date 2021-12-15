bashrc_folder="$HOME/playin/custom_bashrc"
mkdir -p $bashrc_folder
git clone https://github.com/yeltnar/custom_bashrc.git $bashrc_folder;
touch ~/.bashrc;
echo "bashrc_folder=\"$bashrc_folder\"" >> ~/.bashrc
echo ". $bashrc_folder/setup_device.sh" >> ~/.bashrc;
echo ". $bashrc_folder/all.bashrc" >> ~/.bashrc;
echo "check out https://sollove.com/2013/03/03/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers/"
