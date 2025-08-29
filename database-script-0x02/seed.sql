-- Users
INSERT INTO users (first_name, last_name, email, password_hash, phone_number, role)
VALUES
('Alice', 'Smith', 'alice@example.com', 'hashed_pwd1', '1234567890', 'host'),
('Bob', 'Johnson', 'bob@example.com', 'hashed_pwd2', '0987654321', 'guest');

-- Properties
INSERT INTO properties (title, description, address, city, country, price_per_night, owner_id)
VALUES
('Cozy Apartment', '2 bedroom apartment in city center', '123 Main St', 'Lagos', 'Nigeria', 50.00, 1),
('Beach House', 'Luxury villa by the beach', '45 Ocean Ave', 'Accra', 'Ghana', 120.00, 1);

-- Bookings
INSERT INTO bookings (user_id, property_id, check_in, check_out, status)
VALUES
(2, 1, '2025-09-10', '2025-09-15', 'confirmed'),
(2, 2, '2025-10-01', '2025-10-07', 'pending');

-- Payments
INSERT INTO payments (booking_id, amount, payment_method, status)
VALUES
(1, 250.00, 'credit_card', 'completed'),
(2, 600.00, 'paypal', 'pending');

-- Reviews
INSERT INTO reviews (user_id, property_id, rating, comment)
VALUES
(2, 1, 5, 'Amazing stay, very comfortable!'),
(2, 2, 4, 'Great location but expensive.');
