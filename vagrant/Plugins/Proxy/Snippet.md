# Snippet

```ruby
Vagrant.configure('2') do |config|
  # [...]

  if ENV.key?('http_proxy')
    unless Vagrant.has_plugin?('vagrant-proxyconf')
      puts 'vagrant-proxyconf is not installed!'
      puts 'To install the plugin, run:'
      puts 'vagrant plugin install vagrant-proxyconf'
      exit
    end

    config.proxy.http = ENV['http_proxy']
    config.proxy.https =
      ENV.key?('https_proxy') ? ENV['https_proxy'] : ENV['http_proxy']
    config.proxy.no_proxy =
      ENV.key?('no_proxy') ? ENV['no_proxy'] : 'localhost,127.0.0.1'
  end
end
```
