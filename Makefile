# ==============================================================================
# make <all|html|pdf|epub|mobi>
# ==============================================================================
TARGET = slackbook_cn_loongarch64
FORMATS = pdf epub mobi

.PHONY: all clean html format $(FORMATS)

all: html $(FORMATS)

html:
	gitbook build . $(TARGET)_html
	tar -zcf $(TARGET)_html.tar.gz ./$(TARGET)_html/

$(FORMATS):
	gitbook $@ . $(TARGET).$@

format:
	@prettier -wu $(shell find * -type f -name '*.md')

clean:
	rm -rf $(TARGET)_html $(TARGET)_html.tar.gz $(addprefix $(TARGET)., $(FORMATS))
