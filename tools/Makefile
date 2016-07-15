# Makefile for IBG tools.

PYTHON = python
AUTOINDEX = $(PYTHON) autoindex.py

ROOT = ..
CHAP = $(ROOT)/chapters
APPX = $(ROOT)/appendices

FILES = $(ROOT)/about.rst $(CHAP)/01.rst $(CHAP)/02.rst $(CHAP)/03.rst	   \
$(CHAP)/04.rst $(CHAP)/05.rst $(CHAP)/06.rst $(CHAP)/07.rst $(CHAP)/08.rst \
$(CHAP)/09.rst $(CHAP)/10.rst $(CHAP)/11.rst $(CHAP)/12.rst $(CHAP)/13.rst \
$(CHAP)/14.rst $(CHAP)/15.rst $(CHAP)/16.rst $(APPX)/c.rst $(APPX)/e.rst

all: index

index: $(FILES)
	@ for file in $(FILES); do					\
	    echo autoindexing $$file;					\
	    $(AUTOINDEX) $$file;					\
	done

test: autoindex-test.rst
	$(AUTOINDEX) $< -
