# SQL Joins – Complex Queries

This directory contains SQL scripts that demonstrate the use of **INNER JOIN**, **LEFT JOIN**, and **FULL OUTER JOIN** in an Airbnb-like database system.  

## Files
- **joins_queries.sql** → SQL queries using different joins.
- **README.md** → Explanation of the queries.

## Queries Explained

### 1. INNER JOIN
```sql
SELECT b.id AS booking_id,
       b.property_id,
       b.start_date,
       b.end_date,
       u.id AS user_id,
       u.name AS user_name,
       u.email
FROM bookings b
INNER JOIN users u
    ON b.user_id = u.id;
```
- 📌 Returns only bookings that are linked to an existing user.
- 📌 If a booking has no user, it will not appear.

### 2. LEFT JOIN
```sql
SELECT p.id AS property_id, 
       p.name AS property_name, 
       r.id AS review_id, 
       r.rating, 
       r.comment
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id
ORDER BY p.id;
```
- 📌 Returns all properties.
- 📌 Properties with no reviews will still appear with NULL in review fields.

### 3. FULL OUTER JOIN
```sql
SELECT u.id AS user_id,
       u.name AS user_name,
       b.id AS booking_id,
       b.property_id,
       b.start_date,
       b.end_date
FROM users u
FULL OUTER JOIN bookings b
    ON u.id = b.user_id;
```
- 📌 Returns all users and all bookings.
- 📌 Users with no bookings appear with NULL in booking fields.
- 📌 Bookings not linked to a user appear with NULL in user fields.

## Usage
- 📌 psql -U <username> -d <database_name> -f joins_queries.sql

---

# SQL Subqueries - Airbnb Database

This section contains practice SQL queries using **subqueries** for the Airbnb database project.

## Objectives
- Practice using **non-correlated subqueries** (subquery runs independently).
- Practice using **correlated subqueries** (subquery depends on outer query row).

---

### 1. Properties with Average Rating > 4.0
```sql
SELECT p.property_id, p.name, p.location
FROM properties p
WHERE (
    SELECT AVG(r.rating)
    FROM reviews r
    WHERE r.property_id = p.property_id
) > 4.0;
```
- 📌 This retrieves all properties where the average review rating is greater than 4.0.

```sql
SELECT u.user_id, u.name, u.email
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;
```
- 📌 This retrieves all users who have made more than 3 bookings.

---

# SQL Aggregations and Window Functions

This task focuses on applying **SQL aggregation** and **window functions** for deeper data analysis.

## Queries Implemented

### 1. Query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
```sql
SELECT 
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;
```
- 📌 Uses COUNT() and GROUP BY to calculate the number of bookings per user.
- 📌 Includes users with zero bookings using a LEFT JOIN.

### 2. Using window functions (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received
```sql
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    COUNT(b.id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS row_num_rank,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.name
ORDER BY booking_rank;
```
- 📌 Uses RANK() and ROW_NUMBER() as a window function to assign rankings based on total bookings.
- 📌 Properties with equal bookings receive the same rank.
- 📌 Results are ordered by booking rank.