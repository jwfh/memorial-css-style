.SUFFIXES: .dtx .ins .dvi .ps .md .pdf .tex

EXECUTABLES = \
	latexmk \

DTX= \
     	memorial-css.dtx 

OUTFILES= \
	memorial-css.cls \
	memorial-css-fonts.sty \
	memorial-css-logos.sty \
	memorial-css-layout.sty \

FOUND := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH")))

docs: \
	memorial-css.pdf 

clean:

.dtx.cls:
	latex 

.dtx.pdf: $(OUTFILES)
	latexmk -pdf $<
	# latexmk -c $<

