FROM registry.access.redhat.com/ubi8/ubi-minimal:8.4
# FROM redhat/ubi8/ubi-minimal:8.4

LABEL maintainer="TychoDev <cloud.ops@tychodev.com>"

ENV NGINX_VERSION=14 \
    PATH=$HOME/.local/bin/:$PATH

# MicroDNF is recommended over YUM for Building Container Images
# https://www.redhat.com/en/blog/introducing-red-hat-enterprise-linux-atomic-base-image

RUN microdnf update -y \
    && microdnf install -y nginx \
    && microdnf clean all \
    && rm -rf /var/cache/* /var/log/dnf* /var/log/yum.*

RUN mkdir /var/cache/nginx \
    && chown -R nginx:0 /var/log/nginx/ /var/cache/nginx /usr/share/nginx \
    && chmod -R "g+rwX" /var/log/nginx/ /var/cache/nginx /usr/share/nginx

USER nginx
RUN nginx -V
CMD ["nginx", "-g", "daemon off;"]
# CMD ["/usr/sbin/nginx", "-g", "daemon off;"]