class foreman_proxy::params {

  # variables
  $user              = 'foreman-proxy'
  $group             = 'foreman-proxy'
  $home              = '/usr/share/foreman-proxy'
  $config            = '/etc/foreman-proxy/settings.yml'

  $puppetssh_user    = 'root'
  $puppetssh_command = '/usr/bin/puppet agent --onetime --no-usecacheonfailure' 
  $puppetssh_sudo    = 'false'
}