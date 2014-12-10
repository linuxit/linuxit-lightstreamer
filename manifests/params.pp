#
class lightstreamer::params(
  $java_home         = '/usr/bin/java',
  $java_opts         = '-server',
  $secure            = true,
  $port              = '8080',
  $rmi_port          = '8888',
  $monitor_public    = 'N',
  $mon_user          = 'user_changeme',
  $mon_passwd        = 'password_changeme',
  $rmi_user          = 'user_changeme',
  $rmi_passwd        = 'password_changeme',
  $service_enable    = true,
  $service_ensure    = 'running',
  $service_user      = 'lightstreamer',
  $manage_service    = true,
  $manage_user       = true,
  $manage_initscript = true,
  $manage_perms      = true,
  $package_name      = 'lightstreamer',
  $install_type      = 'package',
  $install_dir       = '/opt/lightstreamer',
)
{

  case $::osfamily {
    'RedHat': {
      if $::operatingsystemmajrelease > 6 {
        fail("The ${module_name} module is not supported on a ${::osfamily} based system newer than verson 6.")
      }
      $init_erb      = 'lightstreamer.el.erb'
      $init_script   = '/etc/init.d/lightstreamer'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
  
}
