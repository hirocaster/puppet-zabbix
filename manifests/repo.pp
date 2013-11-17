# Zabbix Official Repository http://repo.zabbix.com/
class zabbix::repo {
  case $osfamily {
    'Debian': {
      apt::key { 'zabbix':
        key        => '79EA5ED4',
        key_source => 'http://repo.zabbix.com/zabbix-official-repo.key'
      }
      case $operatingsystem {
        'Debian': {
          apt::source { 'zabbix':
            location   => 'http://repo.zabbix.com/zabbix/2.2/debian',
            release    => 'wheezy',
            repos      => 'main',
            key        => '8FF57A0425FFD7E7',
            key_server => 'keys.gnupg.net',
            require    => Apt::Key['zabbix']
          }
        }
        'Ubuntu': {
          apt::source { 'zabbix':
            location   => 'http://repo.zabbix.com/zabbix/2.2/ubuntu',
            release    => 'precise',
            repos      => 'main contrib non-free',
            key        => '8FF57A0425FFD7E7',
            key_server => 'keys.gnupg.net',
            require    => Apt::Key['zabbix']
          }
        }
        default:{
          err("Not Support OS.")
        }
      }
    }
  }
}
