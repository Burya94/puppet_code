node default{
  $classes = hiera('classes', '')
  $package = hiera('package', '')
  $service = hiera('service', '')
  create_resources('package', $package)
  create_resources('service', $service)
  if ($classes) {
    hiera_include('classes')
  }
  else{
    notify { 'Default node invocation' :}
  }
}
