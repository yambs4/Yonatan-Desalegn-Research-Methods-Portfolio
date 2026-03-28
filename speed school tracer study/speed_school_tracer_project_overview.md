# Speed School Tracer Study

> **Note:**  
> This repository contains generalized, reusable templates and artifacts.  
> All client‑specific data, scripts, and documents are stored privately and are covered by NDA.

---

## 1. Project Summary
The study examined the transition, retention, academic performance, and aspirations of children previously enrolled in an accelerated learning program and later integrated into the formal schooling system. The evaluation used a quasi‑experimental impact framework, comparing program graduates (LINK schools) with comparable students in traditional GOVERNMENT schools.

### My role:

I worked as data manager, and quantitative methods lead. My responsiblities included:

- Designing the quantitative survey & XLSForm structure
- Training enumerators and managing field operations
- Overseeing data cleaning, documentation, and integration
- Conducting advanced statistical and econometric analysis (PSM, t‑tests, PCA, household indices, coping indices)
- Construction of welfare, housing, and asset indices (PCA), ensured comparability with a previous tracer study in SNNP, Ethiopia
- Writing analytical sections, methods, and producing visual outputs

---

## 2. Methods & workflow

The tracer study /impact evaluation used a A quasi‑experimental evaluation design with matched treatment (LINK) and comparison (GOVERNMENT) groups. It looked at two level impacts - student and household level.

**I employed the following quant and qual techniques:**

- Propensity Score Matching (PSM) for estimating causal program impact on academic outcomes
- Difference‑in‑Means & t‑tests for welfare, asset, land, and TLU comparisons
- Household & Asset Index Construction (using PCA)
- Reduced Coping Strategy Index (rCSI) computation
- Descriptive and cross‑tab analysis for socio‑demography, grade progression, repetition
- Qualitative thematic analysis of KIIs and FGDs

---

## 3. Data

### Sources
For this project I was solely responsible for end-to-end handling of data and analysis. I have used multiple sources of data. These are,

- Primary survey data (guardian‑child matched pairs)
- Administrative education records (rosters, test scores)
- Structured KIIs, FGDs, school observations
- Standardized literacy & numeracy tests

Data preparation and cleaning required merging, appending and juggling between these data sources

### Data, privacy, and ethics

The PI for this study was responsible for securing ethical clearance. I was responsible for documentation and drafting of the ethical clearance application. For the field survey, both ascent and consents were secured before each survey interviews. Together with the project PI, I was responsible for the paper based forms and integrating these into the electronic servey form.

Data was secured in a password secured Kobo Toolbox server. Enumerator facing Kobo Toolbox accounts were separate from the account used for data management. Data was anonymized before being shared. 

---

## 4. Data cleaning, management, analysis, & reporting

### Tools & software I used

**My workflow incorporated:**

**Stata**: full data cleaning, harmonization, PSM, PCA, rCSI, TLU index, visualizations
**Python**: visualization (heatmaps)
**XLSForm/pyxform**: for survey programming and field deployment
**MS Excel (Microsoft365)**: for sampling frames and randomization
**MaxQDA**: for light thematic analysis
**MS Word (Microsoft365): for report writing
**GitHub** for code version control 

### Reporting Template

I used an MS Word document (.docx) syned to a OneDrive. Version control and tracked changes functions of MS Word were fully utilised as a result. 

### Deliverables I produced

- Cleaned & documented datasets
- Stata analysis scripts (fully annotated, reproducible)
- Python visualization scripts (fully annotated, reproducible)
- XLSForm questionnaire module
- Fieldwork report & preliminary findings
- Comprehensive tracer study report (Executive summary, introduction, methods, analysis, findings, conclusion)
- Statistical appendices & summary tables
- Analytical narratives for schooling pathways, welfare, coping, and performance outcomes

### High‑level outcomes (client‑neutral & non‑numerical)

**My analysis highlighted:**

- Program participants originated from significantly more vulnerable households (poorer housing, lower assets, higher food insecurity).
- Despite vulnerabilities, they showed strong educational aspirations.
- Program graduates transitioned into higher grades within the formal system due to acceleration.
- School experience indicators were mixed, with strengths in engagement (e.g., group work) but limitations in resource availability.
- Impact analysis showed positive but location‑specific learning gains, with one district showing measurable improvement.
- Repetition rates remained a challenge, suggesting need for targeted support during transition.

---

## samples and artifacts

- **Generic Analysis Plan Template** 
  ./analysis_plan_template.md

- **Sampling Strategy & Power Calculation Example**  
  ./sampling_power_template.md

- **XLSForm Logic Example**  
  ./xlsform_logic_example.md

**Quantitative analysis Templates**

- **Data Cleaning + Reproducibility Workflow**  
  ./python_cleaning_template.md

- **PSM template for generating impact estimates (Stata)**  
  ./stata_did_template.md

---

## 5. Visual & non‑text deliverables

- **Generic Visuals**  
  ./visuals_gallery.md

- **QGIS/ArcGIS Public Boundary Map Example**  
  ./gis_examples.md

- **Training / TOT Toolbox Slides (Generic)**  
  ./training_toolbox.md

- **Redacted Methods‑Only Excerpts**  
  ./methods_section_redacted.md

---

## 6. Folder Structure
```
project_root/
├── recruitment/
├── ethical_clearance/
├── tools/
│   ├── paper_based/
│   └── forms/
├── data/
│   ├── raw/
│   └── cleaned/
├── code/
├── output/
│   ├── tables/
│   └── visualizations/
├── report/
│   ├── live_documents/
│   ├── submissions/
│   ├── feedback_and_revisions/
│   └── slide_decks/
└── documents/
```

