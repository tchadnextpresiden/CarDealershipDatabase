USE CarDealershipDatabase;

SELECT v.*
FROM inventory i
JOIN vehicles v ON i.VIN = v.VIN
WHERE i.dealership_id = 1;
