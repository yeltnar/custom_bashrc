mkdir -p data
podman run -p8888:8888 -v ./data:/data -v ./ca:/ca -v ./client:/client -v ./caddy/Caddyfile:/etc/caddy/Caddyfile caddy
