#!/bin/bash
set -e

for lib in ncurses form panel menu ; do
    rm -vf                    {{ .xbee.out }}/usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > {{ .xbee.out }}/usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc        {{ .xbee.out }}/usr/lib/pkgconfig/${lib}.pc
done

echo "INPUT(-lncursesw)" > {{ .xbee.out }}/usr/lib/libcursesw.so
ln -sfv libncurses.so      {{ .xbee.out }}/usr/lib/libcurses.so

mv {{ .xbee.out }}/usr/lib/terminfo {{ .xbee.out }}/usr/lib/terminfo2
#documentation
#mkdir -pv       {{ .xbee.out }}/usr/share/doc/ncurses-6.2
#cp -v -R doc/* {{ .xbee.out }}/usr/share/doc/ncurses-6.2
