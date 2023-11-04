# gruzdevnn_infra
gruzdevnn Infra repository

    bastion_IP = 158.160.127.47
    someinternalhost_IP = 10.128.0.28

# cloud-bastion
# cloud-testapp

    testapp_IP = 62.84.114.200
    testapp_port = 9292

# command for run instance YC

    yc compute instance create \
      --name reddit-app3 \
      --hostname reddit-app3 \
      --memory=4 \
      --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
      --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
      --metadata-from-file user-data=Startup.yaml \
      --metadata serial-port-enable=1
