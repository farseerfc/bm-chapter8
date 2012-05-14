default: beamer

all: draft trans handout beamer pure article

draft: main.draft.pdf

handout: main.handout.pdf

trans: main.trans.pdf

beamer: main.beamer.pdf

article: main.article.pdf

main.draft.pdf: main.tex
	echo "\\documentclass[CJK,xcolor=dvipsnames,14pt,draft]{beamer}" >main.draft.tex
	echo "\\input{main.tex}" >>main.draft.tex
	xelatex main.draft.tex
	xelatex main.draft.tex
	rm -v main.draft.tex

main.trans.pdf: main.tex
	echo "\\documentclass[CJK,xcolor=dvipsnames,14pt,trans]{beamer}" >main.trans.tex
	echo "\\input{main.tex}" >>main.trans.tex
	xelatex main.trans.tex
	xelatex main.trans.tex
	rm -v main.trans.tex

main.handout.pdf: main.tex
	echo "\\documentclass[CJK,xcolor=dvipsnames,14pt,handout]{beamer}" >main.handout.tex
	echo "\\input{main.tex}" >>main.handout.tex
	xelatex main.handout.tex
	xelatex main.handout.tex
	rm -v main.handout.tex

main.beamer.pdf: main.tex
	echo "\\documentclass[CJK,xcolor=dvipsnames,14pt]{beamer}" >main.beamer.tex
	echo "\\input{main.tex}" >>main.beamer.tex
	xelatex main.beamer.tex
	xelatex main.beamer.tex
	rm -v main.beamer.tex

main.article.pdf: main.tex
	echo "\\documentclass[CJK]{article}" >main.article.tex
	echo "\\usepackage{beamerarticle,xeCJK}" >>main.article.tex
	#echo "\\begin{CJK}" >>main.article.tex
	echo "\\input{main.tex}" >>main.article.tex
	#echo "\\end{CJK}" >>main.article.tex
	xelatex main.article.tex
	xelatex main.article.tex
	rm -v main.article.tex


pure:
	rm -fv main.{draft,handout,beamer,article,trans}.{aux,log,nav,out,snm,toc,tex,vrb}
	rm -fv main.{aux,log,nav,out,snm,toc,vrb,bbl,blg}
	rm -fv texlog
	rm -fv texput.log
	rm -fv missfont.log

clean:  pure
	rm -fv main.{draft,handout,beamer,article,trans}.pdf
	rm -fv main.pdf


