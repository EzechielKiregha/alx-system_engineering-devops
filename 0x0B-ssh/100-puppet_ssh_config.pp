#!/usr/bin/env bash
# Using puppet to connect without password

file { '/etc/ssh/ssh_config':
  ensure => present,
}

file_line { 'Declare iddntity file':
  path    => '/etc/ssh/ssh_config',
  line    => 'IdentityFile ~/.ssh/school',
  match   => '^#IdentityFile',
}

file_line { 'Turn off passwd auth':
  path    => '/etc/ssh/ssh_config',
  line    => 'PasswordAuthentication no',
  match   => '^#PasswordAuthentication',
}
