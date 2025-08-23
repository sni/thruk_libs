NAME    = libthruk
VERSION = 3.24

ifdef P5DIR
P5TMPDIST = $(P5DIR)
else
P5TMPDIST = $(shell pwd)/local-lib
endif

ifdef LIBDIR
    INSTALLTARGET=$(DESTDIR)$(LIBDIR)
else
    INSTALLTARGET=$(DESTDIR)/usr/lib/thruk/
endif

MODULES = \
          OLE-Storage_Lite-0.19.tar.gz \
          Parse-RecDescent-1.967015.tar.gz \
          Spreadsheet-WriteExcel-2.40.tar.gz \
          Excel-Template-0.34.tar.gz \
          LWP-Protocol-connect-6.09.tar.gz \
          ExtUtils-Manifest-1.63.tar.gz \
          HTML-Escape-1.10.tar.gz \
          Date-Calc-XS-6.4.tar.gz \
          Clone-0.39.tar.gz \


build:
	mkdir -p $(P5TMPDIST)/dest
	mkdir -p $(P5TMPDIST)/bootstrap
	mkdir -p $(P5TMPDIST)/src
	rsync -a src/. $(P5TMPDIST)/src/.
	rsync -a build_module.pl patches lib $(P5TMPDIST)/src/.
	echo "install --install_base $(P5TMPDIST)/bootstrap" > $(P5TMPDIST)/bootstrap/.modulebuildrc
	echo "install --install_base $(P5TMPDIST)/dest" > $(P5TMPDIST)/dest/.modulebuildrc
	$(MAKE) BUILD_MODULES="$(MODULES)" P5DESTDIR="dest" build_modules
	# clean up
	find $(P5TMPDIST)/dest/lib -name \*.so -exec chmod 644 {} \; -exec strip {} \;
	find $(P5TMPDIST)/dest/lib -size 0 -delete
	find $(P5TMPDIST)/dest/lib -name \*.h -delete
	find $(P5TMPDIST)/dest/lib -name \*.txt -delete
	find $(P5TMPDIST)/dest/lib -name qd.pl -delete
	find $(P5TMPDIST)/dest/lib -name mk-ca-bundle.pl -delete
	find $(P5TMPDIST)/dest/lib -name benchmark.pl -delete
	find $(P5TMPDIST)/dest/lib -name .packlist -delete
	find $(P5TMPDIST)/dest/lib -type f -name ttfmod.pl -delete
	find $(P5TMPDIST)/dest/lib -type f -name changes -delete
	find $(P5TMPDIST)/dest/lib -type f -name perllocal.pod -delete
	find $(P5TMPDIST)/dest/lib -type f -name dbixs_rev.pl -delete
	find $(P5TMPDIST)/dest/lib -name \*.pm -exec chmod 644 {} \;
	find $(P5TMPDIST)/dest/lib -name \*.pod -exec chmod 644 {} \;
	find $(P5TMPDIST)/dest/lib -depth -type d -empty -exec rmdir {} \;
	@echo ""
	@echo "################################################################"
	@echo ""
	@echo "  thruk libs have been created in"
	@echo ""
	@echo "  $(P5TMPDIST)"
	@echo ""
	@echo "################################################################"

build_modules:
	unset LANG; \
	unset PERL5LIB; \
	unset PERL_MB_OPT; \
	unset PERL_LOCAL_LIB_ROOT; \
	unset PERL_MM_OPT; \
	export PATH=$(P5TMPDIST)/dest/bin:$$PATH; \
	    export PERL_MM_OPT=INSTALL_BASE=$(P5TMPDIST)/$(P5DESTDIR); \
	    export PERL_MB_OPT=--install_base=$(P5TMPDIST)/$(P5DESTDIR); \
	    export MODULEBUILDRC=$(P5TMPDIST)/$(P5DESTDIR)/.modulebuildrc; \
	    export PERL5LIB=$(P5TMPDIST)/dest/lib/perl5:$(P5TMPDIST)/src/lib:$(P5TMPDIST)/bootstrap/lib/perl5; \
	    cd $(P5TMPDIST)/src && \
	        FORCE=1 ./build_module.pl -p $(P5TMPDIST)/$(P5DESTDIR) $(BUILD_MODULES)

prepack: build

fetch:
	mkdir -p src
	for m in $(MODULES); do \
	    test -f src/$$m || ./download_package $$m || exit 1; \
	done

install:
	mkdir -p $(INSTALLTARGET)
	cp -rp $(P5TMPDIST)/dest/lib/perl5 $(INSTALLTARGET)

installbuilddeps:
	find $(P5TMPDIST)/bootstrap/lib -name \*.so -exec chmod 644 {} \; -exec strip {} \;
	find $(P5TMPDIST)/bootstrap/lib -type f -name xsubpp -delete
	mkdir -p $(INSTALLTARGET)
	cp -rp $(P5TMPDIST)/bootstrap/lib/perl5 $(INSTALLTARGET)

deb: $(NAME)-$(VERSION).tar.gz
	tar zxvf $(NAME)-$(VERSION).tar.gz
	cd $(NAME)-$(VERSION) && /usr/bin/debuild -i -us -uc -b
	rm -rf $(NAME)-$(VERSION)

rpm: $(NAME)-$(VERSION).tar.gz
	rpmbuild -ta $(NAME)-$(VERSION).tar.gz

dist: $(NAME)-$(VERSION).tar.gz

$(NAME)-$(VERSION).tar.gz:
	rm -f $(NAME)-$(VERSION).tar.gz
	mkdir -p $(NAME)-$(VERSION)
	cp -rp \
		src \
		lib \
		patches \
		debian \
		Makefile \
		libthruk.spec \
		build.config \
		build_module.pl \
		$(NAME)-$(VERSION)/
	tar cfz $(NAME)-$(VERSION).tar.gz $(NAME)-$(VERSION)
	rm -rf $(NAME)-$(VERSION)

clean:
	rm -rf $(P5TMPDIST)
	rm -f $(NAME)-$(VERSION).tar.gz

version:
	[ -e .git ] || { echo "changing versions only works in git clones!"; exit 1; }
	[ `git status | grep -cP 'working (directory|tree) clean'` -eq 1 ] || { echo "git project is not clean, cannot tag version"; exit 1; }
	export DEBEMAIL="Thruk Development Team <devel@thruk.org>"; \
	export DEBFULLNAME="Thruk Development Team"; \
	newversion=$$(dialog --stdout --inputbox "New Version:" 0 0 "${VERSION}"); \
    sed "s/^VERSION =.*/VERSION = $$newversion/" -i Makefile; \
    sed "s/^Version.*/Version: $$newversion/" -i libthruk.spec; \
	sed -e 's/UNRELEASED/unstable/g' -i debian/changelog; \
	dch --newversion "$$newversion" --package "libthruk" -D "UNRELEASED" --urgency "low" "new upstream release"; \
	sed -e 's/unstable/UNRELEASED/g' -i debian/changelog
