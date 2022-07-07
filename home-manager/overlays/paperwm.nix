
(self: super: {
  gnomeExtensions = super.gnomeExtensions // {
    paperwm = super.gnomeExtensions.paperwm.overrideDerivation (old: {
      version = "pre-41.0";
      src = super.fetchFromGitHub {
        #owner = "PaperWM-community";
        #repo = "PaperWM";
        #rev = "next-release";
        #sha256 = "b66aaf13e8f4cdf0e2f9078fb3e75703535b822c";
        owner = "ccope";
        rev = "gnome-42";
        repo = "PaperWM";
        # use to figure out the sha256
        #sha256 = self.lib.fakeSha256;
        sha256 = "0w5o3isDvXSmJ9N56qOIxnHz3XGKvBRgmGVB9LbiWEM=";
      };
    });
  };
})
