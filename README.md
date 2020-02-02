# nobian
Debian 10 Buster Provisioning Script

## Enviroments

* VirtualBox 6.1.2
* Vagrant 2.2.7
* Debian 10 Buster
* Host: MSYS2 on Windows 10

## Requirement

* Vagrant Plugin

```
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-disksize
```

## Get Started

Check `Vagrantfile` and modify if necessary (VM Spec, Port Forwading etc.)

```
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

  ## Port Forwading
  config.vm.network :forwarded_port, guest: 80, host: 80
  config.vm.network :forwarded_port, guest: 443, host: 443
end
```

Run `make debian` first

```
$ make debian
```

Run the `make` task according to your needs

```
$ make
docker-host                   provision - docker-host
gnome-desktop                 provision - gnome-desktop
common                        provision - common-tools,common-utils
web-server                    provision - server-utils
allenv                        provision - **env (require: common-utils)
development                   provision - development-tools,development-utils (require: common-utils)
task-full                     task - all tasks (dry-run: `make -n`)
task-full-desktop             task - all tasks with gnome-desktop (dry-run: `make -n`)
```

