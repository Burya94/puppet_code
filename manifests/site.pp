node default{
  $packages = ['gcc', 'gcc-c++', 'kernel-devel', 'libxslt-devel', 'libffi-devel', 'openssl-devel']
  $classes = hiera('classes', '')
  if ($classes) {
     package { $packages:
         ensure => 'installed'
     }
     validate_array($classes)
     hiera_include('classes')
     $pip_pkgs = hiera('pip_pkgs', {})
     create_resources('python::pip', $pip_pkgs)

  }
  else{
      notify { 'Default node invocation' :}
  }
}
