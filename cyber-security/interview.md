# Security Engineer Mock Interview

<!--
https://www.youtube.com/watch?v=GM9yGj5tdHc
-->

<!--
https://www.youtube.com/watch?v=GM9yGj5tdHc
-->

<!--
DevSecOps
Ethical Hacking
Nmap
VPN
Firewall
WAF
OS Internals (Group, ID, Permissions)
-->

## Terms

- User and Entity Behavior Analytics (UEBA)
- Application Layer Transport Security (ALTS)
- Border Gateway Protocol (BGP)
- Common Vulnerabilities and Exposures (CVE)
- Common Vulnerability Scoring System (CVSS)
- Common Weakness Enumeration (CWE)
- Cross-site Scripting (XSS)
- Distributed Denial-of-Service (DDoS)
- Dynamic Application Security Testing (DAST)
- Internet Control Message Protocol (ICMP)
- Internet Protocol Security (IPsec)
- Open Systems Interconnection (OSI)
- Public Key Infrastructure (PKI)
- Request for Comments (RFC)
- Security Information and Event Management (SIEM)
- Security Operations Center (SOC)
- Security Orchestration, Automation and Response (SOAR)
- Security Token Service (STS)
- SQL injection (SQLi)
- Static Application Security Testing (SAST)
- Virtual Private Cloud (VPC)
- XML External Entity (XXE)
- Data Execution Prevention (DEP) / Address Space Layout Randomization (ASLR)

## Questions

### Differences between TCP and UDP?

- TCP
  - Three-way Handshake
  - Is connection-oriented and enables two-way communication between two endpoints after the three-way handshake. TCP is reliable because the protocol ensures that all data is fully transmitted and can be assembled by the receiver in the correct order.
- UDP
  - Is a connection-less protocol. No connection needs to be established between the source and destination before you transmit data. UDP does not have a mechanism to make sure that the payload is not corrupted. As a result, the application must take care of data integrity all by itself.

### Know the common ports

| Port Number | Usage                                                                               |
| ----------- | ----------------------------------------------------------------------------------- |
| 20          | File Transfer Protocol (FTP) Data Transfer                                          |
| 21          | File Transfer Protocol (FTP) Command Control                                        |
| 22          | Secure Shell (SSH)                                                                  |
| 23          | Telnet - Remote login service, unencrypted text messages                            |
| 25          | Simple Mail Transfer Protocol (SMTP) E-mail Routing                                 |
| 53          | Domain Name System (DNS) service                                                    |
| 80          | Hypertext Transfer Protocol (HTTP) used in World Wide Web                           |
| 110         | Post Office Protocol (POP3) used by e-mail clients to retrieve e-mail from a server |
| 119         | Network News Transfer Protocol (NNTP)                                               |
| 123         | Network Time Protocol (NTP)                                                         |
| 143         | Internet Message Access Protocol (IMAP) Management of Digital Mail                  |
| 161         | Simple Network Management Protocol (SNMP)                                           |
| 194         | Internet Relay Chat (IRC)                                                           |
| 443         | HTTP Secure (HTTPS) HTTP over TLS/SSL                                               |

### Watch difference between Data (L7/L6/L5), Segments (TCP) / Datagrams (UDP) (L4), Packets (L3), Frames (L2), Bits (L1) in OSI Model?

![7 Layers](/assets/images/cyber-security/osi-model.png)

## What happen when you type example.com?

- How DNS Works? Top Level DNS, Secondary DNS,
- Encapsulation Application Layer to Physical Layer
- How internet translate IP address to human readable names

### What is penetration test?

TODO

<!--
Social Engineering
-->

### What is vulnerability scan?

TODO

### What difference between authorization and authentication?

- Authentication is proof of authenticity
- Authorization is accesses rules

<!--
ZTA
-->

### What difference between threat, a vulnerability, and a risk?

TODO

<!--
Risk management

threat is a event, occurrence
vulnerability is leak of controls on system / weakness?
risk is?
-->

### What port is ping running on?

ICMP?
traceroute works?
netstat works?

### What is SIEM, SOAR and how they are connected?

TODO

### What is CVE, CWE, and CVSS?

TODO

### How does the TCP handshake works?

TODO

### What is XSS?

TODO

### Stored vs. reflected XSS

TODO

### What is SQLi?

TODO

