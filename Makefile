NAME    = libthruk
VERSION = 2.10

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
          AppConfig-1.71.tar.gz \
          Carp-Clan-6.04.tar.gz \
          Class-Inspector-1.28.tar.gz \
          Class-Singleton-1.5.tar.gz \
          Compress-Raw-Bzip2-2.068.tar.gz \
          Compress-Raw-Zlib-2.068.tar.gz \
          DBI-1.633.tar.gz \
          Digest-MD5-2.54.tar.gz \
          Email-Date-Format-1.005.tar.gz \
          Encode-Locale-1.04.tar.gz \
          Exporter-5.70.tar.gz \
          Exporter-Tiny-0.042.tar.gz \
          ExtUtils-Constant-0.23.tar.gz \
          ExtUtils-Manifest-1.63.tar.gz \
          FCGI-0.77.tar.gz \
          FCGI-ProcManager-0.25.tar.gz \
          File-Copy-Recursive-0.38.tar.gz \
          File-Remove-1.52.tar.gz \
          File-ShareDir-Install-0.10.tar.gz \
          File-Slurp-9999.19.tar.gz \
          GD-2.50.tar.gz \
          HTML-Parser-3.71.tar.gz \
          HTTP-Date-6.02.tar.gz \
          Hash-MultiValue-0.16.tar.gz \
          IO-Compress-2.068.tar.gz \
          IO-String-1.08.tar.gz \
          IO-stringy-2.111.tar.gz \
          LWP-MediaTypes-6.02.tar.gz \
          Locale-Maketext-Simple-0.21.tar.gz \
          Log-Log4perl-1.46.tar.gz \
          MIME-Lite-3.030.tar.gz \
          Module-Load-0.32.tar.gz \
          OLE-Storage_Lite-0.19.tar.gz \
          Params-Check-0.38.tar.gz \
          PathTools-3.47.tar.gz \
          Perl-OSType-1.008.tar.gz \
          Scalar-List-Utils-1.42.tar.gz \
          Stream-Buffered-0.03.tar.gz \
          Template-Toolkit-2.26.tar.gz \
          Test-Cmd-1.08.tar.gz \
          Test-Simple-1.001014.tar.gz \
          Thread-Queue-3.05.tar.gz \
          Time-HiRes-1.9726.tar.gz \
          Try-Tiny-0.22.tar.gz \
          YAML-Tiny-1.67.tar.gz \
          threads-2.01.tar.gz \
          Bit-Vector-7.4.tar.gz \
          DBD-mysql-4.033.tar.gz \
          Date-Calc-6.4.tar.gz \
          Date-Calc-XS-6.4.tar.gz \
          File-Listing-6.04.tar.gz \
          File-ShareDir-1.102.tar.gz \
          Module-Metadata-1.000027.tar.gz \
          Module-ScanDeps-1.18.tar.gz \
          URI-1.67.tar.gz \
          autodie-2.26.tar.gz \
          HTTP-Message-6.06.tar.gz \
          HTTP-Negotiate-6.01.tar.gz \
          Module-Load-Conditional-0.64.tar.gz \
          Net-HTTP-6.07.tar.gz \
          HTTP-Body-1.22.tar.gz \
          HTTP-Cookies-6.01.tar.gz \
          HTTP-Daemon-6.01.tar.gz \
          IPC-Cmd-0.92.tar.gz \
          List-MoreUtils-0.410.tar.gz \
          Plack-1.0034.tar.gz \
          libwww-perl-6.13.tar.gz \
          ExtUtils-CBuilder-0.280220.tar.gz \
          ExtUtils-ParseXS-3.24.tar.gz \
          List-AllUtils-0.09.tar.gz \
          Module-Build-0.4007.tar.gz \
          Module-Install-1.16.tar.gz \
          Module-Runtime-0.014.tar.gz \
          Parse-RecDescent-1.967009.tar.gz \
          Socket-2.019.tar.gz \
          Spreadsheet-WriteExcel-2.40.tar.gz \
          XML-Parser-2.44.tar.gz \
          Date-Manip-6.49.tar.gz \
          Dist-CheckConflicts-0.11.tar.gz \
          Excel-Template-0.34.tar.gz \
          HTML-Escape-1.09.tar.gz \
          Module-Implementation-0.09.tar.gz \
          Params-Validate-1.18.tar.gz \
          DateTime-Locale-0.45.tar.gz \
          DateTime-TimeZone-1.88.tar.gz \
          Log-Dispatch-2.44.tar.gz \
          DateTime-1.18.tar.gz


