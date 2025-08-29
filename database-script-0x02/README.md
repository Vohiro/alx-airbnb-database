# Database Seed Data

This project includes seed data to populate the database with initial values for testing and demonstration purposes.  
The data simulates a small property booking system with **users, properties, bookings, payments, and reviews**.

---

## Seeded Tables and Data

### 1. Users
```sql
INSERT INTO users (first_name, last_name, email, password_hash, phone_number, role)
VALUES
('Alice', 'Smith', 'alice@example.com', 'hashed_pwd1', '1234567890', 'host'),
('Bob', 'Johnson', 'bob@example.com', 'hashed_pwd2', '0987654321', 'guest');
```
- Alice Smith: A host who owns properties.
- Bob Johnson: A guest who makes bookings.

**Why?**
We need both host and guest roles to test interactions within the system. The host lists properties, while the guest books and reviews them.

---

### 2. Properties
``` sql
INSERT INTO properties (title, description, address, city, country, price_per_night, owner_id)
VALUES
('Cozy Apartment', '2 bedroom apartment in city center', '123 Main St', 'Lagos', 'Nigeria', 50.00, 1),
('Beach House', 'Luxury villa by the beach', '45 Ocean Ave', 'Accra', 'Ghana', 120.00, 1);
```
- Cozy Apartment (owned by Alice, located in Lagos, Nigeria).
- Beach House (owned by Alice, located in Accra, Ghana).

**Why?**
Properties are central to the booking system. We seeded two different property types to simulate a budget-friendly option and a luxury stay.

---

### 3. Bookings
``` sql
INSERT INTO bookings (user_id, property_id, check_in, check_out, status)
VALUES
(2, 1, '2025-09-10', '2025-09-15', 'confirmed'),
(2, 2, '2025-10-01', '2025-10-07', 'pending');
```
- Bob booked the Cozy Apartment (confirmed).
- Bob requested the Beach House (pending).

**Why?**
This helps test booking logic for both confirmed and pending states.

---

### 4. Payments
``` sql
INSERT INTO payments (booking_id, amount, payment_method, status)
VALUES
(1, 250.00, 'credit_card', 'completed'),
(2, 600.00, 'paypal', 'pending');
```
- Payment for the confirmed booking (credit card, completed).
- Payment for the pending booking (PayPal, still pending).

**Why?**
We simulate different payment statuses and methods to test payment workflows.

---

### 5. Reviews
``` sql
INSERT INTO reviews (user_id, property_id, rating, comment)
VALUES
(2, 1, 5, 'Amazing stay, very comfortable!'),
(2, 2, 4, 'Great location but expensive.');
```
- Bob reviewed the Cozy Apartment (5 stars, positive).
- Bob reviewed the Beach House (4 stars, good but pricey).

**Why?**
Reviews are critical for feedback and property credibility. Seeding them allows testing of the review and rating system.

---

## Purpose of Seed Data
This seed data was designed to: - Provide **test users** for host and
guest roles.\
- Simulate **realistic property listings**.\
- Demonstrate the **booking lifecycle** (pending, confirmed).\
- Show **payments workflow** (completed vs pending).\
- Capture **user feedback** with reviews.

This makes it easier to test the system end-to-end with meaningful,
consistent data.

---