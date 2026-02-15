create database hotel_analytics;
use hotel_analytics;

CREATE TABLE customers (
    customer_id VARCHAR(5) PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50),
    repeat_customer VARCHAR(5)
);

CREATE TABLE rooms (
    room_id VARCHAR(5) PRIMARY KEY,
    room_type VARCHAR(20),
    price_per_night INT
);

alter table rooms
add hotel_id varchar(10);

UPDATE rooms SET hotel_id = 'H001' WHERE room_id IN ('R001','R002');

CREATE TABLE bookings (
    booking_id VARCHAR(5) PRIMARY KEY,
    customer_id VARCHAR(5),
    room_id VARCHAR(5),
    check_in DATE,
    check_out DATE,
    status VARCHAR(15),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE payments (
    payment_id VARCHAR(5) PRIMARY KEY,
    booking_id VARCHAR(5),
    amount INT,
    payment_mode VARCHAR(20),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

CREATE TABLE hotels (
    hotel_id VARCHAR(5) PRIMARY KEY,
    hotel_name VARCHAR(100),
    city VARCHAR(50)
);