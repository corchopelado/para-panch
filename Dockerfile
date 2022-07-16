FROM corchopelado/nginx
WORKDIR /usr/share/nginx/html 
COPY . .
#RUN /bin/bash -c "curl localhost"