build:
	mkdir -p $(P5TMPDIST)/dest
	mkdir -p $(P5TMPDIST)/src
	rsync -a src/. $(P5TMPDIST)/src/.
	rsync -a build_module.pl distro lib $(P5TMPDIST)/src/.
	echo "install --install_base $(P5TMPDIST)/dest" > $(P5TMPDIST)/dest/.modulebuildrc
	unset LANG; \
	unset PERL5LIB; \
	unset PERL_MB_OPT; \
	unset PERL_LOCAL_LIB_ROOT; \
	unset PERL_MM_OPT; \
	export PATH=$(P5TMPDIST)/dest/bin:$$PATH; \
	    export PERL_MM_OPT=INSTALL_BASE=$(P5TMPDIST)/dest; \
	    export PERL_MB_OPT=--install_base=$(P5TMPDIST)/dest; \
	    export MODULEBUILDRC=$(P5TMPDIST)/dest/.modulebuildrc; \
	    export PERL5LIB=$(P5TMPDIST)/dest/lib/perl5:$(P5TMPDIST)/src/lib; \
	    cd $(P5TMPDIST)/src && \
	        FORCE=1 ./build_module.pl -p $(P5TMPDIST)/dest \
	            ExtUtils-MakeMaker-*.tar.gz \
	            parent-*.tar.gz \
	            version-*.tar.gz \
	            Module-CoreList-*.tar.gz \
	            common-sense-*.tar.gz \
	            Types-Serialiser-*.tar.gz \
	            JSON-*.tar.gz; \
	    export PERL_JSON_BACKEND='JSON::XS'; \
	    cd $(P5TMPDIST)/src && \
	        ./build_module.pl -p $(P5TMPDIST)/dest $(MODULES)
	# clean up
	find $(P5TMPDIST)/dest/lib -name \*.so -exec chmod 644 {} \; -exec strip {} \;
	find $(P5TMPDIST)/dest/lib -size 0 -delete
	find $(P5TMPDIST)/dest/lib -name \*.h -delete
	find $(P5TMPDIST)/dest/lib -name \*.txt -delete
	find $(P5TMPDIST)/dest/lib -name qd.pl -delete
	find $(P5TMPDIST)/dest/lib -name mk-ca-bundle.pl -delete
	find $(P5TMPDIST)/dest/lib -name benchmark.pl -delete
	find $(P5TMPDIST)/dest/lib -name .packlist -delete
	find $(P5TMPDIST)/dest/lib -type f -name xsubpp -delete
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

prepack: build

fetch:
	mkdir -p src
	for m in $(MODULES); do \
	    test -f src/$$m || ./download_package $$m || exit 1; \
	done

install:
	mkdir -p $(INSTALLTARGET)
	cp -rp $(P5TMPDIST)/dest/lib/perl5 $(INSTALLTARGET)

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
		debian \
		Makefile \
		libthruk.spec \
		distro \
		build_module.pl \
		$(NAME)-$(VERSION)/
	tar cfz $(NAME)-$(VERSION).tar.gz $(NAME)-$(VERSION)
	rm -rf $(NAME)-$(VERSION)

clean:
	rm -rf $(P5TMPDIST)
	rm -f $(NAME)-$(VERSION).tar.gz
