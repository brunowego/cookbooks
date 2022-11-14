# Site Reliability Engineering (SRE)

<!--
https://github.com/openrca/orca
https://github.com/upgundecha/howtheysre

Systemic Vision

Tech Head SRE

https://www.youtube.com/channel/UCeKFyxRffWdYTqOJiCWhsig

https://devopsinstitute.com/thought-leadership/upskilling-3/

dark launch vs canary release

https://medium.com/zendesk-engineering/blameless-culture-21662ab9118c
https://devops.com/how-sre-creates-a-blameless-culture/

https://www.amazon.com.br/projeto-f%C3%AAnix-Gene-Kim/dp/8550801895/ref=asc_df_8550801895/?tag=googleshopp00-20&linkCode=df0&hvadid=379765802390&hvpos=&hvnetw=g&hvrand=4437745625071073806&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1001541&hvtargid=pla-812161948508&psc=1

https://www.amazon.com.br/Phoenix-Project-DevOps-Helping-Business/dp/1942788290/ref=asc_df_1942788290/?tag=googleshopp00-20&linkCode=df0&hvadid=379693121961&hvpos=&hvnetw=g&hvrand=4437745625071073806&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1001541&hvtargid=pla-437264780533&psc=1

https://www.amazon.com.br/Unicorn-Project-Developers-Disruption-Thriving/dp/1942788762/ref=asc_df_1942788762/?tag=googleshopp00-20&linkCode=df0&hvadid=379726347250&hvpos=&hvnetw=g&hvrand=15513896059502615592&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1001541&hvtargid=pla-863236963354&psc=1

End User -> Internet -> CDN -> Internet -> Load Balancer -> Web Server -> Database

Embracing Risk
SLIs, SLOs, SLAs and Error Budget
Observability
Toil Free
Release Engineering
Postmortem

class SRE implements DevOps

SLO for Latency
SLO for Memory
SLO for Status code

NoC?
-->

## Hierarchy of Needs

![Hierarchy of Needs](/assets/images/sre/hierarchy-of-needs.png)

## References

