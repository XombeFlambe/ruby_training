class nerd_restaurant::install_postgresql {
  $pg_databases = ['nerd_restaurant_dev', 'nerd_restaurant_test', 'nerd_restaurant_prod']

  class { 'postgresql::server': }
  class { 'postgresql::server::contrib': }
  class { 'postgresql::client': }
  class { 'postgresql::lib::devel': }

  postgresql::server::role { "vagrant":
    password_hash => postgresql_password('vagrant', 'abcd1234'),
    superuser => true
  }

  postgresql::server::db { $pg_databases:
    user => 'vagrant',
    password => postgresql_password('vagrant', 'abcd1234')
  }
}
