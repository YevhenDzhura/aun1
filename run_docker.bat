SET CONTAINER_NAME=flask-app
SET IMAGE_NAME=flask-app

FOR /f "tokens=*" %%j IN ('docker images -q %IMAGE_NAME%') DO (
    echo Image %IMAGE_NAME% is found. Deleting...
  docker stop %CONTAINER_NAME%
    docker rm %CONTAINER_NAME%
    docker rmi %%j
    echo Image is deleted.
)

echo building a docker image...
docker build -t %CONTAINER_NAME% .

echo Launching of a new container %CONTAINER_NAME%...
docker run -d -p 5000:5000 --name %CONTAINER_NAME% %IMAGE_NAME%

echo Container %CONTAINER_NAME% is on.
