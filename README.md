# Superstore Sales & Profit Dashboard

## Project Overview
This project analyzes 9,994 sales records from a US-based 
superstore using Microsoft Excel. The goal is to identify 
key business insights related to sales, profit, customers, 
and regional performance.

## Tools Used
- Microsoft Excel
- Pivot Tables
- Advanced Formulas (XLOOKUP, SUMIFS, COUNTIFS, AVERAGEIFS)
- Data Visualization (Charts & Slicers)

## Dataset
- Source: Kaggle — Sample Superstore Dataset
- Records: 9,994 rows
- Columns: 21
- Time Period: 2014 - 2017

## Key Findings
- Total Revenue: 22,97,200 with 12.47% profit margin
- West region is the most profitable region
- Technology category contributes 50.8% of total profit
- Consumer segment drives 50.6% of total revenue
- Sales grew 51% from 2014 to 2017

## Project Structure
- Pivot Table Sheet — 5 pivot analysis
- Dashboard Sheet — Interactive dashboard with slicers
- Business Insights Sheet — Key findings & recommendations
- Advance Formula Sheet — XLOOKUP, SUMIFS demonstration

## Dashboard Features
- 4 KPI Cards — Sales, Profit, Margin, Orders
- 4 Interactive Charts
- 3 Slicers — Year, Category, Region
- Dynamic filtering with Pivot Tables

# Superstore Sales Analysis MYSQL

## Project Overview
Analysis of US Superstore Sales data (2014-2017) using MySQL and Excel.
Dataset contains 9,994 rows with 4 normalized tables.

## Tools Used
- MySQL Workbench 8.0
- Microsoft Excel

## Database Schema
- **customers** - customer_id, customer_name, segment
- **locations** - postal_code, city, state, country, region
- **products** - product_id, product_name, category, sub_category
- **orders** - order_id, order_date, ship_date, ship_mode, sales, quantity, discount, profit

## Business Questions & Insights

### Sales & Profit Analysis
**Q1. Total sales and profit by region**
- West region leads with $721K sales and $107K profit
- Central region has high sales but lowest profit - suggests heavy discounting

**Q2. Customer segment with highest profit**
- Consumer segment most profitable at $132K
- Home Office has lowest profit at $59K

**Q3. Sales and profit by category**
- Technology highest sales $893K and profit $153K
- Furniture red flag - $755K sales but only $18K profit

**Q4. Top 10 products by sales**
- Canon imageCLASS 2200 Copier is top product at $61K

**Q5. Loss making products**
- Cubify CubeX 3D Printer biggest loss at -$8,879

### Time Based Analysis
**Q6. Monthly sales trend**
- Clear upward trend from 2014 to 2017
- March consistently strong across all years

**Q7. Yearly sales and profit**
- 2017 best year with $724K sales and $92K profit
- 2015 had lower sales than 2014 but higher profit

**Q8. Average shipping days by ship mode**
- Same Day: 0.04 days
- Standard Class: 5 days

### Customer Analysis
**Q9. Top 10 customers by purchase**
- Sean Miller top customer with $25K purchases

**Q10. Segment orders per year**
- All segments show consistent growth 2014-2017
- Home Office fastest growth - doubled from 303 to 647 orders

### Advanced Analysis
**Q11. Discount vs Profit relationship**
- No discount orders avg profit $68
- High discount orders avg loss -$109
- Higher discount directly kills profit

**Q12. Sub-categories with negative profit**
- Tables: $206K sales but -$17K profit
- Bookcases and Supplies also loss-making
- All 3 belong to Furniture category

**Q13. Top 5 customers per segment**
- Sean Miller leads Home Office with $25K
- Tamara Chand leads Corporate with $19K

**Q14. Running total of sales**
- Cumulative sales grew from $14K to $499K in 2014 alone

**Q15. Year over Year growth by category**
- Technology strongest growth 38% in 2016
- All categories dipped in 2015 but recovered in 2016

## Key Findings
1. Discount policy needs review - high discounts causing losses
2. Furniture category underperforming despite high sales
3. West region most profitable
4. Business showing strong growth trend 2014-2017

## Author
**Aman Sen**  
Aspiring Data Analyst  
[LinkedIn](linkedin.com/in/aman-sen-a917a7284)
