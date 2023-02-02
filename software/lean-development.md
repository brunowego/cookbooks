# Lean Software Development (LSD)

<!--
https://linkedin.com/learning/lean-foundations/
https://linkedin.com/learning/learning-lean-it/
https://linkedin.com/learning/lean-technology-strategy-running-agile-at-scale/
https://linkedin.com/learning/lean-technology-strategy-building-high-performing-teams/
https://linkedin.com/learning/lean-technology-strategy-purposeful-organizations/
-->

## Visual Tools

- Kanban
- Andon
- Dashboard

## Related

- Agile Software Development

## Books

- [Implementing Lean Software Development: From Concept to Cash](https://amazon.com/Implementing-Lean-Software-Development-Concept/dp/0321437381)
- [Lean IT: Enabling and Sustaining Your Lean Transformation](https://www.amazon.com/Lean-Enabling-Sustaining-Your-Transformation/)
- [Lean Software Development: An Agile Toolkit: An Agile Toolkit](https://amazon.com/Lean-Software-Development-Agile-Toolkit-ebook/dp/B00HEL13HW)
- [Making Work Visible: Exposing Time Theft to Optimize Work & Flow](https://www.amazon.com/Making-Work-Visible-Exposing-Optimize-ebook/dp/B076BYZ6VN)
- [Managing to Learn: Using the A3 Management Process to Solve Problems, Gain Agreement, Mentor and Lead](https://www.amazon.com/Managing-Learn-Management-Problems-Agreement/dp/1934109207)
- [The Art of Action: How Leaders Close the Gaps between Plans, Actions and Results](https://amazon.com/Art-Action-Leaders-between-Actions/dp/1857885597)
- [The Lean Mindset: Ask the Right Questions](https://www.amazon.com/Lean-Mindset-Ask-Right-Questions/dp/0321896904)
- [Thinking in Bets: Making Smarter Decisions When You Don't Have All the Facts](https://amazon.com/Thinking-Bets-Making-Smarter-Decisions-ebook/dp/B074DG9LQF)
- [This is Lean: Resolving the Efficiency Paradox](https://www.amazon.com/This-Lean-Resolving-Efficiency-Paradox-ebook/dp/B00JZZS7Q0)
- [Toyota Kata: Managing People for Improvement, Adaptiveness and Superior Results](https://www.amazon.com/Toyota-Kata-Managing-Improvement-Adaptiveness/dp/0071635238)

## Prases

- Staying busy doesn't guarantee you're delivering value.
- Value is ultimately determined by customer actions.
- The customer is the person that pays for the final product or service that the organization delivers.

## Concepts

- Optimization of Flow Efficiency

## 7 Principles of Lean Software Development

- Eliminate Waste
  - Remove unnecessary activities
  - Develop features that add value
  - Reduce churn (Customer Success)
  - Reduce dependencies and delays
- Build Quality In
  - Test-driven development
  - Automated testing
  - Continuous integration
  - Refactoring
  - Mistake proofing
- Create Knowledge (e.g. tools: Kata, Set-based design, A3)
  - Experiment
  - Challenge
  - Respond
- Defer Commitment
- Deliver Fast
- Respect People
  - Easy to acquire and use
  - Meet actual needs
  - Focus on support and priorities
  - Appropriate level of autonomy
- Optimize the Whole

## 7 Common Wastes of Software Development

- Partially Done Work
  - Unused designs, specifications, codes, tests, etc.
- Extra Features
  - Featured Used: Hardly Ever, Often, Infrequently
  - 80% of features and functions have low to no value
- Relearning
- Handoffs
  - Explicit Knowledge x Implicit Knowledge
  - Up to 50% tacit knowledge is lost during handoffs
- Task Switching
- Delay
- Defects
  - Failure Demand: Work you have to do now because something wasn't done correctly before

## Key Questions

- What needs do we want to fulfill?
- Is anyone already tackling this?
- How?

## Customer Questions

- Who exactly is our target?
- Individuals or companies?
- Small businesses?
- Enterprises?

## Recommended Cadences

- Frequent planning sessions: prioritization
- Daily meetings: coordination
- Frequent reviews: functionality
- Regular retrospectives: analysis and improvements

## Scientific Thinking

- What we think happens X What actually happens

## Reduce Risk of Upfront Decisions

- Limit them to only what's necessary
- Do targeted research to create a small set of best options
- Utilize set-based design/engineering to get to the best one

## Adopt set-based design

- Design
  - Detailed specs
  - Work Breakdown Structure (WBS)
  - Plan with timelines

<!--
1. Build change-tolerant systems
2. Learn about set-based design
-->

## Implement Kanban System

1. Visualize your work
2. Limit your work in process
3. Monitor and manage flow
4. Make policies explicit
5. Implement regular feedback loops
6. Improve collaboratively

## Costs

### Holding

- Is there money left on the table because these items aren't delivered yet?
- What is the effort required to manage the overhead of this batched work?
- Are there often delays or rework due to last-minute testing before big-batch deployments?

### Transaction

- What is the actual work of delivery inside the organization?
- Does it have monetary cost?
- Does it have a lot of labor cost, perhaps due to manual processes?
- What is the cost of effort to validate the release with your user base?
- What is the cost to the customer every time you deploy?
- Do they need to do an excessive amount of validation work?

## Improving the Level of Psychological Safety

- Assume good intent
- Replace blame with curiosity
- Ensure all personality types can contribute
- Reset your opinion of conflict
- Ask for feedback

## Work within These Guardrails

- Do (Goals)
  - Keep current tech stack
  - Include marketing as part of the team
  - Consult support to anticipate and avoid customer issues
- Avoid (Anti-Goals)
  - Work overtime
  - Require a separate transaction for customers

## Questions

### What is flow efficiency?

A measure of how efficiently value moves through an organization's process and into the hands of the customer.

### What is the basic calculation for a process flow efficiency percentage?

A = Avg. Active Time, I = Avg. Inactive Time, and T = Avg. Total Time

(A / T) \* 100
