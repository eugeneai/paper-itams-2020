.PHONY: clean run show

LATEXMK=latexmk -lualatex -latexoption=-shell-escape
TARGET=cherkashin-proposal
#TLK=talk-tgr-2019-09-05

run: $(TARGET).pdf

tlk: $(TLK).pdf

$(TARGET).pdf $(TLK).pdf: %.pdf: %.tex
	$(LATEXMK) $<

clean:
	BIBINPUTS=$(BIBROOT) $(LATEXMK) -C
	rm -f *.{bbl,aux,ps,dvi,log,toc,out,vrb,snm,nav} *~ ~* *.bak *.synctex.* *.thm *-joined.pdf *.wbk *_latexmk *.fls
	# cd pics && make clean

show: $(TARGET).pdf
	evince $< &
