MAIN=fica
while true ; do \
	  inotifywait $MAIN.tex $MAIN.bib Makefile \
	  && make INTERACTION=nonstopmode OUTPUT=. all -j4
done
