.PHONY: main neurips clean FORCE

main: poster.pdf

poster.pdf: FORCE
	mkdir -p tmp/texmf-var tmp/cache/fontconfig
	TEXMFVAR='$(CURDIR)/tmp/texmf-var' TEXMFCACHE='$(CURDIR)/tmp/texmf-var' XDG_CACHE_HOME='$(CURDIR)/tmp/cache' latexmk -pdflatex='lualatex -interaction nonstopmode' -pdf poster.tex

neurips: output/pdf/neurips-2026-poster-template.pdf

output/pdf/neurips-2026-poster-template.pdf: poster_neurips.tex poster_neurips.bib colorthemes/beamercolorthemeneurips.sty beamerthemegemini.sty
	mkdir -p output/pdf tmp/pdfs/neurips tmp/texmf-var tmp/cache/fontconfig
	TEXMFVAR='$(CURDIR)/tmp/texmf-var' TEXMFCACHE='$(CURDIR)/tmp/texmf-var' XDG_CACHE_HOME='$(CURDIR)/tmp/cache' latexmk -pdflatex='lualatex -interaction=nonstopmode' -pdf -outdir=tmp/pdfs/neurips -jobname=neurips-2026-poster-template poster_neurips.tex
	cp tmp/pdfs/neurips/neurips-2026-poster-template.pdf $@

clean:
	latexmk -pdf -C
	latexmk -pdf -C -outdir=tmp/pdfs/neurips -jobname=neurips-2026-poster-template poster_neurips.tex
