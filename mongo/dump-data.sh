#/bin/sh
current_path=$(cd `dirname $0`; pwd)
docker exec yapi-mongo sh -c 'exec mongodump -d yapi --archive' > ${current_path}/yapi-dump-`date "+%Y-%m-%d-%H-%M"`.archive




