node default{
  package{'java-1.8.0-openjdk.x86_64':
    ensure => 'installed'
  }->
  wget::fetch{'download solr':
    source      => 'http://www-eu.apache.org/dist/lucene/solr/7.1.0/solr-7.1.0.tgz',
    destination => '/usr/local',
    timeout     => 0,
    verbose     => false,
  }->
  archive { '/usr/lib/solr-7.1.0.tgz':
    ensure          => present,
    extract         => true,
    extract_command => 'tar xfz %s solr-7.1.0/bin/install_solr_service.sh --strip-components=2',
    extract_path    => '/usr/lib'
  }->
  exec {'install solr':
    command => 'cd /usr/local/ && bash install_solr_service.sh solr-7.1.0.tgz'
  }->
  file { '/opt/solr':
    owner   => 'solr'
  }
}
