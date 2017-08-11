node default{
  $classes = hiera('classes', '')
  if ($classes) {
    validate_array($classes)
    hiera_include('classes')
    $cfg = lookup("configs", Hash)
    class {'exhibitor':
      log4j_xml => $cfg,
    }
  }
  else{
    notify { 'Default node invocation' :}
  }
}
