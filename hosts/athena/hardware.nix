{ config, lib, pkgs, modulesPath, ... }:

{
	imports = [ ];

	boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "ehci_pci" "ahci" "xhci_pci" "nvme" "floppy" "sr_mod" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ ];
	boot.extraModulePackages = [ ];

	fileSystems."/" = 
		{ device = "/dev/disk/by-uuid/86789db6-83bc-45c0-a222-77f3fb4921db";
			fsType = "ext4";
		};

	fileSystems."/boot" =
		{	device = "/dev/disk/by-uuid/B1B2-D0D1";
			fsType = "vfat";
			options = [ "fmask=0077" "dmask=0077" ];
		};
	
	swapDevices = [ ];

	networking.useDHCP = lib.mkDefault true;

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
