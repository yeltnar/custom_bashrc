need_write=false
to_write=""

if [ -z ${DEVICE_NAME+x} ]; 
then 
    echo "DEVICE_NAME is unset"; 
    read -p "Enter DEVICE_NAME: " DEVICE_NAME
    echo "DEVICE_NAME=$DEVICE_NAME"
    to_write="${to_write}DEVICE_NAME=${DEVICE_NAME}\n"
    need_write=true;
else 
    echo "DEVICE_NAME is set to '$DEVICE_NAME'"; 
fi

if [ -z ${GROUP_NAME+x} ]; 
then 
    echo "GROUP_NAME is unset"; 
    read -p "Enter GROUP_NAME: " GROUP_NAME
    echo "GROUP_NAME=$GROUP_NAME"
    to_write="${to_write}GROUP_NAME=${GROUP_NAME}\n"
    need_write=true;
else 
    echo "GROUP_NAME is set to '$GROUP_NAME'"; 
fi


if [ need_write ]; 
then 
    file_contents=$(cat ~/.bashrc)
    to_write=$(echo -e $to_write)

    echo "${to_write}" > ~/.bashrc
    echo "${file_contents}" >> ~/.bashrc

    # echo "reloading"
    # source ~/.bashrc
fi