create database `Capstone`;
use ` Capstone`;

create table Customers(
customer_id int primary key,
name varchar(30) not null,
phone int (10) unique,
email varchar(20) not null,
reg_date date
);
desc customers;

alter table customers
modify email varchar(50);
alter table customers
rename column custmer_id to customer_id;

create table  Drivers(
driver_id int primary key ,
name varchar (50) not null,
phone int (30) unique,
Licence_Number varchar (40) unique,
rating decimal(4,3)
);
desc drivers;

alter table drivers
modify phone chAR(10);

create table Cabs(
cab_id int primary key ,
driver_id int not null,
car_model varchar(40) not null,
cab_type varchar (30) not null,
reg_number varchar(30) unique,
foreign key (driver_id) references drivers(driver_id)
);
desc cabs;

create table Bookings(
booking_id int primary key,
customer_id int not null,
cab_id int not null,
booking_time datetime not null,
pickup_location varchar(300) not null,
drop_location varchar(300) not null,
status varchar (30),--  -- Completed, Canceled, Ongoing
foreign key (Customer_id) references Customers(Customer_id),
foreign key (cab_id) references  cabs (cab_id)
);

desc Bookings;

create table TripDetails(
trip_id int primary key ,
booking_id int not null,
trip_start_time datetime not null,
trip_end_time datetime not null,
distance_km decimal(6,3),
fare decimal (9,4),
foreign key (booking_id) references Bookings(booking_id)
);
desc TripDetails;

create table Feedback(
Feedback_id int primary key ,
booking_id int not null,
rating int check(rating between 1 and 5), comments text not null,
foreign key(booking_id) references Bookings(booking_id)
);
desc feedback;

INSERT INTO Customers( customer_id,name,phone,email,reg_date)
 VALUES
(1, 'Amit Sharma', '9876543210', 'amit.sharma@gmail.com', '2023-01-15'),
(2, 'Priya Verma', '9898989898', 'priya.verma@gmail.com', '2023-02-01'),
(3, 'Rohan Das', '9123456780', 'rohan.das@gmail.com', '2023-03-12'),
(4, 'Sneha Kapoor', '9345678901', 'sneha.kapoor@gmail.com', '2023-04-10'),
(5, 'Vikram Singh', '9456789012', 'vikram.singh@gmail.com', '2023-05-05'),
(6, 'Anjali Mehta', '9765432109', 'anjali.mehta@gmail.com', '2023-05-20'),
(7, 'Karan Malhotra', '9867543201', 'karan.malhotra@gmail.com', '2023-06-15'),
(8, 'Neha Gupta', '9988776655', 'neha.gupta@gmail.com', '2023-07-08'),
(9, 'Arjun Nair', '9786543210', 'arjun.nair@gmail.com', '2023-08-03'),
(10, 'Simran Kaur', '9123987654', 'simran.kaur@gmail.com', '2023-08-21'),
(11, 'Rahul Reddy', '9345678123', 'rahul.reddy@gmail.com', '2023-09-02'),
(12, 'Meera Joshi', '9456123789', 'meera.joshi@gmail.com', '2023-09-25'),
(13, 'Sandeep Yadav', '9765123487', 'sandeep.yadav@gmail.com', '2023-10-10'),
(14, 'Alok Mishra', '9988771122', 'alok.mishra@gmail.com', '2023-11-05'),
(15, 'Tanya Chawla', '9871234560', 'tanya.chawla@gmail.com', '2023-11-20'),
(16, 'Deepak Kumar', '9321456789', 'deepak.kumar@gmail.com', '2023-12-02'),
(17, 'Shreya Iyer', '9456781234', 'shreya.iyer@gmail.com', '2023-12-18'),
(18, 'Mohit Jain', '9123098765', 'mohit.jain@gmail.com', '2024-01-07'),
(19, 'Kavya Rao', '9765432187', 'kavya.rao@gmail.com', '2024-01-20'),
(20, 'Aditya Bansal', '9345012398', 'aditya.bansal@gmail.com', '2024-02-01');
select * from customers; 

