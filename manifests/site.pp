node default{
  $classes = hiera('classes', '')
  if ($classes) {
    validate_array($classes)
    hiera_include('classes')
    exec {'init solr':
      command => "bin/solr start -e cloud -z 172.17.45.6:2181,172.17.45.7:2181,172.17.45.8:2181 -noprompt",
      user => 'root'
    }
  }
  else{
    notify { 'Default node invocation' :}
  }
}
