# AdventureWorks Database Analysis

This repository contains SQL scripts and analysis performed on the AdventureWorks database, a sample database provided by Microsoft. The AdventureWorks dataset is widely used for demonstrating database features, learning SQL, and understanding business intelligence workflows.

## Table of Contents

- [Overview](#overview)
- [Getting Started](#getting-started)
- [Scripts and Features](#scripts-and-features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Overview

The purpose of this repository is to showcase SQL query techniques, database management practices, and analytical insights extracted from the AdventureWorks database. The analyses focus on areas such as:

- Aggregate Functions
- DDL/DML/DQL Statements
- Joins
- Sub Queries
- System Functions
- Wild Card

## Getting Started

### Prerequisites

To use the SQL scripts provided in this repository, ensure you have the following:

- SQL Server installed on your machine
- AdventureWorks sample database restored on your SQL Server instance

You can download the AdventureWorks database from [Microsoft's official website](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16).

### Cloning the Repository

```bash
git clone https://github.com/dhawalpanchal1997/Adventureworks_db_analysis.git
```

## Scripts and Features

This repository contains SQL scripts categorized by different business use cases. Below are the main features and examples:

1. **Aggregate Functions**
   -This SQL file contains queries designed to analyze sales data from the `Sales.SalesOrderHeader` table, focusing on various metrics such as total sales, customer spending, sales format presentation, payment methods, and top orders by total amount. The queries utilize aggregation functions like SUM, COUNT, and conditional logic to derive insights.
         
         Key Queries:
         
         Total Sales:
             * Calculates the total amount of all sales using the `SUM(TotalDue)` function.
         
         Customer Sales Count:
             * Retrieves the number of sales made by each customer, ordered by the number of sales in descending order.
   
         Customer Spending:
             * Sums the total amount spent by each customer, sorted by total expenditure in descending order.
         
         Formatted Dates:
             * Displays Sales ID along with formatted `OrderDate`, `DueDate`, and `ShipDate` in different formats.
         
         * **Sales Payment Method:
             * Counts the number of sales using credit cards versus those made without credit cards using conditional logic.
         
         Top 5 Expensive Orders:
             * Selects the top 5 most expensive orders based on `TotalDue`, displaying Customer ID, `SalesOrderID`, and Total Amount.
         
         This set of queries showcases different ways to analyze sales data, providing insights into customer behavior, payment methods, and order details.
2. **DDL/DML/DQL**
   -This SQL file focuses on managing and querying employee, department, and sales data within a relational database. It includes various operations such as table creation, data insertion, and constraints addition, as well as complex queries to analyze employee performance, sales, and departmental insights.
         
         Summary:
         
         The SQL file covers the following key areas:
         
         Table Creation:** Creation of `Dept`, `Employee`, and `Sales` tables, each with specific columns and constraints (e.g., unique constraints, primary keys, foreign keys).
         Data Insertion: Populating tables with sample data for departments and employees, along with sales records.
         *Data Manipulation: Implementing various constraints such as unique, primary key, and foreign key relationships. It also includes modifications like adding new columns, setting specific data types, and updating existing data based on conditions.
         Querying and Analysis: Advanced queries for extracting meaningful insights such as:
             * Employee details and their related sales data.
             * Sales data filtered by date, department, or employee.
             * Aggregated analysis like total and average sales, department-wise totals, and salary-based rankings.
         Operations and Transformations: Operations including updating data with percentage increases, handling of conditional logic, and reversing strings (e.g., last name reversal).
         * **Reporting: Generation of reports based on specific conditions like highest sales, employees without sales, and those reporting to specific managers.
         
         Overall, the SQL file showcases a broad range of database management tasks, from creating tables to performing complex queries and analytics.
3. **Joins**
   - This SQL file contains a variety of queries designed to analyze and retrieve specific data insights from multiple tables within a database. The focus is on sales, product details, and employee data, incorporating filtering, aggregation, and grouping operations. Each query targets distinct aspects such as order counts, sales amounts, product attributes, and employee details, often applying conditions to include only relevant data (e.g., filtering based on order counts, sales amounts, or specific dates).
         
         Key Functionalities Include:
         
         * Basic Retrievals: Aggregating data across various dimensions such as customer IDs, product categories, and regions.
         * Filtering and Grouping: Utilizing HAVING clauses to include only those results meeting specific criteria (e.g., orders greater than 5, total sales over $100,000).
         * Date-based Analysis: Filtering sales data by specific dates or date ranges (e.g., before or after a given date, monthly or yearly aggregation).
         * Advanced Aggregations: Calculating metrics like average order quantities, maximum list prices, total revenue, and standard costs.
         * Join Operations: Combining tables across different schemas to provide comprehensive insights (e.g., Sales, Production, Human Resources).
         * Derived Metrics: Calculating averages, sums, and counts based on specific conditions.

4. **Sub Queries**
   -This SQL file focuses on managing and analyzing employee and job data from an organization. It includes a variety of queries to retrieve, filter, and organize information related to employees, their roles, departments, and salaries.
         
         Highlights:
         
          Basic Retrievals:
             * Retrieve all employee records and details such as names, salaries, job titles, and departments.
             * Filter records based on specific criteria like employee IDs, job titles, department names, and locations.
         
         Filtering and Conditions:
             * Filter employees based on specific roles (e.g., Managers, Analysts), locations (e.g., Sydney, Perth), and salary grades.
             * Use subqueries and joins to pull related data from multiple tables (e.g., employees, jobs, departments, job_history).
         
         Advanced Analysis:
             * Analyze employees by experience, commission rates, and salary ranges.
             * Use criteria such as digit presence in employee IDs, hiring dates, and performance evaluations for deeper insights.
         
         Aggregations and Sorting:
             * Count employees, aggregate salaries, and sort data based on department ID, job titles, and experience levels.
             * Retrieve the highest or lowest salaries, or filter employees based on their association with a specific department.
         
         Derived Metrics and Conditional Logic:
             * Calculate salary grades, commission rates, and experience years based on employee data.
             * Filter records using conditions like ensuring salary does not fall within certain ranges, or ensuring specific job titles are excluded.
         
         This file demonstrates a mix of SQL techniques, including filtering, joining, aggregating, and using subqueries for comprehensive data analysis.

5. **System Functions**
   -This SQL file focuses on retrieving and analyzing sales data from the Adventure Works database, specifically targeting the `Sales.SalesOrderHeader` table. Key functionalities include date-based filtering, aggregation, and insights generation.
         
         Highlights:
         
         Basic Retrievals:
             * Retrieve all sales records.
             * Filter by specific dates or date ranges (e.g., 2011-01-01).
         
         Date-Based Analysis:
             * Identify the earliest/latest sale dates.
             * Retrieve records for the current year, month, quarter, or specific years (e.g., 2012 or 2013).
             * Filter records for weekends or weekdays.
         
         Aggregations:
             * Count sales for a given period (e.g., yearly, quarterly, monthly, or weekly).
             * Calculate total and average sales for specific periods or groupings (e.g., weekdays, months, quarters).
         
         Top/Bottom Sales:
             * Find records with the highest and lowest sales amounts.
             * Retrieve the top 5 sales records by amount.
         
         Advanced Analysis:
             * Analyze sales by day of the week, last days of months, or specific holidays.
             * Compare data across different years or quarters.
             * Generate insights for the last 6 or 12 months.
         
         Derived Metrics:
             * Average sales per day/month/quarter.
             * Count unique customers in the last 30 days.
             * Aggregate sales for specific date ranges excluding weekends.
         
         CTE and Subqueries:
             * Leverage Common Table Expressions (CTEs) for advanced calculations (e.g., monthly sales averages, daily sales).
         
         This file demonstrates a mix of SQL skills, including querying, filtering, grouping, aggregating, and leveraging functions for dynamic data analysis.
   - This SQL file includes queries focused on string manipulation, pattern matching, and data transformation within the AdventureWorks2012 database and a custom candidate table:

         Employee Queries:
         * Count job titles with no spaces, exactly two words, or matching first and last characters.
         * Generate hire and birth date keys in yyyyMMdd format.
         
         Person Queries:
         * Construct full names and calculate their lengths.
         * Count names with more than two words.
         * Generate email addresses using first names.
         * Filter names with more than two occurrences of 'D' or 'd'.
         * Sort names by the third character.
         
         Candidate Queries:
         * Replace, split, and manipulate sname field to extract or transform first and last names, and reverse last names.
         
         The file demonstrates string operations, conditional logic, and data formatting techniques in SQL..

7. **Wild Card**
   - This SQL file contains queries and operations on the AdventureWorks2012 database and a custom sample table:

         Employee Queries:
         
         * Find employees with job titles starting with 'E'.
         * Find employees with job titles containing specific patterns (e.g., 'E', 'u', 's', 'a').
         * Find employees meeting custom conditions.
         
         Person Queries:
         
         * Fetch persons with a middle name.
         * List persons with first names starting with 'M' and last names ending in 'n'.
         
         Sample Table Operations:
         
         * Create and populate `sample_001` with sample rows.
         * Use pattern-matching queries to filter rows based on `_`, `%`, and `/`.
         
         The file demonstrates advanced SQL techniques like:
         
         * Pattern matching
         * Conditional filtering
         * Table operations 

## Requirements

- SQL Server (2016 or later recommended)
- AdventureWorks sample database

## Installation

1. Install SQL Server on your system.
2. Download and restore the AdventureWorks database to your SQL Server instance.
3. Clone this repository:

   ```bash
   git clone https://github.com/dhawalpanchal1997/Adventureworks_db_analysis.git
   ```

4. Open the SQL scripts in your preferred SQL editor (e.g., SQL Server Management Studio, Azure Data Studio).

## Usage

- Navigate to the relevant folder or file for the analysis you are interested in.
- Open the SQL script and execute it in your SQL environment.
- Modify parameters or filters within the queries to suit your needs.

## Contributing

Contributions are welcome! If you have suggestions, bug fixes, or additional scripts to share, feel free to fork the repository and submit a pull request.

1. Fork the repository.
2. Create a feature branch.
3. Commit your changes.
4. Open a pull request.

## License

This repository is licensed under the [MIT License](LICENSE). Feel free to use the code for personal and educational purposes.

---

**Happy Querying!**
