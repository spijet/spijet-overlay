# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=6
inherit git-r3 eutils

DESCRIPTION='small script to manage NetworkManager connections with dmenu instead of nm-applet'
SLOT=0
HOMEPAGE='https://github.com/firecat53/${PN}'
LICENSE='MIT'
IUSE="+dmenu rofi"
FEATURES_RESTRICT="mirror"

EGIT_REPO_URI="https://github.com/firecat53/${PN}.git"

RDEPEND='dev-lang/python
         dev-python/pygobject
         dmenu? ( x11-misc/dmenu )
         rofi? ( x11-misc/rofi )'

REQUIRED_USE="^^ ( dmenu rofi )"

src_prepare() {
    default
    use rofi && sed -i 's|^# dmenu.*$|dmenu_command = /usr/bin/rofi|' "${S}/config.ini.example"
}

src_install() {
	  dobin 'networkmanager_dmenu'
    domenu 'networkmanager_dmenu.desktop'
    dodoc 'README.rst'

    insinto "/etc/xdg/${PN}"
    newins 'config.ini.example' 'config.ini'
}
