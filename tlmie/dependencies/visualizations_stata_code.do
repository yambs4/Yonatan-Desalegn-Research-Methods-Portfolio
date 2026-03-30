***********************************************
* 1. GENERATE FICTITIOUS HOUSEHOLD DATA
***********************************************

clear
set obs 400

* respondent and household identifiers
gen id = _n
gen resp_cat = ceil(runiform()*2)     // 1 beneficiary, 2 non-beneficiary
gen resp_sex = ceil(runiform()*2)     // 1 male, 2 female
gen location = ceil(runiform()*4)     // 4 generic clusters
gen woreda   = ceil(runiform()*10)

* demographic
gen hh_numb = ceil(runiform()*8)

* create a simple counter variable
gen counter = 1

* participation items
foreach v in work_eq work_hard econ_contrib visit_out festivals social_act respect visit_ppl move_around pub_places hh_work opinion meet_ppl agri_work land_dec money_dec {
    gen `v' = ceil(runiform()*3)   // categories 1–3
}

* disability difficulty items
foreach v in see_diff hear_diff walk_diff mem_diff care_diff comm_diff {
    gen `v' = ceil(runiform()*4)
}

save "mock_household.dta", replace


***********************************************
* 2. PARTICIPATION RESTRICTION SCORE — MOCK
***********************************************

use "mock_household.dta", clear

local pssvars  work_eq work_hard econ_contrib visit_out festivals social_act respect ///
               visit_ppl move_around pub_places hh_work opinion meet_ppl agri_work land_dec money_dec

foreach v of local pssvars {
    gen pss_`v' = .
    replace pss_`v' = 0 if `v' == 1
    replace pss_`v' = 1 if `v' == 2
    replace pss_`v' = 2 if `v' == 3
}

egen pss_score = rowtotal(pss_*)

* grade categories
recode pss_score ///
    (0/5 = 1 "No restriction") ///
    (6/12 = 2 "Mild") ///
    (13/24 = 3 "Moderate") ///
    (25/40 = 4 "Severe"), gen(pss_cat)
	
	
***********************************************
* 3. REPLICATED GRAPHS
***********************************************

* 3.1 Beneficiary vs Non-Beneficiary Bar Chart

graph bar (count) counter, over(resp_cat, relabel(1 "beneficiary" 2 "non-beneficiary")) ///
    blabel(bar, format(%9.0f)) ///
    ytitle("Count") ///
    name(bar_beneficiary_mock, replace)
	graph export "bar_beneficiary_mock.png" , replace
	
* 3.2 Alternative Pie Chart
qui count
local N = r(N)

label define resp_cat 1 "beneficiary" 2 "non-beneficiary"
label val resp_cat resp_cat

graph pie counter, over(resp_cat) ///
    plabel(_all percent, format(%4.1f)) ///
    title("Sample Distribution (Mock Data)" "N=`N'") ///
    name(pie_beneficiary_mock, replace)
	graph export "pie_beneficiary_mock.png" , replace
	
* 3.3 Gender × Beneficiary Status
graph bar (percent) counter, over(resp_cat, relabel(1 "beneficiary" 2 "non-beneficiary")) over(resp_sex) ///
    blabel(bar, format(%4.1f)) ///
    ytitle("Percent") ///
    name(gender_beneficiary_mock, replace)
	graph export "gender_beneficiary_mock.png" , replace
	
* 3.4 Household Size Distribution
graph bar (percent) counter, over(resp_cat, relabel(1 "beneficiary" 2 "non-beneficiary")) over(hh_numb) ///
    blabel(bar, format(%4.1f)) ///
    ytitle("Percent") ///
    name(hh_size_mock, replace)
	graph export "hh_size_mock.png" , replace
	
* 3.5. DISABILITY MULTI-PANEL GRAPH 
label var see_diff "See"
label var hear_diff "Hear"
label var walk_diff "Walk"
label var mem_diff "Memory"
label var care_diff "Self care"
label var comm_diff "Communication"

local disability see_diff hear_diff walk_diff mem_diff care_diff comm_diff

foreach v of local disability {
    quietly tab `v' resp_cat, chi2

    graph bar (percent) counter, over(`v') over(resp_cat , relabel(1 "beneficiary" 2 "non-beneficiary")) ///
        blabel(bar, format(%4.1f)) ///
        yscale(range(0 100)) ///
        ytitle("Percent") ///
        note("`:var label `v''") ///
        name(`v'_mock, replace)
}
grc1leg2 see_diff_mock hear_diff_mock walk_diff_mock mem_diff_mock care_diff_mock comm_diff_mock, ///
    col(3) xcomm ycomm ///
    subtitle("Difficulty Categories (Fictitious Data)") ///
    name(disability_panel_mock, replace)
graph export "disability_panel_mock.png" , replace

* 3.6. UNBURST-STYLE REPLICATION
cap which sunburst // only runs if installed

gen mem_rel = ceil(runiform()*5)
gen mem_sex = ceil(runiform()*2)

sunburst counter, ///
    by(resp_cat mem_sex mem_rel) ///
    share colorprop palette(piyg) ///
    name(sunburst_mock, replace)
	graph export "sunburst_mock.png" , replace

* 3.7. PSM IMPACT PLOT
clear
set obs 100

gen estimate_id = _n
gen att = rnormal(0, .2)    // simulated ATT around zero

twoway (scatter att estimate_id, mcolor(navy)) ///
       (lfit att estimate_id, lcolor(red)), ///
       title("Mock ATT Estimates (Simulated)") ///
       xtitle("Matched Observation Index") ///
       ytitle("ATT") ///
       name(psm_att_mock, replace)
		graph export "psm_att_mock.png" , replace

