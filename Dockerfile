FROM ubuntu:20.04

COPY . /app

WORKDIR /app

RUN /app/build.sh
# RUN apt-get update \
#     && apt-get install -y curl netcat mysql-client \
#     && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
#     && apt-get install -y nodejs \
#     && npm ci \
#     && chmod +x /app/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["npm", "start"]
