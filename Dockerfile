FROM alpine:3

LABEL description="修改 Alpine 3 官方镜像的默认时区为 Asia/Shanghai，并将软件源替换为国内镜像源" \
	author="l3e0x7b, <lyq0x7b@foxmail.com>"

RUN apk add --no-cache tzdata && \ 
	ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	echo "Asia/Shanghai" > /etc/timezone && \
	apk del tzdata && \
	sed -i 's/dl-cdn.alpinelinux.org/mirrors.cloud.tencent.com/g' /etc/apk/repositories
