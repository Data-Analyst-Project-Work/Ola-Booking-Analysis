-- #1. Retrieve all successful bookings :

CREATE VIEW Successful_Bookings AS
SELECT "Booking_ID", "Booking_Status" 
FROM ola_bookings 
WHERE "Booking_Status" = 'Success';

SELECT * FROM Successful_Bookings;

-- #2. Find the average ride distance for each vehicle type :

CREATE VIEW Avg_Ride_Distance AS
SELECT "Vehicle_Type", AVG("Ride_Distance"::numeric) AS Avg_Ride_Distance
FROM ola_bookings
GROUP BY "Vehicle_Type";

SELECT * FROM Avg_Ride_Distance;

-- #3. Get the total number of cancelled rides by customers :

CREATE VIEW Canceled_Ride_By_Customer AS
SELECT COUNT(*) AS No_Of_Canceled_Rides 
FROM ola_bookings
WHERE "Booking_Status" = 'Canceled by Customer';

SELECT * FROM Canceled_Ride_By_Customer;

-- #4. List the top 5 customers who booked the highest number of rides :

CREATE VIEW Top_5_Booking_Customer AS
SELECT "Customer_ID", COUNT("Booking_ID") AS Total_Rides
FROM ola_bookings
GROUP BY "Customer_ID"
ORDER BY Total_Rides DESC LIMIT 5;

SELECT * FROM Top_5_Booking_Customer;

-- #5. Get the number of rides cancelled by drivers due to personal and car-related issues :

CREATE VIEW Ride_Canceled_By_Driver AS
SELECT COUNT(*) AS Count_Canceled_By_Driver
FROM ola_bookings
WHERE "Booking_Status" = 'Canceled by Driver'
AND "Canceled_Rides_by_Driver" = 'Personal & Car related issue';

SELECT * FROM Ride_Canceled_By_Driver;

-- #6. Find the maximum and minimum driver ratings for Prime Sedan bookings :

CREATE VIEW Max_Min_Driver_Rating AS
SELECT MIN("Driver_Ratings") AS Minimum_Rating, MAX("Driver_Ratings") AS Maximum_Rating
FROM ola_bookings
WHERE "Vehicle_Type" = 'Prime Sedan' AND "Driver_Ratings" <> '0.0' AND "Driver_Ratings" <> '5.0';

SELECT * FROM Max_Min_Driver_Rating;

-- #7. Retrieve all rides where payment was made using UPI :

CREATE VIEW Payment_Via_UPI AS
SELECT "Date", "Time", "Booking_ID", "Payment_Method"
FROM ola_bookings
WHERE "Payment_Method" = 'UPI';

SELECT * FROM Payment_Via_UPI;

-- #8. Find the average customer rating per vehicle type :

CREATE VIEW Avg_Customer_Rating AS
SELECT "Vehicle_Type", AVG("Customer_Rating"::numeric) AS Avg_Customer_Rating
FROM ola_bookings
GROUP BY "Vehicle_Type";

SELECT * FROM Avg_Customer_Rating;

-- #9. Calculate the total booking value of rides completed successfully :

CREATE VIEW Total_Booking_Value AS
SELECT SUM("Booking_Value"::numeric) AS Total_Booking
FROM ola_bookings
WHERE "Incomplete_Rides" = 'No';

SELECT * FROM Total_Booking_Value;

-- #10. List all incomplete rides along with the reason :

CREATE VIEW Incomplete_Rides_Reason AS
SELECT "Booking_ID", "Incomplete_Rides", "Incomplete_Rides_Reason"
FROM ola_bookings
WHERE "Incomplete_Rides" = 'Yes';

SELECT * FROM Incomplete_Rides_Reason;

---------------------------------------------------------- Testing Query -------------------------------------------------------------------------
-- SELECT * FROM ola_bookings;
-----------------------------------------------------------------------------------------------------------------------------------