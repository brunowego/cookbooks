# The Twelve-Factor App

## References

- [The Twelve-Factor App](https://12factor.net/)
- [Four Golden Signal](/4-golden-signals.md)

<!--
https://leanpub.com/12fa-docker-golang
-->

## Courses

- [Cloud Native Twelve-Factor Applications](https://www.linkedin.com/learning/cloud-native-twelve-factor-applications/)

## Libraries

- [Hystrix: Latency and Fault Tolerance for Distributed Systems](https://github.com/Netflix/Hystrix)

## The Twelve Factors

1. Codebase - One codebase tracked in revision control, many deploys
2. Dependencies - Explicitly declare and isolate dependencies
3. Config - Store config in the environment
4. Backing services - Treat backing services as attached resources
5. Build, release, run (CI/CD) - Strictly separate build and run stages
6. Processes - Execute the app as one or more stateless processes
7. Port binding - Export services via port binding
8. Concurrency - Scale out via the process model
9. Disposability - Maximize robustness with fast startup and graceful shutdown
10. Environment uniformity (Dev/prod parity) - Keep development, staging, and production as similar as possible
11. Logs - Treat logs as event streams
12. Admin processes - Run admin/management tasks as one-off processes

## Process Memory Specifics

- Single-threaded memory usage
- Short-live memory usage
- Leverage databases or caches for longer-term memory needs

<!-- ## Disposability

- Security
- Scalability
- Fault tolerance (Crashes happen) -->
