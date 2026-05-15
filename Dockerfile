ARG NODE_VERSION=24
FROM node:${NODE_VERSION}
USER root
WORKDIR /app
COPY ./ ./
RUN ls -lah /
RUN ls -lah /app
RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
ENV NODE_ENV=production
ENV DEBUG=false
EXPOSE 9329
VOLUME ["/data"]
LABEL maintainer="lZiMUl"
LABEL version="1.0.0"