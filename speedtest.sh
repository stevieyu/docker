#!/bin/bash

hosts=(
    "repo.huaweicloud.com/repository/npm"
    "registry.npmmirror.com"
    "mirrors.cloud.tencent.com/npm"
    # "registry.npmjs.org"
)

times=()

for host in "${hosts[@]}"; do
    url="https://$host/ky"
    # echo "test $url"
    time="$(curl -s -w '%{time_total}\n' -o /dev/null "$url")"
    times+=($time)
    echo "$host: $time seconds"
done

find_min_index() {
    # 将数组作为参数传递给函数
    local array=("$@")
    # 假设第一个元素为最小值
    local min=${array[0]}
    local index=0
    # 遍历数组，比较每个元素与当前最小值的大小
    for i in "${!array[@]}"
    do
        # 使用awk进行浮点数比较
        if (( $(awk 'BEGIN{print ('${array[i]}' < '$min')}' ) ))
        then
            min=${array[i]}
            index=$i
        fi
    done
    # 返回最小值的索引
    echo $index
}

min_index=$(find_min_index "${times[@]}")

echo "最少时间为: ${times[min_index]} 秒; 索引: $min_index"
echo "最快主机: ${hosts[min_index]}"
