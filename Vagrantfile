Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.provision "docker",
    images: ["ubuntu"]

  if Vagrant.has_plugin?("vagrant-cachier")
    config.vm.network "private_network", ip: "192.168.50.4"
    config.vm.synced_folder ".", "/vagrant", type: "nfs"

    config.cache.scope = :box
    config.cache.synced_folder_opts = {
      type: :nfs,
      mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    }
  end
  
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  config.vm.network "forwarded_port", guest: 9091, host: 9091
  config.vm.network "forwarded_port", guest: 32400, host: 32400

  # Plex
  config.vm.provision "shell",
    inline: "docker build -t blackperl/plex /vagrant/plex && docker run -d -p 32400:32400 -v /vagrant/plex/:/var/plex -v /vagrant/media:/media -name plex blackperl/plex"

  # Transmission
  config.vm.provision "shell",
    inline: "docker build -t blackperl/transmission /vagrant/transmission && docker run -d -p 9091:80 -p 51413:51413  -v /vagrant/transmission:/var/transmission -v /vagrant/media/downloads:/media/downloads -name transmission blackperl/transmission"
 
  # Sickbeard
  config.vm.provision "shell",
    inline: "docker build -t blackperl/sickbeard /vagrant/sickbeard && docker run -d -p 8081:80 -v /vagrant/sickbeard:/var/sickbeard -v /vagrant/media/tv:/media/tv -v /vagrant/media/downloads/sickbeard:/media/downloads -link transmission:transmission -name sickbeard blackperl/sickbeard"

  # Nginx
  config.vm.provision "shell",
    inline: "docker build -t blackperl/nginx /vagrant/nginx && docker run -d -p 80:80 -v /vagrant/nginx:/var/nginx -link plex:plex -link transmission:transmission -link sickbeard:sickbeard -name nginx blackperl/nginx"

end