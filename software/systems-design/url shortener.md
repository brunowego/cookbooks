# URL Shortener

<!--
https://www.youtube.com/watch?v=m_anIoKW7Jg
-->

<!--
Base62 vs Base64

Base62: 0-9, a-z, A-Z
Base64: 0-9, a-z, A-Z, +, /

Base62 is more efficient than Base64 because it uses less characters.

Base62 is more efficient than Base64 because it uses less characters.
-->

<!--
Base 62 +  Obfuscate with HASHID
-->

## STEP 1 – UNDERSTAND THE PROBLEM AND DEFINE THE REQUIREMENTS

### Functional Requirements

1. URL Shortening: Given a long URL → return a much shorter URL.
2. URL Redirection: Given a short URL → redirect to the original URL.

### Non-Functional Requirements

1. The system must support 100 million URLs generated per day.
2. The shortened URL length must be as short as possible.
3. Only numbers (0–9) and characters (a–z, A–Z) are allowed in the URL.
4. For every 1 write operation to the database, there will be 10 read operations.
5. The average length of stored URLs is 100 bytes.
6. URLs must be stored for a minimum period of 10 years.
7. The system must operate in high availability mode (24/7).

<!--
Toda arquitetura é feita para atender a requisitos bem definidos.
-->

<!--
REQUEST

POST api/v1/shorten
HTTP 201 Created
Body:
{
  "url": "https://www.google.com"
}


RESPONSE

HTTP 200 OK
Body:
{
  "shortUrl": "https://short.url/1234567890"
}
-->

<!--
REQUEST

GET https://short.url/1234567890


RESPONSE

HTTP 302 Found
Location: https://www.google.com
-->

## STEP 2 – CALCULATE THE ESTIMATIONS

- Write operations: 100 million URLs per day = 100,000,000 / 24 / 60 / 60 = 1,160 Requests per second (RPS)
- Read operations: Read-to-write ratio = 10:1 = 1,160 × 10 = 11,600 Requests per second (RPS)
- URL storage duration: 10 years = 100,000,000 × 365 × 10 = 365 billion records
- Storage capacity: Average size = 100 bytes per URL = 365 billion × 100 bytes = 36.5 TB

<!--
Database: Cassandra (Cassandra is a good choice for this use case) (Column-family)
-->

## STEP 3 – CALCULATE THE HASH

**Character set:**

- 10 numeric digits: 0–9
- 26 lowercase letters: a–z
- 26 uppercase letters: A–Z

**Total:**

10 + 26 + 26 = 62 characters

**Character set used:**

`0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz`

### Maximum Number of URLs

| n   | Maximum number of URLs                 |
| --- | -------------------------------------- |
| 1   | 62¹ = 62                               |
| 2   | 62² = 3,844                            |
| 3   | 62³ = 238,328                          |
| 4   | 62⁴ = 14,776,336                       |
| 5   | 62⁵ = 916,132,832                      |
| 6   | 62⁶ = 56,800,235,584                   |
| 7   | 62⁷ = 3,521,614,606,208 ≈ 3.5 trillion |
| 8   | 62⁸ = 218,340,105,584,896              |
