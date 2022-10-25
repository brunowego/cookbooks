# Penetration Test (a.k.a. Pentest)

**Keywords:** Vulnerability Scanner

<!--
https://github.com/austinsonger/Incident-Playbook

https://app.pluralsight.com/library/courses/web-app-pentesting-fundamentals/table-of-contents
https://app.pluralsight.com/library/courses/web-app-pentesting-input-validation/table-of-contents
https://app.pluralsight.com/library/courses/session-management-testing-web-application-penetration-testing/table-of-contents
https://app.pluralsight.com/library/courses/web-app-pentesting-client-side-testing/table-of-contents
https://app.pluralsight.com/library/courses/penetration-testing-identity-authentication-authorization-mechanism/table-of-contents
https://app.pluralsight.com/library/courses/web-app-pentesting-info-gathering/table-of-contents
https://app.pluralsight.com/library/courses/writing-penetration-testing-reports/table-of-contents
https://app.pluralsight.com/library/courses/web-app-pentesting-configuration-deployment-management/table-of-contents
https://app.pluralsight.com/library/courses/web-application-penetration-testing-business-logic-testing/table-of-contents
https://app.pluralsight.com/library/courses/web-app-pen-testing-weak-cryptography/table-of-contents
https://app.pluralsight.com/library/courses/web-app-pentesting-insecure-error-handling/table-of-contents
https://app.pluralsight.com/paths/skills/web-app-pen-testing
https://app.pluralsight.com/library/courses/penetration-testing-big-picture/table-of-contents
https://app.pluralsight.com/library/courses/kali-linux-penetration-testing-ethical-hacking/table-of-contents
https://app.pluralsight.com/paths/certificate/comptia-pentest-pt0-001

https://github.com/swisskyrepo/PayloadsAllTheThings
-->

## Glossary

- GIAC Web Application Penetration Tester (GWAPT)
- Ground Penetration (GPEN)
- National Institute of Standards and Technology (NIST)

## Tools

- [Aircrack-ng](/cyber-security/tools/aircrack-ng.md)
- [CrackStation](/cyber-security/tools/scapy.md)
- [Jok3r](/cyber-security/tools/jok3r.md)
- [Legion](/cyber-security/tools/legion.md)
- [Metasploit Framework](/metasploit-framework/README.md)
- [Network Mapper (Nmap)](/nmap.md)
- [Nikto2](/cyber-security/tools/nikto2.md)
- [OpenSCAP](/cyber-security/tools/openscap.md)
- [OWASP Zed Attack Proxy (ZAP)](/cyber-security/tools/zaproxy.md)
- [Scapy](/cyber-security/tools/scapy.md)
- [sqlmap](/cyber-security/tools/sqlmap.md)
- [Wireshark](/wireshark.md)

## Linux Distribution

- [Kali Linux](/kali.md)

## Web Application Penetration Testing

- Input Validation
- Session Management
- Identity Authentication/Authorization Mechanism
- Client Side

## Assurance That a Control is Working

- Optimistic (Not Recommended)
- Passive (Recommended)
- Active (Recommended)
- Attacker (Not Recommended)

<!--
Red Team (Simulated Attack and Response or STAR)
Bug Bounty

Pass or fail is never the objective of active assurance
The aim is to enable the blue team to improve how they detect and respond
-->

## Critical Success Factors

1. Scope - What will be tested, what will be excluded.
2. Authorities - Make sure everything is written down and legal.
3. Marketing - It is an opportunity to learn, it is not a test.
4. Follow-up and remediation - There will be some, be prepared.

## Testing Psychology

- Penetration Tests: Humans vs Systems
- Red Team: Humans vs Humans

## Certifications

- Certified Ethical Hacker (CEH)
- CompTIA PenTest+
- GPEN and GWAPT
- Offensive Security Certified Professional

<!--
- CREST membership for the organization
-->

## Bug Bounty Program

- Offer rewards for finding bugs or vulnerabilities
- Two types:
  - Public: Any security researcher
  - Private: Only invited researchers
- Scope will be very clearly defined
- Rewards for different types of vulnerability or bug

## Active Assurance

- Business As Usual (BAU)
- Change

### Process

- Scoping: What, how -> Documented scope and authorization
- Testing -> TestReport
  - How long before we test again?
  - Risk Management
  - Fix -> Retest (Is it fixed?)

## NIST Cyber Security Framework

- Identify: Know how you can be attacked
- Protect: Put controls in place to prevent the attack
- Detect: Put controls in place to identify when you've been attacked
- Respond: Know how you can stop the attack once you've detected it
- Recover: Plan how you will restore normal operations

Penetration Testing & Bug Bounties: Identify and Protect. Red Teams/Simulated Attacks: Identify, Protect, Detect and Respond.

## Scoping

- We'd like the tester to spend five days discovering vulnerabilities in our new web application. But we don't want the tester to touch the database server.
- Find vulnerabilities in anything you can see of ours that's connected to the internet. But don't touch our main production systems.

## How much does the tester know?

**Back Box**

- What does the tester know? The same as a criminal - nothing!
- How will the tester spend their time? A large percentage on reconnaissance and discovery.

**Grey Box**

- What does the tester know? Provided with the basic information they would be able to discover using reconnaissance.
- How will the tester spend their time? Majority of the time testing.

**White Box**

- Wha does the tester know? More than a criminal would typically discover!
- How will the teste spend their time? All their time testing.
