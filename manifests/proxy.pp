# zabbix-proxy class.
define zabbix::proxy (
  $db = 'sqlite3',
  ){
    include zabbix::repo
    package { 'zabbix-proxy-sqlite3':
      require => Apt::Source['zabbix']
    }
  }
