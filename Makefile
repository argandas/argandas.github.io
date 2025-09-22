#
# Makefile for Latex resume 
#

# Folders
BUILD_DIR = .build

# XeLaTex options
CC = xelatex
OPTS = -interaction=nonstopmode -halt-on-error -output-directory=$(BUILD_DIR)

.PHONY: clean resume.pdf

resume.pdf:
	[ -d $(BUILD_DIR) ] || mkdir -p $(BUILD_DIR)
	$(CC) $(OPTS) resume.tex
	$(CC) $(OPTS) resume.tex

clean:
	rm -rf $(BUILD_DIR)/*.pdf
	rm -rf $(BUILD_DIR)/*.aux
