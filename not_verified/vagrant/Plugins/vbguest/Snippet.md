# Snippet

```rb
if Vagrant.has_plugin?('vagrant-vbguest')
  # :nodoc:
  class HackyGuestAdditionsInstaller < VagrantVbguest::Installers::RedHat
    def install_dependencies_cmd
      "sed -ie '/^enabled=/ s/1/0/g' /etc/yum/pluginconf.d/fastestmirror.conf; " \
      'yum clean all; rm -r /var/cache/yum/*; ' \
      'yum check-update; ' \
      "yum -y install #{dependencies}"
    end
  end
end

Vagrant.configure('2') do |config|
  if Vagrant.has_plugin?('vagrant-vbguest')
    config.vbguest.installer = HackyGuestAdditionsInstaller
  end
end
```
