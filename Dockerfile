from node:8-alpine
MAINTAINER alliot <https://www.iots.vip>

RUN apk update && \
	apk add --no-cache --update git redis && \
	git clone https://github.com/AlliotTech/naiveboom.git && \
	cd naiveboom/ && \
	apk del git && \
	rm /naiveboom/.git* -rf && \
	sed -i "s#kch.host##g" /naiveboom/views/layout.pug && \
	npm install 

WORKDIR /naiveboom

EXPOSE 3000
CMD redis-server /etc/redis.conf && node /naiveboom/run.js
