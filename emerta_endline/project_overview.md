
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

Additionally, the evaluation used qualitative data:

- Key Informant Interviews
- 6 case studies
- Most Significant Change interviews
- Project documentation, including manuals and performance reports

### Data, privacy, and ethics

**Data ethics**

- Enumerators obtained verbal informed consent before data collection, and participation in surveys and interviews was voluntary. 
- Given the evaluation took place in areas affected by conflict and political instability, my team monitored security conditions continuously and adapted field activities to ensure participant and enumerator safety.
- Sensitive socioeconomic data (income, poverty, gender roles, financial access) were handled carefully to avoid stigmatization of vulnerable households.
- The evaluation’s design was aligned with client’s gender equality and social inclusion (GESI) principles, collecting gender‑disaggregated data and using approaches that encouraged safe participation of women.


**Data anonymization**

- Personal identifiers were removed from the analytical datasets. Variables such as kebele, woreda, sex, and sector were encoded into categorical numeric values.

**Secure storage & access Control**

- Data was collected on a secured tablet.
- Raw and cleaned datasets were stored in designated directories with strictly controlled access.
- The final evaluation report notes that identifiable producer or MSME information was not disclosed publicly.

**Sensitive data handling**
- Because the dataset contained financial, employment, and poverty‑related variables, only aggregated and anonymized outputs (means, percentages, ATT estimates, graphs) were reported.
- Only variables required for outcome measurement and impact evaluation were retained after cleaning; redundant, unused, or sensitive variables were removed.

Although the raw EMERTA dataset is not publicly shareable due to NDA and privacy constraints, the evaluation methodology aligns strongly with FAIRER principles (Findable, Accessible, Interoperable, Reusable, Ethical, and Reproducible).

My Stata workflow uses deterministic code and reproducible pipelines: `foreach`, `forval`, `append`, `teffects`, `postfile`, `graph export`.
All steps from import → cleaning → inflation adjustment → outcome tracking → PSM → graphing are scripted.

---

## 4. Data cleaning, management, analysis, & reporting

### Tools & software I used

**1. Stata (Primary Statistical Software)**
Stata was the core analytical environment for the entire evaluation pipeline. It was used for:

- Data import, cleaning, harmonization, and restructuring
- Parsing multi‑response survey items using loops (foreach, forval), generating variables, recoding, destringing, and labeling
- Inflation adjustment using CPI‑based deflator construction
- Computation of descriptive statistics, ANOVA, chi‑square tests, and tabulations
- Propensity Score Matching (PSM) using `teffects psmatch` with ATT estimation and balance/overlap diagnostics (`teoverlap`, `tebalance`)
- Poverty Probability Index (PPI) estimation using logit models and predicted probabilities
- Graphing and visualization using twoway, bar, hbar, pie, rcap, and grc1leg/grc1leg2 for multi‑panel plots
- Used `kobo2stata` — for conversion of KoboToolbox data formats to stata (`.dta`) data format and labelling
- Used `grc1leg` and `grc1leg2` — combining graphs with shared legends
- Used `spmap`, `shp2dta`, `mif2dta` — for spatial data handling and map rendering
- Used `schemepack` - for enhanced graph aesthetics for publication‑quality visuals

**2. MS Excel (For Cost‑Benefit Analysis & supplementary work)**

- While I used Stata to prepare the cleaned and inflation‑adjusted datasets, the Cost‑Benefit Analysis (CBA) computations were finalized in Excel.

**3. KoboToolbox (Data Collection Platform)**

- The final evaluation survey data were collected digitally using KoboToolbox forms. The baseline (BL) and and annual progress (AP) data were provided by the client.

**5. GitHub for version‑controlled code production**
- GitHub was used for version conttrol. 

**6. Microsoft Word 
- MS Word used for producing final narrative reports. Document version control for accessing document history and the tracked changes function was used to track client feedback and revisions.

### Reporting Template

The reporting followed a standard evaluation form. It has sections for project logic indicator tracking, for impact analysis reporting, and for OECD-DAC based evaluation reporting. An outline of the reporting template can be found [here](dependencies/reporting_template.md).

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

This ensured reproducibility, environment consistency, and clean separation of input, intermediate, and output data.


---


