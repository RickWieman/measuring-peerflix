# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

IP_VLAN = "192.168.50."

TRACKER_BASE_IP = 250

SEEDER_AMOUNT = 1 # max. 98
SEEDER_BASE_IP = 1

PEERFLIX_AMOUNT = 9 # max. 149
PEERFLIX_BASE_IP = 100

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "TFDuesing/Fedora-20"

	config.vm.provider "vmware_workstation" do |v|
		v.vmx["memsize"] = "512"
		v.vmx["numvcpus"] = "2"
	end

	config.vm.define "tracker" do |tracker|
		tracker.vm.hostname = "pf-tracker"
		tracker.vm.network "private_network", ip: "#{IP_VLAN}#{TRACKER_BASE_IP}"
		tracker.vm.provision :shell, :path => "provision/tracker.sh"

		tracker.vm.provider "vmware_workstation" do |v|
			# Limitations on download
			v.vmx["ethernet1.rxbw.limit"] = "100000" # Kbps
			v.vmx["ethernet1.rxfi.droprate"] = "0" # * 0.1%
			v.vmx["ethernet1.rxfi.dropsize"] = "0" # set to 1 if droprate > 0

			# Limitations on upload
			v.vmx["ethernet1.txbw.limit"] = "100000" # Kbps
			v.vmx["ethernet1.txfi.droprate"] = "0" # * 0.1%
			v.vmx["ethernet1.txfi.dropsize"] = "0" # set to 1 if droprate > 0
		end
	end

	(1..SEEDER_AMOUNT).each do |i|
		config.vm.define "seeder-#{i}" do |seeder|
			nodeId = SEEDER_BASE_IP + i
			seeder.vm.hostname = "pf-seeder-#{i}"
			seeder.vm.network "private_network", ip: "#{IP_VLAN}#{nodeId}"
			seeder.vm.provision :shell, :path => "provision/seeder.sh"

			seeder.vm.provider "vmware_workstation" do |v|
				# Limitations on download
				v.vmx["ethernet1.rxbw.limit"] = "2048" # Kbps
				v.vmx["ethernet1.rxfi.droprate"] = "0" # * 0.1%
				v.vmx["ethernet1.rxfi.dropsize"] = "0" # set to 1 if droprate > 0

				# Limitations on upload
				v.vmx["ethernet1.txbw.limit"] = "2048" # Kbps
				v.vmx["ethernet1.txfi.droprate"] = "0" # * 0.1%
				v.vmx["ethernet1.txfi.dropsize"] = "0" # set to 1 if droprate > 0
			end
		end
	end

	(1..PEERFLIX_AMOUNT).each do |i|
		config.vm.define "peerflix-#{i}" do |peerflix|
			nodeId = PEERFLIX_BASE_IP + i
			peerflix.vm.hostname = "pf-peerflix-#{i}"
			peerflix.vm.network "private_network", ip: "#{IP_VLAN}#{nodeId}"
			peerflix.vm.provision :shell, :path => "provision/peerflix.sh"

			peerflix.vm.provider "vmware_workstation" do |v|
				# Limitations on download
				v.vmx["ethernet1.rxbw.limit"] = "1024" # Kbps
				v.vmx["ethernet1.rxfi.droprate"] = "0" # * 0.1%
				v.vmx["ethernet1.rxfi.dropsize"] = "0" # set to 1 if droprate > 0

				# Limitations on upload
				v.vmx["ethernet1.txbw.limit"] = "1024" # Kbps
				v.vmx["ethernet1.txfi.droprate"] = "0" # * 0.1%
				v.vmx["ethernet1.txfi.dropsize"] = "0" # set to 1 if droprate > 0
			end
		end
	end
end