USE CarDealershipDatabase;

SELECT *
FROM sales_contracts
WHERE dealership_id = 1
  AND sale_date BETWEEN '2024-05-01' AND '2024-12-31';
