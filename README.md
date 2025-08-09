# Online Market SQL

## Overview
This SQL script creates and populates a simple online market database with three main tables: 
Customers, Products, and Orders. The database is designed to track customer purchases, product information, and order details.

## Database Schema

### Tables
1. **Customers**  
   - CustomerID (INT, Primary Key)  
   - Name (VARCHAR(100))  
   - Email (VARCHAR(100))  

2. **Products**  
   - ProductID (INT, Primary Key)  
   - ProductName (VARCHAR(100))  
   - Price (DECIMAL(10, 2))  

3. **Orders**  
   - OrderID (INT, Primary Key)  
   - CustomerID (INT, Foreign Key)  
   - ProductID (INT, Foreign Key)  
   - OrderDate (DATE)  
   - Quantity (INT)  

## Sample Queries Included

1. **Top Revenue Product**  
   Identifies the product generating the highest total revenue.

2. **Popular Products**  
   Lists products ordered in quantities greater than 1.

3. **Frequent Customers**  
   Shows customers who have placed more than one order.

4. **Earliest Order Date**  
   Returns the date of the first order in the system.

5. **Unique Customers**  
   Counts the number of distinct customers who have placed orders.

## Implementation Notes

- The script checks for existing objects before creation to avoid errors
- Sample data is inserted only if tables are empty
- Queries are optimized for SQL Server syntax
- The database name is 'Online_Market_SQL'

## Usage Instructions

1. Execute the entire script in SQL Server Management Studio
2. The script will automatically:
   - Create the database if it doesn't exist
   - Create tables if they don't exist
   - Populate with sample data if tables are empty
   - Execute all analytical queries

## Requirements

- SQL Server (2012 or later recommended)
- SQL Server Management Studio or similar query tool
- Appropriate permissions to create databases and tables

## DISCLAIMER

UNDER NO CIRCUMSTANCES SHOULD IMAGES OR EMOJIS BE INCLUDED DIRECTLY 
IN THE README FILE. ALL VISUAL MEDIA, INCLUDING SCREENSHOTS AND IMAGES 
OF THE APPLICATION, MUST BE STORED IN A DEDICATED FOLDER WITHIN THE 
PROJECT DIRECTORY. THIS FOLDER SHOULD BE CLEARLY STRUCTURED AND NAMED 
ACCORDINGLY TO INDICATE THAT IT CONTAINS ALL VISUAL CONTENT RELATED TO 
THE APPLICATION (FOR EXAMPLE, A FOLDER NAMED IMAGES, SCREENSHOTS, OR MEDIA).

I AM NOT LIABLE OR RESPONSIBLE FOR ANY MALFUNCTIONS, DEFECTS, OR ISSUES 
THAT MAY OCCUR AS A RESULT OF COPYING, MODIFYING, OR USING THIS SOFTWARE. 
IF YOU ENCOUNTER ANY PROBLEMS OR ERRORS, PLEASE DO NOT ATTEMPT TO FIX THEM 
SILENTLY OR OUTSIDE THE PROJECT. INSTEAD, KINDLY SUBMIT A PULL REQUEST 
OR OPEN AN ISSUE ON THE CORRESPONDING GITHUB REPOSITORY, SO THAT IT CAN 
BE ADDRESSED APPROPRIATELY BY THE MAINTAINERS OR CONTRIBUTORS.

---
