# Minimal Java 21 runtime image
FROM eclipse-temurin:21-jre

WORKDIR /app

# Run as a non-root user
RUN groupadd --system appgroup \
    && useradd --system --gid appgroup --home-dir /app appuser

# Copy the JAR produced by the CI Maven build
COPY --chown=appuser:appgroup target/*.jar /app/app.jar

USER appuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
