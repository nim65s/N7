all: rapport.pdf 
%.pdf: %.tex
	pdflatex -shell-escape $< && mv $@ ..

clean:
	-rm -vf *.aux *.log *.nav *.out *.snm *.toc *.tmp *.tns *.pyg *.vrb *~ *.orig *.gnuplot *.table 2> /dev/null
