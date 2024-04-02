FROM openjdk:17-alpine as Spc
RUN apk update && apk add git maven
RUN git clone https://github.com/Yaswanth5951/spring-petclinic.git
WORKDIR /spring-petclinic
RUN mvn package

FROM openjdk:17-alpine
COPY --from=Spc /spring-petclinic/target /spring-petclinic/target
WORKDIR /spring-petclinic/target
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "spring-petclinic-3.2.0-SNAPSHOT.jar"]