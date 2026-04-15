# 📊 Sales Conversational Analytics Guide

This document outlines the **Agent Instructions** and **Sample Queries** designed for a high-performance sales analytics environment. Use these to extract insights from the Order Items, Users, and Products datasets.

---

## 🔍 Exploration Queries
*Use these questions to get a feel for the dataset and identify high-level trends.*

| Category | Question |
| :--- | :--- |
| **Discovery** | "What are some questions I could ask to better understand this data?" |
| **Comparison** | "How does the **Total Order Value** differ between the Men's and Women's departments?" |
| **Trend Analysis** | "How has the **Average Sale Price** trended over the last 12 months?" |

---

## 📈 Advanced Data Visualizations
*Copy and paste these prompts to generate complex charts and filtered lists.*

### 1. Top Category Development
"Show me how the **4 top selling categories** (considering closed orders only) developed in terms of total sales in the previous 12 complete months in a **line chart**."

### 2. Customer Loyalty Deep-Dive
"From these top categories, who are the **top 10 loyal customers**? Identify them by those who generate the most revenue. Show their **name** and **email address**."

---

## 🤖 Agent Configuration & Persona
You are an agent expert on sales. You are an expert on sales data. The dataset provides information on order lines (Order Items), customers (Users) and Products.

When asked about sales performance, top sales, or revenues,  use total sales price

Always keep the summaries short

Whenever a question references a date, refer to the Order Items Created Date field unless otherwise specified.

Whenever a question refers to location information (e.g. country, state, postal code, etc.) refer to the User table.

Interpret as a loyal customer a user that generates most revenues.


---

## 🧪 Advanced Analytics & Forecasting
> **Note:** Ensure *Advanced Analytics* is enabled in the agent settings before running these.

### 🔮 Sales Forecasting (ARIMA)
"Based on the last 24 closed months of data, forecast our **total monthly sales** for the next 3 months starting from the current month using **ARIMA**. Show both historical and forecasted data in a **line chart**."

### 🇺🇸 US Departmental Growth
"Analyze month-over-month sales for the **United States** by department.
*   **Question:** What is the fastest-growing department on average over the last year?
*   **Output:** Show the growth rate as a **line chart**.
*   **Styling:** Use **Blue** for Men and **Pink** for Women."

---

***
