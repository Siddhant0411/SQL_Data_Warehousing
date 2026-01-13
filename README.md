# SQL_Data_Warehousing
<br>
# End-to-End SQL Data Warehouse: Medallion Architecture
A comprehensive data engineering project demonstrating the design and implementation of a modern SQL Data Warehouse. This project transforms raw source data (CRM and ERP) into a business-ready **Star Schema** using the **Medallion Architecture**.

---

## 💡 Overview
This project addresses common organizational data challenges—such as manual reporting, inconsistent data "truths," and poor data quality—by building a centralized, automated data warehouse.

### Key Features
* **Architectural Framework:** Implementation of the 3-layer Medallion Architecture (Bronze, Silver, Gold).
* **Data Modeling:** Transition from flat files to a relational Star Schema (Fact and Dimension tables).
* **Automation:** End-to-end ETL pipelines utilizing SQL Stored Procedures.
* **Data Governance:** Integration of data quality checks, surrogate key management, and data cataloging.

---

## 🏗️ Architecture
The project follows a modular pipeline to ensure data lineage and quality:



1.  **Bronze Layer (Raw):** Direct ingestion of CSV files from CRM and ERP systems using `BULK INSERT`. Data is kept in its original format to ensure a "system of record."
2.  **Silver Layer (Cleaned):** Data standardization, handling of null values, deduplication, and cleaning (e.g., trimming strings, mapping status codes to descriptors).
3.  **Gold Layer (Analytics):** Business logic application and final Star Schema modeling. Data is presented via SQL Views for consumption by BI tools like Power BI or Tableau.

---

## 🛠️ Tech Stack
* **Database:** SQL Server Express
* **IDE:** SQL Server Management Studio (SSMS)
* **Modeling:** Draw.io (Architecture & ER Diagrams)
* **Project Tracking:** Notion (Epic/Task management)
* **Version Control:** Git

---
## 📊 Data Insights & Modeling
The final **Gold Layer** implements a Star Schema designed for high-performance querying:



* **Fact_Sales:** Centralized sales data with integrated metrics (Quantity, Price, Tax) from multiple sources.
* **Dim_Customers:** Unified "Golden Records" for customers across CRM and ERP systems.
* **Dim_Products:** Cleaned product catalog with categorized attributes.
* **Dim_Date:** A standard calendar dimension for time-series analysis.

---

## 📑 Documentation
* **Data Catalog:** Detailed definitions for every table and column are available in the `/docs/data_catalog.md` file.
* **Data Lineage:** Visual diagrams showing the flow from **Source → Bronze → Silver → Gold** are included in the `/docs/diagrams/` folder.

---

## 🤝 Contributing
Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/your-username/sql-data-warehouse-project/issues).

## 📜 License
This project is licensed under the MIT License.
