node default{
    file{"/etc/yum.repos.d/elasticsearch.repo":
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('elasticsearch.repo.erb'),
    }
  $classes = hiera('classes', '')
  if ($classes) {
    validate_array($classes)
    hiera_include('classes')
  }
  else{
    notify { 'Default node invocation' :}
  }
}