INSERT INTO Drivers (driver_id,name,phone,Licence_Number,rating)
VALUES
(1, 'Rajesh Kumar', '9001112223', 'DL-12345', 4.5),
(2, 'Sunil Yadav', '9001112224', 'MH-54321', 3.8),
(3, 'Kiran Patel', '9001112225', 'KA-67890', 4.2),
(4, 'Anil Mehta', '9001112226', 'GJ-11223', 4.7),
(5, 'Manoj Rao', '9001112227', 'TN-44556', 4.1),
(6, 'Deepak Joshi', '9001112228', 'UP-77889', 3.5),
(7, 'Ravi Shankar', '9001112229', 'HR-99887', 4.0),
(8, 'Vivek Sharma', '9001112230', 'PB-22334', 4.8),
(9, 'Ajay Kumar', '9001112231', 'RJ-66778', 4.3),
(10, 'Arjun Mehta', '9001112232', 'WB-33445', 4.9),
(11, 'Sameer Khan', '9001112233', 'DL-55667', 4.0),
(12, 'Suresh Reddy', '9001112234', 'AP-90909', 3.9),
(13, 'Rohit Verma', '9001112235', 'MH-12121', 4.6),
(14, 'Kunal Singh', '9001112236', 'GJ-34343', 3.7),
(15, 'Nikhil Jain', '9001112237', 'KA-56565', 4.4),
(16, 'Varun Kapoor', '9001112238', 'UP-78787', 4.1),
(17, 'Harish Gupta', '9001112239', 'TN-98989', 4.2),
(18, 'Sanjay Yadav', '9001112240', 'HR-45454', 3.6),
(19, 'Ashok Pillai', '9001112241', 'KL-34344', 4.7),
(20, 'Gaurav Mishra', '9001112242', 'MP-67676', 4.5);
select * from drivers;

INSERT INTO Cabs (cab_id , driver_id ,car_model , reg_number , cab_type)
 VALUES
(1, 1, 'Sedan', 'DL01AB1234', 4),
(2, 2, 'SUV', 'MH02CD5678', 6),
(3, 3, 'Mini', 'KA03EF9876', 3),
(4, 4, 'Sedan', 'GJ04PQ3456', 4),
(5, 5, 'SUV', 'TN05XY6543', 6),
(6, 6, 'Mini', 'UP06RT1122', 3),
(7, 7, 'Sedan', 'HR07MN9988', 4),
(8, 8, 'SUV', 'PB08KL2233', 6),
(9, 9, 'Mini', 'RJ09GH7788', 3),
(10, 10, 'SUV', 'WB10JK3344', 6),
(11, 11, 'Sedan', 'DL11OP5566', 4),
(12, 12, 'SUV', 'AP12UV7878', 6),
(13, 13, 'Mini', 'MH13WX9090', 3),
(14, 14, 'Sedan', 'GJ14DE4545', 4),
(15, 15, 'SUV', 'KA15FG7878', 6),
(16, 16, 'Mini', 'UP16HI6767', 3),
(17, 17, 'Sedan', 'TN17JK9898', 4),
(18, 18, 'SUV', 'HR18LM3434', 6),
(19, 19, 'Mini', 'KL19NO1212', 3),
(20, 20, 'SUV', 'MP20PQ6767', 6);
 select * from cabs;
 
 INSERT INTO Bookings ( booking_id , customer_id , cab_id , booking_time , pickup_location , drop_location , status)
 VALUES
