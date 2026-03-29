
---

# Survey flow charts for producer and MSME survey forms

---

Below are two clear survey‑flow charts—one for the Producer Survey and one for the MSME Survey—based on the XLSForm logic patterns you shared earlier.

> These are fully NDA‑safe, client‑neutral, and structured so you can paste them directly into GitHub Markdown.

---

## 1. Producer Survey – Survey Flow Chart

```mermaid
flowchart TD

    A[Start] --> B[Consent]
    B -->|No| Z1[End Survey]
    B -->|Yes| C[Respondent Identification]

    C --> D[Household Demographics]

    D --> E[Select Primary Sector]

    E -->|Rice| F1[Rice Production Module]
    E -->|Vegetables| F2[Vegetable Production Module]
    E -->|Other| F3[General Production Module]

    F1 --> G{Produces Multiple Seasons?}
    F2 --> G
    F3 --> G

    G -->|Yes| H[Repeat Group: Season Details]
    G -->|No| I[Continue]

    I --> J[Sales & Marketing]
    J --> K[Sustainability & Practices]
    K --> L[Technology Adoption]
    L --> M[Finance & Saving]
    M --> N[Training & Services]
    N --> O[Gender & Decision-Making]

    O --> P[Feedback & Closure]
    P --> Z[End]
```

--- 

## 2. MSME Survey – Survey Flow Chart 

```mermaid
flowchart TD

    A[Start] --> B[Consent]
    B -->|No| Z1[End Survey]
    B -->|Yes| C[Enterprise Identification]

    C --> D[Ownership & Structure]

    D --> E[Select Business Stage]

    %% Business stage branching
    E -->|Startup| F1[Startup Module]
    E -->|Growth| F2[Growth Module]
    E -->|Maturity| F3[Maturity Module]

    F1 --> G[Employment]
    F2 --> G
    F3 --> G

    G --> H["Financial Performance<br>(Revenue/COGS → EBIT Calculation)"]

    H --> I[Products, Customers & Sales]

    I --> J[Market Linkages]

    J --> K[Technology Use]

    K --> L[Environment & Sustainability]

    L --> M{Is MSME Woman-Owned?}
    M -->|Yes| N[Gender Barriers Module]
    M -->|No| O[Skip to Finance]

    N --> O[Finance & Services]
    O --> P[Shock Response & Business Challenges]

    P --> Q[Feedback & Closure]
    Q --> Z[End]
```
