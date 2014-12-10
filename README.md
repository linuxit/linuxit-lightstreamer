# lightstreamer

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with lightstreamer](#setup)
    * [What lightstreamer affects](#what-lightstreamer-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with lightstreamer](#beginning-with-lightstreamer)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

The Module is intended to install and perform basic management of Lightstreamer.

## Module Description

Given a valid package that you'll need to provide, this module will install 
Lighstreamer and allow some control over an init script and basic configuration
files.

## Setup

### What lightstreamer affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

### Setup Requirements **OPTIONAL**

You'll need to obtain and package lightstreamer into an RPM, then put it in an
accessible repository.

### Beginning with lightstreamer

If you just want to install lightstreamer with our buil-in defaults:

```class { '::lightstreamer': }```

or

```include ::lightstreamer```

However, you probably don't want to do this.


Change your default installation direcory and set up some sensible passwords:

```puppet
class { '::lightstreamer':
  install_dir => '/srv/lightstreamer',
  mon_user    => 'mon',
  mon_passwd  => '53cr3t',
  rmi_user    => 'rmi',
  rmi_passwd  => 'B1g53cr3t',
}
```

Change default Java path:

```puppet
class { '::lightstreamer':
  java_home => '/opt/java/latest',
}
```

## Usage

All interaction should be possible via the main class.

If something isn't parameterized yet, it's time for a pull request.

## Reference

Work in progress.

Current options and their defaults are:

```puppet
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
```
We can manage and init script, together with ```${install_dir}/conf/lightstreamer_conf.xml``` and ```${install_dir}/bin/unix-like/LS.sh```. Only a handful of parameters are available as yet.

## Limitations

* Currently only tested on EL 6 type operating systems.
* Many paramters and defaults require including.

## Development

Pull requests gladly reviewed!

## Release Notes

0.1.0 - Initial version