(1, 1, 1, '2023-07-01', 'Delhi', 'Noida', 'Completed' ),
(2, 2, 2, '2023-07-03', 'Mumbai', 'Thane', 'Completed'),
(3, 3, 3, '2023-07-05', 'Bangalore', 'Mysore', 'Canceled'),
(4, 4, 4, '2023-07-07', 'Ahmedabad', 'Surat', 'Completed'),
(5, 5, 5, '2023-07-08', 'Chennai', 'Pondicherry', 'Completed'),
(6, 6, 6, '2023-07-09', 'Lucknow', 'Kanpur', 'Ongoing'),
(7, 7, 7, '2023-07-10', 'Gurgaon', 'Delhi', 'Completed'),
(8, 8, 8, '2023-07-11', 'Chandigarh', 'Ludhiana', 'Completed'),
(9, 9, 9, '2023-07-12', 'Jaipur', 'Ajmer', 'Canceled'),
(10, 10, 10, '2023-07-13', 'Kolkata', 'Howrah', 'Completed'),
(11, 11, 11, '2023-07-15', 'Delhi', 'Gurgaon', 'Completed'),
(12, 12, 12, '2023-07-16', 'Hyderabad', 'Secunderabad', 'Completed'),
(13, 13, 13, '2023-07-18', 'Pune', 'Mumbai', 'Canceled'),
(14, 14, 14, '2023-07-20', 'Rajkot', 'Vadodara', 'Completed'),
(15, 15, 15, '2023-07-21', 'Bangalore', 'Chennai', 'Completed'),
(16, 16, 16, '2023-07-23', 'Lucknow', 'Varanasi', 'Completed'),
(17, 17, 17, '2023-07-24', 'Chennai', 'Coimbatore', 'Completed'),
(18, 18, 18, '2023-07-25', 'Faridabad', 'Delhi', 'Canceled'),
(19, 19, 19, '2023-07-26', 'Kochi', 'Trivandrum', 'Completed'),
(20, 20, 20, '2023-07-27', 'Indore', 'Bhopal', 'Completed');
 
 select * from bookings;
 
 INSERT INTO TripDetails ( trip_id , booking_id , trip_start_time , trip_end_time , distance_km , fare)
 VALUES
(1, 1, '2023-07-01 10:00:00', '2023-07-01 11:00:00', 20.5, 450.00),
(2, 2, '2023-07-03 14:00:00', '2023-07-03 15:30:00', 35.0, 700.00),
(3, 3, '2023-07-05 09:00:00', '2023-07-05 09:30:00', 10.0, 200.00),
(4, 4, '2023-07-07 08:00:00', '2023-07-07 09:45:00', 50.0, 1000.00),
(5, 5, '2023-07-08 16:00:00', '2023-07-08 17:30:00', 40.0, 850.00),
(6, 6, '2023-07-09 11:00:00', '2023-07-09 12:15:00', 25.0, 500.00),
(7, 7, '2023-07-10 19:00:00', '2023-07-10 20:30:00', 30.0, 650.00),
(8, 8, '2023-07-11 13:00:00', '2023-07-11 14:10:00', 22.0, 480.00),
(9, 9, '2023-07-12 10:00:00', '2023-07-12 11:20:00', 28.0, 600.00),
(10, 10, '2023-07-13 09:00:00', '2023-07-13 10:40:00', 38.0, 820.00),
(11, 11, '2023-07-15 17:00:00', '2023-07-15 18:15:00', 18.0, 400.00),
(12, 12, '2023-07-16 07:00:00', '2023-07-16 08:30:00', 45.0, 950.00),
(13, 13, '2023-07-18 12:00:00', '2023-07-18 13:50:00', 60.0, 1200.00),
(14, 14, '2023-07-20 15:00:00', '2023-07-20 16:40:00', 42.0, 880.00),
(15, 15, '2023-07-21 08:30:00', '2023-07-21 10:30:00', 55.0, 1100.00),
(16, 16, '2023-07-23 14:00:00', '2023-07-23 15:10:00', 24.0, 500.00),
(17, 17, '2023-07-24 09:00:00', '2023-07-24 10:20:00', 26.0, 520.00),
(18, 18, '2023-07-25 11:00:00', '2023-07-25 12:45:00', 48.0, 1020.00),
(19, 19, '2023-07-26 18:00:00', '2023-07-26 19:30:00', 32.0, 700.00),
(20, 20, '2023-07-27 20:00:00', '2023-07-27 21:15:00', 20.0, 450.00);

select * from tripdetails;

