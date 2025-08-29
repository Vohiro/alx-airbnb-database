# Database Schema Documentation

This document provides details about the database schema, including the tables created, keys and constraints, and rationale behind data type choices.

---

## Tables Created

### 1. **Users**
Stores user information for authentication and profile management.

- `id` – Primary key (auto-increment).
- `first_name` – User's first name.
- `last_name` – User's last name.
- `email` – Unique email address.
- `password_hash` – Hashed password.
- `phone_number` – Optional phone number.
- `role` – User role (`guest` by default).
- `created_at` – Timestamp when user is created.

---

### 2. **Properties**
Stores property listings created by users.

- `id` – Primary key (auto-increment).
- `title` – Property title.
- `description` – Detailed description.
- `address` – Full address.
- `city` – City name.
- `country` – Country name.
- `price_per_night` – Price of property per night.
- `owner_id` – Foreign key referencing `users(id)`.
- `created_at` – Timestamp when property is created.

---

### 3. **Bookings**
Handles reservations for properties.

- `id` – Primary key (auto-increment).
- `user_id` – Foreign key referencing `users(id)`.
- `property_id` – Foreign key referencing `properties(id)`.
- `check_in` – Check-in date.
- `check_out` – Check-out date.
- `status` – Booking status (`pending` by default).
- `created_at` – Timestamp when booking is created.

---

### 4. **Payments**
Tracks payments made for bookings.

- `id` – Primary key (auto-increment).
- `booking_id` – Foreign key referencing `bookings(id)`.
- `amount` – Payment amount.
- `payment_date` – Timestamp of payment.
- `payment_method` – Method of payment.
- `status` – Payment status (`completed` by default).

---

### 5. **Reviews**
Stores user reviews for properties.

- `id` – Primary key (auto-increment).
- `user_id` – Foreign key referencing `users(id)`.
- `property_id` – Foreign key referencing `properties(id)`.
- `rating` – Rating (1 to 5).
- `comment` – Optional comment.
- `created_at` – Timestamp when review is created.

---

## Keys and Constraints

- **Primary Keys**:  
  Each table has a primary key (`id`) defined as `SERIAL`, ensuring uniqueness.

- **Foreign Keys**:  
  - `properties.owner_id` → `users.id`  
  - `bookings.user_id` → `users.id`  
  - `bookings.property_id` → `properties.id`  
  - `payments.booking_id` → `bookings.id`  
  - `reviews.user_id` → `users.id`  
  - `reviews.property_id` → `properties.id`

- **Constraints**:  
  - `users.email` is unique to prevent duplicate accounts.  
  - `reviews.rating` must be between 1 and 5 (`CHECK` constraint).  
  - `ON DELETE CASCADE` ensures related data (e.g., properties, bookings, reviews, payments) is removed when a user or property is deleted.

---

## Choice of Data Types

- **`SERIAL` for IDs**: Automatically generates sequential unique identifiers.  
- **`VARCHAR` for names, emails, roles, and addresses**: Allows flexible string storage with defined length.  
- **`TEXT` for descriptions and comments**: Handles longer unstructured content.  
- **`DECIMAL(10,2)` for monetary values**: Ensures precision in storing currency (up to 10 digits, 2 decimal places).  
- **`DATE` for check-in/check-out**: Efficient storage for date-only values.  
- **`TIMESTAMP DEFAULT CURRENT_TIMESTAMP`**: Automatically records the creation date and time.  
- **`CHECK` constraint on rating**: Ensures ratings are valid (1–5).  
- **`DEFAULT` values (e.g., role, booking status, payment status)**: Simplifies inserts and enforces consistent defaults.

---
