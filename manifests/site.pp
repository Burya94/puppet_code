node default{
  $classes = hiera('classes', '')
  if ($classes) {
     validate_array($classes)
     hiera_include('classes')
  }
  else{
      notify { 'Default node invocation' :}
  }
}
