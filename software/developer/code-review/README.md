# Code Review

**Keywords:** Culture

## Tools

### Automated

- [Reviewdog](/reviewdog.md)
- [What The Diff](https://whatthediff.ai)

## Benefits

- Catch bugs
- Catch code quality issues
- A learning opportunity for the
  - Pull Request creator
  - Reviewer
- An exchange of best practices and experiencies
- A chance to synchronize

## Code Review Downsides

- What Code Reviews also amplify:
  - Poor company culture
  - Difficult personalities
  - Unprofessional behaviour
- Leads to:
  - Unnecessary arguments
  - Slow down development
  - Decrease morale

## Personas

- A _Reviewee_ is the subject of your review, or the person(s) who the questions are about.
- A _Reviewer_ is the person completing the review, or the person(s) answering the questions.

## Downsides of Big PRs

- Difficult and long to review
- Paradox: may result in fast approvals
- Hint: people don't bother reviewing properly
  - Reluctant to dedicate that mush time
  - Likely to cut corners

```txt
10 lines of code = 10 issues
500 lines of code = Looks Good To Me (LGTM)
```

## Boy Scout Rule

> Commit atomic self-contained changes

- Leave the
  - campground cleaner than you found it
  - code better than you found it
- Small changes build up
- Unrelated changes? Separate commit!

## Commenting on PRs

- Criticism
  - Hard to accept
  - Get defensive and uncooperative

Vs.

- Feedback
  - Improve
  - Learn

## OIR (stands for Observe, Impact, Request) Rule

- OIR is rather verbose
- Advantages:
  - May prevent request for clarification
  - OIR explains things up front
  - Promotes learning
- Additional clarification is helpful
- Use to pass on knowledge of best practices
