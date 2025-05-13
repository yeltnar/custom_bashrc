echo "this should fail"
curl -k https://nixos-testing.lan:8888

echo "" # get new line 

echo "this should work"
curl -k --cert "./client/client.crt" --key "./client/client.key" https://localhost:8888

echo "" # get new line 

echo "this should also work"
curl -k --cert "./client/client.p12" --cert-type P12 --pass "clientpassword" https://localhost:8888 
