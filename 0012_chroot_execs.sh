#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/_reusables.sh

require-root-user

mkdir -p ${LFS}/chroot_scripts
cp ${SCRIPT_DIR}/files/chroot_scripts/*.sh ${LFS}/chroot_scripts/

function chroot-exec {
    echo "building $(basename ${1})"
    chroot "$LFS" /usr/bin/env -i \
        HOME=/root \
        TERM="$TERM" \
        PS1='(lfs chroot) \u:\w\$ ' \
        PATH=/usr/bin:/usr/sbin \
        MAKEFLAGS="${MAKEFLAGS}" \
        NINJAJOBS=${NINJAJOBS} \
        /bin/bash --login "${1}"
}

#chroot-exec /chroot_scripts/0001_preparations.sh
#chroot-exec /chroot_scripts/0002_gettext.sh
#chroot-exec /chroot_scripts/0003_bison.sh
#chroot-exec /chroot_scripts/0004_perl.sh
#chroot-exec /chroot_scripts/0005_python.sh
#chroot-exec /chroot_scripts/0006_texinfo.sh
#chroot-exec /chroot_scripts/0007_util_linux.sh
#chroot-exec /chroot_scripts/0008_cleanup.sh
#chroot-exec /chroot_scripts/0009_manpages.sh
#chroot-exec /chroot_scripts/0010_iana_etc.sh
#chroot-exec /chroot_scripts/0011_glibc.sh
#chroot-exec /chroot_scripts/0012_timezone.sh
#chroot-exec /chroot_scripts/0013_zlib.sh
#chroot-exec /chroot_scripts/0014_bzip2.sh
#chroot-exec /chroot_scripts/0015_xz.sh
#chroot-exec /chroot_scripts/0016_zstd.sh
#chroot-exec /chroot_scripts/0017_file.sh
#chroot-exec /chroot_scripts/0018_readline.sh
#chroot-exec /chroot_scripts/0019_m4.sh
#chroot-exec /chroot_scripts/0020_bc.sh
#chroot-exec /chroot_scripts/0021_flex.sh
#chroot-exec /chroot_scripts/0022_tcl.sh
#chroot-exec /chroot_scripts/0023_expect.sh
#chroot-exec /chroot_scripts/0024_dejagnu.sh
#chroot-exec /chroot_scripts/0025_binutils.sh
#chroot-exec /chroot_scripts/0026_gmp.sh
#chroot-exec /chroot_scripts/0027_mpfr.sh
#chroot-exec /chroot_scripts/0028_mpc.sh
#chroot-exec /chroot_scripts/0029_attr.sh
#chroot-exec /chroot_scripts/0030_acl.sh
#chroot-exec /chroot_scripts/0031_libcap.sh
#chroot-exec /chroot_scripts/0032_shadow.sh
#chroot-exec /chroot_scripts/0033_gcc.sh
#chroot-exec /chroot_scripts/0034_pkgconfig.sh
#chroot-exec /chroot_scripts/0035_ncurses.sh
#chroot-exec /chroot_scripts/0036_sed.sh
#chroot-exec /chroot_scripts/0037_psmisc.sh
#chroot-exec /chroot_scripts/0038_gettext.sh
#chroot-exec /chroot_scripts/0039_bison.sh
#chroot-exec /chroot_scripts/0040_grep.sh
#chroot-exec /chroot_scripts/0041_bash.sh
#chroot-exec /chroot_scripts/0042_libtool.sh
#chroot-exec /chroot_scripts/0043_gdbm.sh
#chroot-exec /chroot_scripts/0044_gperf.sh
#chroot-exec /chroot_scripts/0045_expat.sh
#chroot-exec /chroot_scripts/0046_inetutils.sh
#chroot-exec /chroot_scripts/0047_less.sh
#chroot-exec /chroot_scripts/0048_perl.sh
#chroot-exec /chroot_scripts/0049_xmlparser.sh
#chroot-exec /chroot_scripts/0050_intltool.sh
#chroot-exec /chroot_scripts/0051_autoconf.sh
#chroot-exec /chroot_scripts/0052_automake.sh
#chroot-exec /chroot_scripts/0053_openssl.sh
#chroot-exec /chroot_scripts/0054_kmod.sh
#chroot-exec /chroot_scripts/0055_libelf.sh
#chroot-exec /chroot_scripts/0056_libffi.sh
#chroot-exec /chroot_scripts/0057_python.sh
#chroot-exec /chroot_scripts/0058_wheel.sh
#chroot-exec /chroot_scripts/0059_ninja.sh
#chroot-exec /chroot_scripts/0060_meson.sh
#chroot-exec /chroot_scripts/0061_coreutils.sh
#chroot-exec /chroot_scripts/0062_check.sh
#chroot-exec /chroot_scripts/0063_diffutils.sh
#chroot-exec /chroot_scripts/0064_gawk.sh
#chroot-exec /chroot_scripts/0065_findutils.sh
#chroot-exec /chroot_scripts/0066_groff.sh
#chroot-exec /chroot_scripts/0067_grub.sh
#chroot-exec /chroot_scripts/0068_gzip.sh
#chroot-exec /chroot_scripts/0069_iproute.sh
#chroot-exec /chroot_scripts/0070_kbd.sh
#chroot-exec /chroot_scripts/0071_libpipeline.sh
#chroot-exec /chroot_scripts/0072_make.sh
#chroot-exec /chroot_scripts/0073_patch.sh
#chroot-exec /chroot_scripts/0074_tar.sh
#chroot-exec /chroot_scripts/0075_texinfo.sh
#chroot-exec /chroot_scripts/0076_vim.sh
#chroot-exec /chroot_scripts/0077_markupsafe.sh
#chroot-exec /chroot_scripts/0078_jinja.sh
#chroot-exec /chroot_scripts/0079_systemd.sh
#chroot-exec /chroot_scripts/0080_dbus.sh
#chroot-exec /chroot_scripts/0081_mandb.sh
#chroot-exec /chroot_scripts/0082_procpsng.sh
#chroot-exec /chroot_scripts/0083_utillinux.sh
#chroot-exec /chroot_scripts/0084_e2fsprogs.sh
#chroot-exec /chroot_scripts/0085_strip.sh
#chroot-exec /chroot_scripts/0086_configure_network.sh
#chroot-exec /chroot_scripts/0087_configure_clock.sh
#chroot-exec /chroot_scripts/0088_configure_console.sh
#chroot-exec /chroot_scripts/0089_configure_locale.sh
#chroot-exec /chroot_scripts/0090_configure_readline.sh
#chroot-exec /chroot_scripts/0091_configure_shells.sh
#chroot-exec /chroot_scripts/0092_configure_systemd.sh
#chroot-exec /chroot_scripts/0093_fstab.sh
#chroot-exec /chroot_scripts/0094_linux_kernel.sh
#chroot-exec /chroot_scripts/0095_modprobe.sh
#chroot-exec /chroot_scripts/0096_popt.sh
#chroot-exec /chroot_scripts/0097_mandoc.sh
#chroot-exec /chroot_scripts/0098_nano.sh

# das nächste Skript ausführen:
# es wird scheitern: https://github.com/rhboot/efivar/pull/228/commits/bc65d63ebf8fe6ac8a099ff15ca200986dba1565
# übernehme die Änderungen und im chroot manuell ausführen
#chroot-exec /chroot_scripts/0099_efivar.sh

#chroot-exec /chroot_scripts/0100_efibootmanager.sh
#chroot-exec /chroot_scripts/0101_which.sh
#chroot-exec /chroot_scripts/0102_libpng.sh
#chroot-exec /chroot_scripts/0103_freetype.sh
#chroot-exec /chroot_scripts/0104_cmake.sh
#chroot-exec /chroot_scripts/0104_graphite2.sh
#chroot-exec /chroot_scripts/0104_harfbuzz.sh
#chroot-exec /chroot_scripts/0103_freetype.sh
#chroot-exec /chroot_scripts/0104_grub.sh
chroot-exec /chroot_scripts/0106_grub_install.sh