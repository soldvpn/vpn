FROM strongswan/strongswan:latest

COPY ipsec.conf /etc/ipsec.conf
COPY ipsec.secrets /etc/ipsec.secrets
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
