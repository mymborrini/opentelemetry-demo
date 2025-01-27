# Observability 

## Identifying the data to collect

How do we know what's important? There are different telemetry signals
 * logs
 * metrics
 * traces
 * profiles

Each database is optimized to get a specific signals, these databases also have to be horizontally scalable. Each database
has specific query language to help you find data about that telemetry signals.

### Loki

Loki is a database for logs, Loki does not index the text of logs, instead entries are grouped into streams and indexed 
with labels. So not only are queries faster but the storage requirements are reduced

### Prometheus

Prometheus is a database for metrics, instead of using file structures to store data. Instead of using file structures to
store data like traditional databases it uses labels, and that makes it really performant. Prometheus also has exemplars so
you don't need to rely on just the high level aggregated overview numbers but you can look at an exemplar, so you don;t need
to rely on just the high level aggregated overview numbers. An exemplar is a sample of a specific period in time. So 
you can look at the real data. Prometheus can both pull data from your application or let your application push the data 
to prometheus.

### Mimir

Is very good if you need more instances of prometheus mimir is your best bet. Is like an extension of prometheus but it is
horizontally scalable and reliable

### Tempo

Traces have a lot of information to store, tracing is also meaningless if you can't correlete them with other information
about what else is happening in the system at the time. Tempo is the database for distributed tracing. Tracing is the most
useful for troubleshooting in general. 

### Pyroscope

A profiles is an information about how much computing power or resources are used by an application. Pyroscope is a database
for profiles and they are really useful because it can help you to see an overall pictures on how much resources an application 
is using and going down to how much resource a specific function call is using. Pyroscope is a database for continuos profiles.
Pyroscope does not stores everything it takes samples every 15 seconds

## Collecting the data

Different types of data have different requirements, how they can be stored or how they can be aggregated. Capturing information
that are already generated is called INSTRUMENTATION. You can do source instrumentation, which means adding code that expose the
information you require, or you can do binary instrumentation which means modifying the binary of the application without modifying
the underlying code, this could involve adding an agent to the components that you want to monitor. Some approaches to instrumentation
don't modify either the code or the binary itself and we can loosely lump these into external instrumentation

### Faro

A tool that helps you collect data of your FRONTEND application. You put some JS in your webapp and this let you see how a user
is using it. You can think of it as a sort of front end observability. It looks at the loading the interactivity and even the visual 
stability of elements on the page 

### Opentelemetry

On the backend side there is of course opentelemetry which is a collection of APIs tools and SDk that have become the industry
standard for how different telemetry signals are collected. The opentelemetry collector collects all the information from different
opentelemetry instrumented backend

### Alloy

Parallel to Opentelemetry collector we have Grafana Alloy. Alloy helps as well modifying tha data, it has a bit more modular 
approach. Opentelemetry collector has a more pipeline approach

### Beyla

Speaking of External instrumentation we have Grafana Beyla, a new EBPF auto-instrumentation tool, it employes a mix of 
approaches depending on the programming language and the protocol. EBPF is a technlogy that allows developers to run programs in
an operating system kernel without having to change the kernel source code itself or use kernel modules. Beyla capture signals for
application monitoring not infrastracture monitoring. This means information about HTTP and GRPC protocols. For example
you can deploy beyla as a sidecar container in a k8s cluster and you just start capturing HTTP and GRPC information. It can 
tell you things like response time but it will also be able to tell you things like the lenght of time before a Go routing actions
or request which you can only really see at a kernel level


