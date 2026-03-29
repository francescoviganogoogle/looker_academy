# 🚀 Looker Project Lifecycle: Initial Setup


## 1. Define Views
Following the "Import from a Public Dataset" workflow, import the following tables from the source schema to initialize your project:

*   [ ] `order_items`
*   [ ] `orders`
*   [ ] `users`
*   [ ] `products`
*   [ ] `inventory_items`

---

## 2. Exploratory Analysis & Modeling
Once the views are generated, define the following Explores in your model file to validate the data structure:

### 👤 User Demographics
*   **Explore:** `users`

Define an Explore for the users table and try to analyze how many users per country.

### 📦 Order Operations
*   **Explore:** `order_items`

 Define an Explore for the order_items table and try to analyze how many orders per order status.

---

> **Tip:** When creating these Explores, ensure that primary keys are correctly defined in the underlying views to avoid symmetric aggregate issues during analysis.

