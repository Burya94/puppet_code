package { 'ntp' :
        ensure => installed,
        }
case $::osfamily{
      'redhat': {
        service {'ntpd':
          ensure => running,
        }
      }
      'debian': {
        service {'ntp':
          ensure => running,
        }
      }
    }