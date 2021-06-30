FROM alpine:3.14

#RUN echo '\
#        . /etc/profile ; \
#    ' >> /root/.profile

# prepare
RUN apk add --no-cache git curl openssl socat && \
git clone https://github.com/acmesh-official/acme.sh.git && \
cd acme.sh/ && \
./acme.sh --install -m my@example.com
COPY account.conf /root/.acme.sh/account.conf

# run
# cert will be stored in: root/.acme.sh/example.com/
ARG DOMAIN_NAME
RUN /root/.acme.sh/acme.sh --issue --dns dns_netcup --dnssleep 900 -d $DOMAIN_NAME -d *.$DOMAIN_NAME
