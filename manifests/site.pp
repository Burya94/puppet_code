node default{
  $classes = hiera('classes', '')
  if ($classes) {
    validate_array($classes)
    hiera_include('classes')
    $exec_res = hiera("exec", {})
    create_resources = hiera('Exec', $exec_res)
  }
  else{
    notify { 'Default node invocation' :}
  }
}
