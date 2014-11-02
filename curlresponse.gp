set term postscript monochrome eps enhanced 22
set output "curlresponse.eps"
#load "styles.inc"
set size 1,0.65
set bmargin 1.5
set tmargin 2
set lmargin 8
set rmargin 2

set ylabel "CDF"
#set xlabel "Nodes in cluster"
#set xrange [0:4000]
#set xtics ("0.1KB" 0.1, "1KB" 1,"10KB" 10,"100KB" 100, "1MB" 1000)
#set logscale x
set xrange [:0.5]
set grid y
#set ytics 97,0.5,100
set yrange [0:100]
#set xrange [0.1:20000]
#set logscale x
#set xtics font "Arial,11pt"
set key bottom right samplen 1 width 1


set title "cURL total time (seconds)" offset 0,-0.8

plot \
	'data/cdf_nomonitor.txt'  u ($1):($6*100)\
		 w l ls 2 title 'vm w/o fingerprinting',\
 	'data/cdf_monitor.txt'  u ($1):($6*100)\
 		 w l ls 4 title 'vm w/ fingerprinting'

	              
!epstopdf "curlresponse.eps"
!rm "curlresponse.eps"
quit