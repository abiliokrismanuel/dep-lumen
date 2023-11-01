# Example Docker Lumen Nginx Php Mysql

1. pindah app lumen 
``` bash
/dep-lumen/<your directory>
```
2. rubah
``` yml
# docker-compose.yml
nginx:
    image: nginx:stable-alpine
    container_name: nginx
    ports:
      - "80:80"
    volumes:
    # change the path to your project path
      - ./<your directory>:/var/www/html 
      - ./nginx/default.conf:/etc/nginx/conf.d/default.conf
    depends_on:
      - php
    networks:
      - lumen
```
3. rubah juga

``` yml
#Dockerfile
COPY /<your directory>/ /var/www/html/

```

4. ganti ```.env ```
``` 
DB_CONNECTION= mysql
DB_HOST= db
DB_PORT= 3306
DB_DATABASE= 
DB_USERNAME= 
DB_PASSWORD= 
DB_ROOT_PASSWORD= 
```

5. run untuk build aplikasi
```yml
docker-compose build
```
6. run
``` yml
docker-compose up
# OR
docker-compose up -d
```

7. untuk mematikannya
``` yml 
docker-compose down
# OR
docker-compose down -v
```
