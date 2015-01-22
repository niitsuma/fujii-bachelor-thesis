#LATEX = /Applications/UpTeX.app/teTeX/bin/platex
LATEX = platex
BIBTEX = pbibtex

#DVIPDF = /Applications/UpTeX.app/teTeX/bin/dvipdfmx 
DVIPDF = dvipdfmx 


EBB = extractbb -m


.PHONY: all




all : main.pdf 

#a-gift-of-fire-jp.pdf : a-gift-of-fire-jp.dvi
#	dvipdfmx a-gift-of-fire-jp.dvi

# scm2cpp11-jp-beam.pdf :  scm2cpp11-jp-beam.tex
# 	(cd images ; ebb *.png) ;  platex scm2cpp11-jp-beam ; dvipdfmx scm2cpp11-jp-beam 

#%.pdf: %.dvi 
#	dvipdfmx  $<

%.pdf: %.dvi 
	$(DVIPDF)  $<


#a-gift-of-fire-jp.dvi : a-gift-of-fire-jp.tex
#	platex a-gift-of-fire-jp.tex

%.dvi: %.tex body.tex introduction.tex
	platex $<

#$(LATEX)  $< ; $(LATEX)  $<  ; $(BIBTEX) $* ; $(LATEX) $* ; $(LATEX) $*

#%.dvi: %.tex 
#	(cd images ; ebb *.png ) ; platex  $<

#%.dvi: %.tex 
#	(cd images ; $(EBB) *.png ) ; platex  $<

#%.dvi: %.tex %.bib
#	ebb *.png ; (cd images ; ebb *.png) ; platex  $< ; (cd images ; ebb *.png)
#	$(BIBTEX) $%
#	$(LATEX)  $< 
#	$(BIBTEX) $%  
#	$(LATEX) $< 



%.bb: %.png 
	ebb  $<


images/%.bb: images/%.png 
	ebb  $<


# %.xbb : %.png 
# 	extractbb  $<
# %.bb : %.xbb
#	extractbb -m $<



#a-gift-of-fire-jp.tex : a-gift-of-fire-jp.org

# %.tex: %.org



.PHONY: clean

clean:
	rm -f *.pdf *.dvi *.log *.vrb *.out *.toc *.nav *.snm *.aux *.bbl *.blg


# %.exe: %.cpp scm2cpp.hpp
# 	$(CC) $(CFLAGS) $(LDFLAGS) $(LIBS) -o $@ $<