INSERT INTO Feedback (feedback_id , booking_id , rating , comments)
VALUES
(1, 1, 4.5, 'Good ride, smooth driving'),
(2, 2, 4.0, 'Comfortable cab, polite driver'),
(3, 3, 2.5, 'Driver was late, not satisfied'),
(4, 4, 4.7, 'Excellent trip experience'),
(5, 5, 4.2, 'Cab was clean, good service'),
(6, 6, 3.0, 'Trip delayed due to traffic'),
(7, 7, 4.8, 'Very professional driver'),
(8, 8, 4.1, 'Nice journey'),
(9, 9, 2.8, 'Driver canceled initially'),
(10, 10, 4.6, 'Happy with the service'),
(11, 11, 4.0, 'On time, good experience'),
(12, 12, 3.5, 'Could improve cab condition'),
(13, 13, 4.9, 'Excellent ride, very satisfied'),
(14, 14, 4.3, 'Smooth and comfortable'),
(15, 15, 4.7, 'Driver very friendly'),
(16, 16, 3.8, 'Average experience'),
(17, 17, 4.5, 'Great experience'),
(18, 18, 2.9, 'Driver was rude'),
(19, 19, 4.2, 'Comfortable journey'),
(20, 20, 4.6, 'Very punctual driver');

select * from feedback;


-- EASY QUERIES --

# 1. List all customers
SELECT * 
FROM Customers;

# 2. Find all drivers with rating above 4
SELECT Driver_ID, Name, Rating
FROM Drivers
WHERE Rating > 4;


# 3. Show all bookings made in August 2025
SELECT *
FROM Bookings
WHERE Booking_time BETWEEN '2025-07-02' AND '2025-07-27';

# 4. Count total bookings by each customer
SELECT Customer_ID, COUNT(*) AS TotalBookings
FROM Bookings
GROUP BY Customer_ID;

# 5. List cab details with their drivers
SELECT C.Cab_ID, C.car_model, C.reg_Number, D.Driver_ID, D.Name AS driver_Name
FROM Cabs C
JOIN Drivers D ON C.Driver_ID = D.Driver_ID;

# 6. Find total revenue earned (sum of fare)
SELECT (SUM(Fare)) AS TotalRevenue
FROM tripdetails t, bookings b
WHERE t.booking_id = b.booking_id AND status = 'Completed';

# 7. Show customers who joined after Jan 2025
SELECT *
FROM Customers
WHERE reg_Date > '2024-01-31'
limit 10;

# 8. Find completed vs canceled bookings count
SELECT Status, COUNT(*) AS TotalCount
FROM Bookings
WHERE Status IN ('Completed', 'Canceled')
GROUP BY Status;

# 9. Show top 5 longest trips by distance
SELECT Trip_ID, Booking_ID, Distance_km
FROM TripDetails
ORDER BY Distance_km DESC
LIMIT 5;

# 10. Display average rating of drivers
SELECT AVG(Rating) AS AvgDriverRating
FROM Drivers;


-- MEDIUM QUERIES --

# 1. Find customers who made more than 5 bookings
SELECT Customer_ID, COUNT(*) AS TotalBookings
FROM Bookings
GROUP BY Customer_ID
HAVING COUNT(*) > 5;


# 2. Identify the busiest day for bookings
SELECT DAYNAME(Booking_TIME) AS DayOfWeek, COUNT(*) AS TotalBookings
FROM Bookings
GROUP BY DayOfWeek
ORDER BY TotalBookings DESC
LIMIT 4;
# 3. Find top 3 most common pickup locations
SELECT Pickup_Location, COUNT(*) AS TotalTrips
FROM bookings
GROUP BY Pickup_Location
ORDER BY TotalTrips DESC
LIMIT 3;

# 4. Show drivers with more than 3 canceled trips
SELECT b.booking_ID, d.Name, sum(case when status = 'Cancelled' then 1 else 0 end) AS CanceledTrips
FROM Drivers d, bookings b 
WHERE status = 'Cancelled'
GROUP BY booking_id, name
ORDER BY CanceledTrips > 3;

# 5. Calculate average fare per car model
SELECT car_model, round(avg(fare),2) Average_Fare
FROM tripdetails t, bookings b, cabs c
WHERE t.booking_id = b.booking_id AND b.cab_id = c.cab_id
GROUP BY car_model;

