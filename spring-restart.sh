# spring-restart.sh
source ./var.sh

if [ -z "$PROJECT_PID" ]; then
    nohup java -jar $JAR_PATH 1>log.out 2>err.out &
fi