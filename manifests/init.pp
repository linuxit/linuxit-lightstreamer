# Class: lightstreamer
#
#  Manage the Lightstreamer Application (see http://www.lightstreamer.com)
#
# Parameters:
#
#
class lightstreamer(
  $java_home         = $lightstreamer::params::java_home,
  $java_opts         = $lightstreamer::params::java_opts,
  $secure            = $lightstreamer::params::secure,
  $port              = $lightstreamer::params::port,
  $rmi_port          = $lightstreamer::params::rmi_port,
  $rmi_user          = $lightstreamer::params::rmi_user,
  $rmi_passwd        = $lightstreamer::params::rmi_passwd,
  $monitor_public    = $lightstreamer::params::monitor_public,
  $monitor_user      = $lightstreamer::params::monitor_user,
  $monitor_passwd    = $lightstreamer::params::monitor_passwd,
  $service_enable    = $lightstreamer::params::service_enable,
  $manage_service    = $lightstreamer::params::manage_service,
  $service_ensure    = $lightstreamer::params::service_ensure,
  $install_type      = $lightstreamer::params::install_type,
  $manage_user       = $lightstreamer::params::manage_user,
  $manage_initscript = $lightstreamer::params::manager_initscript,
  $package_name      = $lightstreamer::params::package_name,
  $system_user       = $lightstreamer::params::system_user,
  $init_script       = $lightstreamer::params::init_script,
  $init_erb          = $lightstreamer::params::init_erb,
  $install_dir       = $lightstreamer::params::install_dir,
  $manage_perms      = $lightstreamer::params::manage_perms,
)
inherits lightstreamer::params {
  
  anchor { 'lightstreamer::begin': }->
  class { '::lightstreamer::install': }->
  class { '::lightstreamer::configure': }~>
  class { '::lightstreamer::service': }->
  anchor { 'lightstreamer::end': }

}
