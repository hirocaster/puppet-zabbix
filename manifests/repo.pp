# Zabbix Official Repository http://repo.zabbix.com/
class zabbix::repo {
  apt::key { 'zabbix':
    key        => '79EA5ED4',
    key_source => 'http://repo.zabbix.com/zabbix-official-repo.key'
  }
  apt::source { 'zabbix':
    location   => 'http://repo.zabbix.com/zabbix/2.2/ubuntu',
    release    => 'precise',
    repos      => 'main contrib non-free',
    key        => '8FF57A0425FFD7E7',
    key_server => 'keys.gnupg.net',
    require    => Apt::Key['zabbix']
  }
}
