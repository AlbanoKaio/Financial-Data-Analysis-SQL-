-- Exploring the main tables to understand the dataset structure
select top(1000) * from FactSales
select * from DimStore
select * from DimGeography
select * from DimChannel

-- Analysis of revenue, profit, and margin by store
select top(10)
	DimStore.StoreName,
	SUM(FactSales.SalesAmount) GrossSales,
	sum(FactSales.TotalCost) TotalCost,
	SUM(FactSales.SalesAmount - FactSales.TotalCost) as GrossProfit,
	SUM(FactSales.SalesAmount - FactSales.TotalCost) * 100 / SUM(FactSales.SalesAmount)  as MarginPercent
from FactSales
INNER JOIN DimStore on FactSales.StoreKey = DimStore.StoreKey
INNER JOIN DimGeography ON DimStore.GeographyKey = DimGeography.GeographyKey
group by DimStore.StoreName
ORDER BY MarginPercent desc
---------------------------------------------------------
-- Analysis of revenue, profit, and margin by country
select
	DimGeography.RegionCountryName,
	SUM(FactSales.SalesAmount) GrossSales,
	sum(FactSales.TotalCost) TotalCost,
	SUM(FactSales.SalesAmount - FactSales.TotalCost) as GrossProfit,
	SUM(FactSales.SalesAmount - FactSales.TotalCost) * 100 / SUM(FactSales.SalesAmount)  as MarginPercent
from FactSales
INNER JOIN DimStore on FactSales.StoreKey = DimStore.StoreKey
INNER JOIN DimGeography ON DimStore.GeographyKey = DimGeography.GeographyKey
group by DimGeography.RegionCountryName
ORDER BY MarginPercent desc
--------------------------------------------------------------
