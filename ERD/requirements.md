# Entities and Relationships in ER Diagram
---
Entities based on Airbnb-like system:
- **User**
    - id, first_name, last_name, email, password_hash, phone_number, role, created_at
- **Property**
    - id, title, description, address, city, country, price_per_night, owner_id (FK), created_at
- **Booking**
    - id, user_id (FK), property_id (FK), check_in, check_out, status, created_at
- **Payment**
    - id, booking_id (FK), amount, payment_date, payment_method, status
- **Review**
    - id, user_id (FK), property_id (FK), rating, comment, created_at

**Relationships:**
- A User can own many Properties → 1-to-many
- A User can make many Bookings → 1-to-many
- A Booking belongs to 1 User and 1 Property → many-to-1
- A Booking has one or more Payments → 1-to-many
- A Review belongs to 1 User and 1 Property → many-to-1

## ER Diagram
[USER] ------------------< owns >------------------ [PROPERTY]
   | id (PK)                                        | id (PK)
   | name                                           | title
   | email                                          | description
   | password_hash                                  | location
   | created_at                                     | price_per_night
                                                    | owner_id (FK)

[USER] ------------------< makes >----------------- [BOOKING] ------------------< generates >----------------- [PAYMENT]
   | id (PK)                                        | id (PK)                                          | id (PK)
                                                    | check_in                                         | booking_id (FK)
                                                    | check_out                                        | amount
                                                    | user_id (FK)                                     | status
                                                    | property_id (FK)                                 | paid_at
                                                    | total_price