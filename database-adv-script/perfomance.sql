-- Optimized query for better performance
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.payment_date
FROM bookings b
/* Use LEFT JOIN in case some bookings don’t yet have payments */
LEFT JOIN payments pay ON b.id = pay.booking_id
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
ORDER BY b.start_date DESC;
