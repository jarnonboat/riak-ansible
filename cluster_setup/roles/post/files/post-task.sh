#!/bin/bash
# to remove proxy configuration in kubernetes manifest

PREFIX=/etc/kubernetes/manifests/
BACKUP_PREFIX=/etc/kubernetes/backup/
mkdir -p $BACKUP_PREFIX

declare -a arr=("kube-apiserver.yaml" "kube-controller-manager.yaml" "kube-scheduler.yaml")

for i in "${arr[@]}"
do
    echo "$PREFIX$i"
    cp $PREFIX$i $BACKUP_PREFIX$i.bak
    START_LINE=$(sed -n '/env/=' $PREFIX$i)
    END_LINE=`expr $START_LINE + 6`
    sed -e "${START_LINE},${END_LINE}d" $PREFIX$i > $PREFIX$i.new
    mv $PREFIX$i.new $PREFIX$i
done


