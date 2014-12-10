# Class: lightstreamer::configure
#
#  Configures Lightstreamer
#
# Parameters:
#
#  All parameters are inherited from the base class.
#
# Actions:
#
#  - Sets permissions for the installation directory and the init script (if required)
#  - Manages the init script (if required)
#  - Templates the LS.sh script with values for configurable variables
#  - Templates lighstreamer_conf.xml with values for TCP listeners
#  - Optionally, removes demo environment
#  - Optionally, locks down Monitor Console and sets up user account
#
# Requires:
#
#  lightstreamer::install
#
# Sample Usage:
#  
#  include lightstreamer::configure
#
class lightstreamer::configure inherits lightstreamer {

  # Permissions
  if $manage_perms == true {
    file { "$install_dir":
      owner   => "$service_user",
      group   => "$service_user",
      recurse => true,
    }
    if $manage_initscript == true {
      file { "$init_script":
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template("lightstreamer/${init_erb}"),
      }
    }
  }
  
  # Template for LS.sh
  file { "${install_dir}/bin/unix-like/LS.sh":
    mode    => '0755',
    content => template("lightstreamer/LS.sh.erb"),
  }

  # Template for lightstreamer_conf.xml
  file { "${install_dir}/conf/lightstreamer_conf.xml":
    content => template("lightstreamer/lightstreamer_conf.xml.erb"),
  }

  if $secure == true {
    # We need to purge a couple of directories.
    file { "${install_dir}/adapters/Demo":
      ensure  => absent,
      force   => true,
      recurse => true,
      purge   => true,
    }
    file { "${install_dir}/pages/demos":
      ensure  => absent,
      force   => true,
      recurse => true,
      purge   => true,
    }
  }
}
