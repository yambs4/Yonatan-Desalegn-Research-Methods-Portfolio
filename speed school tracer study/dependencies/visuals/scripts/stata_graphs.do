* Modified Stata Code for replicating the graphs used for reporting

* Install dependencies
// ssc install schemepack , replace //uncomment if schemepack is not installed

* Set environment variables
set scheme gg_tableau

** Load dummy data
sysuse auto, clear
gen child_gndr = cond(_n <= _N/2, 1, 2)   // synthetic category
label define g 1 "Male" 2 "Female"
label values child_gndr g

** BAR CHART (analogous to "Sex of child by participation")
graph bar (count) child_gndr, over(foreign) ///
    blabel(bar, format(%9.1f)) ///
    title("Bar Chart Example") name(fig_bar, replace)

graph export "fig_bar.png", replace

** HBAR (analogous to "Birth order by woreda")
gen birth_order = ceil(runiform()*5)

graph hbar (mean) birth_order, over(foreign) ///
    title("Horizontal Bar Example") name(fig_hbar, replace)

graph export "fig_hbar.png", replace

** PIE CHART (analogous to "Instruction language pie chart")
graph pie, over(rep78) ///
    title("Pie Chart Example") name(fig_pie, replace)

graph export "fig_pie.png", replace

** HISTOGRAM (analogous to "Housing index histogram")
histogram price, bin(30) ///
    title("Histogram Example") name(fig_hist, replace)

graph export "fig_hist.png", replace

** KERNEL DENSITY (analogous to roster results kernel density)
kdensity mpg, ///
    title("Kernel Density Example") name(fig_kd, replace)

graph export "fig_kd.png", replace

** KERNEL DENSITY (analogous to roster results kernel density)
kdensity mpg, ///
    title("Kernel Density Example") name(fig_kd, replace)

graph export "fig_kd.png", replace

** COMBINED GRAPH (analogous to combined TLU / housing plots)
twoway (kdensity mpg) (kdensity trunk), ///
    legend(order(1 "MPG" 2 "Price")) ///
    title("Combined Density Example") name(fig_combo, replace)

graph export "fig_combo.png", replace


