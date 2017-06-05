# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3

DESCRIPTION="Python clipboard manager"
HOMEPAGE="https://github.com/mrichar1/clipster"
SRC_URI=""
EGIT_REPO_URI="https://github.com/mrichar1/clipster"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="x11-libs/libwnck
    dev-python/pygobject:3"
RDEPEND="${DEPEND}"

src_install(){
    dobin ${PN}
}