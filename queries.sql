-- select * from hotel_analytics.rooms;
-- select count(*) from hotel_analytics.rooms;

-- Total Revenue
select sum(amount) as total_revenue from payments;

-- Most Booked Rooms
SELECT 
    r.room_type,
    COUNT(*) AS total_bookings
FROM bookings b
JOIN rooms r ON b.room_id = r.room_id
GROUP BY r.room_type
ORDER BY total_bookings DESC;

-- Top 5 Customers (Vips)
SELECT 
    c.name,
    COUNT(b.booking_id) AS total_stays
FROM customers c
JOIN bookings b ON c.customer_id = b.customer_id
GROUP BY c.name
ORDER BY total_stays DESC
LIMIT 5;

-- Occuoancy Rate
SELECT h.hotel_name,
       COUNT(b.booking_id) / COUNT(r.room_id) * 100 AS occupancy_rate
FROM hotels h
JOIN rooms r ON h.hotel_id = r.hotel_id
LEFT JOIN bookings b ON r.room_id = b.room_id
GROUP BY h.hotel_name;

-- Average Stay Duration
SELECT 
    AVG(DATEDIFF(check_out, check_in)) AS avg_stay_days
FROM bookings;

-- Total Bookings
SELECT COUNT(*) AS total_bookings FROM bookings;

-- Bookings By Room Types
SELECT 
    r.room_type,
    COUNT(b.booking_id) AS total_bookings
FROM bookings b
JOIN rooms r ON b.room_id = r.room_id
GROUP BY r.room_type;

-- Average Rooms Price
SELECT AVG(price_per_night) AS avg_price FROM rooms;

-- Revenue By Hotel
SELECT 
    h.hotel_name,
    SUM(p.amount) AS revenue
FROM hotels h
JOIN rooms r ON h.hotel_id = r.hotel_id
JOIN bookings b ON r.room_id = b.room_id
JOIN payments p ON b.booking_id = p.booking_id
GROUP BY h.hotel_name;

-- Most Popular Rooms
SELECT 
    r.room_type,
    COUNT(*) AS total
FROM bookings b
JOIN rooms r ON b.room_id = r.room_id
GROUP BY r.room_type
ORDER BY total DESC
LIMIT 1;

desc hotels;
desc rooms;
desc bookings;



SELECT hotel_id, COUNT(*) 
FROM rooms 
GROUP BY hotel_id;

select * from hotels;
select * from rooms;
select * from  bookings;
select * from payments;

SELECT DISTINCT hotel_id FROM rooms;

SELECT DISTINCT room_id FROM bookings;
SELECT DISTINCT room_id FROM rooms;





SELECT *
FROM hotels h
JOIN rooms r ON h.hotel_id = r.hotel_id;

UPDATE rooms SET hotel_id = (SELECT hotel_id FROM hotels LIMIT 1);

SELECT hotel_id FROM hotels;
SELECT DISTINCT hotel_id FROM rooms;


UPDATE rooms SET hotel_id = 'H01' WHERE room_id BETWEEN 'R101' AND 'R113';

UPDATE rooms SET hotel_id = 'H02' WHERE room_id BETWEEN 'R114' AND 'R125';


UPDATE rooms SET hotel_id = 'H03' WHERE room_id BETWEEN 'R126' AND 'R150';


SELECT hotel_id, COUNT(*) 
FROM rooms 
GROUP BY hotel_id;

select hotel_id,count(*)
from rooms
group by hotel_id;

-- Cancellation rate
SELECT 
COUNT(CASE WHEN status='Cancelled' THEN 1 END) * 100.0 / COUNT(*) 
AS cancellation_rate
FROM bookings;



