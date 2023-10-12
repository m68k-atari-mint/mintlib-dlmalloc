#!/bin/bash -eux
# -e: Exit immediately if a command exits with a non-zero status.
# -u: Treat unset variables as an error when substituting.
# -x: Display expanded script commands

# use as build.sh <dest dir> (i.e. the files will be installed to <dest dir>/<sys-root>/usr)

export PREFIX="$($TOOL_PREFIX-gcc -print-sysroot)/opt/mintlib-dlmalloc"

make CROSS_TOOL=${TOOL_PREFIX} SHELL=/bin/bash
make CROSS_TOOL=${TOOL_PREFIX} prefix="${1}${PREFIX}" install
