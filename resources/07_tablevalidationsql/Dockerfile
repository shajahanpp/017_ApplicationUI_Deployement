FROM openjdk:8
WORKDIR /ust/backend
ADD ./ /ust/backend
# RUN ls -l

ENTRYPOINT ["java","-jar","TableValidationSqlQuery-0.0.1-SNAPSHOT.jar"]
# ,"--spring.config.location=application.properties"