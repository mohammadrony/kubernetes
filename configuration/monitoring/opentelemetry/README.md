# Opentelemetry

Configuration

- [Operator](./operator.md)
- [All Instrumentation](./all-instrumentation.yaml)

Concept

- AlwaysOn: sampler samples every trace, for example, a new trace will be started and exported for every request.
- AlwaysOff: sampler samples no traces or, in other words, drops all traces. You can use this sampler to perform load testing or to temporarily disable tracing.
