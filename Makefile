all:
		cd ./srcs/ && docker-compose up -d
re:
		cd ./srcs/ && docker-compose up --build -d
rm:
		docker rm -f $$(docker ps -aq)
rmi:
		docker rmi $$(docker images -q)
stop:
		cd ./srcs/ && docker-compose stop
down:
		cd ./srcs/ && docker-compose down
rmn:
		docker network rm $$(docker network ls -q)
rmv:
		@sudo rm -Rf /home/$$USER/data/wp/* /home/$$USER/data/db/*
		docker volume rm $$(docker volume ls -q)
log:
		cd ./srcs/ && docker-compose logs -f

ps:		
		cd ./srcs/ && docker-compose ps
info:
		@echo "++++++++++Containers+++++++++++"
		cd ./srcs/ && docker-compose ps
		@echo "+++++++Stoping Containers++++++"
		docker ps -a
		@echo "++++++++++++Networs++++++++++++"
		docker network ls
		@echo "++++++++++++Volumes++++++++++++"
		docker volume ls
.PHONY: all re rm rmi stop down rmn rmv log info
