# Create User .ssh Directory
file { '/usr/share/foreman-proxy/':
  ensure => 'directory',
  owner  => 'foreman-proxy',
  group  => 'foreman-proxy',
  mode   => '0600',
}

# Generate SSH keypair for foreman-proxy user
ssh_keygen { 'foreman-proxy':
  home => '/usr/share/foreman-proxy/'
}

# Setup puppetrun configuration
file_line { 'Set Puppet Provider to PuppetSSH':
  path  => '/etc/foreman-proxy/settings.yml',
  line  => ':puppet_provider: puppetssh',
  match => '^.*:puppet_provider:.*$'
}

file_line { 'PuppetSSH: Private Key': 
  path  => '/etc/foreman-proxy/settings.yml',
  line  => ':puppetssh_key: /usr/share/foreman-proxy/.ssh/id_rsa',
  match => '^.*:puppetssh_key:.*$',
}

file_line { 'PuppetSSH: Command':
  path  => '/etc/foreman-proxy/settings.yml',
  line  => ':puppetssh_command: /usr/bin/puppet agent --onetime --no-usecacheonfailure',
  match => '^.*:puppetssh_command:.*$',
}

file_line { 'PuppetSSH: Do not use sudo':
  path  => '/etc/foreman-proxy/settings.yml',
  line  => ':puppetssh_sudo: false',
  match => '^.*:puppetssh_sudo:.*$',
}

file_line { 'PuppetSSH: Set root user':
  path  => '/etc/foreman-proxy/settings.yml',
  line  => ':puppetssh_user: root',
  match => '^.*:puppetssh_user:.*$',
}