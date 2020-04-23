class minecraft (
  $url = 'https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar',
  # 'https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar',
  $install_dir = '/opt/minecraft',
) {
  file { "${install_dir}":
    ensure => directory,
  }
  file { "${install_dir}/server.jar":
    ensure => file,
    source => $url,
    verify_peer => false,
    before => Service['minecraft'],
  }
  package { 'java':
    ensure => present,
  }
  file { "${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
  }
  file { '/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service { 'minecraft':
    ensure => running,
    enable => true,
  }
}
