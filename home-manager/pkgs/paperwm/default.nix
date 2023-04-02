
# NOT USED
# look in overlays/paperwm.nix

{ lib, stdenv }:

stdenv.mkDerivation rec {
 pname = "gnome-shell-extension-paperwm";
 version = "gnome-42.20221101";

 src = builtins.fetchGit {
   url = https://github.com/paperwm/paperwm.git;
   ref = "gnome-42";
 };

 uuid = "paperwm@hedning:matrix.org";

 dontBuild = true;

 installPhase = ''
   runHook preInstall
   mkdir -p $out/share/gnome-shell/extensions/${uuid}
   cp -r . $out/share/gnome-shell/extensions/${uuid}
   runHook postInstall
 '';

 meta = with lib; {
   description = "Tiled scrollable window management for Gnome Shell";
   homepage = "https://github.com/paperwm/PaperWM";
   license = licenses.gpl3;
   maintainers = with maintainers; [ hedning ];
 };
}
