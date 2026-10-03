# The index is laid out by preamble/index.ist, which gives the letter
# headings of the index the sans-serif bold of the headings.  latexmk
# calls makeindex itself, so the style file has to be named here.
$makeindex = 'makeindex -s preamble/index.ist %O -o %D %S';

$pdf_mode = 1;
$bibtex_use = 2;          # run bibtex, and clean the .bbl on "latexmk -C"
@default_files = ('castem.tex');
