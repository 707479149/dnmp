#! /bin/bash
echo www.baidu.com 127.0.0.0 >> /etc/hosts
exit 0
ping -c1 www.baidu.com|awk -F'[(|)]' 'NR==1{print $2}' >>./ip


if [ ! -f "./hosts" ];then
        exit 0
else
cat ./hosts | tr -d "^M" > ./hosts_unix

dos2unix hosts_unix

for line in `cat hosts_unix`
do
        while read ipadd
        do
           echo $ipadd $line >> /etc/hosts
        done<./ip
done

unlink ./ip
unlink ./hosts_unix
fi
tail -f /dev/null
