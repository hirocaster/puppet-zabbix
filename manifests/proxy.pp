# zabbix-proxy class.
define zabbix::proxy (
  $db = 'sqlite3',
  $official_repository = true,
  ){
    if $official_repository == true {
      include zabbix::repo
    }
    package { 'zabbix-proxy-sqlite3':
      require => Apt::Source['zabbix']
    }
  }
