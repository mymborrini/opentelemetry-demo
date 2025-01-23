# OpenTelemetry

## 1 Automatically Instrument Spring Boot App by OpenTelemetry Java Agent

![1.png](./images/1.png)

### Download the opentelemetry java agent 

    curl -L -O https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v1.32.0/opentelemetry-javaagent.jar

Using java agent opentelemetry version 2 does not work the same way but this is just a good example showing how observability can
be implemented

### Run the jar file with the java agent

    java -javaagent:opentelemetry-javaagent.jar -Dotel.traces.exporter=logging -Dotel.metrics.exporter=logging -Dotel.logs.exporter=logging -jar target/open-telemetry-0.0.1-SNAPSHOT.jar

If you don't specify the options opentelemetry will continue raise exceptions because it does not find a collector on port 4318

## 2 PostgresSql -- Spring Boot + OpenTelemetry Java agent

![2.png](./images/2.png)


## 3 OpenTelemetry (traces): Spring Boot 3 + OpenTelemetry Java Agent -- Zipkin

![3.png](./images/3.png)

## 4 OpenTelemetry (metrics): Spring Boot 3 + OpenTelemetry Java Agent -- Prometheus -- Grafana

![4.png](./images/4.png)

Once you run grafana you have to log in
 * username: admin
 * password: admin

Then it will ask you to change the password.

Then you can import a grafana dashboard from a template for example **https://grafana.com/grafana/dashboards/18812-jvm-overview-opentelemetry/**

## 5 Spring Boot 3 + OpenTelemetry Java Agent — Otel Collector — Loki

![5.png](./images/5.png)

Java Opentelemtry agent does not support loki so we have to install an otel collector as well. Installing a Collector
is also really important because it will fetch opentelemetry metrics for all applications.

## 6 Observability Coordinated: Prometheus Exemplars (Metrics) — Grafana Tempo (Traces) — Loki (Logs)

![6.png](./images/6.png)

Now let's make some consideration about prometheus metric **http_server_duration_milliseconds_bucket**

### WHat is Exemplars
[Exemplars](https://grafana.com/docs/grafana/latest/fundamentals/exemplars/#:~:text=An%20exemplar%20is%20a%20specific%20trace%20representative%20of,exemplars%20are%20a%20way%20to%20link%20the%20two): 

    An exemplar is a specific trace representative of measurement taken in a given time interval. 
    While metrics excel at giving you an aggregated view of your system, traces give you a fine grained view of a single 
    request; exemplars are a way to link the two.


A concrete example from grafana documentation:

Suppose your company website is experiencing a surge in traffic volumes. While more than eighty percent of the users are able to access the website in under two seconds, some users are experiencing a higher than normal response time resulting in bad user experience.

To identify the factors that are contributing to the latency, you must compare a trace for a fast response against a trace for a slow response. Given the vast amount of data in a typical production environment, it will be extremely laborious and time-consuming effort.

Use exemplars to help isolate problems within your data distribution by pinpointing query traces exhibiting high latency within a time interval. Once you localize the latency problem to a few exemplar traces, you can combine it with additional system based information or 
location properties to perform a root cause analysis faster, leading to quick resolutions to performance issues.

Support for exemplars is available for the Prometheus data source only. Once you enable the functionality, exemplar data is available by default. 

### How to support exemplars in grafana and tempo
Now go to grafana UI

 * Add Tempo Datasource
 * Data Sources/Prometheus/Exemplars/ `{ "internal link": true, "data source": tempo, "label name": trace_id }`
 * Go to Explore Prometheus and query the metric http_server_duration_milliseconds_bucket
 * Then edit the panel below and set exemplars true
 * You will see that some **PinPoints** are added to your graph. If you hover one of them a model appears where the button `query with tempo`
 * Click it and you will get the whole tempo span of that exemplars

So right now we have some metrics that are correlated with some traces. Let's see how to correlate traces with logs

 * Go to Tempo Data Source/ Trace to logs `{"Data source": loki, "Span start time shift": -1h, "Span end time shift": 1h, "Filter by trace id": true, "Filter by span id": false", "Tags": ["service.name": "job"]}`
 * Remember the Tags part really important to map labels from tempo to labels from loki
 * Go to Explore/Tempo Make a query with Service Name equals Order-service 
 * Click on a Trace id link
 * Near each span you will find a log link. If you click it, the logs from loki will appear

So in the end you can explore prometheus, query the  **http_server_duration_milliseconds_bucket** with exemplars.
Each exemplars have a **Query with tempo** button and for each trace in Tempo you have the grafana loki logs. So we connect
all together. This is the manual procedure to understand what is the goal. Of course we can configure it in the grafana datasource