create database ola;
use ola;

#1. Retrieve all Successful Bookings 
create view Successful_Bookings As
select * from bookings
where Booking_Status = 'Success';

select * from Successful_Bookings;

#2. Average the ride distance from each vehicle type 
Create view ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG (Ride_Distance)
as avg_distance FROM Bookings
GROUP BY Vehicle_Type;

select * from ride_distance_for_each_vehicle;

#3. total number of canceled rides by customers

create view canceled_rides_by_customer AS
select count(*) from bookings
where booking_status = 'Canceled by Customer';

select * from canceled_rides_by_customer;

#4. top 5 customers who booked the highest number of rides

create view top_5_customers as
select Customer_ID, COUNT(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides desc limit 5;

select * from top_5_customers;

#5. number of rides canceled by customer due to personal reasons

create view Canceled_Rides_by_Driver_issue as 
select count(*) from bookings
where Canceled_Rides_by_Driver = 'Personal & car related issue'

#6. max and min driver ratings for prime sedan bookings
CREATE VIEW Max_min_Driver_Rating AS
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
from bookings where vehicle_type = 'prime sedan'

#7. retrieve all rides where payment using UPI

Create view UPI_Payment AS
SELECT * FROM bookings
WHERE Payment_Method ='UPI';

SELECT * FROM UPI_Payment

#8. average customer rating per vehicle

CREATE VIEW Avg_Customer_Rating_per_Vehicle AS
SELECT Vehicle_Type, AVG(Customer_Rating) as Average_Customer_Rating
FROM bookings
GROUP BY Vehicle_Type;

#9. Total Booking Values Of Rides Completed

CREATE VIEW successful_ride_value AS
SELECT sum(Booking_Value) as total_suceesful_ride_value
FROM bookings
where Booking_Status = 'success';

#10. List of incomplete rides with reasons

SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE 'Incomplete_rides' = 'Yes'; 

