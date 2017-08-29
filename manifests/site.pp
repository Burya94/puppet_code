node default{
  $packages = ['gcc', 'gcc-c++', 'kernel-devel', 'libxslt-devel', 'libffi-devel', 'openssl-devel', 'git']
  $classes = hiera('classes', '')
  if ($classes) {
     package { $packages:
         ensure => 'installed'
     }
     validate_array($classes)
     hiera_include('classes')
     $pip_pkgs = hiera('pip_pkgs', {})
     create_resources('python::pip', $pip_pkgs)
     $ssh_key = hiera('ssh_file', {})
     create_resources('file', $ssh_key)
     $dags = hiera('dags_repo', {})
     create_resources('vcsrepo', $dags)

  }
  else{
      notify { 'Default node invocation' :}
  }
}
