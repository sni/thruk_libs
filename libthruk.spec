Summary: Thruk perl libraries
Name: libthruk
Version: 2.20
Release: 1%{?dist}
License: GPLv2
Group: Applications/System
URL: http://www.thruk.org/
Packager: Sven Nierlein <sven.nierlein@consol.de>
Vendor: Labs Consol
Source0: http://download.thruk.org/pkg/v%{version}/src/libthruk-%{version}.tar.gz
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}
BuildRequires: gd-devel > 1.8
BuildRequires: zlib-devel
BuildRequires: libpng-devel
BuildRequires: libjpeg-devel
BuildRequires: mysql-devel
BuildRequires: perl
BuildRequires: autoconf
BuildRequires: automake
BuildRequires: gcc
BuildRequires: chrpath
Requires: gd
%if %{defined suse_version}
BuildRequires: libexpat-devel
# sles 12 requires some special libraries
%if 0%{?suse_version} >= 1315
BuildRequires: libpng16-devel
BuildRequires: libtiff-devel
BuildRequires: libvpx-devel
Requires: libjpeg62
%endif
%else
BuildRequires: expat-devel
%endif
%if 0%{?fc22}%{?fc23}%{?fc24}%{?fc25}%{?fc26}
Requires: perl-Module-Load
Requires: perl-Locale-Maketext-Simple
Requires: perl-Params-Check
Requires: perl-PathTools
Requires: perl-Thread-Queue
Requires: perl-Time-HiRes
Requires: perl-IPC-Cmd
%endif
%if 0%{?fc23}%{?fc24}%{?fc25}%{?fc26}
Requires: perl-Text-Balanced
%endif
%if 0%{?fc24}%{?fc25}%{?fc26}
Requires: perl-Storable
BuildRequires: perl-Storable
BuildRequires: perl-libs
BuildRequires: perl-devel
%endif
%if 0%{?el7}
Requires: perl-Data-Dumper
%endif

# disable creating useless empty debug packages
%define debug_package %{nil}

# disable automatic requirements
AutoReqProv:   no

%description
Thruk is a multibackend monitoring webinterface which currently
supports Nagios, Icinga and Shinken as backend using the Livestatus
API. It is designed to be a 'dropin' replacement and covers almost
all of the original features plus adds additional enhancements for
large installations.

%prep
%setup -q

%build
%{__make}

%install
%{__rm} -rf %{buildroot}
%{__make} install DESTDIR="%{buildroot}" LIBDIR="%{_libdir}/thruk/"

%clean
%{__rm} -rf %{buildroot}

%files
%attr(-,root,root) %{_libdir}/thruk

%changelog
* Mon Jul 13 2015 Sven Nierlein <sven.nierlein@consol.de> 2.00-1
- Initial libs package
