# DevSecOps

DevSecOps more culture than a team.

<!--
https://linkedin.com/learning/paths/get-ahead-in-devsecops
https://linkedin.com/learning/search?entityType=COURSE&keywords=DevSecOps

https://linkedin.com/learning/devsecops-automated-security-testing/welcome
https://linkedin.com/learning/security-testing-essential-training/the-importance-of-security-testing
https://linkedin.com/learning/python-pen-testing-aws/using-python-to-test-for-cloud-deployment-weaknesses-through-pen-testing

Sucuri Website Scanner

blackbox
whitebox
-->

## Links

- [Manifesto](https://devsecops.org/)

## Related

- [Google Trends](https://trends.google.com/trends/explore?date=today%205-y&q=devsecops)

## Terms

- Information Security (InfoSec)
- Security as Code
- Security-first
- Shift-left testing
- Web Application Firewall (WAF)

## Tools

- [Gauntlt](http://gauntlt.org/)

## Quotes

> The purpose and intent of DevSecOps is to build on the mindset that "everyone is responsible for security"with the goal of safely distributing security decisions at speed and scale to those who hold the highest level of context without sacrificing the safety required.
> -- <cite>Shannon Lietz</cite>

## Information Security Friction

### Waterfall Methodology

- Risk Assessment
- Security Plan
- Code Review
- Pen Test
- Regular Audit

**Model Problems**

- Security as an after-thought
- Security "sign off" delays project
- Issues identified late in project
- Once-off point in time assessment
- Cost of re-testing is very high
- Security is too slow
- Not enough skills available to be secure
- Ratio of Security Experts to Dev Experts is very low

> Traditional security checks are too slow.

## Best Security Practices

- PCI DSS v3.2.1
  - 11.2 Run internal and external network vulnerability scans at least quarterly and after any significant change in the network

## Merge DevOps and Sec to Remove Friction

- Code / Static Code Analysis
- Plan / Threat Model Code Standards
- Monitor
- Operator / Monitor, Detect, Respond and Recover
- Deploy / COde Signing Validation
- Release / Compliance Validation
- Test / Penetration Test
- Build / Vulnerability Scan

## Security as Code (Shift-left)

- **Code review** becomes *code preview*
- **Patching** becomes *build new environment and deploy*
- **Incident Response** becomes *Incident Avoidance using Threat Modeling*

> Think of security as code or script.

## Where is DevSecOps Appropriate?

| Very Suitable | Possibly not as Suitable |
| --- | --- |
| Agile Methodology | Waterfall Methodology |
| Existing DevOps in place | Highly regulated, requires approval |
| Many releases per year | Few releases per year |
| Some automation in place | Zero automation in place |

## Some Benefits of DevSecOps Practice

- Reduce time on rework for security vulnerabilities
  - Security issues are found earlier in the lifecycle, reducing the cost of remediation and rework.
- Reduce risk for company and customers
- Increased team collaboration
- Consistency in approach - Continuous Security
- Increased compliance levels - Secure by Design
  - Better and automated security testing and testing helps compliance with various laws.
  - GDPR - General Data Protection Regulation
  - CCPA - California Consumer Privacy Act

## Roles & Responsibilities

| Role/Activity | Responsibility | Fulfilled By |
| --- | --- | --- |
| Tooling | Ensure the DevOps pipeline is extended to include security testing, integrate with security testing tools. | DevOps Engineer or Software Engineer |
| Vulnerability Management | Ensure all vulnerabilities are managed, block deployments in accordance with your company's risk policy. | AppSec Engineer or Software Engineer |
| Application Security | Specialised engineer with focus on security fixes. | AppSec Engineer or Software Engineer |
| Compliance | Ensure testing meets any compliance or regulatory obligations and evidence is available to demonstrate compliance. | IT Professional or Software Engineer |

<!--
Red Team Technical Activities:

✔ Application and Infrastructure Vulnerability Scans;
✔ Application, Infrastructure and Mobile Penetration Tests;
✔ Roll-out of campaigns involving Social Engineering;
✔ Implementation of SAST, DAST, Dependency Scanning and Container Scanning in CI / CD;
✔ Identity Theft in the Wireless network;
✔ Malware Analysis;

Blue Team Technical Activities:

✔ SIEM Implementation and Configuration of Dashboards, Alerts and Metrics;
✔ WAF Rules Control and Monitoring;
✔ Implementation and solution configuration of IDS / IPS, Antivirus, DLP and FIM;
✔ Cloud environment auditing using Inspector, GuardDuty, Cloudtrail, CloudWatch, SecurityHub, etc;
✔ Systems Hardening;
✔ Management of Cryptographic Keys and their rotations;
✔ Identity and Access Management;

GRC Technical Activities:

✔ Recurring Internal Audit using PDCA;
✔ Gap Analysis and Risk Assessment;
✔ Development of Policies and Procedures suitable for the company;
✔ Third Party Audit;
✔ Adaptation of processes according to frameworks of the NIST/ISO27000 family;
✔ Mapping and adequacy of Data Privacy architecture in accordance with LGPD / GDPR (legal support assistance needed);

Management Activities:

✔ Kick-off meetings and project alignment with the main areas of the company;
✔ Elaboration of weekly reports regarding the progress of projects for Managers;
✔ Planning tasks using prioritization and a sense of urgency for distribution among the team through SCRUM methodology and planning (pre) and retrospective (post) meetings;
✔ Personal and technical management (including 1:1s) of a team of 8 people;
✔ Support in creating and maintaining ORKs in the Security area for the company;
-->
