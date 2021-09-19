
{ lib, stdenv }:

stdenv.mkDerivation rec {
 pname = "gnome-shell-extension-paperwm";
 version = "pre-40.0";

 src = builtins.fetchGit {
   url = https://github.com/paperwm/paperwm.git;
   ref = "next-release";
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
