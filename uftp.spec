Name:           uftp
Version:        3.7
Release:        1
Summary:        UFTP - Encrypted UDP based FTP with multicast

Group:          FTP Server
License:        GPL
URL:            http://www.tcnj.edu/~bush/uftp.html
Source0:        %{name}-%{version}.tar.gz
Source1:        uftpd-init
Source2:        uftpd-conf
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

BuildRequires:  openssl-devel

%description
UFTP is an encrypted multicast file transfer program, designed to securely, reliably, and efficiently transfer files to multiple receivers simultaneously. This is useful for distributing large files to a large number of receivers, and is especially useful for data distribution over a satellite link (with two way communication), where the inherent delay makes any TCP based communication highly inefficient. The multicast encryption scheme is based on TLS with extensions to allow multiple receivers to share a common key. UFTP also has the capability to communicate over disjoint networks separated by one or more firewalls (NAT traversal) and without full end-to-end multicast capability (multicast tunneling) through the use of a UFTP proxy server. These proxies also provide scalability by aggregating responses from a group of receivers.

%package server
Summary:    Server for encrypted UDP based ftp with multicast
Group:      FTP Server

%description server
This package provides the server part of encrypted UDP based ftp with multicast 

%package client
Summary:    Client daemon for encrypted UDP based ftp with multicast
Group:      FTP Server

%description client
This package provides the client daemon encrypted UDP based ftp with multicast 


%prep
%setup -q


%build
make %{?_smp_mflags}


%install
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT
install -d -m 0755 %{buildroot}/etc/init.d
install -d -m 0755 %{buildroot}/etc/sysconfig
install -T -m 0755 $RPM_SOURCE_DIR/uftpd-conf %{buildroot}/etc/sysconfig/uftpd
install -T -m 0755 $RPM_SOURCE_DIR/uftpd-init %{buildroot}/etc/init.d/uftpd

%clean
rm -rf $RPM_BUILD_ROOT

%post
/sbin/chkconfig --add uftpd

%files server
%defattr(-,root,root,-)
/bin/uftp
/bin/uftp_keymgt
%doc /usr/share/man/man1/uftp.1.gz
%doc /usr/share/man/man1/uftp_keymgt.1.gz

%files client
/usr/sbin/uftpd
/usr/sbin/uftpproxyd
/bin/uftp_keymgt
/etc/init.d/uftpd
%config(noreplace) /etc/sysconfig/uftpd
%doc /usr/share/man/man1/uftpd.1.gz
%doc /usr/share/man/man1/uftpproxyd.1.gz
%doc /usr/share/man/man1/uftp_keymgt.1.gz

%changelog

