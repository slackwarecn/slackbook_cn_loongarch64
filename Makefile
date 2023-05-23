# ==============================================================================
# make <all|html|pdf|epub|mobi>
# ==============================================================================
TARGET = slackbook_cn
FORMATS = pdf epub mobi

.PHONY: all clean html format $(FORMATS)

all: html $(FORMATS)

html:
	gitbook build . $(TARGET)_html

$(FORMATS):
	gitbook $@ . $(TARGET).$@

format:
	@prettier -wu $(shell find * -type f -name '*.md')

clean:
	rm -rf $(TARGET)_html $(addprefix $(TARGET)., $(FORMATS))
