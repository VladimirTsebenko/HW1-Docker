FROM openjdk:11-jdk AS src
RUN cd /
RUN apt-get install git -y
RUN mkdir spring-petclinic
RUN git clone https://github.com/spring-projects/spring-petclinic.git
RUN chmod +x /spring-petclinic
WORKDIR /spring-petclinic


FROM maven:3.3-jdk-8
COPY --from=src /spring-petclinic .
RUN cd .
RUN mvn package
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "target/*.jar" ]