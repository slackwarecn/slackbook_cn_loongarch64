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
# 倾向于使用的语句，但水平有限 {
#	$(foreach $(EXT), $(FORMATS), $(RM) -f $(TARGET).$(EXT))
#$(RM) -rf $(TARGET)_html
# }
# 当下使用的土法子，求改精确点 {
	$(RM) -rf $(TARGET).*
# }

