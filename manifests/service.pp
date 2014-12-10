# Class: lightstreamer::service
#
#  Controls the Lightstreamer service
#
# Parameters:
#
#  None
#
# Actions:
#
#  Ensures that the service 'lightstreamer' is running and enabled
#
# Requires:
#
#  lightstreamer::install
#
# Sample Usage:
#  
#  include lightstreamer::service
#
class lightstreamer::service inherits lightstreamer {

  if $manage_service == true {
    service { 'lightstreamer':
      ensure => $service_ensure,
      enable => $service_enable,
    }
  }
  
}
