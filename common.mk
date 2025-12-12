# common.mk: Provides the most essential, shared rules for all datasets.

# Download rule:
$(ARCHIVE_FILE):
	@echo "-> Downloading $(DATASET_NAME)..."
	wget --progress=bar:force:noscroll $(URL) -O $(ARCHIVE_FILE)

# Full cleanup rule:
clean-all:
	@echo "-> Removing downloaded archive: $(ARCHIVE_FILE)..."
	rm -f $(ARCHIVE_FILE)

# Phony targets that are not files.
.PHONY: clean-all