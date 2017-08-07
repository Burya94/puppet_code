node default{
  $classes = hiera('classes', '')
  if ($classes) {
    validate_array($classes)
    hiera_include('classes')
    create_resources('logstash::configfile', hiera('my_logstash_configs'))
  }
  else{
    notify { 'Default node invocation' :}
  }
}
