sudo docker container stop ust-ui-backend
sudo docker container rm -f ust-ui-backend
sudo docker image rm -f ust-ui-backend
sudo docker build -t ust-ui-backend .
sudo docker run --name=ust-ui-backend -i --network=host -d ust-ui-backend
