Basic commands:
-----
Build container: 
docker build -f Dockerfile -t test .

Start container:
docker run -d --name testapp -p 80:80 test:latest

Start container with external file binding:
docker run -d --name testapp -p 80:80 -v /app/index_modified.html:/var/www/index.html test:latest

Enter the container:
docker exec -it testapp /bin/s

Stop container:
docker rm -f testapp

Show images:
docker images

Show running containers:
docker ps

Show all containers:
docker ps -a
