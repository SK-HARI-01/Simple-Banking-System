FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY target/*.war app.war

EXPOSE 8080

ENV PORT=8080

ENTRYPOINT ["java", "-jar", "app.war", "--server.port=${PORT}"]