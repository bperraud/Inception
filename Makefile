all: dir
	@docker-compose -f ./srcs/docker-compose.yml up

dir:
	mkdir -p /home/bperraud/data/mariadb /home/bperraud/data/wordpress
	sudo chmod 777 /home/bperraud/data/mariadb /home/bperraud/data/wordpress

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re: dir
	@docker-compose -f srcs/docker-compose.yml up --build

clean:
	docker-compose -f srcs/docker-compose.yml down
	docker system prune -a --volume
	docker system prune -a --force
	sudo rm -rf /home/bperraud/data/

.PHONY: all re down clean
