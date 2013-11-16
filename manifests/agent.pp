# zabbix-agent class.
define zabbix::agent(
  $zabbix_server  = '127.0.0.1',
  $mysql          = false,
  $remote_command = 0, # 0 - do not allow, 1 - allow
  $allow_root     = 0, # 0 - do not allow, 1 - allow
  ) {
    include zabbix::repo
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

    if $mysql == true {
      file { '/var/lib/zabbix/':
        ensure => 'directory',
        owner  => 'root',
        group  => 'zabbix',
        mode   => 640,
      }
      file { '/var/lib/zabbix/.my.cnf':
        ensure  => 'link',
        owner  => 'root',
        group  => 'zabbix',
        target  => '/etc/mysql/debian.cnf',
        require => [File['/var/lib/zabbix/'], Package['mysql-server']]
      }
    }
  }
