# Service-Level Objective (SLO)

A target level of reliability for a service.

## Maths

SLI + Threshold + Time window = SLO

## Concepts

- SLOs need to be owned by people who can act on them
- Start with a four-week rolling window

## Questions

### Does your SLO lack coverage?

#### If an SLO lacks coverage:

1. Loosen or tighten your SLO
2. Change how you measure your SLI
3. Create an aspirational SLO

#### If your SLI lacks coverage:

1. Improve the metric's quality: Move the measurement closer to the end user
2. Sample the metrics more frequently: Capture a higher percentage of interactions

## SLO Implementation

- Measure something relevante to users happiness
- Reasonable by the team/person defending the SLO
- Committed to organizationally
- Refined/reevaluated at a set cadence

## Metrics

| SLI | Threshold | Time Window | SLO |
| -- | -- | -- | -- |
| API requests <500ms | 90% | 30 day (rolling) | 90% of requests to the API should take fewer than 500 milliseconds over a 30-day period |

## API Metrics

- Total requests: 5,344,944
- Total successful requests: 5,189,997 (97.101%)
- 90th percentile latency: 487ms
- 99th percentile latency: 884 ms

```
487 ms + <=50ms = 500ms>
```

## Choosing a Time Window

- Rolling vs. calendar-based window
- Shorter vs. longer window

### Rolling Windows

- More closely follow the user's experience
- Need to set carefully (and consider traffic patterns)

### Calendar-Based Windows

- Align with business planning efforts
- Make it difficult to project future performance

## Relevant Stakeholders

- Product managers
  - Is the threshold set high enough for users?
- Product developers
  - Do we have capacity to take steps to reduce risk in the cas of SLO violations?
- Site reliability engineers (SREs)
  - Can we meet SLO without excessive effort or manual work?

## SLO Documents

- Document authors
- SLO and document reviewers
- Document approvers
- Approval and review dates
- Service description
- SLI implementations
- Time windows
- Thresholds
- Explanation of calculations

## User Satisfaction

- Support tickets
- Social media
- Sample user happiness in your application
- User interviews
- Surveys

## Aspirational SLOs

- Use if it will take longer than your SLO window to improve your service
- Track alongside your current SLO
- Don't alert on it

## Error Budget Policy

- A documented policy codifying the specific, concrete actions to be taken when a service runs out of error budget

TODO
