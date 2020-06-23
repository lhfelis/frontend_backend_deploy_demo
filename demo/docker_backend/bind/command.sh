#!/bin/bash

DB_LB_KEEPALIVED_VIP=172.30.0.200
DB_LB_PORT=3306
DATABASE_SCHEME=djangovuetemplate
PXC_USERNAME=root
PXC_PASSWORD=b0a1d2p3a4s5s6w7d
DATABASE_URL=mysql://${PXC_USERNAME}:${PXC_PASSWORD}@${DB_LB_KEEPALIVED_VIP}:${DB_LB_PORT}/${DATABASE_SCHEME}
DJANGO_SETTINGS_MODULE=backend.settings.prod

export DATABASE_URL
export DJANGO_SETTINGS_MODULE

# wait for pxc db ready
sleep 60

# ensure database djangovuetemplate exists
python3 /root/init_db_schema.py ${DB_LB_KEEPALIVED_VIP} ${DB_LB_PORT} ${PXC_USERNAME} ${PXC_PASSWORD} ${DATABASE_SCHEME}

pushd /root/django-vue-template
    python3 manage.py migrate
    service supervisor start
    sleep infinity
popd