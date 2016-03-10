# ==============================================================================
# make all/pdf/epub/mobi/clean
# ==============================================================================
GITBOOK = gitbook
RM = rm

TARGET = slackbook_cn
FORMATS = pdf epub mobi

.PHONY: all clean $(FORMATS)

all: html $(FORMATS)

html:
	$(GITBOOK) build . $(TARGET)_html

$(FORMATS):
	$(GITBOOK) $@ . $(TARGET).$@

clean:
	$(foreach $(EXT), $(FORMATS), $(RM) -f $(TARGET).$(EXT))
	$(RM) -rf $(TARGET)_html

