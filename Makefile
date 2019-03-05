.SUFFIXES: .dtx .pdf .sty .cls .md 

PKG= \
     	memorial-css

OUTFILES= \
	$(PKG).cls \
	$(PKG)-fonts.sty \
	$(PKG)-logos.sty \
	$(PKG)-layouts.sty \

all: source docs 

source: \
	$(OUTFILES)

docs: \
	$(PKG).pdf 

clean: tidy
	rm -f $(PKG).{cls,pdf}
	rm -f $(PKG)-*.sty

tidy:
	rm -f *.{aux,fdb_latexmk,fls,glo,idx,ilg,ind,log,toc}

.dtx.cls:
	latex $(PKG).ins 

.dtx.sty:
	latex $(PKG).ins 

.dtx.pdf: 
	latexmk -pdf $<
	makeindex -s gind.ist $(basename $<)
	latexmk -pdf $<

