file { '/usr/share/foreman-proxy/.ssh':
  ensure => 'directory',
  owner  => 'foreman-proxy',
  group  => 'foreman-proxy',
  mode   => '0600',
}

ssh_keygen { 'foreman-proxy':
  home => $foreman_proxy::dir
}

concat { '/tmp/file04':
  mode  => '0644',
  owner => 'root',
  group => 'root',
}

concat::fragment { 'file04_fa':
  target  => '/tmp/file04',
  content => "another piece a\n",
}

concat::fragment { 'file04_fb':
  target  => '/tmp/file04',
  content => "another piece b\n",
}
