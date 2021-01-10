
# Minikube start
#minikube start
minikube delete
minikube start
eval $(minikube -p minikube docker-env)

#docker shit
docker build -t mynginx ./srcs/nginx/
docker build -t mysql ./srcs/mysql/
docker build -t myphp ./srcs/phpmyadmin/
docker build -t myword ./srcs/wordpress/

#MetalLB Installation

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

#
minikubeip=$(minikube ip)
sed -i '' "s/192.168.99.*/$minikubeip-$minikubeip/g" ./srcs/metallb.yaml

kubectl apply -f ./srcs/metallb.yaml

#Nginx / MySQL / Wordpress

# Don't forget to give mySQL 'root' privileges to be able to connect with WordPress
# mysql -u root -p 
# -> mysql> GRANT ALL PRIVILEGES ON mysql.* to 'root'@'localhost';
# -> mysql> GRANT ALL PRIVILEGES ON wordpress.* to 'root'@'localhost';



kubectl apply -f ./srcs/nginx.yaml
kubectl apply -f ./srcs/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress.yaml
# kubectl apply -f mysql-secret.yaml 
# kubectl apply -f mysql-deplsvc.yaml
# kubectl apply -f wordpress-deplsvc.yaml
# kubectl apply -f phpmyadmin-deplsvc.yaml
minikube dashboard &
#kubectl get pods