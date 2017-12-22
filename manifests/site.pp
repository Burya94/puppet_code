node default{
  $classes = hiera('classes', '')
  if ($classes) {
    validate_array($classes)
    hiera_include('classes')
    $init = hiera("init", {})
    create_resources('exec', $init)

  }
  else{
    notify { 'Default node invocation' :}
  }
}
