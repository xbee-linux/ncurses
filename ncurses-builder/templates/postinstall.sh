#!/bin/bash
set -e

mkdir -p {{ .pack.exportDir }}/usr/lib/pkgconfig
for lib in ncurses form panel menu ; do
    rm -vf                    {{ .pack.exportDir }}/usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > {{ .pack.exportDir }}/usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc        {{ .pack.exportDir }}/usr/lib/pkgconfig/${lib}.pc
done

rm -vf                     {{ .pack.exportDir }}/usr/lib/libcursesw.so
echo "INPUT(-lncursesw)" > {{ .pack.exportDir }}/usr/lib/libcursesw.so
ln -sfv libncurses.so      {{ .pack.exportDir }}/usr/lib/libcurses.so

rm -fv {{ .pack.exportDir }}/usr/lib/libncurses++w.a

#documentation
#mkdir -pv       {{ .pack.exportDir }}/usr/share/doc/ncurses-6.2
#cp -v -R doc/* {{ .pack.exportDir }}/usr/share/doc/ncurses-6.2
