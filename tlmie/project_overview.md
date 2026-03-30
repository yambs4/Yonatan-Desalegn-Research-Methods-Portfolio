
---

# TLMIE project Endline Evaluation
*Inclusive Governance & Food Security Project — Endline Evaluation*

> The data and outputs of the project are all NDA protected. Presentation of the workflow here is client neutral and all sensitive information has been removed.
---

Role: Lead Researcher (End‑to‑End Evaluation Workflow)

---

## 1. Project overview

The project is a multi‑country disability inclusion initiative implemented in Ethiopia.

This project focused on strengthening inclusive governance and improving food security for marginalized groups through:

- Community‑based training
- Disability‑inclusive facilitation approaches
- Strengthening of local civil society organizations
- Engagement with public authorities
- Capacity building for grassroots advocacy

The endline evaluation assessed whether participation, inclusion, and food security outcomes improved among target households and organizations, using a rigorous mixed‑methods design.

---

## 2. My End‑to‑End evaluation workflow

### 2.1. Evaluation Framework & Indicator Design

I developed an evaluation framework aligned with international evaluation criteria and the project’s theory of change. This included:

- Defining outcome, output, and process indicators
- Mapping indicators to measurement tools
- Establishing an impact estimation strategy using Propensity Score Matching (PSM) due to the absence of baseline microdata

I drafted a full indicator matrix, mapped data sources, and integrated them into the evaluation protocol.

---

### 2.2. XLSForm Development & Digitization

I designed and prepared five digital data‑collection tools:

- Household survey
- Organizational capacity assessment
- Group interview tools
- Public authority inclusion assessment
- Project logic and implementation tracking tool

These were developed in XLSForm format and deployed on Kobo Toolbox. I ensured:

- Proper skip logic and validation
- Multilingual labels
- Enumerator guidance
- Standardized response coding
- Integration of QA elements (timestamps, enumerator ID, etc.)


---

### 2.3. Deployment, Enumerator Training, and Field Data QA

I deployed all tools to Kobo Toolbox and prepared enumerator guidance:
Quality Assurance Processes

- Daily Kobo submissions review
- Consistency checks (location coding, respondent category, age constraints)
- Audio audits for Tools 1 & 4
- GPS and timestamp checks
- Ensured minimum representation per woreda/sub‑city

---

### 2.4. Data Cleaning & Preparation (Stata)

All cleaning and preparation were scripted in Stata using a reproducible .do workflow 

My key data cleaning tasks were:

- Processed raw XLSForm datasets via kobo2stata
- Merged household‑level and member‑level datasets
- Standardized data collector names & IDs
- Generated participation restriction scores (PSS)
- Recoded disability difficulty scales
- Labelled variables, encoded categories
- Constructed panel‑like structures for PSS, food security, and land indicators
- Prepared ready‑to‑merge OPD/CSO and PA‑level datasets

I have generated a clean unified dataset as an output.

---

### 2.5. Analysis & Impact Evaluation

**Descriptive Analysis**

I conducted descriptive analytics across:

- Participant vs non‑participant households
- Individual‑level demographics and characteristics
- Organizational capacities
- Public authority inclusion indicators

**PSM‑Based Impact Estimation**

To estimate project‑attributable effects, I implemented:

- Propensity score estimation
- Matching algorithms
- Average Treatment Effect on the Treated (ATT)
- Robustness checks

This allowed for evidence‑based assessment of outcome changes attributable to project interventions.

---

### 2.6. Visualization & Reporting

**Visualizations**

I produced all analytical figures using Stata, including:

- Participation and restriction categories
- Household livelihood indicators
- Organizational capacity graphics
- Public authority inclusion summaries
PSM visualizations

**Reporting**

I authored the full endline evaluation report, including:

- Executive summary
- Methodology
- Quantitative findings
- Qualitative triangulation
- PSM impact narrative
- Recommendations for future programming
- Annexes (cleaned scripts, tool summaries, methodological notes)

The final deliverable synthesized statistical evidence with qualitative insights into a coherent evaluation narrative.


## Documentation

Analysis Plan [link](dependencies/analysis_plan_template.md)

Sampling Strategy & Power Calculation [link](dependencies/sampling_power_template.md)

XLSForm Logic Example [link](dependencies/xlsform_logic_example.md)

Data Cleaning + Reproducibility Instructions [link](dependencies/cleaning_template.md)

## Visual & non‑text deliverables

- **Visualization code and gallery**
  - [Beneficiary vs Non-Beneficiary Bar Chart](dependencies/visuals/bar_beneficiary_mock.png)
  - [Alternative Pie Chart](dependencies/visuals/pie_beneficiary_mock.png)
  - [Gender viz Beneficiary Status](dependencies/visuals/gender_beneficiary_mock.png)
  - [Household Size Distribution](dependencies/visuals/hh_size_mock.png)
  - [Disability types and level prevalence](dependencies/visuals/disability_panel_mock.png)
  - [Sunburst style distribution graph](dependencies/visuals/sunburst_mock.png)
  - [PSM Impact](dependencies/visuals/psm_att_mock.png)

- [visualizations code](dependencies/visualizations_stata_code.do)

**Graphs gallery**

- XXXXX
- XXXXX

---

## Folder structure

```text
TLMIE_endline/
│
├── data_clean/              # Cleaned datasets (DTA)
├── xlsforms/                # Tool 1–5 XLSForms
├── scripts/                 # Stata .do scripts
├── results/                 # Graphs, tables, outputs
├── report/                  # Final PDF report
└── project_overview.md      # This file
```
