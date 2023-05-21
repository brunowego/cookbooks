# Data

<!--
https://linkedin.com/learning/paths/build-essential-data-skills

https://app.pluralsight.com/search/?q=Event-driven&type=conference%2Cvideo-course%2Cdemo%2Cguide%2Clab%2Cwebinar%2Cpath%2Cassessment&query_id=c21b1585-ff05-4f96-8cc9-b3af36322a3b&source=user_typed

https://app.pluralsight.com/search/?q=Data-driven&type=conference%2Cvideo-course%2Cdemo%2Cguide%2Clab%2Cwebinar%2Cpath%2Cassessment&query_id=50cc03f8-38b9-45e8-801b-1ea1182517b9&source=user_typed
-->

<!--
Leading zero
-->

## Videos

- [Database vs Data Warehouse vs Data Lake | What is the Difference?](https://www.youtube.com/watch?v=-bSkREem8dM)

## Glossary

- Online Analytical Processing (OLAP)
- Online Transaction Processing (OLTP)
- Relational Database Management System (RDBMS)

## Architectures

- Event-driven
- Data-driven

## Differences

### Database (Relational)

- Designed to capture and record data (OLTP)
- Live, real-time data
- Data stored in tables with rows and columns
- Data is highly detailed
- Flexible schema (how the data is orfanized)

### Data Warehouse (Relational)

- Designed to analytical processing (OLAP)
- Data is refreshed from source systems - stores current and historical
- Data is summarized
- Rigid schema (how the data is orgnaizaed)

<!--
Database -> ETL -> Data Warehouse
-->

#### Key Differences (Relational)

- Databases are designed for transactions, Data Warehouse are designed for analytics and reporting
- Databases data is fresh and detailed, Data Warehouse data is refreshed periodically and is summarized
- Databases work slowly for querying large amounts of data and can slow down transactional processes, Data Warehouse don't interfere with any processes and are generally faster

#### Database vs Data Warehouse

- No one is better than the other
- Depends on what kind of data you have an what you want to do with it
- Company can have only one or all options

### Data Lake

- Designed to capture raw data (structured, semi-structured, unstructured)
- Made for large amounts of data
- Used for ML and AI in its current state or for Analytics with processing
- Can organize and put into Databases or Data Warehouses
