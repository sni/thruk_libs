NAME    = libthruk
VERSION = 2.44.2

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

PREMODULES = \
          JSON-4.*.tar.gz \
          JSON-PP-*.tar.gz \
          CPAN-Meta-*.tar.gz \
          Module-Load-Conditional-*.tar.gz \
          IPC-Cmd-*.tar.gz \
          Locale-Maketext-Simple-*.tar.gz \
          Params-Check-*.tar.gz \
          ExtUtils-*.tar.gz \
          Perl-OSType-*.tar.gz \
          Module-Metadata-*.tar.gz \
          version-0.9928.tar.gz \
          Module-Build-*.tar.gz \
          Module-CoreList-*.tar.gz \
          File-Remove-*.tar.gz \
          YAML-Tiny-*.tar.gz \
          Module-Install-*.tar.gz \
          Devel-CheckLib-*.tar.gz \
          File-ShareDir-Install-*.tar.gz \

MODULES = \
          AppConfig-1.71.tar.gz \
          Carp-Clan-6.06.tar.gz \
          Class-Inspector-1.32.tar.gz \
          Clone-0.39.tar.gz \
          Compress-Raw-Bzip2-2.101.tar.gz \
          Compress-Raw-Zlib-2.101.tar.gz \
          Cpanel-JSON-XS-4.07.tar.gz \
          Crypt-Rijndael-1.14.tar.gz \
          DBI-1.639.tar.gz \
          Date-Manip-6.60.tar.gz \
          Digest-SHA-6.02.tar.gz \
          Email-Date-Format-1.005.tar.gz \
          Encode-Locale-1.05.tar.gz \
          FCGI-0.78.tar.gz \
          File-Slurp-9999.27.tar.gz \
          GD-2.50.tar.gz \
          HTML-Tagset-3.20.tar.gz \
          HTTP-Date-6.02.tar.gz \
          HTTP-MultiPartParser-0.02.tar.gz \
          Hash-MultiValue-0.16.tar.gz \
          IO-Compress-2.074.tar.gz \
          IO-Socket-IP-0.39.tar.gz \
          IO-String-1.08.tar.gz \
          IO-stringy-2.111.tar.gz \
          JSON-MaybeXS-1.003010.tar.gz \
          LWP-MediaTypes-6.02.tar.gz \
          Log-Log4perl-1.49.tar.gz \
          MIME-Lite-3.030.tar.gz \
          Module-Load-0.32.tar.gz \
          OLE-Storage_Lite-0.19.tar.gz \
          Parse-RecDescent-1.967015.tar.gz \
          Socket-2.027.tar.gz \
          Spreadsheet-WriteExcel-2.40.tar.gz \
          Stream-Buffered-0.03.tar.gz \
          Template-Toolkit-2.27.tar.gz \
          Test-Cmd-1.09.tar.gz \
          Test-Simple-1.302183.tar.gz \
          Thread-Queue-3.13.tar.gz \
          Thread-Semaphore-2.13.tar.gz \
          Tie-IxHash-1.23.tar.gz \
          Try-Tiny-0.30.tar.gz \
          parent-0.236.tar.gz \
          Bit-Vector-7.4.tar.gz \
          DBD-mysql-4.050.tar.gz \
          Date-Calc-6.4.tar.gz \
          Date-Calc-XS-6.4.tar.gz \
          HTML-Parser-3.72.tar.gz \
          HTTP-Headers-Fast-0.21.tar.gz \
          URI-1.73.tar.gz \
          Cookie-Baker-0.11.tar.gz \
          File-ShareDir-1.104.tar.gz \
          HTTP-Message-6.14.tar.gz \
          HTTP-Negotiate-6.01.tar.gz \
          Net-HTTP-6.17.tar.gz \
          WWW-Form-UrlEncoded-0.24.tar.gz \
          HTML-Escape-1.10.tar.gz \
          HTTP-Cookies-6.04.tar.gz \
          HTTP-Entity-Parser-0.20.tar.gz \
          Plack-1.0047.tar.gz \
          libwww-perl-6.31.tar.gz \
          LWP-Protocol-https-6.09.tar.gz \
          XML-Parser-2.44.tar.gz \
          Excel-Template-0.34.tar.gz \
          LWP-Protocol-connect-6.09.tar.gz


build:
	mkdir -p $(P5TMPDIST)/dest
	mkdir -p $(P5TMPDIST)/bootstrap
	mkdir -p $(P5TMPDIST)/src
	rsync -a src/. $(P5TMPDIST)/src/.
	rsync -a build_module.pl patches lib $(P5TMPDIST)/src/.
	echo "install --install_base $(P5TMPDIST)/bootstrap" > $(P5TMPDIST)/bootstrap/.modulebuildrc
	$(MAKE) BUILD_MODULES="$(PREMODULES)" P5DESTDIR="bootstrap" build_modules
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
	# Cleanup rpath errors in perl modules
	! test -f $(P5TMPDIST)/dest/lib/perl5/*/auto/GD/GD.so                  || chrpath --delete $(P5TMPDIST)/dest/lib/perl5/*/auto/GD/GD.so
	! test -f $(P5TMPDIST)/dest/lib/perl5/*/auto/DBD/mysql/mysql.so        || chrpath --delete $(P5TMPDIST)/dest/lib/perl5/*/auto/DBD/mysql/mysql.so
	! test -f $(P5TMPDIST)/dest/lib/perl5/*/auto/Time/HiRes/HiRes.so       || chrpath --delete $(P5TMPDIST)/dest/lib/perl5/*/auto/Time/HiRes/HiRes.so
	! test -f $(P5TMPDIST)/dest/lib/perl5/*/auto/XML/Parser/Expat/Expat.so || chrpath --delete $(P5TMPDIST)/dest/lib/perl5/*/auto/XML/Parser/Expat/Expat.so
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
