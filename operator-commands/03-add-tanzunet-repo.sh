#
# Defines a repository that can be used to pull images from Tanzu net and install them into the cluster.
#
# Image pulling, and deployment of the packages is handled by kapp-controller and carvel tools 
#

export INSTALL_REGISTRY_HOSTNAME=registry.tanzu.vmware.com
export INSTALL_REGISTRY_USERNAME=$TANZU_NET_USERNAME
export INSTALL_REGISTRY_PASSWORD=$TANZU_NET_PASSWORD
export TAP_VERSION=1.0.1

tanzu package repository add tanzu-tap-repository \
  --url registry.tanzu.vmware.com/tanzu-application-platform/tap-packages:${TAP_VERSION} \
  --namespace tap-install

# to see the impact of this command 
tanzu package repository list -n tap-install

# equivalent kubectl command 
kubectl get packagerepositories.packaging.carvel.dev -n tap-install