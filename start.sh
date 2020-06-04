#!/bin/bash
#Defining where we will put docker files
docker_destination=/tmp/guysharony

#Removing all docker files
rm -rf $docker_destination/.docker
rm -rf $docker_destination/.minikube
rm -rf $docker_destination/com.docker.docker
rm -rf ~/.kube ~/.minikube

if minikube &> /dev/null
then
	echo "Minikube"
	echo " > Checking for update."
	if brew upgrade minikube &> /dev/null
	then
		echo " > Everything is up-to-date."
	else
		echo " > Can't update minikube."
		exit 1
	fi
else
	echo " > Checking for installation."
	if brew install minikube &> /dev/null
	then
		echo " > Everything is installed."
	else
		echo " > Can't install minikube.'"
		exit 1
	fi
fi

if minikube delete &> /dev/null
then
	echo " > Preparing for setting up."
else
	echo " > Can't prepare for setting up."
	exit 1
fi

#Replacing old docker files with symlinks to new docker files
rm -rf ~/Library/Containers/com.docker.docker
rm -rf ~/.docker
mkdir -p $docker_destination/com.docker.docker
mkdir -p $docker_destination/.docker
ln -sf $docker_destination/com.docker.docker ~/Library/Containers/com.docker.docker
ln -sf $docker_destination/.docker ~/.docker

#Opening Docker properly
pkill Docker
open -g -a Docker

#Defining directory for minikube
export MINIKUBE_HOME=$docker_destination

#Removing old minikube files and installing minikube
rm -rf ~/.minikube
if brew install minikube &> /dev/null
then
	echo " > Downloading minikube."
else
	echo " > Can't download minikube."
	exit 1
fi

echo " > Cleaning virtual machines."
vms=$((`VBoxManage list vms | grep "minikube" | wc -l` + 0))
until [ $vms -lt 1 ]
do
	VBoxManage controlvm minikube poweroff &> /dev/null
	VBoxManage unregistervm minikube &> /dev/null
	((vms--))
done

echo " > Starting minikube, please wait."
if minikube start --vm-driver=virtualbox
then
	echo " > Minikube started successfully."
else
	echo " > Can't start minikube."
	exit 1
fi
#Defining minikube ip address and opening ports
server_ip=`minikube ip`
minikube ssh "sudo -u root awk 'NR==14{print \"    - --service-node-port-range=1-35000\"}7' /etc/kubernetes/manifests/kube-apiserver.yaml >> tmp && sudo -u root rm /etc/kubernetes/manifests/kube-apiserver.yaml && sudo -u root mv tmp /etc/kubernetes/manifests/kube-apiserver.yaml"

eval $(minikube docker-env)

#Building docker image
echo -e "\nDocker:"
if docker build -t services/nginx srcs/images/nginx/ &> /dev/null
then
	echo " > Creating Nginx image."
	sleep 1
else
	echo " > Can't create Nginx image."
	exit 1
fi

if kubectl apply -f srcs/yaml/nginx.yaml &> /dev/null
then
	echo " > Applying yaml for Nginx server."
	sleep 1
else
	echo " > Can't apply yaml for Nginx server."
	exit 1
fi

if docker build -t services/mysql srcs/images/mysql/ &> /dev/null
then
	echo " > Creating MySql image."
	sleep 1
else
	echo " > Can't create MySql image."
	exit 1
fi

if kubectl apply -f srcs/yaml/mysql.yaml &> /dev/null
then
	echo " > Applying yaml for MySql server."
	sleep 1
else
	echo " > Can't apply yaml for MySql server."
	exit 1
fi

if docker build -t services/wordpress srcs/images/wordpress/ &> /dev/null
then
	echo " > Creating Wordpress image."
	sleep 1
else
	echo " > Can't create Wordpress image."
	exit 1
fi

if kubectl apply -f srcs/yaml/wordpress.yaml &> /dev/null
then
	echo " > Applying yaml for Wordpress server."
	sleep 1
else
	echo " > Can't apply yaml for Wordpress server."
	exit 1
fi

if docker build -t services/phpmyadmin srcs/images/phpmyadmin/ &> /dev/null
then
	echo " > Creating Phpmyadmin image."
	sleep 1
else
	echo " > Can't create Phpmyadmin image."
	exit 1
fi

if kubectl apply -f srcs/yaml/phpmyadmin.yaml &> /dev/null
then
	echo " > Applying yaml for Phpmyadmin server."
	sleep 1
else
	echo " > Can't apply yaml for Phpmyadmin server."
	exit 1
fi

if docker build -t services/influxdb srcs/images/influxdb/ &> /dev/null
then
	echo " > Creating influxdb image."
	sleep 1
else
	echo " > Can't create influxdb image."
	exit 1
fi

if kubectl apply -f srcs/yaml/influxdb.yaml &> /dev/null
then
	echo " > Applying yaml for influxdb server."
	sleep 1
else
	echo " > Can't apply yaml for influxdb server."
	exit 1
fi

if docker build -t services/grafana srcs/images/grafana/ &> /dev/null
then
	echo " > Creating grafana image."
	sleep 1
else
	echo " > Can't create grafana image."
	exit 1
fi

if kubectl apply -f srcs/yaml/grafana.yaml &> /dev/null
then
	echo " > Applying yaml for grafana server."
	sleep 1
else
	echo " > Can't apply yaml for grafana server."
	exit 1
fi

if docker build -t services/ftps srcs/images/ftps/ &> /dev/null
then
	echo " > Creating ftps image."
	sleep 1
else
	echo " > Can't create ftps image."
	exit 1
fi

if kubectl apply -f srcs/yaml/ftps.yaml &> /dev/null
then
	echo " > Applying yaml for ftps server."
	sleep 1
else
	echo " > Can't apply yaml for ftps server."
	exit 1
fi

if minikube addons enable ingress &> /dev/null
then
	echo " > Allowing income connections."
	sleep 1
else
	echo " > Can't allow income connections."
	exit 1
fi

echo -e " > Website link: http://"$server_ip
echo -e "\nLoading ports."
echo -e " > Waiting for port 80, please wait."
until $(curl --output /dev/null -Isf http://$server_ip:80);
do
	&> /dev/null
done
echo -e " > Waiting for port 5050, please wait."
until $(curl --output /dev/null -Isf http://$server_ip:5050);
do
	&> /dev/null
done
echo -e " > Waiting for port 5000, please wait."
until $(curl --output /dev/null -Isf http://$server_ip:5000);
do
	&> /dev/null
done

#Opening website
open http://$server_ip
