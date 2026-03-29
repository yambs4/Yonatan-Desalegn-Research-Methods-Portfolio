
---

# Stata workflow

---

## 1. Data Import & Setup

```Stata
-----------------------------------------------------
* 1. SETUP: Globals, directories, and loading data *
-----------------------------------------------------
clear all
set more off

* Global paths (dummy example)
global bl     "01_data_dummy/baseline/"
global ap     "01_data_dummy/annual_progress/"
global fe     "01_data_dummy/final_evaluation/"
global out    "03_outputs/"
global figs   "$out/sample_figures/"
global logs   "$out/logs/"

* Load dummy baseline dataset
use "$bl/dummy_bl.dta", clear

* Inspect data structure
describe
summarize
```

## 2. Cleaning & Harmonization

```Stata
-----------------------------------------------------
* 2. HARMONIZATION OF KEY VARIABLES               *
-----------------------------------------------------
* Sector harmonization
recode sector_type ("rice"=1 "vegetables"=2 "gemstone"=3), gen(sector)

* Sex harmonization
recode sex ("Male"=1 "Female"=2), gen(owner_sex)

* Survey round identifier
gen survey_type = 1   // Baseline
```

### Multi‑response parsing (dummy version of the real workflow)

```Stata
* Parse multi-response practices field (dummy example)
split practices, parse(";")

foreach p of varlist practices* {
    gen prc_`p' = (`p' != "")
    label var prc_`p' "Practice: `p'"
}
```

## 3. Combining Datasets Into a Rolling‑Baseline Panel
```Stata
-----------------------------------------------------
* 3. APPENDING MULTIPLE SURVEY ROUNDS             *
-----------------------------------------------------
tempfile master
save `master'

* Append annual progress
use "$ap/dummy_ap.dta", clear
gen survey_type = 2
append using `master'
save `master', replace

* Append final evaluation
use "$fe/dummy_fe.dta", clear
gen survey_type = 3
append using `master'
save `master', replace
```

## 4. Inflation Adjustment (CPI Deflators)
```Stata
-----------------------------------------------------
* 4. INFLATION ADJUSTMENT USING CPI DEFLATORS     *
-----------------------------------------------------

* Dummy CPI table
gen cpi = .
replace cpi = 100 if year == 2017
replace cpi = 117 if year == 2018
replace cpi = 132 if year == 2019
replace cpi = 158 if year == 2020
replace cpi = 190 if year == 2021
replace cpi = 255 if year == 2022
replace cpi = 298 if year == 2023

* Real (inflation-adjusted) income
gen real_income = income_total / (cpi/100)
label var real_income "Inflation-adjusted net income"
```

## 5. Constructing Outcome Indicators

```Stata
-----------------------------------------------------
* 5. OUTCOME INDICATORS                          *
-----------------------------------------------------
* Enterprise-level indicator examples
gen ebit = revenue - cogs
egen full_time = rowtotal(ft_emp1 ft_emp2 ft_emp3)
egen part_time = rowtotal(pt_emp1 pt_emp2)
egen seasonal  = rowtotal(seas_emp1 seas_emp2)

* Producer performance indicators
recode sales_change ("Increase"=1 "Same"=0 "Decrease"=-1), gen(sales_chg)
recode customers_change ("Increase"=1 "Same"=0 "Decrease"=-1), gen(cust_chg)
```

## 6. Poverty Probability Index (PPI)
```Stata
-----------------------------------------------------
* 6. POVERTY PROBABILITY INDEX (PPI)              *
-----------------------------------------------------

logit poor roof_type floor_type toilet_type light_source ///
      cooking_fuel hh_assets house_ownership

predict ppi_prob
gen ppi = round(ppi_prob * 100)

label var ppi "Poverty Probability Index (0–100)"
```

## 7. Propensity Score Matching (PSM)
```Stata
-----------------------------------------------------
* 7. PSM IMPACT EVALUATION                       *
-----------------------------------------------------

* Treatment indicator (dummy)
gen treated = (cohort <= 3)

* PSM model: effect of treatment on real income
teffects psmatch (real_income) ///
    (treated age owner_sex sector household_size), ///
    atet vce(robust)

* Diagnostics
tebalance summarize
teoverlap
```

## 8. Statistical Testing
```Stata
-----------------------------------------------------
* 8. INFERENTIAL STATISTICS                       *
-----------------------------------------------------

* ANOVA across survey rounds
anova real_income survey_type

* Sector-level chi-square tests
tab sales_chg sector, chi2
tab cust_chg  sector, chi2
``
````
## 9. Visualization & Exporting Graphs
```Stata
-----------------------------------------------------
* 9. GRAPHING & VISUALIZATION                    *
-----------------------------------------------------

* Income trend (dummy)
twoway (line real_income year), ///
    title("Real Income Over Time") ///
    xtitle("Year") ytitle("Real Income")

graph export "$figs/real_income_trend.png", replace

* Sector comparison
graph bar ebit, over(sector) ///
    title("EBIT by Sector (Dummy Data)")

graph export "$figs/ebit_sector.png", replace
```
