#!/bin/sh
echo "Setting up Minikube..."

# to check minikube health
echo ">>> minikube status <<<"
minikube status

# to point your shell to minikube's docker-daemon
eval $(minikube -p minikube docker-env)

# to check if we're looking docker's images inside minikube
echo ">>> docker images <<<"
docker images

# to build docker's images inside minikube
echo ">>> ./Build-DockerImages <<<"
./Build-DockerImages.sh

# to deploy docker's images to minikube
echo ">>> ./Deploy-DockerImages <<<"
./Deploy-DockerImages.sh

# if you want to use images from dockerhub, please comment the previous two commands: ./Build-DockerImages.ps1 and ./Deploy-DockerImages.ps1
#echo ">>> ./Deploy-DockerHubImages <<<"
#./Deploy-DockerHubImages.sh

# to list IP and ports exposed
echo ">>> minikube service postgres --url <<<"
minikube service postgres --url

# remove old minikube ip from hosts file
HOSTS=/etc/hosts
grep "localhost.rolaguard" $HOSTS > $HOSTS

# add hte new minikube ip to hosts file
MINIKUBE_IP=`minikube ip`
echo "$MINIKUBE_IP localhost.rolaguard" >>  $HOSTS
echo ">>> updated hosts file with new minikube IP: $MINIKUBE_IP <<<"

open http://localhost.rolaguard:30003/

# to open k8s dashboard into default browser
echo ">>> minikube dashboard <<<"
minikube dashboard
