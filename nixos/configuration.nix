# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').

{ config, pkgs, ... }:

let
  # Import unstable channel for specific packages
  unstable = import <nixos-unstable> { config = config.nixpkgs.config; };

  # Derivation that puts your Itachi image into the Nix store
  itachiLoginBg = pkgs.runCommand "itachi-login-bg" { } ''
    cp ${./wallpapers/itachi-uchiha_800.gif} $out
  '';
in

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Enable experimental features for nix commands and flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader with timeout optimization
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # VERIFIED: Reduces bootloader menu timeout from 10s to 1s
  boot.loader.timeout = 1;

  # VERIFIED: Boot optimizations from NixOS community
  # These kernel parameters reduce boot verbosity and improve speed
  boot.kernelParams = [
    "quiet" # Reduce kernel messages during boot
    "splash" # Show splash screen instead of text
    "rd.udev.log_level=3" # Reduce udev logging
  ];

  # VERIFIED: Enable systemd in initrd for faster parallel boot (NixOS 22.11+)
  boot.initrd.systemd.enable = true;

  # Fix for serial port devices causing boot delays (observed after optimization)
  boot.blacklistedKernelModules = [ "serial8250" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment with SDDM Astronaut Theme
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "breeze";
  };

  services.desktopManager.plasma6.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
    config.common.default = "kde";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # BLUETOOTH CONFIGURATION - Added for KDE Plasma Bluetooth support
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true; # Enable Blueman for additional Bluetooth management

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.pydi = {
    isNormalUser = true;
    description = "pydi";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    #tools
    wget
    curl
    unzip
    wl-clipboard
    appimage-run
    pomodoro-gtk
    #browser
    google-chrome
    brave
    #code tools - Use unstable for latest versions
    nodejs_24
    unstable.pnpm
    unstable.bun
    yarn
    git
    lazygit
    opencode
    gh
    neovim
    gcc
    clang
    #IDE
    vscode
    zed-editor
    antigravity
    #terminal
    tmux
    tmuxp
    ripgrep
    starship
    zoxide
    eza
    kitty
    ghostty
    zsh
    oh-my-zsh
    zsh-autosuggestions
    zsh-syntax-highlighting

    #font
    nerd-fonts.jetbrains-mono
    # Language Servers
    typescript
    lua-language-server
    vscode-langservers-extracted # Provides html-lsp, css-lsp, json-lsp, eslint-lsp
    typescript-language-server
    tailwindcss-language-server
    clang-tools # Provides clangd, clang-format
    stylua
    nodePackages.prettier
    nixd
    nixpkgs-fmt
    # Bluetooth packages - Added for better Bluetooth support
    bluez
    bluez-tools
    kdePackages.bluedevil # KDE Plasma 6 Bluetooth integration
    # Tell SDDM Breeze theme to use Itachi as background
    (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
      [General]
      background=${itachiLoginBg}
    '')
  ];

  users.users.pydi.shell = pkgs.zsh;

  # Enable Zsh system-wide
  programs.zsh = {
    enable = true;

    ohMyZsh = {
      enable = true;
      theme = "robbyrussell"; # you can change this to any Oh My Zsh theme later
      plugins = [ "git" "z" "sudo" "history" ];
    };

    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
  };

  # VERIFIED: Boot time optimizations from official NixOS Discourse
  # Source: https://discourse.nixos.org/t/boot-faster-by-disabling-udev-settle-and-nm-wait-online/6339
  systemd.services = {
    # Disable NetworkManager-wait-online to prevent boot delays (saves ~1.3s based on your analysis)
    NetworkManager-wait-online.enable = false;

    # Disable systemd-udev-settle to prevent device waiting delays (can save several seconds)
    systemd-udev-settle.enable = false;
  };

  # VERIFIED: Optimize systemd timeouts to prevent long waits during boot
  systemd.settings.Manager = {
    DefaultTimeoutStopSec = "10s";
    DefaultTimeoutStartSec = "30s";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
