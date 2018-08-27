FROM java:8
WORKDIR /opt
ADD gs-spring-boot-0.1.0.jar gs-spring-boot-0.1.0.jar
ENV SERVER_PORT=80
ENV NAME=unknown
EXPOSE $SERVER_PORT
CMD java -jar gs-spring-boot-0.1.0.jar