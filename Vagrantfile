VAGRANTFILE_API_VERSION = "2"

## デフォルトProvider変更
#ENV["VAGRANT_DEFAULT_PROVIDER"] = "docker"

Vagrant.configure("2") do |config|

  # nginx conainer
  config.vm.define "nginx" do |v|
    v.vm.provider "docker" do |d|
      d.name = "nginx"
      d.build_dir = "./docker-container/nginx"
      d.volumes = ["/vagrant-log/nginx:/var/log/nginx"]
      d.ports = ["80:80"]
      d.vagrant_vagrantfile = "./vagrant-docker.proxy"
      d.remains_running = false
      d.link "app:app"
    end
  end

  # flask conainer
  config.vm.define "python-app" do |v|
    v.vm.provider "docker" do |d|
      d.name = "app"
      d.build_dir = "."
      d.volumes = ["/vagrant-app:/mnt-app", "/vagrant-log/app:/mnt-log"]
      d.ports = ["5000:5000"]
      d.vagrant_vagrantfile = "./vagrant-docker.proxy"
      d.remains_running = false
      d.link "redis:redis"
    end
  end

  # redis conainer
  config.vm.define "redis" do |v|
    v.vm.provider "docker" do |d|
      d.name = "redis"
      d.image = "redis"
      #d.build_dir = "./docker-container/redis"
      d.volumes = ["/var/redis:/mnt"]
      d.ports = ["6379:6379"]
      d.vagrant_vagrantfile = "./vagrant-docker.proxy"
      d.remains_running = false
    end
  end

end
