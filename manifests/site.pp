node default{
  $classes = hiera('classes', '')
  if ($classes) {
    validate_array($classes)
    hiera_include('classes')
    #$logstash_configs = hiera('logstash_configs', {})
    #create_resources('logstash::configfile', $logstash_configs)
    #$logstash_plugins = hiera('logstash_plugins', {})
    #create_resources('logstash::plugin', $logstash_plugins)
  }
  else{
    notify { 'Default node invocation' :}
  }
}
