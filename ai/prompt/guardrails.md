# Prompt Guardrails

<!--
https://github.com/guardrails-ai/guardrails | https://guardrailsai.com

Guardrails AI
NeMo Guardrails
LangChain Guardrails
-->

<!--
Unsafe Intent Blocker: https://gist.github.com/brunowego/3d9b4d7bf98bb79149af7a874a993538
-->

## Types

- Safety Filters
- Toxicity & Abuse Mitigation
- Privacy Filtering
- Prompt Injection Hardening
- Rate Limiting & Abuse Prevention
- Content Classifiers

<!--
// const checkIsRequestSafe = async (modelMessages: ModelMessage[]) => {
//   const lastMessage = modelMessages.at(-1)

//   const { object } = await generateObject({
//     // model: openai('gpt-4o-mini'),
//     // model: googleGenAI('gemini-2.5-flash'),
//     model: lmstudio('qwen/qwen3-vl-8b'),
//     schema: z.object({
//       shouldBlock: z
//         .boolean()
//         .describe('Should block request if user message is an bad actor.'),
//     }),
//     system: guardrailSystemPrompt,
//     prompt: endent`
//       As an guardrail agent, determine whether this user message is bad or good.

//       Based on user message: ${lastMessage?.content} return { shouldBlock: <true | false> }
//     `,
//   })

//   console.log({ object })

//   return !object.shouldBlock
// }
-->
