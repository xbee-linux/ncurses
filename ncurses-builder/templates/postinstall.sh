#!/bin/bash
set -e

for lib in ncurses form panel menu ; do
    rm -vf                    {{ .xbeeOut }}/usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > {{ .xbeeOut }}/usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc        {{ .xbeeOut }}/usr/lib/pkgconfig/${lib}.pc
done

echo "INPUT(-lncursesw)" > {{ .xbeeOut }}/usr/lib/libcursesw.so
ln -sfv libncurses.so      {{ .xbeeOut }}/usr/lib/libcurses.so

mv {{ .xbeeOut }}/usr/lib/terminfo {{ .xbeeOut }}/usr/lib/terminfo2
#documentation
#mkdir -pv       {{ .xbeeOut }}/usr/share/doc/ncurses-6.2
#cp -v -R doc/* {{ .xbeeOut }}/usr/share/doc/ncurses-6.2
