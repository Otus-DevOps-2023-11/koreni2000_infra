#!/bin/bash

PROJECT_ID="b1ge1dcgioqf46mpfont"

# список виртуальных машин
VM_LIST=$(yc compute instance list --format=json --folder-id=$PROJECT_ID)

# JSON-объект для хранения инвентаря
echo '{'

# Группы хостов
echo '  "_meta": {'
echo '    "hostvars": {'
FIRST=true
for row in $(echo "${VM_LIST}" | jq -r '.[] | @base64'); do
    _jq() {
        echo ${row} | base64 --decode | jq -r ${1}
    }

    VM_NAME=$(_jq '.name')
    EXTERNAL_IP=$(_jq '.network_interfaces[0].primary_v4_address.one_to_one_nat.address')

    if [ "$FIRST" = true ]; then
        FIRST=false
    else
        echo ","
    fi
    echo '      "'${VM_NAME}'": { "ansible_host": "'${EXTERNAL_IP}'" }'
done
echo '    }'
echo '  },'

# Группы хостов
echo '  "all": {'
echo '    "hosts": ['$(echo "${VM_LIST}" | jq -r '.[].name' | tr '\n' ',' | sed 's/,$//')']'
echo '  }'

echo '}'
