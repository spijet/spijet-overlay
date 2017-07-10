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

IUSE="systemd pm-utils udev"

DEPEND="
  app-shells/bash
  sci-visualization/gnuplot
  dev-util/cmake"

RDEPEND="
  systemd? ( sys-apps/systemd )
  pm-utils? ( sys-power/pm-utils )
  udev? ( virtual/udev )
  ${DEPEND}"

src_unpack() {
    default
    epatch "${FILESDIR}/${PN}-add-prefix-and-flags.patch"
}
src_configure() {
    local mycmakeargs=(
        "-DWITH_SYSTEMD=$(usex systemd)"
        "-DWITH_PMUTILS=$(usex pm-utils)"
        "-DWITH_UDEV=$(usex udev)"
    )
    cmake-utils_src_configure
}

src_install() {
    cmake-utils_src_install
    fperms 0755 "/usr/share/battery-stats/battery-stats-generate" \
           "/usr/share/battery-stats/battery-stats-graph" \
           "/usr/share/battery-stats/battery-stats-graph-flow" \
           "/usr/share/battery-stats/collect-csv" \
           "/usr/share/battery-stats/graph-setup"
}
