class nerd_restaurant::install_app {

  file { '/home/vagrant/bin/setup_native.sh':
    ensure => present,
    mode => 775,
    source => '/vagrant/puppet/modules/nerd_restaurant/files/setup_native.sh',
    replace => true,
    require => File['/home/vagrant/bin']
  }


  file { '/home/vagrant/nerd_restaurant':
    ensure => symlink,
    target => '/vagrant'
  }

  file { '/vagrant/config/database.yml':
    ensure => present,
    source => '/vagrant/config/database.yml.dist',
    replace => false
  }

  file { '/home/vagrant/README.md':
    ensure => present,
    source => '/vagrant/puppet/modules/nerd_restaurant/files/README.md',
    replace => true
  }

  file { '/home/vagrant/.bashrc':
    ensure => present,
    source => '/vagrant/puppet/modules/nerd_restaurant/files/bashrc',
    replace => true
  }
}
