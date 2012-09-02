.SUFFIXES:

.SUFFIXES: .html .pdf

.PHONY: clean all

export DEV_DIR:=$(CURDIR)

mmdxsltbase=$(HOME)/Library/Application Support/MultiMarkdown/bin

all: databases.html examples.html

clean:
	-rm *.html *.pdf *.tex 

%.html: %.mmd 
	cd "$(mmdxsltbase)"  && ./mmd-xslt ${realpath $<}
	mv $(<:.mmd=.html)  $@
