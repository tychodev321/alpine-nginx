# https://hub.docker.com/_/nginx/tags
FROM nginx:1.25.2-alpine-slim

LABEL maintainer=""

ENV PATH=$HOME/.local/bin/:$PATH

RUN echo "nginx version: $(nginx -v)"

# USER 1001
CMD ["nginx", "-g", "daemon off;"]
# CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
