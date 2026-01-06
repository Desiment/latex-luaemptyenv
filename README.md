# luaemptyenv - Empty Environments for LuaLaTeX

LuaLaTeX package for creating environments that discard all contained content.

**Requirements:** LuaLaTeX, xparse, eoldef.

**Installation:** Place `luaemptyenv.sty` and `luaemptyenv.lua` in LaTeX path or document folder.

## Commands

- `\emptyenvironment{name}[numarg][optarg_default]{begin_def}{end_def}` - defines a new environment that ignores all content between `\begin{envname}` and `\end{envname}`

## Usage

```latex
\usepackage{luaemptyenv}
\emptyenvironment{draft}{}{}

\begin{draft}
This content will be completely ignored.
Including \verb|verbatim|, $math$, and special characters: & % # _
\end{draft}
```

**Notes:** 
1. The `eoldef` package (CTAN 2025-06-16) is required for proper handling of content on the same line as `\begin{envname}`. 
2. Such environments **can not be used** inside command definitions (because `\end{envname}` will not appear in input buffer)

**Version:** 0.1.0 (2026-01-05) | **LaTeX:** 2025-11-01+
