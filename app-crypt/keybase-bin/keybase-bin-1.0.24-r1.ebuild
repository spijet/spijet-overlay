# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils gnome2-utils xdg

MY_PN="keybase"
MY_PV="20170526160108.83e1e9f"
MY_P="${MY_PN}_${PV}-${MY_PV}"

DESCRIPTION="GUI client for keybase.io"
HOMEPAGE="https://keybase.io/"
SRC_URI="
	x86? ( https://s3.amazonaws.com/prerelease.keybase.io/linux_binaries/deb/${MY_P}_i386.deb -> ${PF}.deb )
	amd64? ( https://s3.amazonaws.com/prerelease.keybase.io/linux_binaries/deb/${MY_P}_amd64.deb -> ${PF}.deb )"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

QA_PREBUILT="opt/keybase/Keybase"
S="${WORKDIR}/opt/keybase"

DEPEND="gnome-base/gconf
	sys-fs/fuse
	app-crypt/gnupg"
RDEPEND="${DEPEND}"

src_unpack() {
	cp "${DISTDIR}/${PF}.deb" .
	ar x "./${PF}.deb"
	unpack "./data.tar.xz"
}

src_install() {
	dodir "/opt/keybase/"
	cp -R "${S}" "${D}/opt/"

	local binary_name
	for binary_name in kbfsfuse kbnm keybase run_keybase; do
		newbin "${WORKDIR}/usr/bin/${binary_name}" "${binary_name}"
	done

	local icon_size
	for icon_size in 16 32 128 256 512; do
		newicon -s "${icon_size}" \
			"${WORKDIR}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/${MY_PN}.png" \
			"${MY_PN}.png"
	done

	newmenu "${WORKDIR}/usr/share/applications/${MY_PN}.desktop" "${MY_PN}.desktop"
}

pkg_preinst() {
	xdg_pkg_preinst
	gnome2_icon_savelist
}

pkg_postinst() {
	if mkdir "${ROOT%/}/keybase" &>/dev/null; then
		chmod 777 "${ROOT%/}/keybase"
	fi
	xdg_pkg_postinst
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_icon_cache_update
}
