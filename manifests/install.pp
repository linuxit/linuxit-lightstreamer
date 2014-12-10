# Class: lightstreamer::install
#
#  Installs Lightstreamer
#
# Parameters:
#
#  All inherited from the base class.
#
#  $lightstreamer::manage_user    if set, creates a service user
#  $lightstreamer:: service_user  name to use for service user and group
#  $lightstreamer::install_type   controls whether to install a package or expect a manual install
#  $lightstreamer::package name   of the lightstreamer package to install
#
# Actions:
#
#  - Adds system user and group
#  - Installs the lightstreamer package if necessary
#
# Requires:
#
# Sample Usage:
#  
#  include lightstreamer::install
#
class lightstreamer::install inherits lightstreamer {

  if $manage_user == true {
  
    group { "$service_user":
      system => true,
      ensure => present,
      }->
      
    user { "$service_user":
      system     => true,
      gid        => "$service_user",
      home       => "$install_dir",
      shell      => '/bin/bash',
      comment    => 'Lightstreamer',
      managehome => false,
      }
  }

  if $install_type == "package" {
    package { "$package_name": ensure => latest, }
  }
}
