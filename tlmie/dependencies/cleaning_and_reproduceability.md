
---

# Data Cleaning & Reproducibility Workflow (Stata Snippets with Fictitious Data)

> NDA compliant
> 
---

## 1. Import Kobo Exports

```Stata
* Import mock Kobo dataset
import delimited "mock_household_survey.csv", clear
rename respondent_id id
```

## 2. Fix Categorical Inconsistencies

```Stata
replace enumerator = "Enumerator_A" if inlist(enumerator, "EnumA", "ENUMA", "enuma")
replace enumerator = "Enumerator_B" if enumerator == "EnumB"
```

## 3. Generate Derived Indicators

```Stata
* Example participation score
egen participation_score = rowtotal(part1 part2 part3 part4), missing
label variable participation_score "Participation Restriction Index
```

## 4. Clean Missing Values

```Stata
foreach v of varlist part1-part4 {
    replace `v' = . if `v' < 0
}
```

## 5. Encode Variables & Labels

```Stata
encode gender, gen(gender_id)
label define gender_lbl 1 "Male" 2 "Female"
label values gender_id gender_lbl
```

## 6. Save Clean Dataset

```Stata
save "clean_mock_survey.dta", replace
```
