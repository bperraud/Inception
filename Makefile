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
	docker stop $(docker ps -qa)
	docker rm $(docker ps -qa)
	docker rmi -f $(docker images -qa)
	docker volume rm $(docker volume ls -q)
	docker network rm $(docker network ls -q)
	docker system prune -a --volume
	docker system prune -a --force
	sudo rm -rf /home/bperraud/data/

.PHONY: all re down clean
