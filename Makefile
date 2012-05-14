default: beamer pure


SIZE=14pt
ASPECT=1610
MAIN=chapter8

all: draft trans handout beamer article pure

draft: $(MAIN).draft.$(ASPECT).pdf

handout: $(MAIN).handout.$(ASPECT).pdf

trans: $(MAIN).trans.$(ASPECT).pdf

beamer: $(MAIN).beamer.$(ASPECT).pdf

article: $(MAIN).article.pdf


$(MAIN).draft.$(ASPECT).pdf: $(MAIN).tex
	echo "\\documentclass[CJK,xcolor=dvipsnames,aspectratio=$(ASPECT),$(SIZE),draft]{beamer}" >$(MAIN).draft.$(ASPECT).tex
	echo "\\input{$(MAIN).tex}" >>$(MAIN).draft.$(ASPECT).tex
	xelatex $(MAIN).draft.$(ASPECT).tex && xelatex $(MAIN).draft.$(ASPECT).tex

$(MAIN).trans.$(ASPECT).pdf: $(MAIN).tex
	echo "\\documentclass[CJK,xcolor=dvipsnames,aspectratio=$(ASPECT),$(SIZE),trans]{beamer}" >$(MAIN).trans.$(ASPECT).tex
	echo "\\input{$(MAIN).tex}" >>$(MAIN).trans.$(ASPECT).tex
	xelatex $(MAIN).trans.$(ASPECT).tex && xelatex $(MAIN).trans.$(ASPECT).tex

$(MAIN).handout.$(ASPECT).pdf: $(MAIN).tex
	echo "\\documentclass[CJK,xcolor=dvipsnames,aspectratio=$(ASPECT),$(SIZE),handout]{beamer}" >$(MAIN).handout.$(ASPECT).tex
	echo "\\input{$(MAIN).tex}" >>$(MAIN).handout.$(ASPECT).tex
	xelatex $(MAIN).handout.$(ASPECT).tex && xelatex $(MAIN).handout.$(ASPECT).tex

$(MAIN).beamer.$(ASPECT).pdf: $(MAIN).tex
	echo "\\documentclass[CJK,xcolor=dvipsnames,aspectratio=$(ASPECT),$(SIZE)]{beamer}" >$(MAIN).beamer.$(ASPECT).tex
	echo "\\input{$(MAIN).tex}" >>$(MAIN).beamer.$(ASPECT).tex
	xelatex $(MAIN).beamer.$(ASPECT).tex && xelatex $(MAIN).beamer.$(ASPECT).tex

$(MAIN).article.pdf: $(MAIN).tex
	echo "\\documentclass[CJK]{article}" >$(MAIN).article.tex
	echo "\\usepackage{beamerarticle,xeCJK}" >>$(MAIN).article.tex
	#echo "\\begin{CJK}" >>$(MAIN).article.tex
	echo "\\input{$(MAIN).tex}" >>$(MAIN).article.tex
	#echo "\\end{CJK}" >>$(MAIN).article.tex
	xelatex $(MAIN).article.tex && xelatex $(MAIN).article.tex


pure:
	rm -fv $(MAIN).{draft,handout,beamer,article,trans}.*.{tex,aux,log,nav,out,snm,toc,tex,vrb}
	rm -fv $(MAIN).{aux,log,nav,out,snm,toc,vrb,bbl,blg}
	rm -fv texlog texput.log missfont.log

clean:  pure
	rm -fv $(MAIN).{draft,handout,beamer,article,trans}.*.pdf
	rm -fv $(MAIN).pdf


