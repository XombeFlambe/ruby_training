class { "nerd_restaurant::packages": require => Stage["main"] }
class { "nerd_restaurant::install_postgresql": require => Class["nerd_restaurant::packages"] }
class { "nerd_restaurant::install_ruby": require => Class["nerd_restaurant::install_postgres"] }
class { "nerd_restaurant::install_app": require => Class["nerd_restaurant::install_ruby"] }
class { "nerd_restaurant::install_nginx": require => Class["nerd_restaurant::install_app"] }

class nerd_restaurant {
  Exec {
    path => ['/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin']
  }

  group { 'puppet':
    ensure => present,
  }

  group { 'vagrant':
    ensure => present
  }

  user { 'vagrant':
    ensure => present,
    home => '/home/vagrant',
    gid => 'vagrant',
    shell => '/bin/bash',
    require => Group['vagrant']
  }

  file { '/home/vagrant':
    ensure => directory,
    owner => 'vagrant',
    group => 'vagrant',
    mode => 0750,
    require => User['vagrant']
  }

  group { 'nerd_restaurant':
    ensure => present
  }

  user { 'nerd_restaurant':
    ensure => present,
    home => '/home/nerd_restaurant',
    gid => 'nerd_restaurant',
    shell => '/bin/bash',
    require => Group['nerd_restaurant']
  }

  file { '/home/nerd_restaurant':
    ensure => directory,
    owner => 'nerd_restaurant',
    group => 'nerd_restaurant',
    mode => 0750,
    require => User['nerd_restaurant']
  }

  file { '/home/vagrant/bin':
    ensure => directory,
    require => File['/home/vagrant']
  }

  group { 'nerdery':
    ensure => present
  }

  user { 'nerdery':
    ensure => present,
    home => '/home/nerdery',
    gid => 'nerdery',
    shell => '/bin/bash',
    groups => ['sudo'],
    require => Group['nerdery']
  }

  file { '/home/nerdery':
    ensure => directory,
    owner => 'nerdery',
    group => 'nerdery',
    mode => 0750,
    require => User['nerdery']
  }

  exec { 'update-locale':
    command => 'update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8',
  }

  class { 'timezone':
    timezone => 'America/Chicago',
  }

  include packages
  
  include install_postgresql
  
  
  
  include install_ruby
  
  
  include install_app
  
  
  
  
  
  include install_tmux
  
  
  include install_vim
  
}
