# Data Cleaning Template (Stata-Based)

> **Generalized template derived from your cleaning scripts. Client-specific items replaced.**

---

## 1. Load Raw Data

stata
```Stata
use "data/raw_survey.dta", clear
```
## 2. Standardize Enumerator Metadata
```Stata
decode intrvw_nm, gen(interviewer)
recode intrvw_sx (1=2) if interviewer=="ENUM_A"
```
## 3. Clean & Normalize Text Fields
```Stata
replace school = "School_A" if inlist(school, "Skool A", "School A.", "SCH_A")
replace kebele = "Kebele_A" if inlist(kebele, "Kebele A.", "Kb A")
```
## 4. Household Consistency Checks
```Stata
local hhvars ppl_in_hs chldrn_in_hs boys_in_hs grls_in_hs
foreach v of local hhvars {
    assert `v' >= 0
    tab `v'
}
```
## 5. Merge Parallel Variables Across Groups
```Stata
gen caretaker = caretaker_l
replace caretaker = caretaker_g if resp_ctgry=="GOV"
label var caretaker "Primary caretaker (harmonized)"
```
## 6. Derived Indicators
```Stata

* Tropical Livestock Units
gen TLU = oxen*1.1 + cows*1 + goats*0.09 + sheep*0.1 + donkeys*0.5
```
## 7. Index Construction (Example: Housing Index)
```Stata

pca wall_mtrl roof_mtrl flr_mtrl ktchn_typ
predict housing_i
sum housing_i, detail
replace housing_i = (housing_i - r(min)) / (r(max) - r(min))
```
## 8. Export Cleaned Data
```Stata
save "data/clean_survey.dta", replace
```

