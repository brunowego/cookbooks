# LLM Evals (Evaluations)

<!--
https://github.com/search?q=path%3A.github%2Fworkflows%20path%3A.y%20content%3Allm%20content%3Aeval&type=code
-->

## Types of Evals

- LLM-as-a-Judge
  - An LLM scores or critiques another LLM’s output.
  - Example: “Is this answer relevant and factually correct?”
- Reference-based evals
  - Compare the output against a ground-truth or golden answer.
  - Can be automated with metrics like BLEU/ROUGE or LLM-based comparisons.
- Retrieval evals (RAG-specific)
  - Measure how well your retriever is working.
  - Metrics: context precision, groundedness, answer relevance.
- Prompt evals
  - Specifically A/B testing different prompts to see which leads to better responses.

## Tools

- [DSPy](/dspy.md)
- [LangChain](/langchain/README.md)
- [Langfuse](/langfuse/README.md)
- [LiteLLM](/litellm.md)
- [OpenAI Evals](https://github.com/openai/evals)
- [OpenPipe](https://openpipe.ai)
- [OpenRouter](/openrouter.md)
- [Portkey](/portkey.md)
- [TensorZero](/tensorzero/README.md)

<!--
TruLens
Ragas
Helicone
LangSmith
Promptfoo

https://braintrust.dev
https://github.com/langfuse/langfuse
-->
