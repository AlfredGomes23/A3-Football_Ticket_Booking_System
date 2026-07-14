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

The database schema models, the architectural business logic mapping users, matches, and  bookings, designed in [draw.io](https://app.diagrams.net/).

### Relationship Matrix
- **One to Many (`Users` → `Bookings`):** A single registered fan can purchase multiple entry tickets over the season, but each booking can have only one user.
- **Many to One (`Bookings` → `Matches`):** A high-profile league fixture maps directly to numerous unique seat reservation entries, where each booking have only one match.
- **Junction Entity (`Bookings`):** Resolves the logical Many-to-Many relationship between Fans and Matches by holding the specific compound state (assigned seats, distinct costs, and financial transactions).

![Football System ERD](./assets/Database-ERD.svg)


---

## 🛠️ Schema Architecture & Queries

The complete structural setup the script is located within `schema.sql`. It creates tables with requied constraints and inserts demo data after creating datebase and checking for previouslly created database/table with same name. The solution queries are in the `query.sql` of the given [questions](https://github.com/Apollo-Level2-Web-Dev/B7A3).

_The software used to run and testing the [postgrSQL](https://www.postgresql.org/) is [Beekeeper Studio](https://www.beekeeperstudio.io/)._
