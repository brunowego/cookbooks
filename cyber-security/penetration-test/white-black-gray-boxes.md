# White-Black-Gray Boxes

## Glossary

- Advanced Persistent Threat (APT)

## Types

| Type      | Description                                                                                                                         | Team |
| --------- | ----------------------------------------------------------------------------------------------------------------------------------- | ---- |
| White-Box | Full knowledge of client network and apps, including code, network diagrams, and system access.                                     | Blue |
| Black-Box | No knowledge of client network and apps, but it emulates real-world threats and is performed by independent team (because of bias). | Red  |
| Gray-Box  | A combination of black and white box testing where you have some knowledge of internal systems.                                     |      |

## Details

### White-Box

White Box Testing is also known as structural testing, clear box testing, code-based testing, and transparent testing.

**Pros:**

- Comprehensive
- No limits to the bugs you can find
- Preventative
- If node during development, bugs can be avoided before being pushed to production

**Cons:**

- Easy to accidentally look over 'simple' bugs

### Black-Box

Black Box Testing is also known as functional testing, data-driven testing, and closed box testing.

**Pros:**

- Fast!
- Simplistic
  - Testers aren't worried about code "per sex"
  - Just test the system for bugs that allow access

**Cons:**

- Not comprehensive
  - Bugs are gonna get missed

### Gray-Box

Grey Box Testing is also known as translucent testing as the tester has limited knowledge of coding.

**Pros:**

- Jack of all trades
  - APT / Insider Threat emulation

**Cons:**

- Master of none
  - Slower than Black-box
  - Not as comprehensive as White-box
