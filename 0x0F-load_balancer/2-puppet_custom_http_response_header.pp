#!/usr/bin/env bash
# Using puppet we create http response header 

# Define a class for custom HTTP header configuration
class custom_http_response_header {
    # Install facter package to get hostname
    package { 'facter':
        ensure => installed,
    }

    # Define a custom fact to get the hostname
    file { '/etc/facter/facts.d/hostname.txt':
        ensure  => file,
        content => "hostname=${::hostname}",
    }

    # Install Nginx package
    package { 'nginx':
        ensure => installed,
    }

    # Configure Nginx with custom HTTP header
    file { '/etc/nginx/sites-available/default':
        ensure  => file,
        content => "
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    server_name _;

    root /var/www/html;

    location / {
        index index.html index.htm;
        add_header X-Served-By ${::hostname};
    }
}
",
        require => Package['nginx'],
    }

    # Enable the custom configuration
    file { '/etc/nginx/sites-enabled/default':
        ensure  => 'link',
        target  => '/etc/nginx/sites-available/default',
        require => File['/etc/nginx/sites-available/default'],
        notify  => Service['nginx'],
    }

    # Restart Nginx service
    service { 'nginx':
        ensure  => running,
        enable  => true,
        require => Package['nginx'],
    }
}

# Include the custom HTTP header class
include custom_http_response_header
