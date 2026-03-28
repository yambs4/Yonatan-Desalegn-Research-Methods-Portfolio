
# Sampling & Power Calculation Template

> **Generalized template. Client‑specific values are omitted and covered by NDA.**

## 1. Purpose
Reusable framework for computing sample sizes for RCTs, quasi‑experimental studies, cluster surveys, and impact evaluations.

---

## 2. Required Inputs
- Minimum detectable effect (MDE)  
- Significance level (α = 0.05 typical)  
- Power (1−β = 0.8)  
- Standard deviation (SD)  
- ICC (clustered designs)  
- Average cluster size (m)  
- Treatment:Control ratio  

---

## 3. Design Effect
$$DE\ =\ 1+\ \left[\left(cluster\ size\ -1\right)\ast i c c\right]$$

---

## 4. Sample Size Formula (Continuous Outcome)
$$n=\left[\left(\frac{z_{1-\alpha}+z_{1-\beta}}{\mu_0-\mu_1}\right)^2{2\sigma}^2\right]\ast\ DE$$

---

## 5. Example Output Table

| Parameter         | Value |
|------------------|-------|
| Alpha            | 0.05 |
| Power            | 0.80 |
| ICC              | 0.10 |
| Cluster size (m) | 7 |
| SD               | 1.0 |
| MDE              | 0.25 |
| Required N/arm   | <<Calculated>> |

---

## 6. Notes
- Inflate for non‑response (5–15%).  
- For proportions, replace SD with `sqrt[p*(1−p)]`.  
- For unequal cluster sizes, use weighted DE.

---
