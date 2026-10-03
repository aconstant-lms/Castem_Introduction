# Introduction to Cast3M programming

[![build](https://github.com/aconstant-lms/Castem_Introduction/actions/workflows/build.yml/badge.svg)](https://github.com/aconstant-lms/Castem_Introduction/actions/workflows/build.yml)

Lecture notes introducing the [Cast3M](https://www-cast3m.cea.fr/) finite
element code and its gibiane language, through worked examples:
meshing, elasticity and heat transfer, transient and dynamic analysis,
vibrations and buckling, elastoplasticity, large strain and hyperelasticity,
mesh exchange with gmsh and Paraview, and pre/post-processing in Python and
the shell.

**Andrei Constantinescu** — Laboratoire de Mécanique des Solides, CNRS UMR
7649, École Polytechnique, Palaiseau.

> **Work in progress.** These notes are rewritten as the lectures they
> accompany evolve, and they are certainly not free of errors — in the text,
> in the equations, and in the gibiane examples. Corrections and suggestions
> are very welcome: see [CONTRIBUTING.md](CONTRIBUTING.md).

## Reading it

The compiled PDF is **not** committed. Either download it from the
[latest release](https://github.com/aconstant-lms/Castem_Introduction/releases/latest),
or take the `castem-pdf` artifact from the most recent
[build](https://github.com/aconstant-lms/Castem_Introduction/actions), or
build it yourself.

## Building

    make

which runs `latexmk -pdf castem`. By hand:

    pdflatex castem ; bibtex castem ; makeindex castem ; pdflatex castem ; pdflatex castem

Needs a TeX Live with `babel-french` (`texlive-lang-french` on Debian/Ubuntu)
and `helvet`. `make check` reports undefined references, overfull boxes and
makeindex errors — all three should be zero, and CI fails the build if they
are not.

## Files

| file | contents |
|---|---|
| `castem.tex` | master file: preamble, macros, `\include` list |
| `ch_title.tex` | title page |
| `ch_introduction.tex` | ch. 1 — what Cast3M is, install, running, gibiane basics |
| `ch_meshing.tex` | ch. 2 — mesh creation |
| `ch_elasticity.tex` | ch. 3 — elasticity and thermal equilibrium |
| `ch_heat.tex` | ch. 4 — transient thermal, Newmark dynamics |
| `ch_eigen.tex` | ch. 5 — **vibrations and buckling** (`vibr`, `flambage`, `ksigma`) |
| `ch_plasticity.tex` | ch. 6 — elastoplasticity, by hand and with `pasapas` |
| `ch_largestrain.tex` | ch. 7 — **large strain and hyperelasticity**, contact |
| `ch_importexport.tex` | ch. 8 — I/O, **mesh import from gmsh**, Paraview export |
| `ch_python.tex` | ch. 9 — **pre- and post-processing**: Python, and shell/`sed`/`awk` |
| `ch_questions.tex` | ch. 10 — troubleshooting appendix |
| `castem.bib` | bibliography |
| `FIG/` | figures |
| `OLD/` | superseded monolithic chapter, not included in the build |

## Headings

The sectioning commands are redefined with `\@startsection` in `castem.tex`
(chapter / section / subsection / subsubsection). All four use
`\normalfont\<size>\bfseries\sffamily`, and `\sffamily` is mapped to
**Helvetica** by `\usepackage[scaled=0.92]{helvet}`. `\sffamily` appears
nowhere else in the document, so that one package line controls the whole
heading font; drop it and the headings revert to Computer Modern Sans.

To change the space before a heading, edit the **beforeskip** (the fourth
argument of `\@startsection`). Do not put a `\vspace` in front of the
`\@startsection` call: that glue sits outside the heading's page-break
logic and can be stranded at the foot of a page.

## Conventions

**Encoding.** All sources are UTF-8. Check with `file *.tex`. Convert a stray
latin-1 file with `iconv -f ISO-8859-1 -t UTF-8 f.tex -o f.new && mv f.new f.tex`.

**Worked examples** are a pair of adjacent environments, comment then code,
with no blank line between them:

    \begin{castemcom}
    ... explanation ...
    \end{castemcom}
    \begin{castemlines}
    \begin{verbatim}
    ... gibiane commands ...
    \end{verbatim}
    \end{castemlines}

Keep gibiane lines under about 50 characters so they fit the box.

Full-width listings (shell, Python, gmsh) use `\begin{codebox} ... \end{codebox}`.

Operator tables use `\begin{optable}{Title} op & description \\ \end{optable}`.

**Index.** Three macros, all defined in `castem.tex`:

| macro | for | renders as |
|---|---|---|
| `\dindex{op}{meaning}` | an operator with an English gloss | two entries: `op (meaning)` and `meaning op`, both with `op` in typewriter |
| `\sindex{name}` | an operator, keyword or table index with no useful gloss | one entry, in typewriter |
| `\cindex{concept}` | a concept, not an operator | one entry, in **roman** |

`\cindex` takes an optional sort key for entries whose visible text starts
with maths or a symbol: `\cindex[theta-method]{$\theta$-method}`.

Two rules worth remembering. Use **one spelling and one gloss per operator**,
or the entries fragment into near-duplicates — several glosses are legitimate
only when they mark genuinely different uses (`trac[er]` appears under *plot*,
*save graphics* and *grey levels*). And makeindex's three special characters
`@ ! |` must be escaped with a double quote in the visible text:
`\sindex{"@excel1}`.

**Open items.** `grep -n todoeq ch_*.tex` lists the places where an equation
from the lecture notes still has to be filled in.
