Summary: Thruk perl libraries
Name: libthruk
Version: 1.99
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
%if %{defined suse_version}
BuildRequires: libexpat-devel
%else
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
* Wed Jun 10 2015 Sven Nierlein <sven.nierlein@consol.de> 1.99-1
- Initial libs package
