EXE = udocker
PREFIX = /usr
INSTALL_DIR = $(DESTDIR)$(PREFIX)/bin
INSTALL_PATH = $(INSTALL_DIR)/$(EXE)

.PHONY: install install-symlink uninstall

null:
	@echo "Nothing to build. Use 'make install' or 'make install-symlink'"

install:
	@install -d $(INSTALL_DIR)
	@install -m 755 $(EXE) $(INSTALL_DIR)
	@echo "Installed at: $(INSTALL_PATH)"

install-symlink:
	@ln -s `realpath $(EXE)` $(INSTALL_PATH)
	@echo "Installed at: $(INSTALL_PATH)"

uninstall:
	@rm -f $(INSTALL_PATH)
	@echo "Uninstalled from: $(INSTALL_PATH)"
