在线 ui https://ziahamza.github.io/webui-aria2/

```sh
docker run -d -v ~/Downloads:/root/downloads -p 6800:6800 --name aria2 aria2 --dir=/root/downloads --continue=true --max-connection-per-server=16 --min-split-size=1M --split=10

aria2c -c -s10 -k1M -x16 --enable-rpc=false -o "MacBooster 7_7.2.0_xclient.info.dmg" --header "User-Agent: netdisk;6.0.0.12;PC;PC-Windows;10.0.16299;WindowsBaiduYunGuanJia" --header "Referer: https://pan.baidu.com/disk/home" --header "Cookie: BDUSS=jdzM3VRY1h5VnFKSTNEdlQwNWRQNFdocW44WktJYjFJNlRuVlZVU3QwR1pJOXhiQVFBQUFBJCQAAAAAAAAAAAEAAABT4Ns0eXptMTU4MQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJmWtFuZlrRbN; pcsett=1539865064-081978fe87e79097ed179122d0d7813b" "https://d.pcs.baidu.com/file/e10cdcecdbe71ce32948112c333a8199?fid=4185473307-250528-734395460878415&dstime=1539778691&rt=sh&sign=FDtAERV-DCb740ccc5511e5e8fedcff06b081203-S%2BOX%2FhCNU4PqO7aawNs4t6K9hfc%3D&expires=8h&chkv=1&chkbd=0&chkpc=&dp-logid=6722346247646785356&dp-callid=0&shareid=3404139364&r=561576538"
```