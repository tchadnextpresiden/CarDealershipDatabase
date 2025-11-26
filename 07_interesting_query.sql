USE CarDealershipDatabase;

SELECT d.dealership_id,
       d.name,
       COUNT(i.VIN) AS vehicle_count
FROM dealerships d
LEFT JOIN inventory i ON d.dealership_id = i.dealership_id
GROUP BY d.dealership_id, d.name
ORDER BY vehicle_count DESC;
