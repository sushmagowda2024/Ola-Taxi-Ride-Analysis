create database ola;
use ola;

 select * from bookings;
#1.  Retrive all successful booking
create view successful_booking  as select * from bookings where Booking_Status="Success" ;
select * from successful_booking;

# 2. Find all avegrage  ride distance for each vehicle  type

create view	avegrage_ride_distance_for_each_vehicle  as select Vehicle_Type,avg(Ride_Distance) as average_ride_distance from bookings group by Vehicle_Type;
select * from avegrage_ride_distance_for_each_vehicle;

# 3. Get the total number of cancelled rides by customers

create view cancelled_rides_by_customers as select count(*) as "cancelled rides" from bookings where Booking_Status="canceled by customer";
select * from cancelled_rides_by_customers;

# 4. List the top 5 customers who booked the highest number of rides

create view  highest_number_of_rides as select customer_id,count(booking_id) as total_rides from bookings group by customer_id order by total_rides desc limit 5;
select * from  highest_number_of_rides;
# 5. Get the number of rides cancelled by drivers due to persinal and car-related issuues

 create view rides_cancelled_by_drivers_p_c_issues as select count(*)  from bookings where Canceled_Rides_by_Driver="Personal & Car related issue" ;
 select * from rides_cancelled_by_drivers_p_c_issues;


#6. Find the maximum and minimum driver ratings for prime sedan Bookings
create view max_min_driver_rating as select max(Driver_Ratings) max_driver_rating, min(Driver_Ratings) min_driver_rating from bookings where Vehicle_Type="Prime Sedan";
select * from max_min_driver_rating;


# 7.Retrive all rides where payment was made using UPI
create view UPI_payments as select * from bookings where Payment_Method="UPI";
select * from UPI_payments;

# 8. Find the average customer rating per vehicle type
create view avg_customer_rating as select Vehicle_Type,avg(Customer_Rating) from bookings group by Vehicle_Type;
select * from avg_customer_rating;

# 9. Claculate the total booking value of rides completed successfully
create view total_booking_value as select sum(Booking_Value) from bookings where Booking_Status="Success";
select * from total_booking_value;

# 10. list all incomplete rides along with the reasons
create view incomplete_rides as select Booking_ID,Incomplete_Rides_reason from bookings where Incomplete_Rides="yes";
select * from incomplete_rides;


