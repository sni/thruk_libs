Summary: Thruk perl libraries
Name: libthruk
Version: 3.24
Release: 0
License: GPL-2.0-or-later
Group: Applications/System
URL: http://www.thruk.org/
Packager: Sven Nierlein <sven.nierlein@consol.de>
Vendor: Labs Consol
Source0: %{name}-%{version}.tar.gz
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}
BuildRequires: make
BuildRequires: rsync
BuildRequires: gcc
BuildRequires: perl
BuildRequires: perl(Bit::Vector)
BuildRequires: perl(Cpanel::JSON::XS)
BuildRequires: perl(Date::Calc)
BuildRequires: perl(Digest::SHA)
BuildRequires: perl(ExtUtils::Install)
BuildRequires: perl(HTTP::Request)
BuildRequires: perl(IO::Scalar)
BuildRequires: perl(LWP::Protocol::https)
BuildRequires: perl(LWP::UserAgent)
BuildRequires: perl(Module::Install)
BuildRequires: perl(XML::Parser)

%if %{defined suse_version}
%else
BuildRequires: perl-devel
%endif

Requires:      perl(Bit::Vector)
Requires:      perl(Cpanel::JSON::XS)
Requires:      perl(Crypt::Rijndael)
Requires:      perl(Date::Calc)
Requires:      perl(Date::Manip)
Requires:      perl(DBD::mysql)
Requires:      perl(DBI)
Requires:      perl(FCGI)
Requires:      perl(GD)
Requires:      perl(HTML::Entities)
Requires:      perl(HTTP::Request)
Requires:      perl(IO::Scalar)
Requires:      perl(IO::Socket::IP)
Requires:      perl(IO::Socket::SSL)
Requires:      perl(IO::String)
Requires:      perl(Log::Log4perl)
Requires:      perl(LWP::Protocol::https)
Requires:      perl(LWP::UserAgent)
Requires:      perl(MIME::Lite)
Requires:      perl(Module::Load)
Requires:      perl(Mozilla::CA)
Requires:      perl(Net::HTTP)
Requires:      perl(Net::SSLeay)
Requires:      perl(parent)
Requires:      perl(Plack)
Requires:      perl(Plack::Handler::FCGI)
Requires:      perl(Plack::Util)
Requires:      perl(Plack::Test)
Requires:      perl(Pod::Usage)
Requires:      perl(Socket)
Requires:      perl(Storable)
Requires:      perl(Template)
Requires:      perl(Thread::Queue)
Requires:      perl(threads)
Requires:      perl(Tie::IxHash)
Requires:      perl(Time::HiRes)
Requires:      perl(URI::Escape)
Requires:      perl(XML::Parser)

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
%if %{defined suse_version}
%{__make} installbuilddeps DESTDIR="%{buildroot}" LIBDIR="%{_libdir}/thruk/"
%endif

%clean
%{__rm} -rf %{buildroot}

%files
%attr(-,root,root) %{_libdir}/thruk

%changelog
* Fri Aug 22 2025 Sven Nierlein <sven.nierlein@consol.de> 3.24-1
- Migrate to use system perl modules whenever possible

* Mon Jul 13 2015 Sven Nierlein <sven.nierlein@consol.de> 2.00-1
- Initial libs package
