{
  description = "Dotfiles for my NixOS setup";

  outputs = { self, nixpkgs }: {
    # Just export the dotfiles path for other flakes to use
    dotfiles = ./.;
  };
}
