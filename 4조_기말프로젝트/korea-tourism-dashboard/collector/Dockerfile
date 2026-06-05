FROM alpine:3.18

# coreutils를 추가하여 GNU date 지원
RUN apk add --no-cache curl jq tzdata bash coreutils

ENV TZ=Asia/Seoul
RUN cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
    echo "Asia/Seoul" > /etc/timezone

WORKDIR /app

COPY fetch.sh .
COPY crontab.txt /etc/crontabs/root

RUN chmod +x fetch.sh

# 시작 시 즉시 수집 후 크론 데몬 실행
CMD /app/fetch.sh && crond -f -d 8