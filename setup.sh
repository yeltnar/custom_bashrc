bashrc_folder="$HOME/playin/custom_bashrc"
mkdir -p $bashrc_folder
git clone https://github.com/yeltnar/custom_bashrc.git $bashrc_folder;
touch ~/.bashrc;
echo "bashrc_folder=\"$bashrc_folder\"" >> ~/.bashrc
echo ". $bashrc_folder/setup_device.sh" >> ~/.bashrc;
echo ". $bashrc_folder/all.bashrc" >> ~/.bashrc;