# 6. Find customers with >30% canceled bookings
SELECT c.Customer_ID, name,
       SUM(CASE WHEN Status = 'Canceled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) as cancelpercent
FROM bookings b, customers c 
WHERE b.customer_id = c.customer_id
GROUP BY c.Customer_ID
HAVING CancelPercent > 30;

# 7. Show trips longer than average distance km
SELECT Trip_ID, booking_id,distance_km
FROM TripDetails
WHERE Distance_km > (SELECT AVG(Distance_KM) FROM TripDetails);

# 8. Find top 5 drivers by completed trips
SELECT D.Driver_ID, D.Name, count(*) CompletedTrips
FROM Drivers D, Cabs c, customers cu, bookings b 
where D.Driver_ID = C.Driver_ID
AND B.Status = 'Completed'
GROUP BY D.Driver_ID, D.Name
ORDER BY CompletedTrips DESC
LIMIT 5;


-- HARD QUERIES--

#/ 1. Identify customers who have completed the most bookings. What insights can you draw about their behavior? #/ 
select c.customer_id, c.name,
sum(case when b.status='completed' then 1 else 0 end) as completed_booking
from bookings as b
join customers as c
on c.customer_id = b.customer_id
group by customer_id, name;


#/ 2. Find customers who have canceled more than 30% of their total bookings. What could be the reason for frequent cancellations?
select c.customer_id, c.name,
sum(Case when b.status = "Cancelled" then 1 else 0 end) as Cancelled_Booking,
round(sum(case when b.status = "Cancelled" then 1 else 0 end) * 100.0 / Count(b.booking_id),2) as Percentage
from Bookings as b
Join Customers as c
on c.customer_id = b.customer_id
group by c.customer_id, name
having Percentage > 30
order by Percentage desc;


/* 3. Determine the busiest day of the week for bookings. How can the company optimize
cab availability on peak days?*/
select dayname(booking_time) as Day_of_week,
hour(booking_time) as Hours_of_time,
count(*) as total_booking
from Bookings
where status = "Completed"
group by Day_of_week, Hours_of_time
order by total_booking desc;



-- Driver Performance & Efficiency--


/* 1. Identify drivers who have received an average rating below 3.0 in the past three
months. What strategies can be implemented to improve their performance?*/
Select d.driver_id, d.name, 
round(avg(d.rating),2) as Average_Rating
from Drivers as d
Join Cabs as c
on d.driver_id = c.driver_id
Join Bookings as b
on b.cab_id = c.cab_id
Join Feedback as f
on b.booking_id = f.booking_id
where b.booking_time >= curtime() - interval 3 month
group by d.driver_id, name
having Average_Rating > 1
order by Average_Rating asc;

/* 2. Find the top 5 drivers who have completed the longest trips in terms of distance. 
What does this say about their working patterns? */
Select d.driver_id, d.name, max(t.distance_km) as Distance_km
from Drivers as d
Join Cabs as c
on d.driver_id = c.driver_id
Join Bookings as b
on c.cab_id = b.cab_id 
Join Tripdetails as t
on b.booking_id = t.booking_id
group by d.driver_id, d.name 
order by Distance_km desc
limit 5;


/* 3. Identify drivers with a high percentage of canceled trips. Could this indicate driver 
unreliability? */
Select d.driver_id, d.name, 
concat(round(sum(Case when status = "Cancelled" then 1 else 0 end) * 100.0 / count(d.driver_id),0), '%')as Percentage
from Drivers as d
Join Cabs as c
on d.driver_id = c.driver_id
Join Bookings as b
on c.cab_id = b.cab_id
group by d.driver_id, d.name 
order by Percentage desc
limit 5;

-- Revenue & Business Metrics--


/* 1. Calculate the total revenue generated by completed bookings in the last 6 months. 
How has the revenue trend changed over time? */
Select sum(t.fare) as Total_Revenue
from Bookings as b
Join TripDetails as t
on b.booking_id = t.booking_id
where b.status = "Completed" and t.trip_end_time >= curdate() - interval 6 month;

/* 2. Identify the top 3 most frequently traveled routes based on PickupLocation and 
DropoffLocation. Should the company allocate more cabs to these routes? */
Select pickup_location, drop_location,
count(*) as Total_Trips
from Bookings
group by pickup_location, drop_location
order by Total_Trips desc
limit 3;

/* 3. Determine if higher-rated drivers trend to complete more trips and earn higher fares. 
Is there a direct correlation between driver ratings and earnings? */
Select d.driver_id, d.name,
round(avg(d.rating),2) as Average_Rating,
count(t.trip_id) as Total_Trips,
round(sum(t.fare),2) as Total_Fare
from Drivers as d
Join Cabs as c
on c.driver_id = d.driver_id
Join Bookings as b
on b.cab_id = c.cab_id
Join TripDetails as t
on t.booking_id = b.booking_id
where status = "Completed"
group by d.driver_id, d.name 
order by Average_Rating desc
limit 5;

-- Operational Efficiency & Optimization--

 
/* 1. Analyze the average waiting time (difference between booking time and trip start 
time) for different pickup locations. How can this be optimized to reduce delays? */
Select b.pickup_location,
concat(round(avg(timestampdiff(minute, booking_time, trip_start_time)),2)," min") as Waiting_Time
from Bookings as b
Join TripDetails as t 
on b.booking_id = t.booking_id
group by b.pickup_location
order by Waiting_time desc;

/* 2. Identify the most common reasons for trip cancellations from customer feedback. 
What actions can be taken to reduce cancellations? */
Select f.comments, count(*) as Total_Comments
from Feedback as f
Join Bookings as b
on f.booking_id = b.booking_id
where b.status = "Cancelled" and f.comments is not null
group by f.comments
order by Total_Comments desc
limit 5;


/* 3. Find out whether shorter trips (low-distance) contribute significantly to revenue. 
Should the company encourage more short-distance rides? */
Select 
Case when t.distance_km < 5 then 'Less Distance_km (<5)'
when t.distance_km between 5 and  15 then 'Medium Distance_km (>5)'
else 'More Distance_km (>5)' end as Trip_Distance,
sum(t.fare) as Total_Fare_Amount,
round(avg(t.fare),2) as Average_Fare_Amount
from TripDetails as t
Join Bookings as b
on t.booking_id = b.booking_id
where b.status = "Completed"
group by Trip_Distance
order by Total_Fare_Amount desc;


-- Comparative & Predictive Analysis-- 

 
/* 1. Compare the revenue generated from 'Sedan' and 'SUV' cabs. Should the company 
invest more in a particular vehicle type? */
Select c.cab_type, sum(t.fare) as Revenue
from TripDetails as t
Join Bookings as b
on b.booking_id = t.booking_id
Join Cabs as c
on c.cab_id = b.cab_id
where c.cab_type in ("SUV", "Sedan") and status = "Completed"
group by c.cab_type
order by Revenue desc;

/* 2. Predict which customers are likely to stop using the service based on their last 
booking date and frequency of rides. How can customer retention be improved?  */
Select c.customer_id, c.name,
count(b.booking_id) as Total_Bookings,
max(b.booking_time) as Max_Booking_Time,
Datediff(Curdate(), max(b.booking_time)) as Last_Booking
from Customers as c
Join Bookings as b
on c.customer_id = b.customer_id
group by c.customer_id, c.name
having Last_Booking > 30 
and Total_Bookings < 5
order by Last_Booking desc;

/* 3. Analyze whether weekend bookings differ significantly from weekday bookings. 
Should the company introduce dynamic pricing based on demand? */
Select 
Case when DayOfWeek(b.booking_time) in (1,7) then 'Weekend' else ' Weekday' end as DaysOfWeek,
count(*) as Total_bookings,
sum(t.fare) as Total_Revenue,
round(avg(t.fare),2) Average_Fare_Amount
from Bookings as b
Join TripDetails as t
on b.booking_id = t.booking_id
where status = "Completed"
group by DaysOfWeek
order by Average_Fare_Amount desc;


SELECT Customer_id, Name
FROM Customers;

