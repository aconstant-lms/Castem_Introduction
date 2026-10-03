# Corrections and suggestions

These notes are a work in progress and corrections are genuinely welcome —
they are what makes the next version better than this one.

## The quickest route

Open an [issue](https://github.com/aconstant-lms/Castem_Introduction/issues).
Say which page or section, and what is wrong. For a gibiane example, pasting
the error Cast3M printed is worth more than a description of it.

Pull requests are equally welcome. The CI builds the booklet on every push
and will tell you if something broke.

## Especially useful

- **Examples that do not run.** The gibiane in these notes is checked against
  the operator notices and the shipped `dgibi` test cases, but much of it has
  not been executed as printed. If a snippet fails on your installation, that
  is the most valuable kind of report — please say which Cast3M version.
- **Version drift.** Cast3M changes. Keywords get deprecated (`'GRANDES_DEFORMATIONS'`
  now stops the run), notices get restructured, operators get added. If the
  text disagrees with your installation, your installation is right.
- **Anything in the Input/Output chapter.** The table of formats that `lire`
  and `sort` accept was built from the notices, not from a running
  installation, and is the part most likely to be wrong.

## If you are editing the source

A few conventions, so a pull request does not fight the rest of the document.
They are described more fully in the "Conventions" section of the
[README](README.md).

- **UTF-8.** All `.tex` files are UTF-8. `file *.tex` should say so for every
  one of them.
- **Worked examples** are a `castemcom` (the explanation) immediately followed
  by a `castemlines` (the gibiane), with no blank line between them. Keep
  gibiane lines under about 50 characters so they fit the box.
- **Index entries** use `\dindex{op}{meaning}` for an operator with an English
  gloss, `\sindex{name}` for a keyword, and `\cindex{concept}` for a concept.
  One spelling and one gloss per operator, or the entries fragment.
- **Check before pushing:** `make check` must report zero undefined
  references, zero overfull boxes and zero makeindex errors. The CI enforces
  this.

## Open points

Marked in the source and worth picking up:

- `grep -n todoeq ch_*.tex` — places where an equation from the lecture notes
  still has to be filled in.
- The bibliography is incomplete and some entries need checking.
- `OLD/` holds a superseded French chapter, kept only until someone confirms
  nothing is missing from it.
