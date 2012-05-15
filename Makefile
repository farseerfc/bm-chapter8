default: beamer

SIZE=14pt
ASPECT=1610
MAIN=chapter8
LATEX=latexmk -xelatex

OBJS=draft trans handout beamer

all: $(OBJS) article

$(OBJS): $(MAIN).tex
	echo "\\documentclass[CJK,xcolor=dvipsnames,aspectratio=$(ASPECT),$(SIZE),$@]{beamer}" >$(MAIN).$@.$(ASPECT).tex
	echo "\\input{$(MAIN).tex}" >>$(MAIN).$@.$(ASPECT).tex
	$(LATEX) $(MAIN).$@.$(ASPECT)
    
notes: $(MAIN).tex
	echo "\\documentclass[CJK,xcolor=dvipsnames,aspectratio=$(ASPECT),$(SIZE),beamer]{beamer}" >$(MAIN).notes.$(ASPECT).tex
	echo "\\setbeameroption{show only notes}"  >>$(MAIN).notes.$(ASPECT).tex
	echo "\\input{$(MAIN).tex}" >>$(MAIN).notes.$(ASPECT).tex
	$(LATEX) $(MAIN).notes.$(ASPECT)

article: $(MAIN).tex
	echo "\\documentclass[CJK]{article}" >$(MAIN).article.tex
	echo "\\usepackage{beamerarticle,xeCJK}" >>$(MAIN).article.tex
	#echo "\\begin{CJK}" >>$(MAIN).article.tex
	echo "\\input{$(MAIN).tex}" >>$(MAIN).article.tex
	#echo "\\end{CJK}" >>$(MAIN).article.tex
	$(LATEX) $(MAIN).article.tex

pure:
	rm -fv $(MAIN).{draft,handout,beamer,trans,second,notes}.*.{tex,aux,log,nav,out,snm,toc,tex,vrb,fls,fdb_latexmk}
	rm -fv $(MAIN).article.{tex,aux,log,nav,out,snm,toc,tex,vrb,fls,fdb\_latexmk}
	rm -fv $(MAIN).{aux,log,nav,out,snm,toc,vrb,bbl,blg}
	rm -fv texlog texput.log missfont.log

clean:  pure
	rm -fv $(MAIN).{draft,handout,beamer,article,trans,second,notes}.*.pdf
	rm -fv $(MAIN).article.pdf
	rm -fv $(MAIN).pdf


