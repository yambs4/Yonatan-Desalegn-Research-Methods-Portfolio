# XLSForm Logic Example

> **Generalized template based on your questionnaire. Personally identifiable labels removed.**

## 1. Example XLSForm Snippet

| type | name | label | required | relevant |
|---|---|---|---|---|
| select_one yes_no | consent_hh | Consent provided? | yes | |
| integer | ppl_in_hs | People in household | yes | |
| integer | boys_in_hs | Boys in household | yes | `. <= ${ppl_in_hs}` |
| integer | girls_in_hs | Girls in household | yes | `. <= (${ppl_in_hs}-${boys_in_hs})` |
| note | hh_check | Check totals | | |

---

## 2. Constraint Examples

constraint: `. >= 0 and . <= ${ppl_in_hs}`
constraint_message: Must be less than or equal to household size.

---

## 3. Relevant Logic Examples

relevant: `${consent_hh} = '1'`

---

## 4. Calculation Examples

calculate: total_children
calculation: `${boys_in_hs} + ${girls_in_hs}`

---

## 5. Enumerator Notes
- Ensure household totals match.

---
