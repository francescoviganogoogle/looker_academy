# `README.md`

This repository follows an incremental learning path. Each branch contains the solution to a specific exercise, building toward a complete end-to-end Looker modeling and analytics solution for the **Fashion.ly** use case.

---

## 🏗️ Learning Methodology
The academy is structured so that you move from a blank project to a fully governed semantic layer. To follow the progression, you can switch between branches to see the state of the codebase at the end of each session.



---

## 🌿 Branch List & Progression

Refer to the table below to find the LookML code associated with each stage of the academy.

| Branch Name | Week / Session | Description & Key Features |
| :--- | :--- | :--- |
| `001_empty` | **Week 2 / Session 4 ** | Initial project structure and connection configuration. |
| `002_getting_started` | **Week 2 / Session 5a** | Basic View creation (`orders`, `users`, `products`) and initial Explore definitions. |
| `003_views_explore_joins` | **Week 2 / Session 5b** | Advanced LookML: Joins, complex measures (e.g., `total_gross_margin`), and dimension groups for date analysis. |
| `004_looker_dashboards` | **Week 2 / Session 6** | Transformation of User-Defined Dashboards into **LookML Dashboards** (e.g., Business Pulse). |

---

## 👗 Use Case: Fashion.ly
The project simulates a real-world BI implementation for **Fashion.ly**, an e-commerce clothing retailer.

### **Data Foundations**
The solution leverages the `thelook_ecommerce` public dataset in BigQuery. The model tracks the entire customer lifecycle:
*   **User Acquisition:** From signup (`created_date`) to retention.
*   **Order Fulfillment:** From order placement to shipping and delivery.
*   **Inventory Flow:** Tracking cost and margins from the moment items enter the warehouse.


---

## 🛠️ How to use this repository
1.  **Clone the Repo:** you might consider cloning this project in your Looker instance or just review the code using Github or your IDE of choice.
2.  **Practice:** Attempt the activities listed in the Academy Agenda.
3.  **Verify:** If you get stuck, inspect the solution code for that specific exercise.

---

> **Note:** Ensure you have your Google Cloud Service Account JSON key ready and a dedicated BigQuery dataset for Persistent Derived Tables (PDTs) before starting Week 2.
