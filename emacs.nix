{ pkgs ? import <nixpkgs> {} }:

let
  myEmacs = pkgs.lib.overrideDerivation (pkgs.emacs25.override {
    withGTK3 = true;
    withGTK2 = false;
    withXwidgets = true;
  }) (attrs: {});

  linuxEmacsWithPackages = (pkgs.emacsPackagesNgGen myEmacs).emacsWithPackages;

  macEmacsWithPackages = (pkgs.emacsPackagesNgGen pkgs.emacs25Macport).emacsWithPackages;

  myEmacsPackages = epkgs: (with epkgs.melpaPackages; [
    bbdb
    company
    emms
    exec-path-from-shell
    helm
    htmlize
    jabber
    magit
    multiple-cursors
    nix-mode
    pandoc
    paredit-everywhere
    pdf-tools
    restclient
    spaceline
    zenburn-theme
  ]) ++ (with epkgs.orgPackages; [
    org-plus-contrib
  ]);

# install one of these with "nix-env -f /path/to/emacs.nix -iA emacsLinux"
in {
  emacsLinux = linuxEmacsWithPackages (myEmacsPackages);
  emacsMac = macEmacsWithPackages (myEmacsPackages);
}
