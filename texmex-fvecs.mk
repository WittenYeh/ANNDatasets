# recipe-fvecs-tgz.mk:
# A smart recipe for .tar.gz archives from the Tex-Mex corpus (ftp.irisa.fr).
# It uses conventions to automatically derive all necessary variables from ARCHIVE_FILE.

# --- 1. Derive All Variables from Convention ---
# Extracts the base name from the archive file (e.g., "sift.tar.gz" -> "sift").
ARCHIVE_PREFIX := $(patsubst %.tar.gz,%,$(ARCHIVE_FILE))

# Automatically define the extraction directory using the same prefix.
EXTRACT_DIR    := $(ARCHIVE_PREFIX)

# Automatically define the standard file names based on the prefix.
BASE_FILE      := $(ARCHIVE_PREFIX)_base.fvecs
QUERY_FILE     := $(ARCHIVE_PREFIX)_query.fvecs
LEARN_FILE     := $(ARCHIVE_PREFIX)_learn.fvecs
TRUTH_FILE     := $(ARCHIVE_PREFIX)_groundtruth.ivecs

# The complete list of files to be moved and to check for completion.
FINAL_FILES    := $(BASE_FILE) $(QUERY_FILE) $(LEARN_FILE) $(TRUTH_FILE)
# --- End of Variable Derivation ---


# --- 2. Generic Rules ---
# The main 'setup' target depends on all final files.
setup: $(FINAL_FILES)

# Generic rule to create final files from the archive.
$(FINAL_FILES): $(ARCHIVE_FILE)
	@# This 'if' block ensures the extraction command runs only once.
	@if [ ! -f "$(firstword $(FINAL_FILES))" ]; then \
		echo "-> Extracting all files from $(ARCHIVE_FILE)..."; \
		tar -xzf $(ARCHIVE_FILE); \
		echo "-> Moving required files from $(EXTRACT_DIR)/ subdirectory..."; \
		for file in $(FINAL_FILES); do \
			mv $(EXTRACT_DIR)/$$file .; \
		done; \
		echo "-> Cleaning up temporary directory '$(EXTRACT_DIR)'..."; \
		rm -rf $(EXTRACT_DIR); \
	fi

# Rule to clean up the extracted files.
clean:
	@echo "-> Removing decompressed data files..."
	rm -f $(FINAL_FILES)

# The full cleanup also triggers this local clean.
clean-all: clean

# --- End of Generic Rules ---

# --- 3. Phony Targets ---
.PHONY: setup clean