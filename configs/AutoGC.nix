{ ... }: {
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 5d";
    dates = "Sun 19:00";
  };
}
