---
name: luaemptyenv-00-usage
description: Use luaemptyenv in LuaLaTeX documents to define environments that discard their body content.
license: MIT
compatibility: opencode
metadata:
  package: luaemptyenv
  topic: usage
---

# luaemptyenv: Usage

## When To Use

Use `luaemptyenv` in LuaLaTeX documents when an environment should discard all
content between `\begin{...}` and `\end{...}`.

## Required Setup

Compile with LuaLaTeX.

```latex
\usepackage{luaemptyenv}
```

## Commands

### `\emptyenvironment{<name>}[<num args>][<default>]{<begin code>}{<end code>}`

Defines a new environment that ignores its body. Optional arguments control the
argument signature of the generated environment.

No environment arguments:

```latex
\emptyenvironment{draftblock}{}{}

\begin{draftblock}
This content is ignored.
\end{draftblock}
```

Environment with required arguments:

```latex
\emptyenvironment{hidden}[1]{Begin #1}{End}

\begin{hidden}{note}
Ignored content.
\end{hidden}
```

Environment with optional default argument:

```latex
\emptyenvironment{hiddenopt}[1][default]{Begin #1}{End}

\begin{hiddenopt}
Ignored content.
\end{hiddenopt}
```

### `\cleartoeline{<tokens>}`

Implementation helper defined with `eoldef`. It consumes content to the end of
the line. Ordinary documents should use `\emptyenvironment` instead.

## Rules

- Compile with LuaLaTeX.
- Use generated empty environments at document level.
- Do not use generated empty environments inside command definitions, because the matching `\end{<name>}` will not appear in the input buffer as required.
- The package requires `eoldef` for proper same-line begin handling.

## Avoid

```latex
\newcommand{\hide}[1]{
  \begin{draftblock}
  #1
  \end{draftblock}
}
```

Use the generated environment directly in document source.
