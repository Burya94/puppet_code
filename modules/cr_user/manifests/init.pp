class cr_user($user_name='noname', $user_password='0000') {
  user { $user_name:
    ensure          => present,
    home            => '/home/$user_name',
    password         => $user_password,
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
  }
}
