# 💳 UPI-Transaction-Analysis

An end-to-end data analytics project on UPI payment data using Excel, SQL (MySQL), Python and Power BI to analyze fraud risk, failed transactions, and customer, merchant and device behavior.

---

## Project Overview

This project analyzes 100,000 UPI transactions (Oct 2020 to Aug 2025) across seven related tables to uncover fraud patterns, transaction failures, control gaps and operational risks. The objective is to validate the data, build a relational database, run statistical tests, create dashboards and turn the findings into business recommendations.

The project demonstrates practical implementation of:

- Data Validation & Quality Logging (Excel)
- Relational Database Design (SQL DDL, MySQL)
- Data Ingestion with Python (Pandas + SQLAlchemy)
- Data Cleaning, Transformation & Exploratory Data Analysis
- Hypothesis Testing
- Interactive Dashboards (Power BI)
- Business Insights & Recommendations

---

## Business Problem Statement

A digital payments platform wants to understand where fraud and failures occur, which customers, devices and merchants carry risk, and how well its fraud alerts and controls work. This project identifies fraud drivers, failure patterns and control gaps to support data-driven decisions on security, operations and customer experience.

---

## Dataset Features

The dataset has seven related tables:

- customer_master (10,000 customers): demographics, region, risk score
- device_info (12,000 devices): device type, app version, rooted status
- upi_account_details (12,000 accounts): bank, account type, status
- merchant_info (500 merchants): category, region, risk score
- upi_transaction_history (100,000 transactions): amount, type, channel, status, fraud flag, failure reason
- customer_feedback_surveys (4,000 records): satisfaction score, issue type
- fraud_alert_history (2,000 alerts): alert type, resolution status and dates

---

## Technologies Used

### Programming Language
- Python
- SQL (MySQL)

### Libraries
- Pandas
- NumPy
- Matplotlib
- Seaborn
- SciPy
- SQLAlchemy
- PyMySQL

### Tools
- Microsoft Excel
- MySQL Workbench
- Power BI
- Jupyter Notebook

---

## Project Workflow

1. Business Understanding & KPI Framework
2. Data Validation in Excel (foreign key checks, conditional formatting, Data Quality Log)
3. Database Design (SQL DDL with primary keys, foreign keys and CHECK constraints)
4. Data Ingestion into MySQL (Pandas + SQLAlchemy)
5. Connecting Python to SQL
6. Data Cleaning, Transformations & Exploratory Data Analysis
7. Statistical Analysis
8. Power BI Dashboard Development
9. Strategic Insights & Recommendations

---

## Statistical Techniques Used

- Descriptive Statistics (Mean, Median, Standard Deviation)
- 95% Confidence Intervals
- Independent T-Test
- One-Way ANOVA
- Chi-Square Test
- Correlation Analysis

---

## Data Visualizations

The project includes:

- Histograms
- Boxplots
- Bar Charts
- Heatmaps
- Scatter Plots
- Power BI Executive Dashboard (KPIs, transaction type, device, region and merchant views)
- Power BI Fraud & Operations Dashboard (fraud amount, open alerts, alerts by type)

---

## Key Insights

- The overall fraud rate is 2.00% (95% CI: 1.92% to 2.09%) and the failure rate is 5.87%.
- Rooted devices are only 3.2% of transactions but hold 32.8% of all fraud. Their fraud rate is 20.7% compared with 1.39% on other devices.
- Fraud is spread evenly across device types, channels, regions and merchant categories (1.8% to 2.2%). Customer and merchant risk scores show virtually no relationship with fraud.
- Failed transactions are spread evenly across segments, and the four failure reasons (incorrect PIN, network error, account blocked, bank down) are each about 25%.
- Control gaps: 7,115 transactions came from blocked or suspended UPI accounts, and 3,818 transactions are dated before the merchant onboarding date.
- 248 fraud alerts (12.4%) are still open, and alerts take 35.4 hours on average to resolve.

---

## Business Recommendations

- Add extra checks (step-up authentication or limits) for rooted devices.
- Rebuild the risk score using device signals.
- Enforce account status and merchant onboarding checks after an audit.
- Set a 24-hour alert resolution deadline and clear the open alerts.
- Run a customer education drive to reduce incorrect PIN failures.

---

## Learning Outcomes

This project helped strengthen practical knowledge of:

- Data Validation & Data Quality Management
- SQL Database Design
- Python for Data Analytics
- Exploratory Data Analysis
- Hypothesis Testing
- Power BI Dashboarding
- Business Problem Solving

---

## Final Conclusion

This analysis showed that fraud on the platform is low and spread evenly, with rooted devices as the one strong and significant risk factor. Existing risk scores, channels, regions and merchant categories do not explain fraud. The project highlights the need for device-based security measures, stronger account and onboarding controls, faster alert resolution and better failure monitoring.

---

## 📁 Files Included

- [UPI_Transaction_Analysis.ipynb](UPI_Transaction_Analysis.ipynb) - Python notebook (ingestion, cleaning, EDA and statistical analysis)
- [UPI_DDL_Script.sql](UPI_DDL_Script.sql) - MySQL database schema
- [UPI_Data_Validation.xlsx](UPI_Data_Validation.xlsx) - Excel data validation workbook and Data Quality Log
- [UPI_Executive_Report_Step9.pdf](UPI_Executive_Report_Step9.pdf) - Executive report with insights and recommendations

---

## 👨‍💻 Author

Akshay

- 💼 LinkedIn: https://linkedin.com/in/akshay-441242311
- 🧑‍💻 GitHub: https://github.com/akshay-code10

💡 Turning data into insights for better business decisions.
