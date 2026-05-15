ARG NODE_VERSION=24
FROM node:${NODE_VERSION}
USER root
WORKDIR /app
COPY ./ ./
RUN apt update
RUN apt install dos2unix -y
RUN dos2unix /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
RUN apt remove dos2unix -y
RUN apt clean
RUN npm ci
RUN npm run build
ENTRYPOINT ["/app/entrypoint.sh"]
ENV NODE_ENV=production
ENV DEBUG=false
EXPOSE 9329
VOLUME ["/data"]
LABEL maintainer="lZiMUl"
LABEL version="1.0.0"