default: beamer

SIZE=14pt
ASPECT=169
MAIN=chapter8
LATEX=latexmk -xelatex

OBJS=beamer handout trans draft

all: $(OBJS) article notes

$(OBJS): $(MAIN).tex
	echo "\\documentclass[CJK,aspectratio=$(ASPECT),$(SIZE),$@]{beamer}" >$(MAIN).$@.$(ASPECT).tex
	echo "\\setbeameroption{show notes on second screen}"  >>$(MAIN).notes.$(ASPECT).tex
	echo "\\input{$(MAIN).tex}" >>$(MAIN).$@.$(ASPECT).tex
	$(LATEX) $(MAIN).$@.$(ASPECT)
    
notes: $(MAIN).tex
	echo "\\documentclass[CJK,aspectratio=$(ASPECT),$(SIZE),handout]{beamer}" >$(MAIN).notes.$(ASPECT).tex
	echo "\\usepackage{pgf,pgfpages}"
	echo "\\setbeameroption{show notes}"  >>$(MAIN).notes.$(ASPECT).tex
	echo "\\input{$(MAIN).tex}" >>$(MAIN).notes.$(ASPECT).tex
	$(LATEX) $(MAIN).notes.$(ASPECT)

article: $(MAIN).tex
	echo "\\documentclass[CJK,twocolumn]{article}" >$(MAIN).article.tex
	echo "\\usepackage[a4paper,vmargin={22mm,22mm},hmargin={22mm,30mm}]{geometry}" >>$(MAIN).article.tex
	echo "\\usepackage{beamerarticle,xeCJK}" >>$(MAIN).article.tex
	#echo "\\begin{CJK}" >>$(MAIN).article.tex
	echo "\\input{$(MAIN).tex}" >>$(MAIN).article.tex
	#echo "\\end{CJK}" >>$(MAIN).article.tex
	$(LATEX) $(MAIN).article.tex

pure:
	rm -fv $(MAIN).{draft,handout,beamer,trans,second,notes}.*.{tex,aux,log,nav,out,snm,toc,tex,vrb,fls,bbl,blg,fdb\_latexmk}
	rm -fv $(MAIN).article.{tex,aux,log,nav,out,snm,toc,tex,vrb,fls,bbl,blg,fdb\_latexmk}
	rm -fv $(MAIN).{aux,log,nav,out,snm,toc,vrb,bbl,blg,fdb\_latexmk}
	rm -fv texlog texput.log missfont.log

clean:  pure
	rm -fv $(MAIN).{draft,handout,beamer,article,trans,second,notes}.*.pdf
	rm -fv $(MAIN).article.pdf
	rm -fv $(MAIN).pdf


