class nerd_restaurant::install_tmux {

  file { '/home/vagrant/.tmux.conf':
    ensure => present,
    source => '/vagrant/puppet/modules/nerd_restaurant/files/tmux.conf',
    replace => true,
    require => File['/home/vagrant/bin']
  }

}
