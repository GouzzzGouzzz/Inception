FROM debian:12.2

RUN	apt-get update -y
RUN	apt-get install -y nginx && apt-get install openssl
RUN	mkdir -p /etc/nginx/ssl
RUN	openssl req \
    -new \
    -newkey rsa:4096 \
    -days 365 \
    -nodes \
    -x509 \
    -subj "/C=US/ST=FL/L=Ocala/O=Home/CN=example.com" \
    -keyout /etc/nginx/ssl/key_inception.key \
    -out /etc/nginx/ssl/cert_inception.crt

COPY	nginx.conf /etc/nginx/conf.d/
EXPOSE	443
CMD	["nginx","-g","daemon off;"]
