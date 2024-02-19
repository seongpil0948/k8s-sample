#!/bin/bash

CR_PROJ_PATH=docker.abacussw.co.kr/k8s
CR_OICD_PATH=$CR_PROJ_PATH/oicd
# VERSION_IMG=0.0.2
VERSION_IMG=latest
APP_DIR=/home/abacus/infra/apps

APP_NAME_ONE=sample-java-1
URL_ONE=$CR_OICD_PATH/$APP_NAME_ONE:$VERSION_IMG 
echo "build: $URL_ONE"
docker build $APP_DIR/$APP_NAME_ONE -t $URL_ONE
docker push  $URL_ONE
# docker build -t sample-java-1:latest /home/abacus/infra/apps/sample-java-1

APP_NAME_TWO=sample-java-2
URL_TWO=$CR_OICD_PATH/$APP_NAME_TWO:$VERSION_IMG 
echo "build: $URL_TWO"
docker build $APP_DIR/$APP_NAME_TWO -t $URL_TWO
docker push  $URL_TWO
# docker build -t sample-java-2:latest /home/abacus/infra/apps/sample-java-2








