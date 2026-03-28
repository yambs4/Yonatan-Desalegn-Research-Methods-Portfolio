
# Visuals Gallery (Stata Sandbox Examples)
> **This gallery contains example figures produced using Stata based on:**

> Built‑in graph types (bar, hbar, pie, histogram, kernel density, combined) using public dummy data (auto.dta).
> Custom ATT-style impact graph replicating the structure of the Speed School impact figure.
> All figures are generated from dummy or publicly available data. No client‑specific data is used.


## 1. Built‑in Stata Graph Examples used in the report
Generated from the standard Stata dataset: auto.dta.

**Figures**

Bar chart: [`fig_bar.png`](fig_bar.png)
Horizontal bar chart: [`fig_hbar.png`](fig_hbar.png)
Pie chart: [`fig_pie.png`](fig_pie.png)
Histogram: [`fig_hist.png`](fig_hist.png)
Kernel density: [`fig_kd.png`](fig_kd.png)
Combined density [`fig_combo.png`](fig_combo.png)

Stata Code:
See [stata_builtin_graphs.do](stata_graphs.do) for the code


## 2. Custom ATT Impact Graph
This figure replicates the impact (ATT + CI) plot style used in the Speed School tracer study.

**Figure**

Impact (ATT-style) graph: [`impact_replication.png`](impact_replication.png)

Stata Code:
See: [stata_custom_att_graph.do](att_impact_graph.do)
