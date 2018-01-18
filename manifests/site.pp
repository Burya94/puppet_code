node default{
  package{'java-1.8.0-openjdk.x86_64':
    ensure => 'installed'
  }->
  wget::fetch{'download solr':
    source      => 'http://www-eu.apache.org/dist/lucene/solr/7.1.0/solr-7.1.0.tgz',
    destination => '/usr/local/solr-7.1.0.tgz',
    timeout     => 0,
    verbose     => false,
  }->
  archive { '/usr/local/solr-7.1.0.tgz':
    extract         => true,
    ensure          => present,
    extract_path    => '/usr/local/',
    creates         => '/usr/local/install_sorl_service.ssh',
    extract_command => 'tar xfz %s solr-7.1.0/bin/install_solr_service.sh --strip-components=2',

  }->
  exec {'install solr':
    command => 'cd /usr/local/ && /bin/bash install_solr_service.sh solr-7.1.0.tgz',
    path    => '/usr/bin/:/usr/sbin/'
  }->
  exec { 'stop solr':
    command => 'service solr stop',
    path    => '/sbin/'
  }
  file { '/opt/solr':
    ensure => directory,
    recurse => true,
    owner   => 'solr',
    group   => 'solr'
  }
}
