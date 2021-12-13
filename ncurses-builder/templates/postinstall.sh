#!/bin/bash
set -e

mkdir -p {{ .pack.exportDir }}/lib/pkgconfig
for lib in ncurses form panel menu ; do
    rm -vf                    {{ .pack.exportDir }}/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > {{ .pack.exportDir }}/lib/lib${lib}.so
    ln -sfv ${lib}w.pc        {{ .pack.exportDir }}/lib/pkgconfig/${lib}.pc
done

rm -vf                     {{ .pack.exportDir }}/lib/libcursesw.so
echo "INPUT(-lncursesw)" > {{ .pack.exportDir }}/lib/libcursesw.so
ln -sfv libncurses.so      {{ .pack.exportDir }}/lib/libcurses.so

rm -fv {{ .pack.exportDir }}/lib/libncurses++w.a

#documentation
#mkdir -v       {{ .pack.exportDir }}/share/doc/ncurses-{{ .pack.version }}
#cp -v -R doc/* {{ .pack.exportDir }}/share/doc/ncurses-{{ .pack.version }}
