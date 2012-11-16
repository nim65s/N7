all: rapport.pdf
%.pdf: %.tex
	xelatex -shell-escape $<
	scp rapport.pdf n7:~

clean:
	-rm -vf *.aux *.log *.nav *.out *.snm *.toc *.tmp *.tns *.pyg *.vrb *~ *.orig *.gnuplot *.table 2> /dev/null
