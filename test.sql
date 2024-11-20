-- 1) Get All Dealerships
SELECT * FROM dealerships;

-- 2) Find All Vehicles for a Specific Dealership
SELECT v.*, d.`Name`
FROM inventory AS i
INNER JOIN vehicles AS v
ON i.VIN = v.VIN
INNER JOIN dealerships as d
ON i.DealershipID = d.DealershipID
WHERE i.DealershipID = 1;

-- 3) Find a Car by VIN
SELECT * FROM vehicles
WHERE VIN = "VIN005";

-- 4) Find the Dealership a Car is Located by VIN
Select d.* FROM dealerships AS d
INNER JOIN inventory AS i
ON d.DealershipID = i.DealershipID
WHERE i.VIN = "VIN005";

-- 5) Find All Dealerships That Have a Certain Type of Car
SELECT d.* FROM dealerships AS d
INNER JOIN inventory AS i
ON d.DealershipID = i.DealershipID
INNER JOIN vehicles AS v
ON i.VIN = v.VIN
WHERE v.Color = "Blue" AND v.Make = "Audi" AND v.Model = "A4";

-- 6) Get All Sales Information for a Specific Dealer
SELECT d.`Name`, SC.* FROM salescontracts AS SC
INNER JOIN inventory AS i
ON SC.VIN = i.VIN
INNER JOIN dealerships AS d
ON i.DealershipID = d.DealershipID
WHERE d.DealershipID = 2 AND SaleDate BETWEEN "2024-01-01" AND "2024-04-01";