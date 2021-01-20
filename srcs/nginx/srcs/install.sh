#Nginx package
apk update
apk add nginx openrc openssh
apk add openrc libc6-compat
mkdir /run/nginx/
#missing dir for some reason !
mkdir /run/openrc
#missing file needed
touch /run/openrc/softlevel