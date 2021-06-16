# Penetration Testing

## Glossary

- GIAC Web Application Penetration Tester (GWAPT)
- Ground Penetration (GPEN)
- National Institute of Standards and Technology (NIST)

## Teams

- Red
- Blue
- Purple

### Red Team - Attackers

Typically external resource.

1. Survey + threat intelligence
2. Deliver an attack
3. Breach defences
4. Take control

### Blue Team - Defenders

Internal team (can be outsourced or managed security provider)

1. Detect
2. Respond
3. Eliminate attackers
4. Re-secure systems

### Purple Team

- Red Team: Attacking purple team
- Blue Team + Coach: Defending purple team

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
