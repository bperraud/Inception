all: dir
	sudo docker-compose -f ./srcs/docker-compose.yml up

dir:
	sudo mkdir -p /home/bperraud/data/mariadb /home/bperraud/data/wordpress
	sudo chmod 777 /home/bperraud/data/mariadb /home/bperraud/data/wordpress

down:
	sudo docker-compose -f ./srcs/docker-compose.yml down

re: dir
	sudo docker-compose -f srcs/docker-compose.yml up --build

clean:
	sudo docker-compose -f srcs/docker-compose.yml down
	sudo docker system prune --volumes
	sudo rm -rf /home/bperraud/data/

.PHONY: all re down clean
