USE CarDealershipDatabase;

SELECT d.*
FROM inventory i
JOIN dealerships d ON i.dealership_id = d.dealership_id
WHERE i.VIN = '1FAFP404X1F123456';
