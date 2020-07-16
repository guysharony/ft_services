#!/bin/bash

ft_deployment()
{
	if docker build -t services/$1 srcs/images/$1/ &> /dev/null
	then
        	echo " > Creating $1 image."
        	sleep 1
	else
	        echo " > Can't create $1 image."
	        exit 1
	fi

	if kubectl apply -f srcs/yaml/$1.yaml &> /dev/null
	then
        	echo " > Applying yaml for $1 server."
        	sleep 1
	else
        	echo " > Can't apply yaml for $1 server."
        	exit 1
	fi
}

if minikube &> /dev/null
then
	echo "Minikube"
	echo " > Minikube is installed."
else
	echo " > Please install Minikube."
	exit 1
fi

if minikube delete &> /dev/null
then
	echo " > Removing old minikube clusters."
else
	echo " > Can't remove old minikube clusters."
	exit 1
fi

echo " > Starting minikube, please wait."
if minikube start --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000
then
	echo " > Minikube started successfully."
else
	echo " > Can't start minikube."
	exit 1
fi

eval $(minikube docker-env)

echo -e "\nDocker:"
ft_deployment nginx
#ft_deployment mysql
#ft_deployment wordpress
#ft_deployment phpmyadmin
#ft_deployment influxdb
#ft_deployment grafana
#ft_deployment ftps

#kubectl expose deployment nginx-deployment \
#	--name=nginx-service --type=LoadBalancer

#kubectl apply -f srcs/yaml/namespace.yaml
#kubectl apply -f srcs/yaml/metallb.yaml

#kubectl create -f srcs/yaml/config.yaml
