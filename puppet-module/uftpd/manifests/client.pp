# == Class: uftpd::client
#
# This class is used to manage uftpd client daemon
#
# === Parameters
#
# Document parameters here.
#
# [*daemon_state*]
#   Ensure daemon running. Default: running
#
# [*daemon_enable*]
#   enable daemon during boot. Default: true
#
# [*destination_dir*]
#   dir for upload files. Default: /var/uftpd
#
# [*version*]
#   set specific application version. Default: latest
#   set to 'absent' to remove package.
#
# === Variables
#
# [*pidfile*]
#   daemon pid file location. Default: /var/run/uftpd.pid
#
# [*logfile*]
#   daemon log file location. Default: /var/log/uftpd.log
#
# === Examples
#
#  class { 'uftpd::client':
#    destination_dir => '/opt/upload',
#  }
#
# === Authors
#
# Andrii Grytsenko <andrii.grytsenko@gmail.com>
#
class uftpd::client (
  $daemon_state    = 'running',
  $daemon_enable   = true,
  $destination_dir = '/var/uftpd',
  $version         = 'latest'
) {

  package { 'uftp-client':
    ensure => $version,
  }

  service { 'uftpd':
    ensure    => $daemon_state,
    enable    => $daemon_enable,
    subscribe => [
      File['/etc/sysconfig/uftpd'],
      File[$destination_dir]
    ],
  }

  file { $destination_dir:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['uftp-client'],
  }

  file { '/etc/sysconfig/uftpd':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('uftpd/uftpd.erb'),
    require => Package['uftp-client'],
  }

}

