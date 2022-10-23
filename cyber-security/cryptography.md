# Cryptography

<!--
https://app.pluralsight.com/library/courses/applied-cryptography-getting-started/table-of-contents
https://app.pluralsight.com/library/courses/cryptography-principles-it-professionals-developers/table-of-contents
-->

<!--
https://web3auth.io/

https://atani.com/
-->

## Terms

- Pretty Good Privacy (PGP)

## Funny Phrases

- The strongest support is ZERO!

## Glossary

- Advanced Encryption Standard (AES)
- Cryptographic Hash Function (CHF)
- Elliptic Curve Cryptography (ECC)
- eXclusive OR (XOR)
- Hardware Security Modules (HSM)
- Public Key Infrastructure (PKI)
- Rivest–Shamir–Adleman (RSA)

<!--
Encryption
Decryption

Brute force

Out of band
Recipients
Symmetric Algorithm -> Cipher
-->

## Topics

- XOR Cipher
- Cesear Cipher
- Substitution Cipher
- Vigenere Cipher
- Hashing Functions
- Block Ciphers
- Stream Ciphers
- RSA

## Cryptography Algorithms

- AES

## Reasons to Use Cryptography

- Confidentiality
- Integrity
- Authenticity
- Originator's Identity (non-repudiation)

## Message Digest/Hash

A short distillation of a message or file produced by a one-way cryptographic process, such that a change of any single character in the original file would produce a different message digest.

## Key Management

- Storage: Use HSM
- Distribution
- Change

## Cryptography Types

### Semantic Cryptography

The same key is used for encryption and decryption.

### Asymmetric Cryptography

Different keys are used for encryption and decryption.

- Public key is used to encrypt.
- Private key is used to decrypt.

Common algorithms: RSA and ECC

<!-- ### Digital Signature

TODO -->

## Two Key Questions

- Where are the keys stored? Keys stored securely, not just on servers.
- Does one person have acesses to a whole secret key? One person never can acesses a secret key.

## Attacker's Opportunities

- Recognized, proven algorithm or invented algorithm?
- Used correctly?

## What Goes Wrong?

- Non-standard algorithms
- Poor implementation of an algorithm
- Poor cryptographic architecture
- Non-random keys
- Keys not protected
