#!/bin/bash

EPUB=$1
TMP_DIR=/tmp/b

if [ -z "${EPUB}" ]; then
  echo "need to specify the file to fix"
  exit 1
else
  CURRENT_DIR=$(pwd)
  mkdir ${TMP_DIR}
  cd ${TMP_DIR}
  unzip ${EPUB} &> /dev/null
  tidy -m *.html &> /dev/null  # Suppress output
  zip ${EPUB} * &> /dev/null
  cd ${CURRENT_DIR}
  rm -rf ${TMP_DIR}
fi
