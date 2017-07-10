# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit cmake-utils

DESCRIPTION="Battery statistics logger"
HOMEPAGE="https://github.com/petterreinholdtsen/${PN}"
SRC_URI="https://github.com/petterreinholdtsen/${PN}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"

DEPEND="
  app-shells/bash
  sci-visualization/gnuplot
  dev-util/cmake"

RDEPEND="${DEPEND}"
