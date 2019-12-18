FROM maven:3.3-jdk-8 AS src
RUN git clone https://github.com/spring-projects/spring-petclinic.git
WORKDIR /spring-petclinic
RUN mvn install

FROM openjdk:8-jre-alpine
COPY --from=src /spring-petclinic/target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar / 
ENTRYPOINT ["/usr/bin/java"]
CMD ["-jar","spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar"]