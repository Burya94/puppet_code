node default{
  $classes = hiera('classes', '')
  if ($classes) {
    hiera_include('classes')
  }
  else{
    notify { 'Default node invocation' :}
  }
}
