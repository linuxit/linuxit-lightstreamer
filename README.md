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

class { '::lightstreamer': }

## Usage

Change your default installation direcory and set up some sensible passwords:

class { '::lightstreamer':
  install_dir => '/srv/lightstreamer',
  mon_user    => 'mon',
  mon_passwd  => '53cr3t',
  rmi_user    => 'rmi',
  rmi_passwd  => 'B1g53cr3t',
}

Change default Java path:

class { '::lightstreamer':
  java_home => '/opt/java/latest',
}

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

Currently only tested on EL 6 type operating systems.

## Development

Pull requests gladly reviewed.

## Release Notes

0.1.0 - Initial version