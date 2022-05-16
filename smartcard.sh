sudo apt install opensc
modutil -dbdir sql:$HOME/.pki/nssdb/ -add "cac-module" -libfile /usr/lib/x86_64-linux-gnu/pkcs11/opensc-pkcs11.so

# Install DoD Certs
wget https://militarycac.com/maccerts/AllCerts.p7b
for n in *.p7b; do certutil -d sql:$HOME/.pki/nssdb -A -t TC,CT, -n $n -i $n; done
