$servicename = hiera('ntpname')

package { 'ntp' :
        ensure => installed,
        }

service {$servicename:
          ensure => running,
        }

class {'cr_user':
  user_name => 'tester',
  user_password => 'passwd'
  }
