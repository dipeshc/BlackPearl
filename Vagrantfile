Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.provision "docker",
    images: ["ubuntu"]
  
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 8081, host: 8081
 
  # Utorrent
  config.vm.provision "shell",
    inline: "docker build -t utorrent /vagrant/utorrent && docker run -d -p 45000:6881 -p 8080:80  -v /vagrant/utorrent:/var/utorrent -v /vagrant/media/downloads:/media/downloads utorrent"
 
  # Sickbeard
  config.vm.provision "shell",
    inline: "docker build -t sickbeard /vagrant/sickbeard && docker run -d -p 8081:80 -v /vagrant/sickbeard:/var/sickbeard -v /vagrant/media/tv:/media/tv -v /vagrant/media/downloads/sickbeard:/media/downloads sickbeard"
end
