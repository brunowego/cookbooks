# Testing

## Types

- Unit Tests
- Functional Tests
- Integration Tests
- Component Tests
- System Tests
- Exploratory Tests
- Usability Tests
- A/B Tests
- User Interface Tests / Visual Regression Tests
- Prototype Tests
- Monkey Tests
- Non-Functional / Specialty Tests
- Load Tests
- Security Tests
- Performance Tests
- Reliability Tests
- Compatibility Tests
- Test Suites
- End-to-end Tests / Workflow Tests

<!--
jest-image-snapshot
-->

## Category Tools

- GUI-based (e.g. SoupUI, Postman)
- Code-based (frameworks and libraries)

## Approaches

- Small-step
- Bottom-up
- Top-down

## Types of Test

- Test-driven development (Requirements -> Design)
- Test-first development (Design -> Code)
- Test-last development

## Terms

- Test-Code-Refactor
- System Under Test (SUT)
- TestOps

## Concepts

**Keywords:** Test Suite and Approaches.

- Agile Testing Quadrants
- Test Pyramid

## Body of Test Case

- Arrange: Text Fixture
- Act
- Assert

## Maintenance Moments

- Adding Tests
- Updating Tests
- Fixing Failures

## Determine What to Automate

- Identify Value for Each Scenario
- Identify Risk of Automation
- Identify Cost of Automation

| Scenario | Value | Risk | Cost | Total |
| --- | --- | --- | --- | --- |
| Name | X | X | X | X |

**Range:** Consider use 1 to 5.

- Scores 13-15 should be automated
- Scores 12 (and less) should not be automated

## Frameworks

<!-- ### Build

TODO -->

### Assertion

- [AssertJ](https://assertj.github.io/doc/) for Java
- [Hamcrest](http://hamcrest.org/) for multiple languages
- [Truth](https://github.com/google/truth) for Java and Android

### Mocking

| Language | Frameworks |
| --- | --- |
| C# (.NET) | JustMock |
| Java | EasyMock, jMock and Mockito |
| Python | unittest.mock |
