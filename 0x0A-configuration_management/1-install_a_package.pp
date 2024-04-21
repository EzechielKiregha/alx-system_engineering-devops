# This code will install the flask package 2.1.0
exec { 'install_flask':
  command => 'pip3 install Flask==2.1.0',
  path    => ['/usr/bin', '/bin'],
}
