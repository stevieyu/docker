#!/bin/bash

file_path="./tmp.txt"

# 读取文件中的所有域名
domains=$(grep -oE '[[:alnum:]+\.\-]+\.([[:alnum:]]{2,})+' "$file_path")

# 对每个域名进行ping测试并获取延迟
ping_results=""
while IFS= read -r domain; do
    echo "ping $domain"
    ping_result=$(ping -c 1 "$domain" | tail -1 | awk '{print $4}' | cut -d '/' -f 2)
    ping_results+="$ping_result $domain"$'\n'
done <<< "$domains"

# 按照延迟从小到大进行排序
sorted_results=$(echo "$ping_results" | sort -n)

# 输出排序后的结果及对应的延迟时间
while IFS= read -r result; do
    latency=$(echo "$result" | awk '{print $1}')
    domain=$(echo "$result" | awk '{print $2}')
    echo "延迟时间：$latency ms - 域名：$domain"
done <<< "$sorted_results"