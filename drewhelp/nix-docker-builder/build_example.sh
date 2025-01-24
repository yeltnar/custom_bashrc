podman run -it -v ./example-docker.nix:/tmp/example-docker.nix -v $PWD:/tmp/mnt -v $PWD/inside_container.sh:/tmp/inside_container.sh nixos/nix bash -c /tmp/inside_container.sh

# podman load < *.tar.gz
