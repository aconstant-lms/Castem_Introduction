# Working on the lecture notes "Introduction to Cast3M programming"

Author: Andrei Constantinescu (LMS, CNRS & Ecole Polytechnique). LaTeX book, see README.md for the layout.
Companion volume: "Nonlinear Problems in Mechanics" (`aconstant-lms/npm-lecture`). The two share their
style and notation files; keep them in step.

## Conventions (apply to every edit)
- Layout and typography live in `preamble/style.tex`, notation in `preamble/notation.tex`. Both are shared
  verbatim with the companion notes **above** the rule marked *Cast3M-specific* / *Additions for the Cast3M
  notes*; a change above that rule should be copied across, a change below it belongs only here.
- Use the notation macros, never ad-hoc bold: vectors and 2nd-order tensors bold italic (`\vect{}`,
  `\tens{}`, `\sig`, `\eps`), 4th-order tensors blackboard bold (`\tensf{}`, `\bbC`), matrices bold
  upright (`\mat{K}`). A gibiane operator in running text is `\op{name}`.
- Every chapter follows the frame: `\framepart{Outline}` (what the chapter does, and what you should be
  able to do after it), numbered sections, `\framepart{Summary}` (a `gbox*` of bold-led items), and
  `\framepart{Exercises}` (`\exercise{Title}` items). Frame parts are unnumbered, in small caps: refer to
  them with `\pageref`/`\nameref`, never `\ref`.
- **Worked examples** are a `castemcom` (the explanation) immediately followed by a `castemlines` (the
  gibiane), with NO blank line between them, or they end up one below the other. Keep gibiane lines under
  about 50 characters so they fit the 92 mm box. Full-width listings (shell, Python, gmsh) use `codebox`.
- Gray boxes: `optable{Title}` for a table of operators, `gbox{Title}` for any other titled table or key
  statement, `gbox*` for an untitled one. Never `tabularx` inside them — in a breakable `tcolorbox` it
  measures against `\textwidth` and overflows the box; use a fixed `p{}` width.
- Index with `\dindex{op}{english gloss}` for an operator, `\sindex{name}` for a keyword or table index,
  `\cindex{concept}` for a concept (roman, with an optional sort key for maths). One spelling and one
  gloss per operator, or the entries fragment into near-duplicates. makeindex's `@ ! |` must be escaped
  with a double quote in the visible text: `\sindex{"@excel1}`.
- A Cast3M name too wide for the comment column takes `\ul` in place of `\_`, which allows a break there.
- Encoding: every `.tex` file is UTF-8. `file *.tex` should say so for all of them.
- `\todoeq{...}` marks an equation from the lecture notes still to be filled in; `grep -n todoeq ch_*.tex`.
- Red `\draftnote{...}` marks open questions for the author (shown only under `\drafttrue`); leave them
  unless resolved.

## Checking the gibiane
- The text is checked against the operator notices and the shipped `dgibi` test cases, not against a
  running installation. When adding or changing an example, say which version it was checked against, and
  prefer a construction that works on old and current releases over one that needs the newest notice.
- Keywords get deprecated between releases (`'GRANDES_DEFORMATIONS'` now stops the run). If the text
  disagrees with a real installation, the installation is right.

## Workflow
- One conversation per chapter; touch other files only when needed (cross-references, notation).
- Build: `make`, which is `latexmk -pdf castem`. `.latexmkrc` is what passes the index style file to
  makeindex, so prefer latexmk over a bare `pdflatex`.
- Before committing, `make check` must report **zero** undefined references, **zero** overfull boxes and
  **zero** makeindex errors. The CI enforces all three and fails the run otherwise.
- Commit with a clear message per round of corrections (e.g. "ch7: fix the NUME_LOI table, add the
  self-contact exercise"). The commit message becomes the release note, so make it readable for the author.
- Every push to `main` triggers `.github/workflows/build.yml`, which compiles the book and uploads
  `castem.pdf` as an artifact; a `v*` tag also attaches it to the release. After pushing, check the run
  succeeded (`gh run list` / Actions tab) and give the author the link; attach the PDF in the conversation
  only if asked.
