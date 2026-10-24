#  A Learning and Reasoning AI in Common Lisp

Astra is an experimental artificial intelligence project built from scratch in **Common Lisp**. Its goal is to explore how an AI can represent knowledge, reason about facts, learn from experience, and eventually make decisions autonomously.

The project starts with a symbolic reasoning engine and will gradually evolve into a learning system with persistent memory, rule generalization, and goal-oriented planning.

## Current Features

- **Knowledge base:** Stores facts as Lisp symbols.
- **Forward chaining:** Applies rules repeatedly to derive new facts.
- **Rule learning:** Allows new inference rules to be added at runtime.
- **Fact learning:** Adds new facts to the knowledge base.
- **Basic querying:** Checks whether a fact is known or can be inferred.
- **Persistent memory:** Saves and restores facts and rules using a Lisp file.

## Requirements

- [Portacle](https://portacle.github.io/) — a portable Common Lisp development environment.
- [SBCL](https://www.sbcl.org/) — Steel Bank Common Lisp, included with Portacle.

No external AI APIs, machine learning frameworks, or pretrained models are required for the current version.

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/Solidshade/astra.git
cd astra
```
### 2. Open the project

Open Portacle and load `astra.lisp` in Emacs.

### 3. Load the program

Save the file, then run the following Emacs command:

```text
M-x slime-compile-and-load-file
```

Here, `M-x` means pressing `Alt + X` in Portacle.

### 4. Start Astra

At the Lisp REPL, enter:

```lisp
(start-astra)
```

Astra will run its inference engine and display the facts it knows, including conclusions derived from its rules.

## Usage

### Query the knowledge base

```lisp
(ask 'slippery-road)
(ask 'flying-car)
```

Astra checks its knowledge base and attempts to infer the requested facts.

### Teach Astra a fact

```lisp
(learn-fact 'sunshine)
```

### Teach Astra a rule

```lisp
(learn-rule '(sunshine) 'bright-day)
```

### Query a derived conclusion

```lisp
(ask 'bright-day)
```

Astra should infer `BRIGHT-DAY` from the new fact and rule.

### Save memory

```lisp
(save-memory)
```

### Restore memory

```lisp
(load-memory)
```

By default, memory is stored in `astra-memory.lisp` in the current working directory.

## How It Works

Astra currently uses a simple symbolic AI architecture.

1. **Facts** represent information known by the system.
2. **Rules** describe relationships between facts.
3. **Inference** repeatedly applies rules to derive new knowledge.
4. **Learning functions** allow facts and rules to be added at runtime.
5. **Persistence** saves the knowledge base so it can be restored later.

For example, given the facts `RAIN`, `CLOUDS`, and `COLD`, Astra can apply these rules:

```lisp
(((rain clouds) wet-ground)
 ((wet-ground cold) slippery-road))
```

It first infers `WET-GROUND`, then uses that conclusion to infer `SLIPPERY-ROAD`.

This is an example of **forward chaining**, a classical rule-based reasoning technique.

## Philosophy

Astra is a learning project focused on understanding the foundations of artificial intelligence.

Rather than starting with a large pretrained model, the project begins with explicit knowledge representations and transparent reasoning mechanisms. Each component is developed incrementally to make the system's behavior understandable and testable.

The long-term objective is to combine symbolic reasoning, learning from examples, memory, and planning into a more capable AI system.

## Limitations

Astra is an early prototype, not a general-purpose AI.

- It does not understand natural language yet.
- Its current learning functions require explicit facts and rules.
- It does not yet learn generalized rules automatically.
- It does not have a neural network or pretrained language model.
- Its conclusions are only as reliable as its knowledge and rules.

These limitations are part of the development roadmap.

## Contributing

Contributions, suggestions, bug reports, and discussions are welcome.

If you experiment with Astra, consider contributing improvements to the inference engine, learning algorithms, memory system, or test suite.

## License

MIT License. Go nuts.

---

**Built with Common Lisp.**

*An experiment in building intelligence from the ground up.*
