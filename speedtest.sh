#!/bin/bash

hosts=(
    "repo.huaweicloud.com/repository/npm"
    "registry.npmmirror.com"
    "mirrors.cloud.tencent.com/npm"
    "registry.npmjs.org"
)

times=()

for host in "${hosts[@]}"; do
    url="https://$host/ky"
    # echo "test $url"
    time="$(curl -s -w '%{time_total}\n' -o /dev/null "$url")"
    times+=($time)
    echo "$host: $time"
done

fastest_host=""
fastest_time=0

for idx in "${!times[@]}"; do
  time="${times[$idx]}"
  if [[ "$fastest_host" == "" || "$(echo "$time<$fastest_time" | bc)" -eq 1 ]]; then
    fastest_host="${hosts[$idx]}"
    fastest_time="$time"
  fi
done

echo "Fastest host: $fastest_host ($fastest_time seconds)"