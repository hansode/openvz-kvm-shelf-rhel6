#!/bin/bash
#
# requires:
#  bash
#
set -e

cd vendor
for i in vmbuilder; do
  echo === $i ===
  (
    cd $i
    git pull origin master
  )
  git commit -m "update $i." $i
done
