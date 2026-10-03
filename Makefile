MAIN = castem

.PHONY: all clean distclean check watch

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex $(wildcard ch_*.tex) $(MAIN).bib
	latexmk -pdf -interaction=nonstopmode -file-line-error $(MAIN)

# The same gate the CI applies: latexmk exits 0 on an undefined reference or
# an overfull box, so check the log explicitly.
check: $(MAIN).pdf
	@echo "undefined references/citations : $$(grep -c 'undefined' $(MAIN).log || true)"
	@echo "overfull boxes                 : $$(grep -c '^Overfull' $(MAIN).log || true)"
	@echo "makeindex errors               : $$(grep -c 'Input index error' $(MAIN).ilg || true)"
	@grep -n 'undefined\|^Overfull' $(MAIN).log | head -40 || true

watch:
	latexmk -pdf -pvc -interaction=nonstopmode $(MAIN)

clean:
	latexmk -c $(MAIN)
	rm -f $(MAIN).idx $(MAIN).ind $(MAIN).ilg $(MAIN).bbl $(MAIN).blg

distclean:
	latexmk -C $(MAIN)
	rm -f $(MAIN).idx $(MAIN).ind $(MAIN).ilg $(MAIN).bbl $(MAIN).blg
