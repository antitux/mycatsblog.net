FROM nginx
COPY site /srv/site
RUN apt-get update &&\
    apt-get install -y bundler git &&\
    cd /srv/site &&\
    bundle install &&\
    jekyll build &&\
    rm -rf /usr/share/nginx/html &&\
    cp -a /srv/site/_site /usr/share/nginx/html &&\
    chown -R nginx:nginx /usr/share/nginx/html &&\
    cd / &&\
    rm -rf /srv/site &&\
    apt-get -y remove bundler git &&\
    apt-get autoclean