Simple Flask Webapp
======================

# 1. Introduction
환경변수 HOSTNAME을 출력하는 간단한 Web Application입니다. 
Python 기반의 Flask를 사용하였으며, 5000번 포트를 통해 Request를 전달받습니다.
***
# 2. How to Build
## Manual
프로젝트 루트 디렉토리에서 아래 명령어를 실행합니다.  
IMAGE_NAME과 IMAGE_TAG는 상황에 맞게 변경합니다.
``` bash
IMAGE_NAME="simple-webapp"
IMAGE_TAG="latest"
docker build --tag ${IMAGE_NAME}:${IMAGE_TAG} .
```
## Jenkins
Jenkins에서 Multi Pipeline 타입의 Item을 생성하고, 프로젝트 소스코드의 Repository URL을 Branch Source로 지정합니다.  
프로젝트에 포함된 Jenkinsfile로부터 빌드 과정이 자동으로 진행되며, Kaniko를 통해 컨테이너 이미지 Build, Push를 수행합니다.
참고로 대부분의 CSP에서 Docker를 더 이상 Container Runtime으로 제공하지 않기 때문에, Docker in Docker 방식의 agent를 사용할 수 없습니다.
***
# 3. 배포
Local 환경 배포시 아래 명령어를 실행합니다(K8s에 배포하는 방법은 simple-flask-webapp-deployment 프로젝트 참고).
``` bash
WEBAPP_PORT=5000
WEBAPP_NAME="webapp-test"
IMAGE_NAME="simple-webapp"
IMAGE_TAG="latest"
docker run -p ${WEBAPP_PORT}:5000 --name ${WEBAPP_NAME} -d ${IMAGE_NAME}:${IMAGE_TAG}
```