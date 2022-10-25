# DevSecOps

<!--
https://app.pluralsight.com/paths/skill/fundamentals-of-devsecops

https://www.youtube.com/watch?v=TCkFakjcsMA

https://www.udemy.com/course/kubernetes-devsecops/
https://www.linkedin.com/learning/search?keywords=DevSecOps

https://tiexames.com.br/novosite2015/curso_ISO_27002_Foundation.php
-->

<!--
Frictionless Enablement
Reducing noise and fatigue
Share responsability
-->

<!--
- Treat Model (Critical Assets, Abuse Stories)
  - Sprint Planning (Risk Prioritization)
  - Design (Includes Sec & Ops Requirements)
  - CI/CD Pipeline (Unit Test Cases) -->

DevSecOps more culture than a team. Incorporate security within Agile and DevOps practices. Everyone is responsible for security.

![DevSecOps Ecosystem](/assets/images/cyber-security/devsecops-ecosystem.jpg)

## Links

- [DevSecOps Manifesto](https://devsecops.org/)
- [Awesome DevSecOps Awesome](https://github.com/devsecops/awesome-devsecops)
- [Ultimate DevSecOps library](https://github.com/sottlmarek/DevSecOps)

## Related

- [Google Trends](https://trends.google.com/trends/explore?date=today%205-y&q=devsecops)

## Manifesto

- **Leaning in** over Always Saying “No”
- **Data & Security Science** over Fear, Uncertainty and Doubt
- **Open Contribution & Collaboration** over Security-Only Requirements
- **Consumable Security Services with APIs** over Mandated Security Controls & Paperwork
- **Business Driven Security Scores** over Rubber Stamp Security
- **Red & Blue Team Exploit Testing** over Relying on Scans & Theoretical Vulnerabilities
- **24x7 Proactive Security Monitoring** over Reacting after being Informed of an Incident
- **Shared Threat Intelligence** over Keeping Info to Ourselves
- **Compliance Operations** over Clipboards & Checklists

## Process

- Backlog: Threat Modeling
- Code/Commit: SCA (SBOM)
- Build/Test: SAST / DAST
- Deploy: Container Security
- Monitor: Monitoring / Pen Testing

## Benefits

- Faster Delivery
- Improved Security Posture
- Reduced Costs
- Enhancing the Value of DevOps
- Improving Security Integration and Pace
- Enabling Greater Overall Business Success

## Shift-left

![DevSecOps Pipeline](/assets/images/cyber-security/devsecops-pipeline.png)

## Tools

<!--
https://sucuri.net/
https://fossa.com/

Aqua Security
Codacy
Checkmarx
Prisma Cloud
ThreatModeler
SonarQube
Acunetix
CyberRes Fortify
IriusRisk
-->

### Code Scanning, Alerts, and Notification of Security Anomalies

- [Alerta](https://alerta.io/)
- [Gerrit](https://gerritcodereview.com/)
- [GitLab](/gitlab/README.md)
- [ShiftLeft](https://shiftleft.io/)
- [Snyk](/cyber-security/tools/snyk.md)
- [SonarSource](/sonarsource/README.md)
- [Trivy](/cyber-security/tools/trivy.md)

### Automation: Scanning, Discovery, and Remediation of Security Defects

- [StackStorm](https://stackstorm.com/)
- [OWASP Glue](https://github.com/OWASP/glue)
- [OWASP Zed Attack Proxy (ZAP)](https://zaproxy.org/)
- [OWASP Dependency-Check](https://owasp.org/www-project-dependency-check/) — Build Composition Analysis
- [Lynis](/cyber-security/tools/lynis.md)

### Dashboards for Visibility: Customize Your View and Integrate Sources

- Grafana
- Kibana

### Threat Intelligence: Identity, Predict, and Define Threats

- [OWASP Threat Dragon](https://owasp.org/www-project-threat-dragon/)

### Testing: Find Security Issues Before Going Live

- [Arachni](https://github.com/Arachni)
- BDD-Security
- [Chef InSpec](https://docs.chef.io/inspec/)
- [Gauntlt](http://gauntlt.org/)
- [Falco](/cyber-security/tools/falco.md)

## Quotes

> The purpose and intent of DevSecOps is to build on the mindset that "everyone is responsible for security"with the goal of safely distributing security decisions at speed and scale to those who hold the highest level of context without sacrificing the safety required.
> -- <cite>Shannon Lietz</cite>

## Goals

- Security Auditing
- Compliance Testing (e.g. PCI, HIPAA, SOx)
- Penetration Testing
- Vulnerability Detection
- System Hardening

## Benefits

- Audit Trail
- Compliance
- Confidence
- Observability
- Quality Gates
- Single Source of Truth (SSoT)
- Traceability

## Use Cases

- Lack Visibility
- Troubled Audits
- Unified Governance
- Risk Mitigation

## Information Security Friction

### Waterfall Methodology

- Risk Assessment
- Security Plan
- Code Review
- Pen Test
- Regular Audit

#### Model Problems

- Security as an after-thought
- Security "sign off" delays project
- Issues identified late in project
- Once-off point in time assessment
- Cost of re-testing is very high
- Security is too slow
- Not enough skills available to be secure
- Ratio of Security Experts to Dev Experts is very low

> Traditional security checks are too slow.

### Best Security Practices

- PCI DSS v3.2.1
  - 11.2 Run internal and external network vulnerability scans at least quarterly and after any significant change in the network

### Merge DevOps and Sec to Remove Friction

- Code -> Static Code Analysis
- Plan -> Threat Model Code Standards
- Operate -> Monitor, Detect, Respond and Recover
- Deploy -> Code Signing Validation
- Release -> Compliance Validation
- Test -> Penetration Test
- Build -> Vulnerability Scan

## Security as Code

- **Code review** becomes _code preview_
- **Patching** becomes _build new environment and deploy_
- **Incident Response** becomes _Incident Avoidance using Threat Modeling_

> Think of security as code or script.

## Continuous Integration / Delivery (CI/CD)

- Source Code: Repositories (Commit, Pull, etc), Security Review of Code
- Continuous Integration Pipeline: Build, Unit Test, Integration Test, Security Testing
- Continuous Deployment Pipeline: Acceptance, Environment Deploy, Security Review of Environment

> Sustainability Process: Repeatable, Consistent, Embedded Approach

## Where is DevSecOps Appropriate?

| Very Suitable            | Possibly not as Suitable            |
| ------------------------ | ----------------------------------- |
| Agile Methodology        | Waterfall Methodology               |
| Existing DevOps in place | Highly regulated, requires approval |
| Many releases per year   | Few releases per year               |
| Some automation in place | Zero automation in place            |

## Some Benefits of DevSecOps Practice

- Reduce time on rework for security vulnerabilities
  - Security issues are found earlier in the lifecycle, reducing the cost of remediation and rework.
- Reduce risk for company and customers
- Increased team collaboration
- Consistency in approach - Continuous Security
- Increased compliance levels - Secure by Design
  - Better and automated security testing and testing helps compliance with various laws.
  - General Data Protection Regulation (GDPR)
  - California Consumer Privacy Act (CCPA)

## Roles & Responsibilities

| Role/Activity            | Responsibility                                                                                                     | Fulfilled By                         |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------ |
| Tooling                  | Ensure the DevOps pipeline is extended to include security testing, integrate with security testing tools.         | DevOps Engineer or Software Engineer |
| Vulnerability Management | Ensure all vulnerabilities are managed, block deployments in accordance with your company's risk policy.           | AppSec Engineer or Software Engineer |
| Application Security     | Specialised engineer with focus on security fixes.                                                                 | AppSec Engineer or Software Engineer |
| Compliance               | Ensure testing meets any compliance or regulatory obligations and evidence is available to demonstrate compliance. | IT Professional or Software Engineer |
