# puppet-zabbix

Puppet module to Zabbix 2.2 server and agent.

* use MySQL

## Support OS

* Ubuntu 12.04 LTS (precise)

## Usage

Setup for `http://YOUR-HOST/zabbix/`

### Install zabbix server

```puppet
zabbix::server { 'zabbix-server':
  php_timezone => 'Japan/Tokyo'
}
```

### Install zabbix agent

```puppet
zabbix::agent { 'zabbix-agent':
  zabbix_server => 'zabbix.example.com',
  mysql => false, # MySQL Server is true
}
```

go to access `http://YOUR-HOST/zabbix/`.

## Advance setup server for your domain(`example.com`).

required [apache](https://github.com/puppetlabs/puppetlabs-apache/issues/new) module for puppet.

````puppet
  class { 'apache':
    default_vhost => false,
    mpm_module => 'prefork',
  }
  apache::mod { 'php5': }
  apache::vhost { 'example.com':
    port    => '80',
    docroot => '/usr/share/zabbix'
  }

  zabbix::server { 'zabbix-server':
    php_timezone => 'Japan/Tokyo',
    virtual_host => true
  }
````

go to access `http://example.com/`.

## Required Puppet Modules

* `apt`

## Development

Then write some code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
