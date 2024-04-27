# Generate 2048 bit RSA private key (no passphrase) and the certificate signing request (CSR)
```
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/{name of the key}.key -out /etc/ssl/certs/{name of the key}.crt
```

# Create a privacy enhanced mail (PEM) file from existing certificate files that form a chain
```
sudo cat /etc/ssl/private/{name of the key}.key > {location}/{name of the key}.pem
```

```
sudo cat /etc/ssl/certs/{name of the key}.crt >> {location}/{name of the key}.pem
```

# Check the experation date of the privacy enhanced mail (PEM) file
```
openssl x509 -enddate -noout -in {location}/{name of the key}.pem
```