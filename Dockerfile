# use a node base image
FROM node:8

# set maintainer
LABEL maintainer "sunnypabba@gmail.com"

# run a command inside the container
# this will create a directory for our application
RUN mkdir -p /app

# set the working directory to our app directory
WORKDIR /app

# copy our application inside the container
COPY app/* /app/

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000

# tell docker what command to run when container is run
CMD npm start
