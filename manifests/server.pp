# zabbix-server class.
define zabbix::server (
  $php_timezone = 'Japan/Tokyo',
  ){

  package { 'zabbix-release':
    require => Apt::Source['zabbix']
  }
  package { 'zabbix-server-mysql':
    require => Apt::Source['zabbix']
  }
  package { 'zabbix-frontend-php':
    require => Apt::Source['zabbix']
  }

  file { '/etc/apache2/conf.d/zabbix':
    content => template('zabbix/apache_conf_zabbix.erb'),
    require => Package['zabbix-frontend-php'],
    notify  => Service['apache2']
  }

  file { '/etc/zabbix/web/zabbix.conf.php':
    content => template('zabbix/web_zabbix.conf.php.erb'),
    require => Package['zabbix-frontend-php'],
    notify  => Service['apache2']
  }

  service { 'zabbix-server':
    ensure  => running,
    enable  => true,
    require => Package['zabbix-server-mysql']
  }

  service { 'mysql':
    ensure  => running,
    enable  => true,
    require => Package['zabbix-server-mysql']
  }
}
