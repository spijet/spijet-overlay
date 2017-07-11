# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Display a PNG image in an unmanaged window."
HOMEPAGE="https://github.com/sdhand/${PN}"
SRC_URI="https://github.com/sdhand/${PN}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="BSD-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"

DEPEND="
  x11-libs/cairo
  x11-libs/libxcb"
