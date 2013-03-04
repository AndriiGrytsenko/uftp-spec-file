# == Class: uftpd::server
#
# This class is used to manage uftpd server
#
# === Parameters
#
# [*version*]
#   set specific application version. Default: latest
#
# === Examples
#
#  class { 'uftpd::server': }
#
# === Authors
#
# Andrii Grytsenko <andrii.grytsenko@gmail.com>
#
class uftpd::server (
  $version = 'latest'
) {

  package { 'uftp-server':
    ensure => $version,
  }

}

