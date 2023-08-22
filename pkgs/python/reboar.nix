{pkgs, ...}: {
  devShells.py-reboar = pkgs.mkShell {
    name = "reboar";
    packages = with pkgs; [
      python311
      ffmpeg
      python311Packages.mutagen
      python311Packages.pydub
    ];
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";
    DIRENV_LOG_FORMAT = "";
  };
}
