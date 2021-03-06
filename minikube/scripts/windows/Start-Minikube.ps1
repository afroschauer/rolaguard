echo "creating Minikube cluster..."

# to poweroff VM with minikube
echo ">>> minikube stop <<<"
minikube stop

# to remove VM with minikube
echo ">>> minikube delete -p minikube <<<"
minikube delete -p minikube
Remove-Item -Force -Recurse ~/.minikube
ls ~/.minikube -ErrorAction SilentlyContinue

# to create or start VM with minikube
# some params:
#  --driver=hyperv         : when it start you can choose a driver type:  virtualbox, vmwarefusion, hyperv, vmware, docker
#  --memory=2500           : restrict VM memory up to 2.5G
#  --v=7 --alsologtostderr : log in verbose mode
echo ">>> minikube start <<<"
minikube start --driver=hyperv --memory=2500 --v=7 --alsologtostderr --force