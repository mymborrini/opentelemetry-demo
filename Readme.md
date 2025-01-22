# OpenTelemetry

## 1 Automatically Instrument Spring Boot App by OpenTelemetry Java Agent

![1.png](./images/1.png)

### Download the opentelemetry java agent 

    curl -L -O https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v2.12.0/opentelemetry-javaagent.jar

### Run the jar file with the java agent

    java -javaagent:opentelemetry-javaagent.jar -Dotel.traces.exporter=logging -Dotel.metrics.exporter=logging -Dotel.logs.exporter=logging -jar target/open-telemetry-0.0.1-SNAPSHOT.jar

If you don't specify the options opentelemetry will continue raise exceptions because it does not find a collector on port 4318

## 2 PostgresSql -- Spring Boot + OpenTelemetry Java agent

![2.png](./images/2.png)