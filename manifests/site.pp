node default{
  $classes = hiera('classes', '')
  if ($classes) {
    validate_array($classes)
    hiera_include('classes')
    $start = hiera("run", {})
    create_resources('exec', $start)
    exec { 'zk start':
      command => "/opt/zookeeper/bin/zkServer.sh start",
      require => Class['zookeeper']
    }
  }
  else{
    notify { 'Default node invocation' :}
  }
}
