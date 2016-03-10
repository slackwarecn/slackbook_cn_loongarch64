GITBOOK = gitbook

TARGET = slackbook_cn
FORMATS = epub mobi pdf

.PHONY: all clean $(FORMATS)

all: html $(FORMATS)

html:
	$(GITBOOK) build . $(TARGET)_html

$(FORMATS):
	$(GITBOOK) $@ . $(TARGET).$@
