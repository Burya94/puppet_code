node default{
  $classes = hiera('classes', '')
  if ($classes) {
    validate_array($classes)
    hiera_include('classes')
    $logstash_configs = hiera('logstash_configs', {})
    create_resources('logstash::configfile', $logstash_configs) 
  }
  else{
    notify { 'Default node invocation' :}
  }
}
