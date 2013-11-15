# puppet-zabbix

Puppet module to Zabbix server and agent.

## Support OS

* Ubuntu 12.04 LTS (precise)

## Usage

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
}
```

## Required Puppet Modules

* `apt`

## Development

Then write some code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
