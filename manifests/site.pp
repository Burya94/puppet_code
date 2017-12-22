node default{
  $classes = hiera('classes', '')
  if ($classes) {
    validate_array($classes)
    hiera_include('classes')
    $init = hiera("init", {})
    create_resources('exec', $init)
    exec { 'iptables':
      command => "/bin/systemctl stop solr && /sbin/iptables -A INPUT -p tcp -s ${::ipaddress_enp0s8} -j ACCEPT"
    }->
    exec { 'iptables out':
      command => "/sbin/iptables -A OUTPUT -p tcp -d ${::ipaddress_enp0s8} -j ACCEPT"
    }
  }
  else{
    notify { 'Default node invocation' :}
  }
}
