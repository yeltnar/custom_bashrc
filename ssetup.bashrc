#curl -s -L -O https://raw.githubusercontent.com/yeltnar/gist/master/all.bashrc
#chmod 700 all.bashrc
#curl -s -L -O https://raw.githubusercontent.com/yeltnar/gist/master/win.bashrc
#chmod 700 win.bashrc
#curl -s -L -O https://raw.githubusercontent.com/yeltnar/gist/master/mac.bashrc
#chmod 700 mac.bashrc

echo -e "$(pwd)/all.bashrc\n$(cat ~/.bashrc)" > ~/.bashrc 
