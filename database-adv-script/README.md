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
- Returns only bookings that are linked to an existing user.
- If a booking has no user, it will not appear.

### 2. LEFT JOIN
```sql
SELECT p.id AS property_id,
       p.name AS property_name,
       p.location,
       r.id AS review_id,
       r.rating,
       r.comment
FROM properties p
LEFT JOIN reviews r
    ON p.id = r.property_id;
```
- Returns all properties.
- Properties with no reviews will still appear with NULL in review fields.

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
- Returns all users and all bookings.
- Users with no bookings appear with NULL in booking fields.
- Bookings not linked to a user appear with NULL in user fields.

## Usage
- psql -U <username> -d <database_name> -f joins_queries.sql

---

