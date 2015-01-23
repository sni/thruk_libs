ifdef P5DIR
P5TMPDIST = $(P5DIR)
else
P5TMPDIST = $(shell pwd)/local-lib
endif

MODULES = \
          Algorithm-C3-0.10.tar.gz \
          Any-Moose-0.25.tar.gz \
          AppConfig-1.67.tar.gz \
          Carp-Clan-6.04.tar.gz \
          Class-Accessor-0.34.tar.gz \
          Class-C3-XS-0.13.tar.gz \
          Class-Data-Inheritable-0.08.tar.gz \
          Class-Inspector-1.28.tar.gz \
          Class-Method-Modifiers-2.11.tar.gz \
          Class-Singleton-1.5.tar.gz \
          Compress-Raw-Bzip2-2.068.tar.gz \
          Compress-Raw-Zlib-2.068.tar.gz \
          Config-General-2.56.tar.gz \
          Crypt-RC4-2.02.tar.gz \
          DBI-1.633.tar.gz \
          Data-Dump-1.22.tar.gz \
          Data-Dumper-2.154.tar.gz \
          Devel-CheckOS-1.73.tar.gz \
          Digest-1.17.tar.gz \
          Digest-MD5-2.54.tar.gz \
          Digest-Perl-MD5-1.9.tar.gz \
          Email-Date-Format-1.005.tar.gz \
          Encode-Locale-1.04.tar.gz \
          Exporter-5.70.tar.gz \
          Exporter-Tiny-0.042.tar.gz \
          ExtUtils-Config-0.008.tar.gz \
          ExtUtils-Constant-0.23.tar.gz \
          ExtUtils-InstallPaths-0.010.tar.gz \
          ExtUtils-Manifest-1.70.tar.gz \
          FCGI-0.77.tar.gz \
          File-Copy-Recursive-0.38.tar.gz \
          File-Path-2.09.tar.gz \
          File-Remove-1.52.tar.gz \
          File-ShareDir-Install-0.10.tar.gz \
          File-Slurp-9999.19.tar.gz \
          GD-2.50.tar.gz \
          Getopt-Long-2.43.tar.gz \
          HTML-Tagset-3.20.tar.gz \
          HTTP-Date-6.02.tar.gz \
          HTTP-Parser-XS-0.17.tar.gz \
          Hash-MultiValue-0.15.tar.gz \
          IO-Compress-2.068.tar.gz \
          IO-String-1.08.tar.gz \
          IO-stringy-2.110.tar.gz \
          LWP-MediaTypes-6.02.tar.gz \
          List-Compare-0.39.tar.gz \
          Locale-Maketext-Simple-0.21.tar.gz \
          Log-Log4perl-1.46.tar.gz \
          MIME-Base64-3.15.tar.gz \
          MIME-Lite-3.030.tar.gz \
          MIME-Types-2.09.tar.gz \
          Math-Complex-1.59.tar.gz \
          Module-Load-0.32.tar.gz \
          Mozilla-CA-20141217.tar.gz \
          Net-Server-2.008.tar.gz \
          OLE-Storage_Lite-0.19.tar.gz \
          Package-Stash-XS-0.28.tar.gz \
          Params-Check-0.38.tar.gz \
          Path-Tiny-0.061.tar.gz \
          PathTools-3.47.tar.gz \
          Perl-OSType-1.007.tar.gz \
          Pod-Escapes-1.07.tar.gz \
          Pod-Simple-3.29.tar.gz \
          Pod-Usage-1.64.tar.gz \
          Safe-Isa-1.000005.tar.gz \
          Scalar-List-Utils-1.41.tar.gz \
          Set-Object-1.34.tar.gz \
          Spreadsheet-ParseExcel-0.65.tar.gz \
          Stream-Buffered-0.03.tar.gz \
          Sub-Exporter-Progressive-0.001011.tar.gz \
          Sub-Identify-0.10.tar.gz \
          Sub-Install-0.928.tar.gz \
          Sub-Name-0.12.tar.gz \
          Task-Weaken-1.04.tar.gz \
          Template-Toolkit-2.26.tar.gz \
          Test-Cmd-1.07.tar.gz \
          Test-Simple-1.001014.tar.gz \
          Text-Balanced-2.02.tar.gz \
          Text-ParseWords-3.29.tar.gz \
          Text-SimpleTable-2.03.tar.gz \
          Text-Tabs+Wrap-2013.0523.tar.gz \
          Thread-Queue-3.05.tar.gz \
          Thread-Semaphore-2.12.tar.gz \
          Tie-RefHash-1.39.tar.gz \
          Tie-ToObject-0.03.tar.gz \
          Time-HiRes-1.9726.tar.gz \
          Time-Local-1.2300.tar.gz \
          Try-Tiny-0.22.tar.gz \
          Variable-Magic-0.55.tar.gz \
          YAML-1.14.tar.gz \
          base-2.18.tar.gz \
          boolean-0.43.tar.gz \
          libnet-3.05.tar.gz \
          podlators-2.5.3.tar.gz \
          threads-1.96.tar.gz \
          threads-shared-1.46.tar.gz \
          Attribute-Handlers-0.96.tar.gz \
          Bit-Vector-7.4.tar.gz \
          DBD-mysql-4.029.tar.gz \
          Date-Calc-6.3.tar.gz \
          Date-Calc-XS-6.3.tar.gz \
          Encode-2.68.tar.gz \
          Eval-Closure-0.12.tar.gz \
          ExtUtils-Helpers-0.022.tar.gz \
          File-Listing-6.04.tar.gz \
          File-ShareDir-1.102.tar.gz \
          HTML-Parser-3.71.tar.gz \
          Module-Metadata-1.000026.tar.gz \
          Module-ScanDeps-1.18.tar.gz \
          Parse-CPAN-Meta-1.4414.tar.gz \
          Template-Timer-1.00.tar.gz \
          URI-1.65.tar.gz \
          WWW-RobotRules-6.02.tar.gz \
          autodie-2.26.tar.gz \
          CPAN-Meta-Check-0.009.tar.gz \
          Class-MethodMaker-2.22.tar.gz \
          HTML-Lint-2.20.tar.gz \
          HTTP-Message-6.06.tar.gz \
          HTTP-Negotiate-6.01.tar.gz \
          HTTP-Request-AsCGI-1.2.tar.gz \
          Module-Load-Conditional-0.64.tar.gz \
          Net-HTTP-6.07.tar.gz \
          HTTP-Body-1.19.tar.gz \
          HTTP-Cookies-6.01.tar.gz \
          HTTP-Daemon-6.01.tar.gz \
          IPC-Cmd-0.92.tar.gz \
          List-MoreUtils-0.402.tar.gz \
          Plack-1.0033.tar.gz \
          Plack-Middleware-FixMissingBodyInRedirect-0.12.tar.gz \
          Plack-Middleware-RemoveRedundantBody-0.05.tar.gz \
          Plack-Middleware-ReverseProxy-0.15.tar.gz \
          libwww-perl-6.08.tar.gz \
          ExtUtils-CBuilder-0.280220.tar.gz \
          ExtUtils-ParseXS-3.24.tar.gz \
          IO-1.25.tar.gz \
          LWP-Protocol-https-6.06.tar.gz \
          Module-Build-0.4007.tar.gz \
          Module-Build-Tiny-0.039.tar.gz \
          Module-Pluggable-5.1.tar.gz \
          Module-Runtime-0.014.tar.gz \
          Params-Util-1.07.tar.gz \
          Parse-RecDescent-1.967009.tar.gz \
          Path-Class-0.35.tar.gz \
          Plack-Middleware-MethodOverride-0.11.tar.gz \
          Plack-Test-ExternalServer-0.01.tar.gz \
          Readonly-2.00.tar.gz \
          Socket-2.016.tar.gz \
          Spreadsheet-WriteExcel-2.40.tar.gz \
          Starman-0.4011.tar.gz \
          Tree-Simple-1.25.tgz \
          Tree-Simple-VisitorFactory-0.12.tgz \
          UNIVERSAL-isa-1.20140927.tar.gz \
          XML-Parser-2.44.tar.gz \
          YAML-Tiny-1.64.tar.gz \
          aliased-0.34.tar.gz \
          constant-1.27.tar.gz \
          CGI-Simple-1.115.tar.gz \
          Class-Accessor-Chained-0.01.tar.gz \
          Class-C3-0.27.tar.gz \
          Config-Any-0.24.tar.gz \
          Data-OptList-0.109.tar.gz \
          Data-Page-2.02.tar.gz \
          Data-Types-0.09.tar.gz \
          Date-Manip-6.48.tar.gz \
          Devel-GlobalDestruction-XS-0.01.tar.gz \
          Dist-CheckConflicts-0.11.tar.gz \
          Excel-Template-0.34.tar.gz \
          File-BOM-0.14.tar.gz \
          LWP-Protocol-connect-6.09.tar.gz \
          MRO-Compat-0.12.tar.gz \
          Module-Implementation-0.09.tar.gz \
          Module-Install-1.14.tar.gz \
          Package-DeprecationManager-0.13.tar.gz \
          Package-Stash-0.37.tar.gz \
          Params-Validate-1.17.tar.gz \
          Sub-Exporter-0.987.tar.gz \
          B-Hooks-EndOfScope-0.13.tar.gz \
          Catalyst-Plugin-CustomErrorMessage-0.06.tar.gz \
          Class-C3-Adopt-NEXT-0.13.tar.gz \
          DateTime-Locale-0.45.tar.gz \
          DateTime-TimeZone-1.84.tar.gz \
          Devel-GlobalDestruction-0.13.tar.gz \
          Getopt-Long-Descriptive-0.098.tar.gz \
          Log-Dispatch-2.44.tar.gz \
          String-RewritePrefix-0.007.tar.gz \
          namespace-clean-0.25.tar.gz \
          Class-Load-0.22.tar.gz \
          Class-Load-XS-0.09.tar.gz \
          DateTime-1.18.tar.gz \
          MongoDB-0.45.tar.gz \
          Moose-2.1005.tar.gz \
          MooseX-Emulate-Class-Accessor-Fast-0.00903.tar.gz \
          MooseX-Param-0.02.tar.gz \
          namespace-autoclean-0.24.tar.gz \
          Data-Visitor-0.30.tar.gz \
          Excel-Template-Plus-0.06.tar.gz \
          MooseX-Role-WithOverloading-0.16.tar.gz \
          MooseX-Types-0.45.tar.gz \
          MooseX-Types-Path-Class-0.06.tar.gz \
          MooseX-MethodAttributes-0.29.tar.gz \
          MooseX-Role-Parameterized-1.08.tar.gz \
          MooseX-Getopt-0.65.tar.gz \
          Catalyst-Runtime-5.90082.tar.gz \
          Catalyst-View-Excel-Template-Plus-0.04.tar.gz \
          Catalyst-View-GD-0.01.tar.gz \
          Catalyst-View-JSON-0.35.tar.gz \
          Catalyst-View-TT-0.42.tar.gz \
          MooseX-Daemonize-0.19.tar.gz \
          Catalyst-Action-RenderView-0.16.tar.gz \
          Catalyst-Plugin-Authentication-0.10023.tar.gz \
          Catalyst-Plugin-Authorization-Roles-0.09.tar.gz \
          Catalyst-Plugin-ConfigLoader-0.34.tar.gz \
          Catalyst-Plugin-Redirect-0.02.tar.gz \
          Catalyst-Plugin-Static-Simple-0.33.tar.gz \
          Catalyst-Devel-1.39.tar.gz


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
	            YAML-LibYAML-*.tar.gz \
	            JSON-*.tar.gz; \
	    export PERL_JSON_BACKEND='JSON::XS'; \
	    export PERL_YAML_BACKEND='YAML::XS'; \
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


clean:
	rm -rf $(P5TMPDIST)
