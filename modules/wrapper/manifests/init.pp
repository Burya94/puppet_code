class wrapper(){
    file{"/etc/yum.repos.d/elasticsearch.repo":
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('wrapper/elasticsearch.repo.erb')
    }
    include elasticsearch
}
