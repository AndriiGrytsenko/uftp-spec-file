class uftp {

    $destination_dir = '/var/uftp'
    
    package { uftp-client:
        ensure => present,
    }

    service { "uftpd":
	require => [ File["$destination_dir"], Package["uftp-client"]],
        ensure => running,
        enable => true, 
    }

   exec { "uftpd-reload":
        require => [ Package['uftp-client'], File["$destination_dir"]],
        command => "/etc/init.d/uftpd restart",
        refreshonly => true,
    }

    file { "$destination_dir":
	ensure => directory,
	owner => root,
	group => root,
	mode => 644,
    }

    file { "/etc/sysconfig/uftpd":
        ensure => present,
        owner  => root,
        group  => root,
        mode   => 755,
        content => template("uftp/uftpd.erb"),
        notify => Exec["uftpd-reload"],
    }

}

