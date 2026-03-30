*===============================================================================
* REPLICATION OF EMERTA PROJECT VISUALS 
* Using Publicly Available Data (nlsw88, census, auto)
*===============================================================================

clear all
set scheme tab1 // Matches your environment setting

* 1. INCOME TRENDS (Replicating EBIT/Revenue logic)
* Logic: Using 'gnp96' as a proxy for trend analysis over survey rounds
sysuse gnp96, clear
gen survey_type = cond(date < q(1970q1), 1, cond(date < q(1985q1), 2, 3))
label define svy 1 "Baseline" 2 "Annual Progress" 3 "Final Evaluation"
label values survey_type svy

graph bar (mean) gnp96, over(survey_type) ///
    title("Income Trends (Proxy)") ///
    blabel(bar, format(%9.1f)) ytitle("Mean Income Level") ///
    note("Replicating ebit/gross_revenue tracking logic")
	graph export "1_income_trend.png", replace width(1800)
* 2. EMPLOYMENT LEVELS
* Logic: Tracking full-time/part-time employment using 'nlsw88'
sysuse nlsw88, clear
gen survey_type = ceil(runiform()*3)
label values survey_type svy

gl outcome2 hours age tenure // Proxies for employment indicators
tabstat $outcome2, statistic(mean median sd n) by(survey_type)

graph bar hours, over(survey_type) by(race) ///
    title("Employment Levels (Hours Worked)") ///
    blabel(bar, format(%9.1f))
	graph export "2_employment_levels.png", replace width(1800)
	
* 3. BUSINESS PERFORMANCE CHANGES
* Logic: Box plots to show distribution changes across sectors
sysuse auto, clear
gen sector_type = cond(foreign==0, "Rice", "Vegetables")
encode sector_type, gen(sector_n)

graph box price, over(sector_n) title("Business Performance Distribution") ///
    ytitle("Performance Metric (Price Proxy)")
	graph export "3_business_performance_changes.png", replace width(1800)

* 4. PPI DISTRIBUTIONS (Poverty Probability Index)
* Logic: Replicating your mapping of scores to poverty rates
sysuse nlsw88, clear
gen ppi_score = floor(runiform()*100)
gen pvty_rts = .
* Replicating your mapping logic (Snippet 5)
replace pvty_rts = 0.04741976 if ppi_score >= 50 & ppi_score < 60
replace pvty_rts = 0.01527792 if ppi_score >= 70
replace pvty_rts = 0.85234120 if ppi_score < 30

kdensity pvty_rts, title("PPI Distribution (Poverty Rates)") ///
    xtitle("Poverty Probability") lcolor(black)
	graph export "4_ppi_distributions.png", replace width(1800)

* 5. GENDER EQUALITY & SUSTAINABILITY INDICATORS
* Logic: Pie charts with 'over' and 'by' logic (Snippet 13)
sysuse nlsw88, clear
gen gender_equality = cond(married==1, 1, 0)
label define yn 1 "Yes" 0 "No"
label values gender_equality yn
gen counter = 1

graph pie counter, over(gender_equality) by(race) ///
    pie(1, explode) plabel(_all percent, format(%9.2f)) ///
    title("Gender Equality Indicators") legend(rows(1))
	graph export "5_gesi.png", replace width(1800)

* 6. PSM IMPACT GRAPHS (Propensity Score Matching)
* Logic: Replicating teffects psmatch and overlap/balance visuals (Snippet 6-8)
sysuse nlsw88, clear
* Treatment: Union status; Outcome: Wage; Covariates: age, grade, race
teffects psmatch (wage) (union age grade i.race)

* Replicating overlap plot (as seen in your .gph saves)
teoverlap, title("PSM Overlap: Treatment vs Control") ///
    xtitle("Propensity Score")
	graph export "6_psm_impact.png", replace width(1800)

*==============================================================================
* REPLICATION OF CUSTOM IMPACT GRAPHS
* Using public 'nlsw88' data
*==============================================================================
clear all
sysuse nlsw88, clear

* 1. Prepare Synthetic Cohorts (To mimic your 'year' or 'survey_type' logic)
set seed 1234
gen year = .
replace year = 2018 in 1/700
replace year = 2019 in 701/1400
replace year = 2020 in 1401/l
label var year "Evaluation Year"

* 2. Define Variables (Mimicking $xvars and $attsr)
* Treatment: union status | Outcome: wage | Covariates: age, grade, married
global xvars age grade married i.race

* 3. Postfile Setup (Logic from Snippet: capturing ATT, SE, and CIs)
tempname att_results
postfile `att_results' str20 category year att se ci_lower ci_upper using "replicated_impact.dta", replace

* 4. Loop through 'Years' to calculate impact (Mimicking your forval i = 1/6 logic)
levelsof year, local(years)
foreach y in `years' {
    * Run PSM for the specific cohort
    quietly teffects psmatch (wage) (union $xvars) if year == `y', atet
    
    * Extract results (Logic from your snippet)
    matrix tbl = r(table)
    local att      = tbl[1,1]
    local se       = tbl[2,1]
    local ci_lower = tbl[5,1]
    local ci_upper = tbl[6,1]
    
    * Post to results file
    post `att_results' ("Overall") (`y') (`att') (`se') (`ci_lower') (`ci_upper')
}
postclose `att_results'

* 5. Replicate the Impact Graph (Logic: graph twoway rcap + dot)
use "replicated_impact.dta", clear

graph twoway ///
    (rcap ci_lower ci_upper year, lcolor(gs10)) ///  /* Confidence Intervals */
    (dot att year, msize(medium) mcolor(navy))  ///  /* ATT Estimate */
    , ///
    yline(0, lcolor(red) lpattern(dash)) ///
    xscale(range(2017 2021)) ///
    xlabel(2018(1)2020) ///
    title("Impact on Wages over Time (ATT)") ///
    subtitle("Replicating MSME/Producer Impact Logic") ///
    ytitle("Average Treatment Effect (Wage)") ///
    xtitle("Survey Year") ///
    legend(order(2 "ATT" 1 "95% CI")) ///
    scheme(s2color)

