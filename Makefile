.PHONY: clean run show view

LATEXMK=latexmk -lualatex -latexoption=-shell-escape
TARGET=cherkashin-proposal

TLK=talk-2020-09-03-proposal
# TLK=talk-2020-10-16-RS

run: $(TARGET).pdf

tlk: $(TLK).pdf

$(TARGET).pdf $(TLK).pdf: %.pdf: %.tex
	$(LATEXMK) $<
	$(LATEXMK) $<

clean:
	BIBINPUTS=$(BIBROOT) $(LATEXMK) -C
	rm -f *.{bbl,aux,ps,dvi,log,toc,out,vrb,snm,nav} *~ ~* *.bak *.synctex.* *.thm *-joined.pdf *.wbk *_latexmk *.fls
	# cd pics && make clean

show: $(TARGET).pdf
	evince $< &

view: $(TLK).pdf
	evince $< &
