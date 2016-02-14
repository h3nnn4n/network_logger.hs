#!/usr/bin/gnuplot

#
# Creates a version of a plot, which looks nice for inclusion on web pages
#
# AUTHOR: Hagen Wierstorf
# Edit  : Renan S. Silva

reset

set terminal pngcairo size 1920,1080 enhanced font 'Verdana,9'
#set terminal pngcairo size 800,600 enhanced font 'Verdana,9'
set output 'stats.png'

set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror
set style line 12 lc rgb '#808080' lt 0 lw 1

set grid back ls 12

set style line 1 lc rgb '#8b1a0e' pt 1 ps 1 lt 1 lw 1 # --- red
set style line 2 lc rgb '#5e9c36' pt 2 ps 1 lt 1 lw 1 # --- green
set style line 3 lc rgb '#65393d' pt 3 ps 1 lt 1 lw 1 # --- brown
set style line 4 lc rgb '#3db7c2' pt 4 ps 1 lt 1 lw 1 # --- blue
set style line 5 lc rgb '#f9c386' pt 5 ps 1 lt 1 lw 1 # --- blue
set style line 6 lc rgb '#98cdc5' pt 6 ps 1 lt 1 lw 1 # --- grey-cyan-thing

#set logscale y

#set xrange [100:3250]
set yrange [0  :7000000]

set key top left

set xlabel 'Tamanho'
set ylabel 'Tempo'

plot    'stats_overnight'      using ($0+1):1 title ''   with lines ls 1, \
        'stats_overnight'      using ($0+1):2 title ''   with lines ls 2, \
        "stats_overnight"      using ($0+1):1 notitle    with lines ls 5 smooth bezier, \
        "stats_overnight"      using ($0+1):2 notitle    with lines ls 6 smooth bezier
