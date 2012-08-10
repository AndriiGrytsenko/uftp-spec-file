uftpd-spec-file
===============

Here you can find **RPM .SPEC file** and **LSB script** for UFTP program <http://www.tcnj.edu/~bush/uftp.html> both are compatible with CentOS/RHEL 5/6.


## More information about UFTP
UFTP is an encrypted multicast file transfer program, designed to securely, reliably, and efficiently transfer files to multiple receivers simultaneously. This is useful for distributing large files to a large number of receivers, and is especially useful for data distribution over a satellite link (with two way communication), where the inherent delay makes any TCP based communication highly inefficient. The multicast encryption scheme is based on TLS with extensions to allow multiple receivers to share a common key. UFTP also has the capability to communicate over disjoint networks separated by one or more firewalls (NAT traversal) and without full end-to-end multicast capability (multicast tunneling) through the use of a UFTP proxy server. These proxies also provide scalability by aggregating responses from a group of receivers.

## Download source code
You can download source code from project official page <http://www.tcnj.edu/~bush/uftp.html>

## RPM build procedure
1. get latest version of UFTP 
2. unpack to the arhive
3. put files *uftpd-conf* and *uftpd-init* into directory with a source code
4. gzip directory with name like *uftp-3.7.tar.gz* and put it into ~/rpmbuild/SOURCES
5. Run `rpmbuild -ba --nodeps ~/rpmbuild/SPECS/uftp.spec` to build the RPM archive

