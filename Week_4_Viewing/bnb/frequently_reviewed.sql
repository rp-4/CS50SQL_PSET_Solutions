
CREATE VIEW "frequently_reviewed" AS
SELECT listings.id, listings.property_type, listings.host_name, COUNT(reviews.listing_id) AS 'reviews' FROM "listings"
JOIN reviews
  ON reviews.listing_id = listings.id
GROUP BY reviews.listing_id ORDER BY COUNT(reviews.listing_id) DESC, listings.property_type, listings.host_name LIMIT 100;
