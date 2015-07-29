class resolver::config {
  #install DNS resolv.conf
  file {'/etc/resolv.conf':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => $::ipaddress ? {
      '^172\.16\.' => 'puppet:///modules/resolver/cerberus.conf',
      '^172\.17\.' => 'puppet:///modules/resolver/dns01.conf',
      '^192\.168\.'  => 'puppet:///modules/resolver/anubis.conf',
    }
  }
}
