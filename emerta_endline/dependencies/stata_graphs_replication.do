
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

* 3. BUSINESS PERFORMANCE CHANGES
* Logic: Box plots to show distribution changes across sectors
sysuse auto, clear
gen sector_type = cond(foreign==0, "Rice", "Vegetables")
encode sector_type, gen(sector_n)

graph box price, over(sector_n) title("Business Performance Distribution") ///
    ytitle("Performance Metric (Price Proxy)")

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

* 6. PSM IMPACT GRAPHS (Propensity Score Matching)
* Logic: Replicating teffects psmatch and overlap/balance visuals (Snippet 6-8)
sysuse nlsw88, clear
* Treatment: Union status; Outcome: Wage; Covariates: age, grade, race
teffects psmatch (wage) (union age grade i.race)

* Replicating overlap plot (as seen in your .gph saves)
teoverlap, title("PSM Overlap: Treatment vs Control") ///
    xtitle("Propensity Score")

* Replicating balance plot
tebalance density age, title("Covariate Balance: Age")
