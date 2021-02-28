bashrc_folder="$HOME/gist"
git clone https://github.com/yeltnar/gist.git $bashrc_folder;
touch ~/.bashrc;
echo ". $bashrc_folder/setup_device.sh" >> ~/.bashrc;
echo ". $bashrc_folder/all.bashrc" >> ~/.bashrc;
