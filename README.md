# Farm Management System

## Overview
This project is a **Farm Management System** database implemented in MySQL. It is designed to manage farm operations, crops, equipment, sales, and farmer information in a structured and relational manner.

## Features
- Manage farmers and their farms
- Track crops grown on each farm
- Record farm equipment and its status
- Record crop sales with automatic total calculation
- Relationships and constraints ensure data integrity

## Database Structure
- **Farmers**: Stores farmer personal information  
- **Farms**: Stores farm details linked to farmers  
- **Crops**: Stores crop information  
- **FarmCrops**: Many-to-Many relationship linking farms and crops  
- **Equipment**: Stores farm equipment information  
- **Sales**: Records crop sales with total amount calculation

## Installation
1. Ensure **MySQL** is installed on your system.
2. Download the `farm_management_system.sql` file.
3. Open MySQL and run:
   ```sql
   source /path/to/farm_management_system.sql;
