# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/Nefelim4ag/systemd-swap.git"

inherit systemd git-r3

DESCRIPTION="systemd support for swap deviceds"
HOMEPAGE="https://github.com/Nefelim4ag/systemd-swap"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-apps/systemd"
RDEPEND="${DEPEND}"

src_install() {
	dobin systemd-swap
    insinto /etc/systemd
    doins swap.conf
	dodir /var/lib/systemd-swap
    systemd_dounit systemd-swap.service
}
