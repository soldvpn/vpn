#!/bin/sh

# Генерация сертификатов и других необходимых настроек для StrongSwan
# Пример (замените на свои нужды):
sudo ipsec pki --gen --type rsa --size 4096 --outform pem > /etc/ipsec.d/private/server-key.pem
sudo ipsec pki --pub --in /etc/ipsec.d/private/server-key.pem --type rsa | sudo tee /etc/ipsec.d/certs/server-pub.pem
sudo ipsec pki --issue --lifetime 3650 --cacert /etc/ipsec.d/cacerts/ca-cert.pem --cakey /etc/ipsec.d/private/ca-key.pem --dn "C=US, O=VPN Server, CN=VPN" --san vpn.example.com --flag serverAuth --flag ikeIntermediate --outform pem > /etc/ipsec.d/certs/server-cert.pem

# Запуск StrongSwan
exec /usr/sbin/ipsec start --nofork
