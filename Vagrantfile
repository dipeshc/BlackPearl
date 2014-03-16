Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.provision "docker",
    images: ["ubuntu"]

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    config.cache.synced_folder_opts = {
      type: :nfs,
      mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    }
  end
  
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  config.vm.network "forwarded_port", guest: 9091, host: 9091

  # Transmission
  config.vm.provision "shell",
    inline: "docker build -t blackperl/transmission /vagrant/transmission && docker run -d -p 9091:80 -p 51413:51413  -v /vagrant/transmission:/var/transmission -v /vagrant/media/downloads:/media/downloads -name transmission blackperl/transmission"
 
  # Sickbeard
  config.vm.provision "shell",
    inline: "docker build -t blackperl/sickbeard /vagrant/sickbeard && docker run -d -p 8081:80 -v /vagrant/sickbeard:/var/sickbeard -v /vagrant/media/tv:/media/tv -v /vagrant/media/downloads/sickbeard:/media/downloads -link transmission:transmission -name sickbeard blackperl/sickbeard"

  # Nginx
  config.vm.provision "shell",
    inline: "docker build -t blackperl/nginx /vagrant/nginx && docker run -d -p 80:80 -v /vagrant/nginx:/var/nginx -link transmission:transmission -link sickbeard:sicbeard -name nginx blackperl/nginx"

end