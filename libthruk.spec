Summary: Thruk perl libraries
Name: libthruk
Version: 2.32
Release: 0
License: GPL-2.0-or-later
Group: Applications/System
URL: http://www.thruk.org/
Packager: Sven Nierlein <sven.nierlein@consol.de>
Vendor: Labs Consol
Source0: %{name}-%{version}.tar.gz
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}
BuildRequires: gd-devel > 1.8
BuildRequires: zlib-devel
BuildRequires: libpng-devel
BuildRequires: libjpeg-devel
%if 0%{?el8}
BuildRequires: mysql-community-devel
%else
BuildRequires: mysql-devel
%endif
BuildRequires: perl
BuildRequires: autoconf
BuildRequires: automake
BuildRequires: binutils
BuildRequires: gcc
BuildRequires: chrpath
BuildRequires: rsync
Requires: gd

# sles
%if %{defined suse_version}
BuildRequires: libexpat-devel
BuildRequires: fontconfig-devel
BuildRequires: xorg-x11-libXpm-devel
# sles 12
%if 0%{?suse_version} >= 1315
BuildRequires: libpng16-devel
BuildRequires: libtiff-devel
BuildRequires: libvpx-devel
Requires: libjpeg62
%else
# sles 11
BuildRequires: freetype2-devel
%endif
%endif

# centos
%if 0%{?el6}
BuildRequires: perl-devel
%endif
%if 0%{?el7}
BuildRequires: perl(Locale::Maketext::Simple)
BuildRequires: perl-devel
Requires: perl(Data::Dumper)
Requires: perl(Digest)
%endif

# fedora
%if 0%{?fc26}
BuildRequires: expat-devel
BuildRequires: perl(ExtUtils::MakeMaker)
BuildRequires: perl(Storable)
BuildRequires: perl-libs
Requires: perl(Module::Load)
Requires: perl(Locale::Maketext::Simple)
Requires: perl(Params::Check)
Requires: perl(PathTools)
Requires: perl(Thread::Queue)
Requires: perl(Time::HiRes)
Requires: perl(IPC::Cmd)
Requires: perl(Text-Balanced)
Requires: perl-Text-Balanced
Requires: perl(Storable)
Requires: perl(Digest)
Requires: perl(Digest::MD5)
%endif
%if 0%{?fc27}
BuildRequires: perl-devel
BuildRequires: expat-devel
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
