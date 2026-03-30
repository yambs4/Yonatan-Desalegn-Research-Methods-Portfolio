
---

# XLSForm Logic Example Snippets (NDA compliant)

---

Below are generic examples demonstrating the types of logic used in the original tools without revealing the actual items.

---

## 1. Required + Constraint Example

| type | name | label | required | constraint | constraint_message |
| :--- | :--- | :--- | :--- | :--- | :--- |
| integer | age | Age of respondent | yes | . >= 18 and . <= 99 | Age must be between 18–99 |

---

## 2. Skip Logic Example

| type | name | label | relevant |
| :--- | :--- | :--- | :--- |
| select_one yes_no | has_disability | Does this person have a functional difficulty? | |
| text | describe_disability | Describe the difficulty | ${has_disability} = 'yes' |

---

## 3. Repeat Group Example

| type | name | label | required | constraint | constraint_message |
| :--- | :--- | :--- | :--- | :--- | :--- |
| begin_repeat | household_members | | | | |
| text | member_name | Name of household member | yes | | |
| select_one gender | member_sex | Sex | yes | | |
| integer | member_age | Age | yes | | |
| end_repeat | | | | | |

---

## 4. Calculated Field Example

| type | name | label | required | constraint | constraint_message |
| :--- | :--- | :--- | :--- | :--- | :--- |
| calculate | total_food_sources | | | | ${primary_source} + ${secondary_source} |
| note | food_source_summary | Total sources: ${total_food_sources} | | | |
