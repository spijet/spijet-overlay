# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
DESCRIPTION='small script to manage NetworkManager connections with dmenu instead of nm-applet'
SLOT=0
HOMEPAGE='https://github.com/firecat53/${PN}'
LICENSE='MIT'
IUSE="+dmenu rofi"
FEATURES_RESTRICT="mirror"

if [[ ${PV} == 9999* ]] ; then
    inherit git-r3 eutils
    EGIT_REPO_URI="https://github.com/firecat53/${PN}.git"
else
    inherit eutils
    SRC_URI="https://github.com/firecat53/${PN}/archive/${PV}.tar.gz"
    KEYWORDS="~amd64 ~x86"
fi

KEYWORDS="~amd64 ~x86"
RDEPEND='dev-lang/python
         dev-python/pygobject
         dmenu? ( x11-misc/dmenu )
         rofi? ( x11-misc/rofi )'

REQUIRED_USE="^^ ( dmenu rofi )"

src_unpack() {
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
