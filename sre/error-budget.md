# Error Budget

<!--
https://app.pluralsight.com/library/courses/allthetalks-session-41/table-of-contents
-->

SLI = [Good events / Valid events] x 100

## Uptime

| Time Frame | 99% Uptime | 99.9% Uptime | 99.95% Uptime | 99.99% Uptime |
| --- | --- | --- | --- | --- |
| Daily | 14m 24s | 1m 26s | 43s | 9s |
| Weekly | 1h 40m 48s | 10m 5s | 5m 3s | 1m 1s |
| Monthly | 7h 18m 18s | 43m 50s | 21m 55s | 4m 23s |
| Yearly | 3d 15h 39m 30s | 8h 45m 57s | 4m 22m 59s | 52m 36s |

## Principles

- SRE need Service Level Objectives (SLO) with consequences.
- Any organization, even without hiring a single SRE can have an Error Budget Policy.
- This is any lever you can use to keep your customers from experiencing pain using your application.
- You can implement this today: measure, account and act.

## Shared Responsibility Model

- Dumping all production services on an SRE team cannot work.
- If a team gets overloaded with operation toil, they cannot make tomorrow better than today.
- Providing an SRE team some way of giving back-pressure to their dev partners provides balance.

## Regulating Workload

- Give 5% of the operational work to the developers: On-call shifts, rollout management, ops tasks.
- Track the project work of the SRE team: If it's not delivering completed projects: there's something wrong.
- Analyse new production systems and only on-board them if they can be operated safely.
- If every problem with a system has to be escalated to its developer: Give the pager to the developer instead!

## Leadership Buy-in

- An SRE organization within a company needs a mandate.
- Without leadership buy-in, it can not work.
- When applications mis their SLOs and run out of Error Budget: it puts additional load on the SRE team:
  - Need to devote more company resources to addressing reliability concerns.
  - Or, loosen the SLO.

## Automation

- Three places SRE teams can benefit from Automation:
  - To eliminate their toil - don't do things over and over!
  - To do capacity planning - auto-scaling instead of manual forecasting!
  - To fix issues automatically - if you can write the fix in a playbook, you can make the computer do it!

## Your First SRE

- Defining and refining the Service Level Objectives.
- Best placed person to see that the Error Budget Policy is enacted when necessary.
- Is now responsible for making sure that the application meets the reliability expectations of its users.

## Policy

### How Reliable Do You Want To Be?

The answer is always more!

We know the key to SRE is to be able to balance your error budget against engineering time, development velocity and money.

So we introduce a Budget.

### When Spend

- The Error Budget Policy is what you agree to do when the application exceeds it's error budget.
- This is not "pay $$$"
- Must be something that will visibly improve reliability.

###

Until the application is again meeting its SLO and has some Error Budget:

- No new features launches allowed.
- Sprint planning may only pull postmortem action items from the backlog.
- Software development team most meet with SRE team daily to outline their improvements.

## Error Budgets

- The error budget is the gap between perfect reliability and our SLO.
- This is a budget to be spent.
- Given an uptime SLO of 99.9%, after a 20 minute outage you still have 23 minutes of budget remaining for the month!

