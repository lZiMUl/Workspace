ARG NODE_VERSION=24
FROM node:${NODE_VERSION}
USER root
WORKDIR /app
COPY ./ ./
RUN pwd && ls -lah /app && file /app/entrypoint.sh
RUN apt update
RUN apt install dos2unix -y
RUN dos2unix ./entrypoint.sh
RUN chmod +x ./entrypoint.sh
RUN apt remove dos2unix -y
RUN apt clean
ENTRYPOINT ["./entrypoint.sh"]
ENV NODE_ENV=production
ENV DEBUG=false
EXPOSE 9329
VOLUME ["/data"]
LABEL maintainer="lZiMUl"
LABEL version="1.0.0"