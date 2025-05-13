server_url="https://localhost:8888"

echo "this should fail"
curl -k "$server_url"

echo "" # get new line 

echo "this should work"
curl -k --cert "./client/client.crt" --key "./client/client.key" "$server_url"

echo "" # get new line 

echo "this should also work"
curl -k --cert "./client/client.p12" --cert-type P12 --pass "clientpassword" "$server_url" 
