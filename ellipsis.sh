#!/usr/bin/env bash
#
# tbjers/dot-kitty ellipsis package

pkg.link() {
  fs.link_rfiles common $HOME/.config/kitty
}

pkg.install() {
  case $(os.platform) in
    osx)
      brew cask install kitty
      ;;
    linux)
      curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
      mkdir -p ~/.local/bin
      mkdir -p ~/.local/share/applications
      ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
      cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
      sed -i "s/Icon\=kitty/Icon\=\/home\/$USER\/.local\/kitty.app\/share\/icons\/hicolor\/256x256\/apps\/kitty.png/g" ~/.local/share/applications/kitty.desktop
      ;;
  esac
}
