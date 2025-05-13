#!/bin/bash

set -e

TMP_DIR="$bashrc_folder/drewhelp/client_cert_setup"
CA_DIR="$TMP_DIR/ca"
CLIENT_DIR="$TMP_DIR/client"
CA_KEY="$CA_DIR/ca.key"
CA_CERT="$CA_DIR/ca.crt"
CLIENT_KEY="$CLIENT_DIR/client.key"
CLIENT_CSR="$CLIENT_DIR/client.csr"
CLIENT_CERT="$CLIENT_DIR/client.crt"
CLIENT_P12="$CLIENT_DIR/client.p12"
# CA_SUBJECT="/C=US/ST=Texas/L=Austin/O=MyOrg/CN=My Root CA"
# CLIENT_SUBJECT="/C=US/ST=Texas/L=Austin/O=MyClientOrg/CN=client1"
CA_SUBJECT=""
CLIENT_SUBJECT=""
CA_DAYS=3650
CLIENT_DAYS=365
P12_PASSWORD="clientpassword" # Change this for real use

echo "Setting up in $TMP_DIR"
mkdir -p "$CA_DIR" "$CLIENT_DIR"

echo "--- Creating Certificate Authority ---"
cd "$CA_DIR"
echo "Generating CA private key ($CA_KEY)..."
openssl genrsa -out "$CA_KEY" 2048
echo "Generating CA certificate ($CA_CERT)..."
# openssl req -x509 -new -nodes -key "$CA_KEY" -days "$CA_DAYS" -out "$CA_CERT" -subj "$CA_SUBJECT"
openssl req -x509 -new -nodes -key "$CA_KEY" -days "$CA_DAYS" -out "$CA_CERT"  
echo "CA certificate created: $CA_CERT"
cd "$TMP_DIR"

echo "\n--- Creating Client Certificate ---"
cd "$CLIENT_DIR"
echo "Generating client private key ($CLIENT_KEY)..."
openssl genrsa -out "$CLIENT_KEY" 2048
echo "Creating client Certificate Signing Request ($CLIENT_CSR)..."
openssl req -new -key "$CLIENT_KEY" -out "$CLIENT_CSR"  
# openssl req -new -key "$CLIENT_KEY" -out "$CLIENT_CSR" -subj "$CLIENT_SUBJECT"
echo "CSR created: $CLIENT_CSR"

echo "Signing client certificate ($CLIENT_CERT) with the CA..."
cd "$CA_DIR"
openssl x509 -req -in "$CLIENT_CSR" -CA "$CA_CERT" -CAkey "$CA_KEY" -CAcreateserial -out "$CLIENT_CERT" -days "$CLIENT_DAYS"
echo "Client certificate signed: $CLIENT_CERT"
cd "$TMP_DIR/client"

echo "\n--- Creating PKCS12 file ($CLIENT_P12) ---"
openssl pkcs12 -export -inkey "$CLIENT_KEY" -in "$CLIENT_CERT" -out "$CLIENT_P12" -certfile "$CA_CERT" -passout "pass:$P12_PASSWORD"
echo "Client PKCS12 file created: $CLIENT_P12 (password: $P12_PASSWORD)"

echo "\n--- Files created in $TMP_DIR: ---"
find "$TMP_DIR" -type f

echo "\nRemember to configure Caddy to trust the CA certificate:"
echo "trusted_ca_cert_file $CA_CERT"

echo "\nAnd configure your client to use $CLIENT_CERT and $CLIENT_KEY (or $CLIENT_P12)."

cd "$TMP_DIR"

