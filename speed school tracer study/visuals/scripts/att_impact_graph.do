* Install dependencies
// ssc install schemepack , replace

* Set environment variables
set scheme gg_tableau

* 1. Load dummy data
sysuse auto, clear

* Create synthetic subject scores similar to "Average, MT, English, Math"
gen avg_score   = (mpg/2)        + rnormal(0, 1)
gen mt_score    = (weight/1000)  + rnormal(0, 1)
gen eng_score   = (price/3000)   + rnormal(0, 1)
gen math_score  = (turn/10)      + rnormal(0, 1)

* Create binary "treatment" variable similar to LINK/GOV
gen treat = foreign == 1
label define treatlbl 0 "Control" 1 "Treated"
label values treat treatlbl

* 2. Compute placebo ATTs and confidence intervals
program define att_ci, rclass
    syntax varname
    ttest `varlist', by(treat)
    return scalar att  = r(mu_2) - r(mu_1)
    return scalar ll   = r(mu_2) - r(mu_1) - invttail(r(df),0.025)*r(se)
    return scalar ul   = r(mu_2) - r(mu_1) + invttail(r(df),0.025)*r(se)
end

tempfile results
postfile handle str20 subject att ll ul using `results'

foreach s in avg_score mt_score eng_score math_score {
    quietly att_ci `s'
    local att = r(att)
    local ll  = r(ll)
    local ul  = r(ul)
    post handle ("`s'") (`att') (`ll') (`ul')
}

postclose handle

use `results', clear

* 3. Prepare axis labels
gen x = _n
label define subj 1 "Average" 2 "MT language" 3 "English" 4 "Maths"
label values x subj

* 4. Create impact plot (ATT + CI)
twoway ///
    (rcap ll ul x, lcolor(blue*0.6) lwidth(medthick)) ///
    (scatter att x, msymbol(O) mcolor(orange) msize(medlarge) ///
        mlab(att) mlabpos(12) mlabcolor(black)) ///
    , ytitle("Impact Estimate (ATT-like)") ///
      xtitle("Subjects") ///
      ylabel(, angle(horizontal)) ///
      xscale(range(0.5 4.5)) ///
      xlabel(1 2 3 4, valuelabel) ///
      yline(0, lcolor(red) lpattern(dash)) ///
      legend(order(1 "95% CI" 2 "ATT (placebo)") pos(6)) ///
      title("Impact Graph (Replicating SSP Style)")

graph export "impact_replication.png", replace width(1800)
