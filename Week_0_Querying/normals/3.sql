/* choose a location of your own and write a SQL query to find the normal temperature at 0 meters, 100 meters, and 200 meters.
You might find Google Earth helpful if you’d like to find some coordinates to use! */
-- 21°50'31"N 67°12'59"E  = 21.5 lat, 67.5 long

SELECT "0m", "100m" ,"200m" FROM "normals" WHERE latitude = 21.5 AND longitude = 67.5;


