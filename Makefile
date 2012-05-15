default: beamer

SIZE=14pt
ASPECT=1610
MAIN=chapter8
LATEX=latexmk -xelatex

all: draft trans handout beamer article

draft: $(MAIN).draft.$(ASPECT).pdf

handout: $(MAIN).handout.$(ASPECT).pdf

trans: $(MAIN).trans.$(ASPECT).pdf

beamer: $(MAIN).beamer.$(ASPECT).pdf

article: $(MAIN).article.pdf


$(MAIN).draft.$(ASPECT).pdf: $(MAIN).tex
	echo "\\documentclass[CJK,xcolor=dvipsnames,aspectratio=$(ASPECT),$(SIZE),draft]{beamer}" >$(MAIN).draft.$(ASPECT).tex
	echo "\\input{$(MAIN).tex}" >>$(MAIN).draft.$(ASPECT).tex
	$(LATEX) $(MAIN).draft.$(ASPECT)

$(MAIN).trans.$(ASPECT).pdf: $(MAIN).tex
	echo "\\documentclass[CJK,xcolor=dvipsnames,aspectratio=$(ASPECT),$(SIZE),trans]{beamer}" >$(MAIN).trans.$(ASPECT).tex
	echo "\\input{$(MAIN).tex}" >>$(MAIN).trans.$(ASPECT).tex
	$(LATEX) $(MAIN).trans.$(ASPECT)

$(MAIN).handout.$(ASPECT).pdf: $(MAIN).tex
	echo "\\documentclass[CJK,xcolor=dvipsnames,aspectratio=$(ASPECT),$(SIZE),handout]{beamer}" >$(MAIN).handout.$(ASPECT).tex
	echo "\\input{$(MAIN).tex}" >>$(MAIN).handout.$(ASPECT).tex
	$(LATEX) $(MAIN).handout.$(ASPECT)

$(MAIN).beamer.$(ASPECT).pdf: $(MAIN).tex
	echo "\\documentclass[CJK,xcolor=dvipsnames,aspectratio=$(ASPECT),$(SIZE),beamer]{beamer}" >$(MAIN).beamer.$(ASPECT).tex
	echo "\\input{$(MAIN).tex}" >>$(MAIN).beamer.$(ASPECT).tex
	$(LATEX) $(MAIN).beamer.$(ASPECT)

$(MAIN).article.pdf: $(MAIN).tex
	echo "\\documentclass[CJK]{article}" >$(MAIN).article.tex
	echo "\\usepackage{beamerarticle,xeCJK}" >>$(MAIN).article.tex
	#echo "\\begin{CJK}" >>$(MAIN).article.tex
	echo "\\input{$(MAIN).tex}" >>$(MAIN).article.tex
	#echo "\\end{CJK}" >>$(MAIN).article.tex
	$(LATEX) $(MAIN).article.tex


pure:
	rm -fv $(MAIN).{draft,handout,beamer,trans}.*.{tex,aux,log,nav,out,snm,toc,tex,vrb,fls,fdb_latexmk}
	rm -fv $(MAIN).article.{tex,aux,log,nav,out,snm,toc,tex,vrb,fls,fdb\_latexmk}
	rm -fv $(MAIN).{aux,log,nav,out,snm,toc,vrb,bbl,blg}
	rm -fv texlog texput.log missfont.log

clean:  pure
	rm -fv $(MAIN).{draft,handout,beamer,article,trans}.*.pdf
	rm -fv $(MAIN).article.pdf
	rm -fv $(MAIN).pdf


