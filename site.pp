$servicename = hiera('ntpname')
package { 'ntp' :
        ensure => installed,
        }
service {$servicename:
          ensure => running,
        }
