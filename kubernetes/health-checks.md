# Kubernetes Health Checks

## Links

- [Kubernetes API health endpoints](https://kubernetes.io/docs/reference/using-api/health-checks/)
- [zPages](https://opencensus.io/zpages/)

## Questions

- [Where does the convention of using /healthz for application health checks come from?](https://stackoverflow.com/questions/43380939/where-does-the-convention-of-using-healthz-for-application-health-checks-come-f)

## Videos

- [Monitorama PDX 2016 - Kelsey Hightower - healthz: Stop reverse engineering applications and start monitoring from the inside](https://vimeo.com/173610242)

## Tests

- Database Checks
- Functional Tests
- HTTP Health Check
- Memory Heap
- Memory Resident Set Size (Memory RSS)
- Smoke Tests

## Probe Endpoints

- `GET /healthz` (deprecated)
- `GET /livez` or `GET /healthz/live`: Used to ensure zero down-time deployments
- `GET /readyz` or `GET /healthz/ready`: Used to decide whether traffic should be directed to the pod

<!-- - `GET /metrics`: Used to expose metrics in Prometheus format -->
