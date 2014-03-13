# Class: foreman_puppetssh
#
# This module manages foreman_puppetssh
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#

include params

class foreman_proxy (
  $user                   = $foreman_proxy::params::user,
  $home                   = $foreman_proxy::params::home,
  $config                 = $foreman_proxy::params::config,
  $puppetssh_user         = $foreman_proxy::params::puppetssh_user,
  $puppetssh_command      = $foreman_proxy::params::puppetssh_command,
  $puppetssh_sudo         = $foreman_proxy::params::puppetssh_sudo
)
{
  class { 'foreman_proxy::authorized_keys': } ~>
  class { 'foreman_proxy::puppetssh': } ~>
  Class['foreman_proxy']
}