class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service {'sshd':
    ensure => running,
    enable => true,
  }
  ssh_authorized_key { 'root@master.puppet.vm':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCwe76X2cvGn8EdTnxinahFaKAAveOvULQyQmVq7tb6b/VRDdZarxGMEcXsEcqISzBf9UIeCzEvqLP6ktUtzKqkbF+MQvQgyy18aWq3itW5JP54FETr/TYdrVMdPbaCdaR9HSiB97KhiRH0scJVsRs1ZOe/dskEaI8BHFjiW/kjn3qQEM5eHvo8HAGaXCvnszWPux75JtOJnxJkp1gjgGW1+S2M2k6MDOeN6cqwy5GPW+CppIrRvB0qvyJ9+qXVDPe5wgTn70VuoftzffttB2iiZmxAQ19+1b3ORFPP8Yi/M0pXtw8qS86b3I6ZhNIPILAT0xN7qnnpUoIWTXidTOkN',
  }
}
