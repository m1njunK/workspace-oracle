# var.sh
# 환경 변수 작성하기
# GITHUB 저장소
GITHUB_ID="expandsource"
# 프로젝트 정보
PROJECT_NAME="aws-v1"
PROJECT_VERSION="v1-0.0.1"
PROJECT_PID="$(pgrep -f ${PROJECT_VERSION}-SNAPSHOT.jar)"
# 배포하는 파일(JAR) 경로
JAR_PATH="${HOME}/${PROJECT_NAME}/build/libs/${PROJECT_VERSION}-SNAPSHOT.jar"


export GITHUB_ID
export PROJECT_NAME
export PROJECT_VERSION
export PROJECT_PID
export JAR_PATH