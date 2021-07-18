{ pkgs ? import <nixpkgs> { } }:
with pkgs;

let
  assembleComponents = ( components: {
    buildInputs = map (c: c.buildInputs) components;
    shellInit = builtins.foldl' (a: b: a + b ) "" (map (c: c.shellInit) components);
    shellStartService = builtins.foldl' (a: b: a + b ) "" (map (c: c.shellStartService) components);
    shellStopService = builtins.foldl' (a: b: a + b ) "" (map (c: c.shellStopService) components);
    shellDump = builtins.foldl' (a: b: a + b ) "" (map (c: c.shellDump) components);
    shellRestore = builtins.foldl' (a: b: a + b ) "" (map (c: c.shellRestore) components);
  } );

  cfg =
    if builtins.pathExists ./config.nix
    then import ./config.nix
    else {  # default configuration
      postgresql = {
        port = "5433";
        name = "mydb";
        user = "myuser";
        password = "mypassword";
      };
      mysql = {
        port = "3307";
        password = "mypassword";
        databases = [ "mydb" ];
      };
      phpfpm = {};
      nginx = {};
    };

  components = assembleComponents [ 
    # ((import ./components/mysql.nix) { inherit pkgs; cfg = cfg.mysql; })
    # ((import ./components/postgresql.nix) { inherit pkgs; cfg = cfg.postgresql; })
    # ((import ./components/phpfpm.nix) { inherit pkgs; cfg = cfg.phpfpm; })
    # ((import ./components/nginx.nix) { inherit pkgs; cfg = cfg.nginx; })
  ];

  rootDir   = toString ./.;
in

mkShell {
  buildInputs = [
    python38Packages.pip
    python38Packages.hidapi
    hidapi
    busybox
    gcc-arm-embedded
    dfu-util
    pkgsCross.avr.buildPackages.gcc
    teensy-loader-cli
  ] ++ components.buildInputs;

  shellHook = ''
    #python3 -m venv .venv
    #source .venv/bin/activate
  '';
}
