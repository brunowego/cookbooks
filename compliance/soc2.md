# System and Organization Controls 2 (SOC 2)

<!--
https://secureframe.com
-->

## Compliance Checklist

This checklist outlines the core documentation, controls, and practices needed to meet SOC 2 compliance — especially under the Security, Availability, Processing Integrity, Confidentiality, and Privacy principles.

## 🔐 Security

- [ ] Role-based access control (RBAC) implemented
- [ ] Multi-Factor Authentication (MFA) enforced for sensitive systems
- [ ] Periodic access reviews (quarterly or more frequent)
- [ ] Password policy defined and enforced
- [ ] Endpoint protection on all company devices
- [ ] Firewall/WAF and network access controls
- [ ] Secure secrets management (e.g., Vault, GitHub Secrets)
- [ ] Vulnerability management process (scanning + patching)
- [ ] Employee security training (onboarding and annual)
- [ ] Onboarding/offboarding checklist for system access
- [ ] Logging and monitoring enabled on all critical services

## ⚠️ Incident Response

- [ ] Incident Response Plan (`INCIDENT_RESPONSE_PLAN.md`)
- [ ] Postmortem process defined (`ops/postmortems/`)
- [ ] Postmortem template in use (`TEMPLATE.md`)
- [ ] Simulated incident exercises (tabletop)
- [ ] Alerting system in place for service degradation or failures

## 🗄️ Policies & Governance

- [ ] Security Policy (`SECURITY_POLICY.md`)
- [ ] Access Control Policy (`ACCESS_CONTROL_POLICY.md`)
- [ ] Change Management Policy (`CHANGE_MANAGEMENT_POLICY.md`)
- [ ] Backup and Disaster Recovery Policy (`BACKUP_AND_RECOVERY.md`)
- [ ] Vendor/Subprocessor Management Policy (`VENDOR_MANAGEMENT_POLICY.md`)
- [ ] Secure Development Policy (`SECURE_DEVELOPMENT.md`)
- [ ] Data Retention and Disposal Policy (if applicable)
- [ ] Confidentiality Policy
- [ ] Privacy Policy (internal and external)
- [ ] Onboarding & Offboarding Procedure (`ONBOARDING_OFFBOARDING.md`)

## 🔧 Secure Development & Deployment

- [ ] Code review required for all PRs
- [ ] CI/CD pipeline with automated checks (lint, tests, policies)
- [ ] Environments separated (prod/staging/dev)
- [ ] Access to production limited and logged
- [ ] Deployments are tracked and approved

## 💽 Data Protection & Availability

- [ ] Regular encrypted backups
- [ ] Backup restore tested periodically
- [ ] Infrastructure as Code (IaC) or automated provisioning
- [ ] Uptime and error monitoring (e.g., UptimeRobot, Sentry)
- [ ] SLA/SLO/SLI defined for critical services (optional but recommended)
- [ ] Production data anonymized before use in staging (`ops/scripts/anonymize_production.sql`)
- [ ] Redundancy and failover mechanisms in place

## 🧾 Audit Readiness

- [ ] Versioned documentation stored in repo (`/ops/policies/`)
- [ ] Access logs and system events retained
- [ ] Security incidents logged and reviewed
- [ ] All changes traceable via Git and CI/CD logs
- [ ] Security and compliance ownership assigned

> ✅ All policies should be stored as Markdown files in `/ops/policies/` and versioned with the rest of the codebase to ensure visibility and accountability.
