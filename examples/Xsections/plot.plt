#!/usr/bin/env gnuplot
if ( GPVAL_VERSION >= 4.4 && strstrt(GPVAL_TERMINALS, 'wxt') > 0 ) set terminal wxt persist
if ( GPVAL_VERSION >= 4.4 && strstrt(GPVAL_TERMINALS, 'qt') > 0 ) set terminal qt persist
if ( GPVAL_VERSION >= 4.4 && strstrt(GPVAL_TERMINALS, 'wxt') == 0 && strstrt(GPVAL_TERMINALS, 'qt') == 0 ) print "wxt and qt terminals not available, proceeding with default"
if ( GPVAL_VERSION < 4.4 ) print "gnuplot is too old to check for available terminals" ; print "attempting to use wxt terminal and hoping for the best" ; set terminal wxt persist
set key box
set key opaque
set yrange [-0.1:1.1]
##set xrange [.7:6]
set xlabel "log_{10}(E/GeV)"
set ylabel "Muon Flux Ratio"
plot "fluxes_flavor.txt" u 1:8 w l title "Only CC"
replot "fluxes_flavor.txt" u 1:10 w l title "Only NC"

set terminal postscript enhance eps color
set output "plot.eps"
replot


