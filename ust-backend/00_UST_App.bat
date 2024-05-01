docker container stop ust-ui-backend
docker container rm -f ust-ui-backend
docker image rm -f ust-ui-backend
docker build -t ust-ui-backend .
docker run --name=ust-ui-backend -i --network=host -d ust-ui-backend
