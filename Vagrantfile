# -*- mode: ruby -*-
# vi: set ft=ruby :
# A dummy plugin for Barge to set hostname and network correctly at the very first `vagrant up`
module VagrantPlugins
  module GuestLinux
    class Plugin < Vagrant.plugin("2")
      guest_capability("linux", "change_host_name") { Cap::ChangeHostName }
      guest_capability("linux", "configure_networks") { Cap::ConfigureNetworks }
    end
  end
end

Vagrant.configure(2) do |config|

  ## Box
  # config.vm.box = "nobiki/debian10jp"
  # config.vm.box_version = "1.0"
  config.vm.box = "./debian10jp.box"
  config.vm.define "nobian"

  ## VM Spec
  config.disksize.size = '120GB'
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 4
    vb.memory = 8192 # MB
    vb.gui = true

    vb.customize [
      "modifyvm", :id,
      "--vram", "256",
      "--monitorcount", "1",
      "--clipboard-mode", "bidirectional",
      "--accelerate3d", 'on',
      "--hwvirtex", "on",
      "--nestedpaging", "on",
      "--largepages", "on",
      "--chipset", "ich9",
      "--ioapic", "on",
      "--pae", "off",
      "--paravirtprovider", "kvm",
    ]
  end

  ## Provision
  config.vbguest.auto_update = true
  config.vm.provision :shell, name:"core", path:"provision.sh", privileged: true
  config.vm.provision :shell, name:"core", path:"shell/root-core.sh", privileged: true
  config.vm.provision :shell, name:"core", path:"shell/fzf.sh", privileged: false
  config.vm.provision :shell, name:"docker-host", path:"shell/docker-ce.sh", privileged: false
  config.vm.provision :shell, name:"gnome-desktop", path:"shell/gnome-desktop/root-gnome.sh", privileged: true
  config.vm.provision :shell, name:"gnome-desktop", path:"shell/ibus-mozc.sh", privileged: false
  config.vm.provision :shell, name:"gnome-desktop", path:"shell/gnome-desktop/font.sh", privileged: false
  config.vm.provision :shell, name:"gnome-desktop", path:"shell/gnome-desktop/theme.sh", privileged: false
  config.vm.provision :shell, name:"gnome-desktop", path:"shell/gnome-desktop/icon.sh", privileged: false
  config.vm.provision :shell, name:"gnome-desktop", path:"shell/vlc.sh", privileged: false
  config.vm.provision :shell, name:"gnome-desktop", path:"shell/wine.sh", privileged: false
  config.vm.provision :shell, name:"gnome-desktop", path:"shell/chrome.sh", privileged: false
  config.vm.provision :shell, name:"common-utils", path:"shell/apt/common.sh", privileged: false
  config.vm.provision :shell, name:"common-utils", path:"shell/anyenv.sh", privileged: false
  config.vm.provision :shell, name:"common-utils", path:"shell/direnv.sh", privileged: false
  config.vm.provision :shell, name:"common-utils", path:"shell/yarn.sh", privileged: false
  config.vm.provision :shell, name:"common-tools", path:"shell/apt/common.sh", privileged: false
  config.vm.provision :shell, name:"common-tools", path:"shell/jq.sh", privileged: false
  config.vm.provision :shell, name:"common-tools", path:"shell/hcat.sh", privileged: false
  config.vm.provision :shell, name:"common-tools", path:"shell/highway.sh", privileged: false
  config.vm.provision :shell, name:"common-tools", path:"shell/bat.sh", privileged: false
  config.vm.provision :shell, name:"common-tools", path:"shell/exa.sh", privileged: false
  config.vm.provision :shell, name:"common-tools", path:"shell/ripgrep.sh", privileged: false
  config.vm.provision :shell, name:"common-tools", path:"shell/xpanes.sh", privileged: false
  config.vm.provision :shell, name:"common-tools", path:"shell/trans.sh", privileged: false
  config.vm.provision :shell, name:"server-utils", path:"shell/certbot.sh", privileged: false
  config.vm.provision :shell, name:"server-utils", path:"shell/nginx.sh", privileged: false
  config.vm.provision :shell, name:"development-tools", path:"shell/apt/development.sh", privileged: false
  config.vm.provision :shell, name:"development-tools", path:"shell/ctags.sh", privileged: false
  config.vm.provision :shell, name:"development-tools", path:"shell/phpcs.sh", privileged: false
  config.vm.provision :shell, name:"development-tools", path:"shell/eslint.sh", privileged: false
  config.vm.provision :shell, name:"development-tools", path:"shell/git_find_big.sh", privileged: false
  config.vm.provision :shell, name:"development-tools", path:"shell/hadolint.sh", privileged: false
  config.vm.provision :shell, name:"development-tools", path:"shell/js-beautify.sh", privileged: false
  config.vm.provision :shell, name:"development-tools", path:"shell/sql-formatter.sh", privileged: false
  config.vm.provision :shell, name:"development-tools", path:"shell/rsense.sh", privileged: false
  config.vm.provision :shell, name:"development-tools", path:"shell/ngrok.sh", privileged: false
  config.vm.provision :shell, name:"development-utils", path:"shell/jmeter.sh", privileged: false
  config.vm.provision :shell, name:"development-utils", path:"shell/postman.sh", privileged: false
  config.vm.provision :shell, name:"cloud-sdks", path:"shell/awscli.sh", privileged: false
  config.vm.provision :shell, name:"cloud-sdks", path:"shell/gcloud.sh", privileged: false

  ## Port Forwading
  config.vm.network :forwarded_port, guest: 80, host: 80
  config.vm.network :forwarded_port, guest: 443, host: 443
  # config.vm.network :forwarded_port, guest: 3000, host: 3000
  # config.vm.network :forwarded_port, guest: 3306, host: 3306
  # config.vm.network :forwarded_port, guest: 4444, host: 4444
  # config.vm.network :forwarded_port, guest: 8080, host: 8080
  # for i in 5800..5810
  #   config.vm.network :forwarded_port, guest: i, host: i
  # end
  # for i in 5900..5910
  #   config.vm.network :forwarded_port, guest: i, host: i
  # end
end
