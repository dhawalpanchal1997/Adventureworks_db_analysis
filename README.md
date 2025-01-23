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

- Sales and Revenue analysis
- Customer segmentation
- Employee data insights
- Product performance
- Inventory management

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
   - Query sales trends by date, region, or product.
   - Analyze revenue and profit margins.

2. **DDL/DML/DQL**
   - Customer segmentation based on demographics.
   - Identify top customers by sales.

3. **Joins**
   - Evaluate product sales and profitability.
   - Analyze inventory levels and turnover rates.

4. **Sub Queries**
   - Insights into employee roles and performance metrics.

5. **System Functions**
   - Custom queries addressing specific business questions.

6. **Wild Card**
   - This SQL file contains queries and operations on the AdventureWorks2012 database and a custom sample table:

**Employee Queries:**

* Find employees with job titles starting with 'E'.
* Find employees with job titles containing specific patterns (e.g., 'E', 'u', 's', 'a').
* Find employees meeting custom conditions.

**Person Queries:**

* Fetch persons with a middle name.
* List persons with first names starting with 'M' and last names ending in 'n'.

**Sample Table Operations:**

* Create and populate `sample_001` with sample rows.
* Use pattern-matching queries to filter rows based on `_`, `%`, and `/`.

**The file demonstrates advanced SQL techniques like:**

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
