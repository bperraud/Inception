dir:
	mkdir -p /home/bperraud/data/mariadb
	mkdir -p /home/bperraud/data/wordpress

all: dir
	@docker-compose -f ./srcs/docker-compose.yml up

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re: dir
	@docker-compose -f srcs/docker-compose.yml up --build

clean:
	docker-compose -f srcs/docker-compose.yml down
	docker stop $(docker ps -qa) 2>/dev/null
	docker rm $(docker ps -qa) 2>/dev/null
	docker rmi -f $(docker images -qa) 2>/dev/null
	docker volume rm $(docker volume ls -q) 2>/dev/null
	docker network rm $(docker network ls -q) 2>/dev/null
	docker system prune -a --volume 2>/dev/null
	docker system prune -a --force 2>/dev/null
	sudo rm -rf /home/bcaffere/ 2>/dev/null

.PHONY: all re down clean
