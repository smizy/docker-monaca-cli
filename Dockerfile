FROM pottava/nodejs
MAINTAINER smizy

RUN adduser -D -g '' -u 1000 docker

RUN apk --no-cache add git && \
    npm install -g cordova@6.0 monaca  

RUN cd /opt/node/lib/node_modules/monaca/node_modules/.bin && \
    ln -s /opt/node/bin/cordova . && \
    mkdir /app 

USER docker
WORKDIR /app
    
VOLUME ["/opt/node/lib/node_modules"]

CMD ["sh"]
