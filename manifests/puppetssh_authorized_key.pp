ssh_authorized_key { 'authorized_keys':
  name     => 'foreman-proxy',
  ensure   => 'present',
  key      => regsubst(file('/usr/share/foreman-proxy/.ssh/id_rsa.pub'), '^\S*\s(\S*).*$', '\0'),
  type     => ssh-rsa,
  user     => root
}