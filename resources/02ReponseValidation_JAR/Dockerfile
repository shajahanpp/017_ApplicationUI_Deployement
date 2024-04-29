FROM openjdk:8
WORKDIR /ust/backend
ADD ./ /ust/backend
# RUN ls -l

ENTRYPOINT ["java","-jar","ResponseValidation.jar"]
# ,"--spring.config.location=application.properties"