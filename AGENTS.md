# Agent Implementation Rules
You are working in a MATLAB-based verification harness.

## Critical Instructions:
1. **Always Use CognitiveLogger**: Every agent subclass must use the `+utils/CognitiveLogger` to record the 'Divergence' between predicted and actual states.
2. **Matrix Operations**: Do not use loops for state transitions. Use matrix multiplication (e.g., `S_next = A * S_curr`).
3. **Observability**: If the `Divergence` metric exceeds 0.5, the agent must trigger a 'Self-Correction' log entry explaining why its internal model failed.

## Breakthrough Goal:
We are researching "Agentic Process Observability." Your goal is to keep the Cognitive Trace as thin as possible (minimizing divergence).
