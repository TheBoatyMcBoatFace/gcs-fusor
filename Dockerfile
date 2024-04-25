# Base Image
FROM ubuntu:focal

# Maintainer
LABEL maintainer="TheBoatyMcBoatFace"

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Environment Variables
ENV GOOGLE_APPLICATION_CREDENTIALS=/etc/gcsfuse/key.json
ENV GOOGLE_BUCKET=your-bucket-name
ENV GOOGLE_PROJECT=your-project-id
ENV MOUNT_PATH=/mnt/gcs

# Update packages and install necessary tools
RUN apt-get update && \
    apt-get install -y curl gnupg lsb-release ca-certificates fuse

# Configure package manager
RUN GCSFUSE_REPO=gcsfuse-`lsb_release -c -s` && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.asc] https://packages.cloud.google.com/apt $GCSFUSE_REPO main" | tee /etc/apt/sources.list.d/gcsfuse.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | tee /usr/share/keyrings/cloud.google.asc && \
    apt-get update

# Install Cloud Storage FUSE
RUN apt-get install -y gcsfuse

# Set up mount point
RUN mkdir -p ${MOUNT_PATH}

# Mount command on start
CMD ["sh", "-c", "gcsfuse --foreground ${GOOGLE_BUCKET} ${MOUNT_PATH} && while true; do sleep 1000; done"]

# Expose volume
VOLUME ${MOUNT_PATH}
