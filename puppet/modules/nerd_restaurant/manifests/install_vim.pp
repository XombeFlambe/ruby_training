class nerd_restaurant::install_vim {

  file { '/home/vagrant/.vimrc':
    ensure => present,
    source => '/vagrant/puppet/modules/nerd_restaurant/files/vimrc',
    replace => true,
    require => File['/home/vagrant/bin']
  }

  $vim_dirs = [
    '/home/vagrant/.vim',
    '/home/vagrant/.vim/_temp',
    '/home/vagrant/.vim/_backup'
  ]

  file { $vim_dirs:
    ensure => directory,
    require => File['/home/vagrant']
  }

}
