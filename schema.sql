-- =========================================================================
-- SYSTEM: Football Ticket Booking System
-- DESCRIPTION: SQL for Table Creation, Data Insertion & Queries
-- =========================================================================

-- DROP Database IF THEY ALREADY EXIST TO PREVENT CONFLICTS
drop database if exists Football_Ticket_Booking_System;

-- create database
create database Football_Ticket_Booking_System;


-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS
-- [ skip for newly created database ] --
DROP TABLE IF EXISTS Bookings;

DROP TABLE IF EXISTS Matches;

DROP TABLE IF EXISTS Users;



-- =========================================================================
-- 1. CREATE USERS TABLE
-- =========================================================================
CREATE TABLE Users (
  user_id serial,
  full_name varchar(100) not null,
  email varchar(150) unique not null,
  role varchar(50) not null,
  phone_number varchar(15), -- nullable as sample data
  constraint pk_users primary key (user_id),
  constraint chk_user_role Check (role in ('Ticket Manager', 'Football Fan'))
);

-- =========================================================================
-- 2. CREATE MATCHES TABLE
-- =========================================================================
CREATE TABLE Matches (
  match_id serial,
  fixture varchar(250) not null,
  tournament_category varchar(150) not null,
  base_ticket_price decimal(10, 2) not null,
  match_status varchar(25) not null,
  constraint pk_matches primary key (match_id),
  constraint prvnt_neg_price check (base_ticket_price >= 0),
  constraint chk_match_status check (
    match_status in (
      'Available',
      'Selling Fast',
      'Sold Out',
      'Postponed'
    )
  )
);

-- =========================================================================
-- 3. CREATE BOOKINGS TABLE
-- =========================================================================
CREATE TABLE Bookings (
  booking_id serial,
  user_id int not null,
  match_id int not null,
  seat_number varchar(10), -- nullable as per sample data
  payment_status varchar(25), -- nullable as per sample data
  total_cost decimal(10, 2) not null,
  constraint pk_booking_id primary key (booking_id),
  constraint fk_user_id foreign key (user_id) references Users (user_id),
  constraint fk_match_id foreign key (match_id) references Matches (match_id),
  constraint prvnt_neg_cost check (total_cost >= 0),
  constraint chk_payment_status check (
    payment_status in ('Pending', 'Confirmed', 'Cancelled', 'Refunded')
  )
);






-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO USERS
-- =========================================================================
INSERT INTO
  Users (user_id, full_name, email, role, phone_number)
VALUES
  (
    1,
    'Tanvir Rahman',
    'tanvir@mail.com',
    'Football Fan',
    '+8801711111111'
  ),
  (
    2,
    'Asif Haque',
    'asif@mail.com',
    'Football Fan',
    '+8801722222222'
  ),
  (
    3,
    'Sajjad Rahman',
    'sajjad@mail.com',
    'Ticket Manager',
    '+8801733333333'
  ),
  (
    4,
    'Jannat Ara',
    'jannat@mail.com',
    'Football Fan',
    NULL
  );

-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO MATCHES
-- =========================================================================
INSERT INTO
  Matches (
    match_id,
    fixture,
    tournament_category,
    base_ticket_price,
    match_status
  )
VALUES
  (
    101,
    'Real Madrid vs Barcelona',
    'Champions League',
    150.00,
    'Available'
  ),
  (
    102,
    'Man City vs Liverpool',
    'Premier League',
    120.00,
    'Selling Fast'
  ),
  (
    103,
    'Bayern Munich vs PSG',
    'Champions League',
    130.00,
    'Available'
  ),
  (
    104,
    'AC Milan vs Inter Milan',
    'Serie A',
    90.00,
    'Sold Out'
  ),
  (
    105,
    'Juventus vs Roma',
    'Serie A',
    80.00,
    'Available'
  );

-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO BOOKINGS
-- =========================================================================
INSERT INTO
  Bookings (
    booking_id,
    user_id,
    match_id,
    seat_number,
    payment_status,
    total_cost
  )
VALUES
  (501, 1, 101, 'A-12', 'Confirmed', 150.00),
  (502, 1, 102, 'B-04', 'Confirmed', 120.00),
  (503, 2, 101, 'A-13', 'Confirmed', 150.00),
  (504, 2, 101, NULL, NULL, 150.00),
  (505, 3, 102, 'C-20', 'Pending', 120.00);