- [Ghidra](https://github.com/NationalSecurityAgency/ghidra)
- [Awesome Site Reliability Engineering](https://github.com/dastergon/awesome-sre)
- [DevOps](/devops.md)
- [The Twelve-Factor App](/12factor.md)
- [Glossary: Simplified Guide to the Incident Command System for Transportation Professionals](https://ops.fhwa.dot.gov/publications/ics_guide/glossary.htm)

## Content

- [LinkedIn: School of SRE](https://linkedin.github.io/school-of-sre/)
- [Resilience First: SRE and the Four Golden Signals of Monitoring](https://www.observability.splunk.com/en_us/infrastructure-monitoring/guide-to-sre-and-the-four-golden-signals-of-monitoring.html)
- [SRE fundamentals: SLIs, SLAs and SLOs](https://cloud.google.com/blog/products/devops-sre/sre-fundamentals-slis-slas-and-slos)
- [Top 5 Tools for the Best SRE Stack](https://stackpulse.com/blog/top-5-tools-for-the-best-sre-stack/)

## What is Site Reliability Engineering?

Site Reliability Engineering (SRE) is a practice that applies software development skills and mindset to IT operations, with the goal of improving the reliability of high-scale systems through automation and continuous integration and delivery. The concept originated with Google in the early 2000s and was documented in a book with the same name, Site Reliability Engineering. SRE shares many governing concepts with DevOps—both domains rely on a culture of sharing, metrics and automation. SRE is often thought of as a specific implementation of DevOps. The role of the Site Reliability Engineer is common in digital companies and gaining momentum in a traditional IT team. Part systems administrator, part second tier support and part developer, a Site Reliability Engineer requires a personality that is by nature inquisitive, always acquiring new skills, asking questions, and solving problems by embracing new tools and automation.

## SRE Challenges

- Reliability—Maintaining a high level of network and application availability
- Monitoring—Implementing performance metrics and establish benchmarks in order to monitor the systems.
- Alerting—Readily identifying any issues and ensure that there is a closed loop support process in place to solve them.
- Infrastructure—Understanding cloud and physical infrastructure scalability and limitations.
- Application Engineering—Understanding all application requirements including testing and readiness needs.
- Debugging—Understanding the systems, log files, code, use case and troubleshooting, so they can debug as needed.
- Security—Understanding common security issues, as well a tracking and addressing vulnerabilities, to ensure the systems are properly secured.
- Best Practices Documentation—Prescribing solutions, production support playbooks, etc.
- Best Practice Training—Promoting and evangelizing SRE best practices through production readiness reviews, blameless postmortems, technical talks, and tooling.

## What to Look For in a Potential SRE

1. Curious: Pokes things and takes them apart. Researches topics and asks questions.
2. Determined: Sees tasks through against all odds.
3. Self-taught: Reads books/documentation and experiments with tools.
4. Adaptable: Has a positive attitude towards change. This job constantly changes.
5. Automates: Creates systems (not necessarily technical) to solve repetitive problems and increase efficiency.
6. Calm: Works well under pressure or emergency situations.

## Phrases

- SRE is more about practices then tooling.
- SRE impacts the costumer experience and the ROI.

<!--
##

- SRE Team
  - Automate administrative tasks
  - Monitoring of the system and alerting on failures on
  - Responsible for dealing with those failures
- Product Development Team
  - Design
  - Building
  - Testing

## Functions of Site Reliability Engineering

- Eliminating Toil: Automating manual, repetitive work
- Managing Risk: Agreed service levels with explicit tolerance
- Handling Failure: Incident management and postmortems
-->

## Books

- [Building Secure and Reliable Systems: Best Practices for Designing, Implementing, and Maintaining Systems](https://www.amazon.com/Building-Secure-Reliable-Systems-Implementing/dp/1492083127)
- [Google SRE Books](https://sre.google/books/)
- [Seeking SRE: Conversations About Running Production Systems at Scale](https://www.amazon.com/Seeking-SRE-Conversations-Running-Production-ebook/dp/B07GQ2YY1D)
- [Site Reliability Engineering: How Google Runs Production Systems](https://www.amazon.com/Site-Reliability-Engineering-Production-Systems-ebook/dp/B01DCPXKZ6)
- [The Site Reliability Workbook: Practical Ways to Implement SRE](https://www.amazon.com/Site-Reliability-Workbook-Practical-Implement/dp/1492029505)
- [The Visible Ops Handbook: Implementing ITIL in 4 Practical and Auditable Steps](https://www.amazon.com/Visible-Ops-Handbook-Implementing-Practical-ebook/)

<!--
https://sre.google/sre-book/table-of-contents/
https://sre.google/workbook/table-of-contents/

https://www.youtube.com/playlist?list=PLIivdWyY5sqJrKl7D2u-gmis8h9K66qoj

https://www.coursera.org/learn/site-reliability-engineering-slos

https://cloud.google.com/blog/products/management-tools/tune-up-your-sli-metrics-cre-life-lessons
https://cloud.google.com/blog/products/gcp/understanding-error-budget-overspend-cre-life-lessons
https://cloud.google.com/blog/products/management-tools/tune-up-your-sli-metrics-cre-life-lessons
https://cloud.google.com/blog/products/devops-sre/defining-slos-for-services-with-dependencies-cre-life-lessons
https://cloud.google.com/blog/products/gcp/know-thy-enemy-how-to-prioritize-and-communicate-risks-cre-life-lessons
https://www.usenix.org/sites/default/files/conference/protected-files/srecon18americas_slides_brown.pdf
https://docs.google.com/spreadsheets/d/1XTsPG79XCCiaOEMj8K4mgPg39ZWB1l5fzDc1aDjLW2Y/view#gid=504317509
https://queue.acm.org/detail.cfm?id=3096459
https://cloud.google.com/blog/products/gcp/applying-the-escalation-policy-cre-life-lessons
https://cloud.google.com/blog/products/gcp/an-example-escalation-policy-cre-life-lessons
-->

## Content

- [How Complex Systems Fail](https://how.complexsystems.fail/)

## Tools

- [BLAMELESS](https://www.blameless.com/)
- [Gremlin](https://www.gremlin.com/)

## Terms

- Agile Software Development Life Cycle (SDLC)
- Application Performance Monitoring (APM)
- Customer Centricity (CX)
- IT Service Management (ITSM)
- Service Oriented Architecture (SOA)

## Benefits

- Blameless Culture
- Holistic Vision
- Quality by Design
- Security by Design
- Privacy by Design / Privacy by Default

## Metrics

- Application Performance Index (Apdex)

## Service-Level

- Error Budget
- Measure Improvement
- Monitoring And Alerting Strategy
- Risk Management
- Service-Level Agreement (SLA) - Services Contract
- Service-Level Objective (SLO) - Goals for the Services
  - 90% of users should experience a load time of less than 1 second
  - 95% of users should experience a load time of less than 1.5 seconds
  - 99% of users should experience a load time of less than 2 seconds
- Service-Level Indicator (SLI) -
- System Reliability

<!--
##

SLIs drive SLOs which inform SLAs


## Service Matrix

Frequency
Aggregation
Geography Variation
Monitoring System

## Tips for Crafting SLAs and SLOs

Involve the team
Use simple metrics
Skip absolute language
Avoid marketing
Use error budgets
-->

## Failure Metrics

- Mean Time Between Failures (MTBF)
- Mean Time To Acknowledge failures (MTTA)
- Mean Time To Resolution of failures (MTTR)

## Stability Patterns

- Timeouts
- Circuit Breaker
- Fail Fast
- Bulkheads
- Steady State
- Handshaking
- Test Harness
- Decoupling Middleware

## Maturity Categories

- Incidents
- Post-incidents
- Disaster recovery
- Infrastructure
- Provisioning

## Ten Build Commandments

1. Thou shalt use a source control system.
2. Thou shalt use the right tool for the job (maybe several).
3. Thou shalt write portable and low-maintenance build files.
4. Thou shalt use a release process that is reproducible.
5. Thou shalt use a package manager.
6. Thou shalt define an upgrade process before releasing version 1.0.
7. Thou shalt provide a detailed log of what thou have done.
8. Thou shalt canary.
9. Thou shalt keep the big picture in mind.
10. Thou shalt apply these commands to thyself.

## Visible Ops

- Phase 1: Stabilize the patient, modify first response
- Phase 2: Cath and release, find fragile artifacts
- Phase 3: Establish repeatable build library
- Phase 4: Enable continuous improvement

## Postmortem Process

- Incident description
- Timeline
- Sources
- What went well
- Contributing couses
- Correction actions
- Metrics

## Principles

1. SRE needs Service Level Objectives (SLO), with consequences.
2. SREs have time to make tomorrow better than today.

- SLOs and Error Budgets are the first step.
- The next step is staffing an SRE role.
- Real responsibility.
- Once you have SREs: make sure they know that their job is not to suffer under operation load, but to make each day brighter.
- "Brighter" might mean different things: It depends on what your SREs find most useful to do.

3. SRE teams have the ability to regulate their workload.

- Your teams need to be able to prioritize and do the work.
- Each new system to maintain has a human cost.
- Must be abre to push-back on unreliable practices and systems.

## Troubleshooting

### Scientific Method

- Observation
- Question
- Hypothesis
- Experiment
- Analysis
- Conclusion

## Capacity Patterns

- Pool connections
- Use caching carefully
- Pre-compute content
- Tune the garbage collector

## Scaling Puzzle

- What metric to use?
- When to scale up?
- When to scale down?
- Scale horizontally or vertically?

## Distributed Design

- 0.99 x 0.99 x 0.99 = 0.97
- 1 - (1 - 0.99) (1 - 0.99) (1 - 0.99) = 0.999999

## Main Themes of SRE

- Eliminate Toil
- Product teams own their services in production
- Design reliability in
- Practice makes perfect

## Reliability and Consistency Up Front

- Fixing a product after launch is always more expensive.
- SRE teams can and should consult up-front on designs:
  - Architecting resilient systems.
  - Maintaining consistency means fever SREs can support more products.

## Toil

- Operating systems in production.
- Must be a part of the role.
- On-call and incident management.
- A bounded part of the role: Recommend less than 50% of the workload be operations.

## Project Work

- Consulting on System Architecture and Design.
- Authoring and iterating on Monitoring.
- Automation of repetitive work.
- Coordinating implementation of postmortem action items

## Questions

### My goal is to improve reliability by

- Improving Incident Management
- Defining and measuring SLOs and SLIs
- Practicing Chaos Engineering
- Automating Chaos Engineering

<!--
##

"Good" events / Total events = SLI

##

- What actually makes your users happy?
  - Define Your Users
  - Identify Critical Activities
  - Draw an Architecture Diagram

## SLO

- Service Level Objectives set a goal for how well the system should behave
- Specifically tracking customer experience
- If customers are happy, then the SLO is being met

### Typical SLOs

- Uptime of 99.9% a month (i.e. 43 minutes of downtime a month)
- 99.99% of HTTP requests in a month succeed with a 200 OK
- 50% of HTTP requests returned in under 300ms
- 99% of log entries processed in under 5 minutes

### But What About SLAs?

- Service Level Agreements are typically guarantees with penalties for not meeting them
- A system can still be within its SLA and the customers can also feel very unhappy with the experience

### What Next?

- You could implement SLOs today for your application, but this is only a foundation
- You need consequences

## SLI

### Implementation Sources

- Application server logs
- Load balancer logs or monitoring
- Black-box monitoring
- Client-side instrumentation

### Request-Driven SLIs

- Availability
- Latency
- Throughput

###

- Consider client-side instrumentation to most closely approximate actual user experience
-->

<!--
## Interview

https://www.youtube.com/watch?v=OnX45XBbc4I
https://www.youtube.com/watch?v=IFn0reHaGMg
-->
