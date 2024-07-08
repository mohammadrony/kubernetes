# Grafana Tempo Query

[Query with TraceQL](https://grafana.com/docs/tempo/latest/traceql/)

```traceql
{ span.http.method = "GET" }
```

```traceql
{ .http.method = "POST" } | count() > 1
```

```traceql
{ span.db.system =~ "postgresql|mysql" }
```

```traceql
{ span.http.status_code >= 200 && span.http.status_code < 300 } | count() > 2
```
