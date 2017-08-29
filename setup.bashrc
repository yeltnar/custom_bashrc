#curl -s -L -O https://raw.githubusercontent.com/yeltnar/gist/master/setup.bashrc
#chmod 700 setup.bashrc
curl -s -L -O https://raw.githubusercontent.com/yeltnar/gist/master/all.bashrc
chmod 700 all.bashrc
curl -s -L -O https://raw.githubusercontent.com/yeltnar/gist/master/win.bashrc
chmod 700 win.bashrc
curl -s -L -O https://raw.githubusercontent.com/yeltnar/gist/master/mac.bashrc
chmod 700 mac.bashrc

#if ! [ -f ~/.bashrc ]; then
	touch ~/.bashrc
#fi

#if [ -f ~/.bash_profile ]; then
	echo -e "$(cat ~/.bash_profile)\nif [ -f ~/.bashrc ]; then . ~/.bashrc; fi" > ~/.bash_profile
#fi

echo -e ". $(pwd)/all.bashrc\n$(cat ~/.bashrc)\n" > ~/.bashrc 
