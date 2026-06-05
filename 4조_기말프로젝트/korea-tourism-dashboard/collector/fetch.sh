#!/bin/bash

DATA_DIR="/app/data"
mkdir -p "$DATA_DIR"

BASE_URL="http://apis.data.go.kr/B551011/DataLabService"
# 예시로 기초 지자체(locgoRegnVisitrDDList) 사용
ENDPOINT="/locgoRegnVisitrDDList"

# 오늘 날짜와 어제 날짜 계산
TODAY=$(date +"%Y%m%d")
YESTERDAY=$(date -d "yesterday" +"%Y%m%d")

# 2023년 데이터가 있는지 확인 (초기 적재 플래그)
if [ ! -f "$DATA_DIR/20230101.json" ]; then
    echo "초기 데이터 적재를 시작합니다 (2023-01-01 ~ $YESTERDAY)"
    START_DATE="20230101"
    END_DATE=$YESTERDAY
else
    echo "일일 데이터 수집을 시작합니다 ($YESTERDAY)"
    START_DATE=$YESTERDAY
    END_DATE=$YESTERDAY
fi

# 공공데이터포털 API 호출 (JSON 포맷 지정)
REQ_URL="${BASE_URL}${ENDPOINT}?serviceKey=${API_KEY}&numOfRows=65000&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&startYmd=${START_DATE}&endYmd=${END_DATE}"

echo "Fetching data from: $REQ_URL"

# 결과를 JSON 파일로 저장
# 운영 환경에서는 날짜별로 파일을 분리하거나, jq를 사용해 하나의 summary.json으로 병합하는 로직을 추가할 수 있습니다.
curl -s -X GET "$REQ_URL" | jq '.' > "$DATA_DIR/latest_raw.json"

# Nginx에서 바로 사용할 수 있도록 가공 (옵션: jq 활용)
# 응답 헤더가 정상(0000)인 경우 body의 items만 추출
jq '.response.body.items.item // []' "$DATA_DIR/latest_raw.json" > "$DATA_DIR/summary.json"

echo "데이터 수집 완료: $(date)"