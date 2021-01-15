minikubeip=$(minikube ip)
sed -i '' "s/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/$minikubeip/g" test.sh

192.168.99.211
