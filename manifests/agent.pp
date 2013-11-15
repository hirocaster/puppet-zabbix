# zabbix-agent class.
define zabbix::agent(
  $zabbix_server = '127.0.0.1'
  ) {
  package { 'zabbix-agent':
    require => Apt::Source['zabbix']
  }

  file { 'zabbix-agent-conf':
    path    => '/etc/zabbix/zabbix_agentd.conf',
    content => template('zabbix/zabbix_agentd.conf.erb'),
    require => Package['zabbix-agent'],
    notify  => Service['zabbix-agent']
  }

  service { 'zabbix-agent':
    ensure     => running,
    enable     => true,
    require    => File['zabbix-agent-conf']
  }
}
