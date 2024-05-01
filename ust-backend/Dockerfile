FROM openjdk:8
WORKDIR /ust/web/backend
ADD ./ /ust/web/backend
#RUN ls -l
ENTRYPOINT ["java","-jar","Ust-web-backend-0.0.1-SNAPSHOT.war","--spring.config.location=application.properties"]
