#!/bin/sh
current_path=$(cd `dirname $0`; pwd)
docker cp ${current_path}/yapi-import.archive yapi-mongo:/root 
docker exec yapi-mongo sh -c 'exec mongorestore -d yapi --archive=/root/yapi-import.archive'

