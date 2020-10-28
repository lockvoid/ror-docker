FROM nginx

# Install dependencies

RUN apt-get update -qq && apt-get -y install apache2-utils

# Establish where Nginx should look for files

ENV RAILS_ROOT /srv/app

# Set our working directory inside the image

WORKDIR $RAILS_ROOT

# Create log directory

RUN mkdir log

# Copy over static assets

COPY public public/

# Copy  config template

COPY docker/web/nginx.conf /tmp/docker.nginx

RUN envsubst '$RAILS_ROOT' < /tmp/docker.nginx > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]