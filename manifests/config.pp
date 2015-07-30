class resolver::config {
  #install DNS resolv.conf
  #file '/etc/resolv.conf':
    #ensure => 'file',
    #owner  => 'root',
    #group  => 'root',
    #mode   => '0644',
    if $::ipaddress =~ /^172\.16\./  {
      file {'/etc/resolv.conf':
        ensure => 'file',
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/resolver/cerberus.conf',
        }
      }
    elsif $::ipaddress =~ /^172\.17\./ {
      file {'/etc/resolv.conf':
        ensure => 'file',
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/resolver/dns01.conf',
        }
      }
    elsif  $::ipaddress =~ /^192\.168\./ {
      file {'/etc/resolv.conf':
        ensure => 'file',
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/resolver/anubis.conf',
        }
      }
    elsif $::ipaddress =~ /^10\.0\./ {
        file {'/etc/resolv.conf':
          ensure => 'file',
          owner  => 'root',
          group  => 'root',
          mode   => '0644',
          source => 'puppet:///modules/resolver/puppet.conf',
          }
        }
    else {
      fail("Server $ipaddress does not match resolv.conf listing")
    }
#      '^172\.16\.' => 'puppet:///modules/resolver/cerberus.conf',
#      '^172\.17\.' => 'puppet:///modules/resolver/dns01.conf',
#      '^192\.168\.'  => 'puppet:///modules/resolver/anubis.conf',

  }
