# Data Modeling

## Articles

- [Data Modeling: Conceptual vs Logical vs Physical Data Model](https://online.visual-paradigm.com/knowledge/visual-modeling/conceptual-vs-logical-vs-physical-data-model)

## Glossary

- Database Management Systems (DBMS)
- Entity and Relationship Diagram (ERD) / Diagrama de Entidade e Relacionamento (DER)

## Conceptual Model vs Logical Model vs Physical Model

| ERD feature   | Conceptual | Logical  | Physical |
| ------------- | ---------- | -------- | -------- |
| Entity (name) | Yes        | Yes      | Yes      |
| Relationship  | Yes        | Yes      | Yes      |
| Column        |            | Yes      | Yes      |
| Column’s Type |            | Optional | Yes      |
| Primary Key   |            |          | Yes      |
| Foreign Key   |            |          | Yes      |

## Types

### Conceptual

This Data Model defines WHAT the system contains. This model is typically created by Business stakeholders and Data Architects. The purpose is to organize, scope and define business concepts and rules.

![Conceptual Data Model](/assets/images/data/conceptual-data-model.png)

### Logical

Defines HOW the system should be implemented regardless of the DBMS. This model is typically created by Data Architects and Business Analysts. The purpose is to developed technical map of rules and data structures.

![Logical ER Model](/assets/images/data/logical-er-model.png)

### Physical

This Data Model describes HOW the system will be implemented using a specific DBMS system. This model is typically created by DBA and developers. The purpose is actual implementation of the database.

![Logical ER Model](/assets/images/data/physical-er-model.png)
