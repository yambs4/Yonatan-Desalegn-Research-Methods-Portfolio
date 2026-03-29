
---

# XLSForm based workflow

The survey used an XLSForm to deploy the producer and MSME survey questionnaire. Below, I provide excerpts showing logic built into the electronic forms deployed for data collection.

> All tables avoid code inside cells (per GitHub rendering rules) and remain NDA‑compliant.

---

## 1. Producer Survey XLSForm table excerpts

### 1.1 Conditional Display Based on Agricultural Sector

| type | name | relevant |
| :--- | :--- | :--- |
| select_one sector | sector | |
| integer | rice_area | `${sector} = 'rice'` |
| integer | veg_area | `${sector} = 'vegetables'` |

This mirrors sector‑specific branching used in the real form: agricultural modules are enabled only when a respondent selects that sector category.

### 1.2 Seasonal production logic

| type | name | relevant |
| :--- | :--- | :--- |
| select_one yes_no | produces_multiple | |
| **begin_repeat** | **seasons** | `${produces_multiple} = 'yes'` |
| integer | production_volume | |
| select_one season_name | season_name | |
| **end_repeat** | | |

The repeat group structure reflects how seasonal production questions were collected.

### 1.3 Constraint on land area reporting

| type | name | constraint | constraint_message |
| :--- | :--- | :--- | :--- |
| decimal | land_size | `. >= 0 and . <= 10` | "Enter a value between 0 and 10 ha" |

This mirrors typical minimum/maximum validation for land, inputs, or livestock quantities.

### 1.4 Multi‑select technology adoption logic

| type | name | relevant |
| :--- | :--- | :--- |
| select_multiple tech_list | tech_used | |
| integer | tech_year_acquired | `selected(${tech_used}, 'solar_pump')` |

This pattern mirrors how the real form captured different technology types and linked follow‑ups.

---

## 2. MSME Survey – Example XLSForm Logic Snippets

### 2.1 Employment disaggregation by employment type

| type | name | relevant |
| :--- | :--- | :--- |
| integer | full_time_emp | |
| integer | part_time_emp | |
| integer | seasonal_emp | |
| note | emp_total_note | `${full_time_emp} + ${part_time_emp}` |

The logic mirrors how MSMEs reported multiple employment categories.

### 2.2 Conditional MSME module based on business stage

| type | name | relevant |
| :--- | :--- | :--- |
| select_one stage_options | business_stage | |
| **begin_group** | **growth_group** | `${business_stage} = 'growth'` |
| integer | new_customers | |
| integer | new_products | |
| **end_group** | | |

Reflects the real conditional modules depending on whether MSMEs were in start‑up, growth, or maturity stages.

### 2.3 Capturing monthly EBIT with auto‑calculation

| type | name | calculation |
| :--- | :--- | :--- |
| integer | revenue | |
| integer | cogs | |
| **calculate** | **ebit** | `${revenue} - ${cogs}` |

This mirrors the EBIT proxy your team generated during analysis.

### 2.4 Conditional logic for gender‑related questions

| type | name | relevant |
| :--- | :--- | :--- |
| select_one yes_no | woman_owner | |
| **begin_group** | **gender_barriers** | `${woman_owner} = 'yes'` |
| select_multiple barriers | gender_challenges | |
| **end_group** | | |

This mirrors how gender‑specific modules were activated only when relevant.

---

## 3. Additional Logic Snippets Common to Both Forms

### 3.1 Skip logic based on previous responses

| type | name | relevant |
| :--- | :--- | :--- |
| select_one yes_no | received_training | |
| text | training_provider | `${received_training} = 'yes'` |

### 3.2 Internal consistency constraint

| type | name | constraint |
| :--- | :--- | :--- |
| integer | sales | `. >= ${production_volume}` |

### 3.3 Dynamic relevance using selected()

| type | name | relevant |
| :--- | :--- | :--- |
| select_multiple assets_list | assets_owned | |
| integer | num_silos | `selected(${assets_owned}, 'grain_silo')` |



