#!/bin/bash
#
BASE_CONFIG=zbx-agent.yml
ZBX_PLACE=/opt/zabbix
export ZBX_PLACE

for i in "$@"
do
    case $i in
        machine-list)
            docker-machine ls
            exit 0
        ;;
        --machine=*)
           MACHINE_NAME="${i#*=}"
           eval $(docker-machine env $MACHINE_NAME)
           shift
        ;;
        --base=*)
           BASE_CONFIG="${i#*=}".yml
           shift
        ;;
        init)
	    # copy persistent data to machine host
	    docker-machine ssh $MACHINE_NAME "mkdir -p $ZBX_PLACE"
	    docker-machine scp -r ./zbx_env $DOCKER_MACHINE_NAME:$ZBX_PLACE
            exit 0
        ;;
        build)
            docker-compose -f $BASE_CONFIG -f machines/$DOCKER_MACHINE_NAME.yml build $SERVICE
            exit 0
        ;;
         start-daemon)
            docker-compose -f $BASE_CONFIG -f machines/$DOCKER_MACHINE_NAME.yml up -d
            exit 0
        ;;
        start)
            docker-compose -f $BASE_CONFIG -f machines/$DOCKER_MACHINE_NAME.yml start
            exit 0
        ;;
        stop)
            docker-compose -f $BASE_CONFIG -f machines/$DOCKER_MACHINE_NAME.yml stop
            exit 0
        ;;
        logs)
            docker-compose -f $BASE_CONFIG -f machines/$DOCKER_MACHINE_NAME.yml logs
            exit 0
        ;;
        down)
            docker-compose -f $BASE_CONFIG -f machines/$DOCKER_MACHINE_NAME.yml down
            exit 0
        ;;
        config)
            docker-compose -f $BASE_CONFIG -f machines/$DOCKER_MACHINE_NAME.yml config
            exit 0
        ;;
        --container=*)
           CONTAINER="${i#*=}"
           shift
        ;;
        --service=*)
           SERVICE="${i#*=}"
           shift
        ;;
        attach)
           docker exec -t -i $CONTAINER /bin/bash
           exit 0
           shift
        ;;
        list)
           docker inspect --format='{{.Name}}' $(docker ps -aq --no-trunc)
           exit 0
           shift
        ;;
        help)
            echo "Checkout README.md and add machine.yml"
            exit 1
            shift
        ;;
    esac
done

echo "Options:"
echo "  init:	       copy ./zbx_env to MACHINE:$ZBX_PLACE"
echo "  start-daemon:  start all services and detach"
echo "  stop:          stop all service"
echo "  list:          list all dockers container names"
echo "  --machine=<machine name> docker machine to work with"
echo "  machine-list:  list all machines"
exit 1
