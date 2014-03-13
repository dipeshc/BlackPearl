Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.provision "docker",
    images: ["ubuntu"]
  
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  
  # Sickbeard
  config.vm.provision "shell",
    inline: "docker build -t sickbeard /vagrant/sickbeard-data && docker run -d -p 8081:80 -v /vagrant/sickbeard-data:/sickbeard-data -v /vagrant/media/tv:/tv sickbeard"
end
