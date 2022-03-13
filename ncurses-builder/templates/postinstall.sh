#!/bin/bash
set -e

for lib in ncurses form panel menu ; do
    rm -vf                    {{ .pack.xbeeOut }}/usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > {{ .pack.xbeeOut }}/usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc        {{ .pack.xbeeOut }}/usr/lib/pkgconfig/${lib}.pc
done

echo "INPUT(-lncursesw)" > {{ .pack.xbeeOut }}/usr/lib/libcursesw.so
ln -sfv libncurses.so      {{ .pack.xbeeOut }}/usr/lib/libcurses.so

mv {{ .pack.xbeeOut }}/usr/lib/terminfo {{ .pack.xbeeOut }}/usr/lib/terminfo2
#documentation
#mkdir -pv       {{ .pack.xbeeOut }}/usr/share/doc/ncurses-6.2
#cp -v -R doc/* {{ .pack.xbeeOut }}/usr/share/doc/ncurses-6.2
