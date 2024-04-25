# GCS Fusor
Mounts a Google Cloud Storage Bucket to a path which can then be mounted to a local machine.

[GCS FUSE Repo](https://github.com/GoogleCloudPlatform/gcsfuse)
[GDocs](https://cloud.google.com/storage/docs/gcs-fuse)
[Install FUSE](https://cloud.google.com/storage/docs/gcsfuse-install)

Google Permission Needed: Cloud Storage Folder Admin

CLI Options: https://cloud.google.com/storage/docs/gcsfuse-cli

Local Mounting: https://cloud.google.com/storage/docs/gcsfuse-mount



## To Yeet
Build
```bash
docker build -t gcs-fusor .
```

docker compose up -d --build

docker exec -it my-gcsfuse-container /bin/bash

docker exec -it my-gcsfuse-container ls /mnt/gcs

docker compose up -d

docker compose down