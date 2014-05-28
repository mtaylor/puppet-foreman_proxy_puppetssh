include params

# Create User .ssh Directory
file { $home:
  ensure => 'directory',
  owner  => $user,
  group  => $group,
  mode   => '0600',
}

# Generate SSH keypair for foreman-proxy user
ssh_keygen { $user:
  home => $home
}

# Setup puppetrun configuration
file_line { 'Set Puppet Provider to PuppetSSH':
  path  => $config,
  line  => ':puppet_provider: puppetssh',
  match => '^.*:puppet_provider:.*$'
}

file_line { 'PuppetSSH: Private Key': 
  path  => $config,
  line  => ":puppetssh_key: ${home}/.ssh/id_rsa",
  match => '^.*:puppetssh_key:.*$',
}

file_line { 'PuppetSSH: Command':
  path  => $config,
  line  => ":puppetssh_command: ${puppet_command}",
  match => '^.*:puppetssh_command:.*$',
}

file_line { 'PuppetSSH: Use sudo':
  path  => $config,
  line  => ":puppetssh_sudo: ${puppet_sudo}",
  match => '^.*:puppetssh_sudo:.*$',
}

file_line { 'PuppetSSH: Set root user':
  path  => $config,
  line  => ":puppetssh_user: ${puppet_user}",
  match => '^.*:puppetssh_user:.*$',
}