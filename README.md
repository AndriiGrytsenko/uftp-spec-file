uftpd-spec-file
===============

Here you can find **RPM .SPEC file** and **LSB script** for UFTP program <http://www.tcnj.edu/~bush/uftp.html> both are compatible with CentOS/


## More information about UFTP
UFTP is an encrypted multicast file transfer program, designed to securely, reliably, and efficiently transfer files to multiple receivers simu

## Download source code
You can download source code from project official page <http://www.tcnj.edu/~bush/uftp.html>

## RPM build procedure
1. get latest version of UFTP.
2. put uftp-3.7.tar.gz* and files *uftpd-conf* and *uftpd-init* into ~/rpmbuild/SOURCES
3. Run `rpmbuild -ba --nodeps ~/rpmbuild/SPECS/uftp.spec` to build the RPM archive

## Little bit about the .spec file
It provides two RPM packages:..
1. uftp-client..
2. uftp-server..

In first one you will be able to find client daemon and proxy, where in second one - server tool to send files. *uftp_keymgt* is provided by bo

## Puppet module
I also put puppet module for client daemon into *puppet_module* directory. 
