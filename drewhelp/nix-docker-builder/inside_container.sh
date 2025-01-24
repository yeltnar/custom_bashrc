cd /tmp
nix-build /tmp/example-docker.nix
mv `readlink /tmp/result ` /tmp/mnt/
