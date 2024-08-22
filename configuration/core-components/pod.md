# Pod Usage

## Monitoring Probes

Liveness Probe

- Determine if container is running and healthy.
- Restart if check fails.

Readiness Probe

- Determine if container is ready to receive traffic.
- Stop sending traffic if check fails.

Startup Probe

- Determine if container has successfully started.

Probe types

- HTTP Get
- TCP check
- Command
