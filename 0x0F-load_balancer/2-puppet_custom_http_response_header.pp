#!/usr/bin/env bash
# Using puppet we create http response header 

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Allow HTTP traffic
firewall { 'allow http':
  port   => 80,
  proto  => 'tcp',
  action => 'accept',
}

# Define Nginx configuration
file { '/etc/nginx/sites-available/custom_conf':
  ensure  => present,
  content => "
server {
    listen 80;
    listen [::]:80;
    server_name _;

    location /redirect_me {
        return 301 https://youtube.com/@AI_Mirror_Company;
    }

    error_page 404 /404.html;

    location /404.html {
        root /var/www/html;
        internal;
    }

    location / {
        root /var/www/html;
        index index.html index.htm;
        add_header X-Served-By $hostname;
    }
}
",
}

# Create a symbolic link to enable the site
file { '/etc/nginx/sites-enabled/custom_conf':
  ensure => link,
  target => '/etc/nginx/sites-available/custom_conf',
}

# Remove default Nginx configuration
file { '/etc/nginx/sites-enabled/default':
  ensure => absent,
}

# Restart Nginx service
service { 'nginx':
  ensure => running,
  enable => true,
  require => File['/etc/nginx/sites-enabled/custom_conf'],
}
