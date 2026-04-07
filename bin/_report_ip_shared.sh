if [ ! -e "$bashrc_folder" ]; then
    echo "\$bashrc_folder is not set" 1>&2;
    exit 1;
fi

# Load device naming
if [ -f ~/.bashrc ]; then
    grep 'export' ~/.bashrc | grep NAME > /tmp/device_name && source /tmp/device_name
fi
if [ -f "$bashrc_folder/gitignore/device_name.env" ]; then
    source "$bashrc_folder/gitignore/device_name.env"
fi

cd "$bashrc_folder" || exit 1

PATH="/usr/local/bin:/sbin:/usr/bin:/bin:/snap/bin:/data/data/com.termux/files/usr/bin:$PATH"

pub_ip=$(curl -sS https://ip.andbrant.com);
lan_ip="$(ifconfig | awk '/192\.168/{print $2}' | tr '\n' ' ')";
nebula_ip=$(ifconfig | awk '/10\.10\.10/{print $2}');
git_branch=$(git rev-parse HEAD 2>/dev/null)
nebula_version=$(nebula --version 2>/dev/null)
nebula_expire=$(nebula-cert print -json -path /etc/nebula/host.crt 2>/dev/null | jq .[0].details.notAfter -r)
date="$(date)"
device_name="$GROUP_NAME-$DEVICE_NAME"

new_content=$(jq -n \
    --arg pub_ip "$pub_ip" \
    --arg lan_ip "$lan_ip" \
    --arg nebula_ip "$nebula_ip" \
    --arg nebula_version "$nebula_version" \
    --arg nebula_expire "$nebula_expire" \
    --arg date "$date" \
    --arg git_branch "$git_branch" \
    --arg device_name "$device_name" \
    '{pub_ip: $pub_ip, lan_ip: $lan_ip, nebula_ip: $nebula_ip, nebula_version: $nebula_version, nebula_expire: $nebula_expire, date: $date, git_branch: $git_branch, device_name: $device_name}')

export device_report_json="$new_content"
export GROUP_NAME DEVICE_NAME device_name
