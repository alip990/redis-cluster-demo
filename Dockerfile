FROM redis:latest

COPY ./entrypoint.sh /entrypoint.sh
RUN apt-get update && apt-get install -y dnsutils

RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]