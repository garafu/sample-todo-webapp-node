FROM ubuntu:20.04

COPY . /app

WORKDIR /app

RUN /app/build.sh

EXPOSE 3000

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["npm", "start"]
