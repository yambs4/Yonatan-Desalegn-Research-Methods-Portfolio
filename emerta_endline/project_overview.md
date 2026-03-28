
---

# EMERTA Project Evaluation & Learning

> Because the EMERTA project data is protected by NDA, this portfolio uses dummy or publicly available datasets to illustrate my full research and analysis workflow.
> The structure, methods, and Stata commands are directly modeled after the real EMERTA evaluation pipeline.

---

## 1. Project Background
The EMERTA Final Evaluation applied a mixed‑methods, multi‑round impact evaluation design built on a rolling baseline survey system. Quantitative data were collected from six MSME cohorts and seven producer cohorts between 2017 and 2024, with each cohort receiving a Baseline (BL), Annual Progress (AP), and Final Evaluation (FE) survey. The project (2016–2024) supported agricultural and gemstone value chain development in Ethiopia's Amhara region. 

It targeted:

- Producer income growth
- MSME performance improvement (EBIT, sales, customers, assets)
- Employment creation (full‑time, part‑time, seasonal)
- Gender equality & environmental sustainability
- System-level capacity building and enabling environment reforms

## 2. My role on the evaluation team as atechnical lead included:

- Running rolling baseline, annual progress, and final evaluation analyses in Stata
- Harmonizing multiple (10 including the endline survey) rounds of survey data
- Cleaning and restructuring large & complex datasets
- Running PSM (Propensity Score Matching) for impact evaluation
- Conducting inflation adjustment (CPI-based deflators)
- Producing intermediate & immediate outcome indicators
- Creating publication-quality graphs (.gph) for the final evaluation reporting
- Running poverty estimation (using PPI method)
- Generating disaggregated results (sector × gender × cohort × survey round)
- Writing final evaluation report

> All examples in this repo use dummy public data for illustration.

---

## 3. Methodology and workflow

### Evaluation design

The EMERTA final evaluation used a cohort‑based rolling baseline design combined with a mixed‑methods analytical framework. This approach enabled both longitudinal and cross‑sectional assessment of project outcomes across producer and MSME beneficiaries.

**Rolling Baseline, Multi‑Round Panel Structure**
The evaluation followed a rolling baseline (BL) system in which new cohorts were enrolled each project year and tracked through:

- Baseline (BL)
- Annual Progress (AP)
- Final Evaluation (FE)

This produced a panel-like structure with up to six MSME cohorts and seven producer cohorts measured repeatedly across time. The design allowed comparison of both short‑term (BL→AP) and long‑term (BL→FE) changes for key outcomes such as income, employment, business performance, and sustainability practices.

**Multi‑Source Mixed‑Methods Approach**

Quantitative data were complemented with:

- Key Informant Interviews (KIIs)
- Focus Group Discussions (FGDs)
- Case studies
- Internal project documentation

This enabled triangulation of quantitative findings with contextual, institutional, and experiential insights.

**Data Harmonization & Cleaning Architecture**
I prepared a Stata code based workflow and created a structured multi‑module cleaning pipeline, including:

- Harmonization of categorical variables (sector, sex, education, location)
- Parsing of multi‑response fields (practices, loan sources, technologies)
- Recoding, destringing, and applying consistent labels across BL/AP/FE datasets
- Constructing survey‑type, sector, and cohort indicators
- Inflation adjustment using CPI series (2017–2024) to derive real monetary indicators

This ensured comparability of data across survey rounds and cohorts.

**Outcome Measurement Framework**

In the evaluation, I tracked three levels of project logic indicators:

- Ultimate outcomes: income, EBIT, employment levels
- Intermediate outcomes: sales performance, customer base, product quality, asset growth
- Immediate outcomes: sustainable agricultural practices, market linkages, access to finance, technology adoption

Indicators were consistently disaggregated by sector, gender, cohort, and survey round.

### Statistical and analytical methodologies used

For this endline evaluation, I combined  descriptive, inferential, and causal impact estimation approaches.

**Descriptive & Inferential Statistics**

- Tabulations and cross‑tabs for outcome indicators (income, employment, business performance)
- ANOVA and chi‑square tests to assess differences across survey round, sector, gender, and cohort
- Multi‑response disaggregation via Stata loops for practices, loan sources, technologies, and market linkages

**Inflation Adjustment**

Monetary values were converted into real 2017 prices using CPI deflators for 2017–2024 to control for Ethiopia’s high inflation. Real values were computed for:

- Revenue
- Expenses
- Net income
- EBIT

**Poverty Probability Index (PPI)**

A logit model was estimated using asset and household‑characteristic variables. Predicted probabilities were mapped to poverty rates using standardized lookup tables for Amhara region.

**Propensity Score Matching (PSM) Impact Evaluation**

To estimate project‑attributable impact, I used `teffects psmatch` in Stata to compute the Average Treatment Effect on the Treated (ATT) for:

- Producer net income
- MSME EBIT
- Full‑time and part‑time employment
- Models included covariates such as woreda, sex, age, education, household size, sector, and cohort. Post‑estimation involved balance and overlap checks.

**Cost‑Benefit Analysis (CBA)**

While calculations were finalized externally, Stata was used to generate the income‑based estimates needed for the CBA. The project produced a strong ROI driven primarily by producer income gains.

---

## 4. Data

### Sources

The evaluation used three primary quantitative datasets generated through the project’s rolling baseline design:

Baseline (BL) - collected at the start of the project.
Annual Progress (AP) - collected annually except for 2020, the COVID-19 year.
Final Evaluation (FE) - collected during this final evaluation, I was responsible for designing the survey instruments, creating the digital data collection forms (Kobo Toolbox based) and managing the data.

Together, these covered 500+ MSMEs and 3,000+ producer households, distributed across six MSME cohorts and seven producer cohorts. The datasets include information on demographics, revenues, expenses, employment, business practices, market linkages, sustainability behaviors, technology use, and access to finance.

I did extensive processing of these variables, including:

- Financial indicators (revenue, COGS, EBIT, net income)
- Business performance indicators (sales, customers, product quality, assets)
- Sustainability & agricultural practices
- Employment (full‑time, part‑time, seasonal, casual)
- Gender and household characteristics
- Loan access, saving behavior, and multi‑response fields

### Data, privacy, and ethics


---

## 4. Data cleaning, management, analysis, & reporting

### Tools & software I used



### Reporting Template




### Deliverables I produced





### High‑level outcomes (client‑neutral & non‑numerical)





---

## 5. Documentation and code snippets (client‑neutral & non‑numerical)


---

## 6. Visual & non‑text deliverables

Dozens of graphs were produced using Stata’s graph, twoway, bar, hbar, and grc1leg commands to visualize:

- Income trends
- Employment levels
- Business performance changes
- PPI distributions
- Gender equality & sustainability indicators

All figures were exported as .gph and PNG files. Links to replications of some of these graphs using Stata is linked in the documentation below.


---

## 7. Folder structure



---


