# Football Ticket Booking System - Database Design & SQL Queries

A comprehensive relational database solution built to manage football tournament fixtures, fan accounts, and transactional match ticket booking records. The requirment details are [here](https://github.com/Apollo-Level2-Web-Dev/B7A3).

---

## 📌 Project Overview

The core objective of this repository is to showcase proper relational schema implementation using strict data types, primary and foreign keys, dynamic data integrity constraints, and multi-table filtering queries.

### Key Capabilities Evaluated:
- **Relational Integrity:** Implemented robust custom table-level constraints (`CHECK`, `UNIQUE`, `PRIMARY KEY`, `FOREIGN KEY`).
- **Data Normalization:** Structured entities to mitigate redundancy and facilitate 1-to-Many and Junction-based table bridges.
- **Advanced Query Formulation:** Utilized complex operations including back-to-back table joins (`INNER`/`LEFT`), row pagination filters (`LIMIT`/`OFFSET`), pattern matching (`ILIKE`), missing value handling (`COALESCE`), and subquery evaluations.

---

## 📊 Database Design (ERD)

The database schema models the architectural business logic mapping users, matches, and stadium bookings.

### Relationship Matrix
- **One to Many (`Users` → `Bookings`):** A single registered fan can purchase multiple entry tickets over the season.
- **Many to One (`Bookings` → `Matches`):** A high-profile league fixture maps directly to numerous unique seat reservation entries.
- **Junction Entity (`Bookings`):** Resolves the logical Many-to-Many relationship between Fans and Matches by holding the specific compound state (assigned seats, distinct costs, and financial transactions).

![Football System ERD](./assets/Database-ERD.svg)

---

## 🛠️ Schema Architecture & Setup

The complete structural setup script is located within `schema.sql`. It features systematic table teardowns to prevent collisions, followed by localized column grouping and table-level constraint grouping at the bottom for maximized codebase scannability.

### Database Generation Execution:
To build the schema and populate the system with seeding records, execute the following script inside your PostgreSQL environment:

```sql
-- Creates database, establishes structural schemas, and seeds records
\i schema.sql