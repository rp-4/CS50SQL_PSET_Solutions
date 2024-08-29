-- *** The Lost Letter ***
/*Clerk, my name’s Anneke. I live over at 900 Somerville Avenue.
Not long ago, I sent out a special letter. It’s meant for my friend Varsha.
She’s starting a new chapter of her life at 2 Finnegan Street, uptown.
(That address, let me tell you: it was a bit tricky to get right the first time.)
The letter is a congratulatory note—a cheery little paper hug from me to her, to celebrate this big move of hers.
Can you check if it’s made its way to her yet? */

-- given data
-- from: 900 Somerville Avenue
-- to: 2 Finnegan Street, uptown
-- type: congratulatory note—a cheery little paper hug

-- Check if the FROM and TO addrsses are available. (TO address is not available)

SELECT * FROM addresses WHERE address = "900 Somerville Avenue";
SELECT * FROM addresses WHERE address = "2 Finnegan Street";

/* we will find the TO address id from PACKAGES table using FROM address and PACKAGE CONTENT
and then get the name and type of TO address from the PACKAGES table */

SELECT address, type FROM "addresses" WHERE id = (
    SELECT to_address_id FROM "packages" WHERE from_address_id = (
        SELECT id FROM "addresses" WHERE address = "900 Somerville Avenue")
        AND contents LIKE "%congratulatory%"
        OR contents LIKE "%cheery%"
        OR contents LIKE "%little%");


-- *** The Devious Delivery ***
/*Good day to you, deliverer of the mail. You might remember that not too long ago I made my way over from the town of Fiftyville.
I gave a certain box into your reliable hands and asked you to keep things low.
My associate has been expecting the package for a while now. And yet, it appears to have grown wings and flown away.
Ha! Any chance you could help clarify this mystery? Afraid there’s no “From” address.
It’s the kind of parcel that would add a bit more… quack to someone’s bath times, if you catch my drift.*/

-- given data
-- FROM: Null

-- simply get the PACKAGE_ID from PACKAGES TABLE where FROM address ISNULL
-- then get the ADDRESS_ID from SCANS TABLE using PACKAGE_ID and ACTION=DROP

SELECT * FROM "addresses" WHERE id = (
    SELECT address_id FROM "scans" WHERE action = "Drop" AND package_id = (
        SELECT id FROM "packages" WHERE from_address_id ISNULL));

-- simpley get the CONTENTS from PACKAGES table where FROM id is NULL
SELECT contents FROM "packages" WHERE from_address_id ISNULL;


-- *** The Forgotten Gift ***
/*Oh, excuse me, Clerk. I had sent a mystery gift, you see, to my wonderful granddaughter, off at 728 Maple Place.
That was about two weeks ago. Now the delivery date has passed by seven whole days and I hear she still waits,
her hands empty and heart filled with anticipation. I’m a bit worried wondering where my package has gone.
I cannot for the life of me remember what’s inside, but I do know it’s filled to the brim with my love for her.
Can we possibly track it down so it can fill her day with joy? I did send it from my home at 109 Tileston Street.*/

-- given data
-- FROM: 109 Tileston Street
-- TO: 728 Maple Place
-- CONTENT: have to find
-- ABOUT TWO WEEKS AGO
-- DELIVERY DATE HAS PASSED BY SEVEN WHOLE DAYS

-- check the CONTENT of the package from PACKAGES table using FROM and TO addresses which are already given

SELECT * FROM "packages" WHERE from_address_id = (
    SELECT id FROM "addresses" WHERE address = "109 Tileston Street")
    AND to_address_id = (
    SELECT id FROM "addresses" WHERE address = "728 Maple Place");


-- join multiple tables: PACKAGES, SCANS and DRIVERS
-- then list everything using FROM and TO given addresses
-- we can see that the at the latest timestamp, driver named Mikel picked it up but never Dropped it.

SELECT * FROM "packages"
JOIN scans
  ON scans.package_id = packages.id
JOIN drivers
  ON scans.driver_id = drivers.id
WHERE packages.from_address_id = (
	SELECT id FROM "addresses" WHERE address = "109 Tileston Street")
	AND packages.to_address_id = (
	SELECT id FROM "addresses" WHERE address = "728 Maple Place");
