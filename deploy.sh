# deploy.sh
# 1. 환경변수 불러오기 (적용)
source ./var.sh
echo "1. 환경변수 세팅 완료"

# 2. crontab 초기화
touch empty
crontab empty
rm empty
echo "2. 크론탭 초기화 완료"

# 3. 서버 확인
sudo apt -y update
echo "3-1 apt 업데이트 완료"

sudo apt -y install openjdk-11-jdk
echo "3-2 jdk 인스톨 완료"

sudo timedatectl set-timezone Asia/Seoul
echo "3-3 타임존 서울로 변경 완료"

# 4. 프로젝트 폴더 삭제
rm -rf ${HOME}/${PROJECT_NAME}
echo "4. 프로젝트 폴더 삭제 완료"

# 5. 깃 저장소 가져오기
git clone https://github.com/${GITHUB_ID}/${PROJECT_NAME}.git
sleep 5s
echo "5. 깃 저장소 가져오기 완료"

# 6. gradlew 실행권한 부여
chmod u+x ${HOME}/${PROJECT_NAME}/gradlew
echo "6. 빌드도구 실행권한 부여 완료"

# 7. 빌드
cd ${HOME}/${PROJECT_NAME}
./gradlew build
sleep 3s
echo "7. 빌드 완료"


# 8. 시작하기
nohup java -jar ${JAR_PATH} 1>${HOME}/log.out 2>${HOME}/err.out &
sleep 3s
echo "8. 서버 시작 완료"


# 9. 크론 등록
crontab -l > crontab_new
echo "* * * * * ${HOME}/spring-restart.sh" 1>>crontab_new
crontab crontab_new
rm crontab_new
echo "9. cron 자동 서버 체크 완료"