node default{
  $classes = hiera('classes', '')
  if ($classes) {
    validate_array($classes)
    hiera_include('classes')
    $start = hiera("run", {})
    create_resources('exec', $start)
  }
  else{
    notify { 'Default node invocation' :}
  }
}
