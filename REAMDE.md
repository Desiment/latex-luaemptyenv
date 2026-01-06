# luaemptyenv - Empty Environments for LuaLaTeX

LuaLaTeX package for creating environments that discard all contained content.

**Requirements:** LuaLaTeX, xparse, eoldef.

**Installation:** Place `luaemptyenv.sty` and `luaemptyenv.lua` in LaTeX path or document folder.

## Commands

- `\NewEmptyEnvironment{envname}` - defines a new environment that ignores all content between `\begin{envname}` and `\end{envname}`

## Usage

```latex
\usepackage{luaemptyenv}
\NewEmptyEnvironment{draft}

\begin{draft}
This content will be completely ignored.
Including \verb|verbatim|, $math$, and special characters: & % # _
\end{draft}
```

**Note:** The `eoldef` package (CTAN 2025-06-16) is required for proper handling of content on the same line as `\begin{envname}`.

**Version:** 0.1.0 (2026-01-05) | **LaTeX:** 2025-11-01+
