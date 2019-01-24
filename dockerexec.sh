#docker exec -it $1 /bin/bash
# docker volume create drew_shell_volume

# docker run \
# --name drew_shell \
# --rm \
# -i \
# -t drew_shell \
# --mount source=drew_shell_volume,target=/drew_shell_volume 
# bash

docker run drew_shell \
  -it
  -d \
  -e DEVICE_NAME=Mac \
  -e GROUP_NAME=Computer \
  --name drew_shell \
  --mount source=drew_shell_volume,target=/app \
   /bin/bash 
  #/bin/bash
#   nginx:latest
