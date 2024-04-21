# This code will install the flask package 2.1.0
# Install pip package
package { 'python3-pip':
  ensure => 'installed',
}

# Install Werkzeug 2.1.1 using pip
exec { 'install_werkzeug':
  command => '/usr/bin/pip3 install werkzeug==2.0.2',
  path    => ['/usr/bin', '/bin'],
  creates => '/usr/local/lib/python3.8/dist-packages/werkzeug', # Adjust the path as per your Python installation
}

# Install Flask 2.1.0 using pip
exec { 'install_flask':
  command => '/usr/bin/pip3 install Flask==2.1.0',
  path    => ['/usr/bin', '/bin'],
  creates => '/usr/local/lib/python3.8/dist-packages/flask', # Adjust the path as per your Python installation
  require => Exec['install_werkzeug'], # Ensure Werkzeug is installed first
}