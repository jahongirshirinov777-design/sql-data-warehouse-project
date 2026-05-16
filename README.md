# SQL Data Warehouse: End-to-End Sales Analytics
Engineered by hand and AI across Staging, Silver, and Gold layers—proving that autonomous AI cannot manage the complex schema dependencies, structural debugging, and architectural trade-offs of a true end-to-end data warehouse. 

## 📊 Project Overview
This project demonstrates the architecture and implementation of a professional **Data Warehouse**. It showcases the transformation of raw transactional data into a high-performance **Star Schema** (alternative to Snowflakw Schema) optimized for business intelligence and analytics.

* **Data Architecture:** Designed using the Medallion Architecture framework (Bronze, Silver, Gold).
* **ETL Pipelines:** Automated workflows for data extraction, robust cleansing, structural transformation, and final data enrichment.
* **Data Modeling:** Structured dimensional modeling utilizing highly optimized Fact and Dimension tables to facilitate seamless analytical querying.

---

## 🛠️ Tools Used
* **Database Engine:** SQL Server Express
* **IDE / Management Tool:** SQL Server Management Studio (SSMS)
* **Version Control:** Git & GitHub
* **Text Editor / Scripting:** Notepad++
* **System Architecture:** Draw.io
* **Project Management & Documentation:** Notion

---

## 📋 Project Requirements & Specifications

### Objective
Develop a modern data warehouse using SQL Server to consolidate multi-source sales data, eliminating silos to enable high-fidelity analytical reporting and data-driven decision-making.

### Specifications:
* **Data Sources:** Seamless ingestion of relational data from two separate source business systems (**CRM** and **ERP**), provided as flat CSV files.
* **Data Quality:** Systematic cleansing, type enforcement, anomaly detection, and handling of structural integrity issues (e.g., missing keys, irregular formatting) prior to storage.
* **Integration:** Blending disparate operational sources into a unified, user-friendly data model engineered strictly for high-performance business queries.
* **Scope:** Focused on delivering a high-performance snapshot of the latest available data state. To ensure optimal analytical performance and scope constraint, historical data tracking (historization/SCD) is not required.

---

## 🏗️ Data Architecture

The core data pipeline for this project is engineered using the industry-standard **Medallion Architecture**, progressing systematically through Bronze, Silver, and Gold data layers:

<img width="1041" height="591" alt="Data_Flow drawio" src="https://github.com/user-attachments/assets/61984c8f-95ab-46d3-998e-78657a5a27b7" />

### 🟫 1. Bronze Layer (Raw Data):
* Data is maintained raw, in its original structural schema, with zero transformations applied to preserve baseline source integrity.

### ⬜ 2. Silver Layer (Cleaned & Standardized)
* A high-quality "single source of truth" where stored procedures clean, deduplicate, and standardize raw data.

### 🟨 3. Gold Layer (Business-Ready / Analytical)
* A reporting-ready layer modeled into a star schema using views to deliver aggregated, high-value data for Power BI and analytical queries.

---

## 👨‍💻 About Me
I am a **Data Science Master’s student** with a strong foundation in **Economics, Econometrics and Statistics**. Currently serving as a **Student Assistant at Fraunhofer**, I specialize in bridging the gap between economic research and scalable, production-ready data engineering solutions.

* **📍 Location:** Halle (Saale), Germany
* **🎯 Professional Focus:** Data Warehousing, and Automated ELT/ETL Pipelines.
* **🔧 Core Languages:** SQL (T-SQL), Python (Pandas/NumPy), R (ggplot2), and Power BI.
