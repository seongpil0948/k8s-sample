SERVER_URI=192.168.0.103
MOUNT_PATH=/nfs_shared

helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
helm install nfs-shared-class nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
  --set nfs.server=$SERVER_URI \
  --set nfs.path=$MOUNT_PATH \
  --set storageClass.archiveOnDelete=true \
  --set storageClass.name=nfs-shared-client \
  --set storageClass.defaultClass=true \