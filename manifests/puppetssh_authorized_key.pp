include params

ssh_authorized_key { 'authorized_keys':
  name     => $user,
  ensure   => 'present',
  key      => regsubst(file("{$home}/id_rsa.pub"), '^\S*\s(\S*).*$', '\0'),
  type     => ssh-rsa,
  user     => $puppetssh_user
}