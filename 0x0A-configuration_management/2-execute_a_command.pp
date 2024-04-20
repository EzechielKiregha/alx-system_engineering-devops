#This code kills a process & and works together with the killmenow file which has already been provided
exec {' pkill':
  command  =>  'pkill killmenow',
  provider =>  'shell',
}
