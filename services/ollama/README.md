## Running ollama on cluster

Tried initially using qwen2.5:14bn

set the container to 4 cores limit, 20gb ram limit

it works but slow prompts ~ 2.3 tokens /s

"""
Looking at the performance stats in your JSON response:

prompt_eval_duration: ~2.8 seconds to parse the prompt.
eval_duration: ~16.7 seconds to generate 38 tokens (~2.3 tokens/second).
That generation speed is right in line with expectations for a 14B parameter model running purely on a 4-core Intel CPU without a dedicated GPU.
"""