### Vulnerability recognitions

TODO

### What is Kubernetes spot minimal, deployable unit, pod, master node, etcd, the problem for workload, scheduler, controller, etc

TODO

### What is key value database?

TODO

### What is pipeline and how it works?

TODO

### What is SaaS, PaaS and IaaS?

TODO

### What is SAST and DAST?

TODO

### What is Docker and how it works?

TODO

### What is VPC and how it works?

TODO

### What difference between Symmetric vs. Asymmetric Encryption?

- Symmetric encryption uses a single key that needs to be shared among the people who need to receive the message while asymmetric encryption uses a pair of public key and a private key to encrypt and decrypt messages when communicating.
- Symmetric encryption is an old technique while asymmetric encryption is relatively new.
- Asymmetric encryption was introduced to complement the inherent problem of the need to share the key in symmetric encryption model, eliminating the need to share the key by using a pair of public-private keys.
- Asymmetric encryption takes relatively more time than the symmetric encryption.

### What is PKI?

- What is the certificate authority?
- What is the intermediate authority?
- How build multi region certificate authority on cloud (AWS)?

### Name the symmetric and asymmetric encryption algorithms

- Standard symmetric encryption algorithms are RC4, AES, DES, 3DES, and QUAD
- Standard asymmetric encryption algorithms are RSA, Diffie-Hellman, ECC, El Gamal, and DSA

### Salt vs. pepper?

- Salt is random data that is added to data before generating a hash code. It is common to store the salt alongside the hash value.
- Pepper is also random data that is added to data before generating a hash code. Unlike salt, pepper is kept secret. In many cases, pepper isn't stored at all. In other cases, it is securely stored separately from the hash code.

### What is exactly hash?

A hash is a mathematical function that converts an input of arbitrary length into an encrypted output of a fixed length. Thus regardless of the original amount of data or file size involved, its unique hash will always be the same size.

### When you broke up something last time? + How you solved it?

TODO

### What is the last buffer overflow vulnerability you encountered?

TODO

### What is your favourite DevSecOps tool and why?

TODO

### How you will design the AWS security audit proposal?

TODO

### Nmap Basics

- Syn scan -sS
- OS scan -o
- TCP or UDP scan -sU / -sT
- Using the NSE - how any why

### Calculation of IP scopes and addresses

TODO

### Transport vs. Tunnel mode IPsec

TODO

### What is `/etc/shadow` and `/etc/passwd`?

TODO

### Define the vulnerability type and describe it:

1. `1' or '1' = '1'))/*` -> SQLi
2. `<svg/onload='+/"/+/onmouseover=1/+/[*/[]/+alert(1)//'>` -> XSS
3. `https://sottlmare.com/ /../../../../etc/shadow` -> Path Traversal / OS Credential Dumping
4. `<!ENTITY xxe SYSTEM "file:///etc/password">` -> XXE injection
5. `https://www.example.com/change_password.php?userid=1701` ->

### What and how is defined the Docker layer, Docker image?

TODO

### What is the Kubernetes init container?

TODO

### What contains the Pod security policy and what Network policy?

TODO

### Which pre-commit hooks you recommend and why?

TODO

### How the Istio service mesh mutual authentication works?

TODO

### Definition of Kubernetes Replica set?

TODO

<!--
Autoscaling
-->

### Where and why, you will use Kubernetes sidecar?

TODO

### How does the STS and ALTS work and what are their differences?

TODO

### E2E encryption and Cloud load balancers. Explain!

TODO

### Encryption and compression?

TODO

### What is the content of the certificate?

TODO

### Design the PKI for Cloud environment

TODO

### Design the anti DDoS for Internet facing connectivity provider + name DoS protection for GCP/AWS

TODO

### Tell us all the DHCP flow step by step

TODO

### Build SOC in 5 sentences

TODO

### RFC number of BGP

RFC 1105

### Explain the SAGA pattern and present example

TODO

### Explain and tell exact vulnerability for buffer overwrite and buffer overread + (ASLR, DEP)

TODO

### How SSL handshake works?

TODO

### Explain RSI encryption

TODO

<!--
five steps
cypher settings
session specific data
authenticates server certificate
uses asymmetric cryptography
-->

<!--
### What is ZTA?
### What is DevOps?
### What is Cloudification?
### What is Cloud Native means?
-->
