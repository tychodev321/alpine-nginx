FROM ubuntu:22.10

LABEL maintainer=""

ENV NGINX_VERSION=1.20.1 \
    PATH=$HOME/.local/bin/:$PATH

RUN apt update -y && apt upgrade -y \
    && apt install -y nginx-${NGINX_VERSION} \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/cache/nginx \
    && chown -R nginx:0 /var/log/nginx/ /var/cache/nginx /usr/share/nginx \
    && chmod -R "g+rwX" /var/log/nginx/ /var/cache/nginx /usr/share/nginx

RUN echo "nginx version: $(nginx -v)"

# USER 1001
CMD ["nginx", "-g", "daemon off;"]
# CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
