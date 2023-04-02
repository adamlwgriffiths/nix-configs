
(self: super: {
  gnomeExtensions = super.gnomeExtensions // {
    paperwm = super.gnomeExtensions.paperwm.overrideDerivation (old: {
      #version = "42.20221101";
      version = "develop.20221203";
      src = super.fetchFromGitHub {
        owner = "paperwm";
        repo = "PaperWM";
        #rev = "gnome-42";
        rev = "develop";
        # use to figure out the sha256
        #sha256 = self.lib.fakeSha256;
        #sha256 = "HuqSp6NM9Ye9SyQT+il5Cn4FsSxnT6CAlA/NjwBkajo=";
        sha256 = "ngyTsls0RYQyepfwvNJDPdlGMRC2+woFCW4RVjsaPRU=";
      };
    });
  };
})
