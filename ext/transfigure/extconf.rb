require 'mkmf'

$CFLAGS << " -O3 "
$srcs = ["transfigure.c"]

create_makefile("transfigure/transfigure")
