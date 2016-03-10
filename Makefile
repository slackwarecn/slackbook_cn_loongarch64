GITBOOK = gitbook
OUTFILENAME = slackbook_cn

all: html pdf epub mobi

html:
	$(GITBOOK) build . $(OUTFILENAME)_html

pdf:
	$(GITBOOK) pdf . $(OUTFILENAME).pdf

epub:
	$(GITBOOK) epub . $(OUTFILENAME).epub

mobi:
	$(GITBOOK) mobi . $(OUTFILENAME).mobi

