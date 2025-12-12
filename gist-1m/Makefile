# Makefile for the SIFT 1 Million dataset (ultimate minimal version)

# --- 1. Dataset-Specific Configuration ---
# All other variables (like filenames and extraction directory)
# are derived automatically by the included recipes.
DATASET_NAME   := gist-1m
ARCHIVE_FILE   := gist.tar.gz
URL            := ftp://ftp.irisa.fr/local/texmex/corpus/gist.tar.gz
# --- End of Configuration ---


# --- 2. Include Generic Recipes ---
# Provides the download rule.
include ../common.mk
# Derives all filenames and provides extraction, clean, and preview rules.
include ../texmex-fvecs.mk
# --- End of Recipes ---

# --- 3. Define Final Targets ---
all: setup

.PHONY: all