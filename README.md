Simple Flask Webapp
======================

# 1. Introduction
This webapp prints the environment variable 'HOSTNAME'. It uses port 5000 in default.
****
# 2. How to Build
You can build a container image using the following command inside the project's root directory.
Please modify IMAGE_NAME and IMAGE_TAG for your taste. 
``` bash
IMAGE_NAME="simple-webapp"
IMAGE_TAG="latest"
docker build --tag ${IMAGE_NAME}:${IMAGE_TAG} .
```
