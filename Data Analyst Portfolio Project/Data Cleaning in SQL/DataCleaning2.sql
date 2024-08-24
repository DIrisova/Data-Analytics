select * from [dbo].[NashvilleHousingData ]
----------------------------------------------------------------
-- 1. Standardize Date Format:
select SaleDate, CONVERT(Date, SaleDate)
from [dbo].[NashvilleHousingData ]

update [dbo].[NashvilleHousingData ]
set SaleDate = CONVERT(Date, SaleDate)

Alter table NashvilleHousingData
Add SaleDateConverted Date;

update NashvilleHousingData
Set SaleDateConverted = CONVERT(Date, SaleDate)

select SaleDateConverted, SaleDate
from [dbo].[NashvilleHousingData ]

----------------------------------------------------------------
-- 2. Populate Missing Property Address Data:
-- where Property address is Null
select * from [dbo].[NashvilleHousingData ]
where PropertyAddress is Null

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress) as CopyAdress
from [dbo].[NashvilleHousingData ] a 
JOIN [dbo].[NashvilleHousingData ] b 
ON a.ParcelID = b.ParcelID
and a.UniqueID <> b.UniqueID
where a.PropertyAddress is NULL

update a
set PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
from [dbo].[NashvilleHousingData ] a 
JOIN [dbo].[NashvilleHousingData ] b 
ON a.ParcelID = b.ParcelID
and a.UniqueID <> b.UniqueID

----------------------------------------------------------------
-- 3. Breaking Down Address into Individual Columns: Address, City, State
Select PropertyAddress 
from [dbo].[NashvilleHousingData ]

SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) as Address,
from [dbo].[NashvilleHousingData ] 


SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) as Address,
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress)) as AddressClear
from [dbo].[NashvilleHousingData ]


ALTER TABLE NashvilleHousingData
ADD PropertySplitAddress NVARCHAR(255)

UPDATE NashvilleHousingData
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1)


ALTER TABLE NashvilleHousingData
ADD PropertySplitCity NVARCHAR(255)

UPDATE NashvilleHousingData
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress))

SELECT * from NashvilleHousingData



select [OwnerAddress] from NashvilleHousingData

select 
Parsename(REPLACE(OwnerAddress, ',', '.'), 1)
from NashvilleHousingData


select 
Parsename(REPLACE(OwnerAddress, ',', '.'), 3),
Parsename(REPLACE(OwnerAddress, ',', '.'), 2),
Parsename(REPLACE(OwnerAddress, ',', '.'), 1)
from NashvilleHousingData


ALTER TABLE NashvilleHousingData
ADD OwnerSplitAddress NVARCHAR(255)

UPDATE NashvilleHousingData
SET OwnerSplitAddress = Parsename(REPLACE(OwnerAddress, ',', '.'), 3)


ALTER TABLE NashvilleHousingData
ADD OwnerSplitCity NVARCHAR(255)

UPDATE NashvilleHousingData
SET OwnerSplitCity = Parsename(REPLACE(OwnerAddress, ',', '.'), 2)

ALTER TABLE NashvilleHousingData
ADD OwnerSplitState NVARCHAR(255)

UPDATE NashvilleHousingData
SET OwnerSplitState = Parsename(REPLACE(OwnerAddress, ',', '.'), 1)

SELECT * from NashvilleHousingData

----------------------------------------------------------------

-- 4. Change Y and N to Yes and No in "Sold as Vacant" field

select SoldAsVacant
from NashvilleHousingData

SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
from NashvilleHousingData
GROUP BY SoldAsVacant
order by 2


SELECT SoldAsVacant,
CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
     WHEN SoldAsVacant = 'N' THEN 'No'
     ELSE SoldAsVacant
     END
from NashvilleHousingData


UPDATE NashvilleHousingData
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
     WHEN SoldAsVacant = 'N' THEN 'No'
     ELSE SoldAsVacant
     END


SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
from NashvilleHousingData
GROUP BY SoldAsVacant
order by 2


-- 5. Remove Duplicates 
-- identify duplicates 
SELECT * from NashvilleHousingData

WITH RowNumCTE as (
SELECT *, 
    row_number() OVER(
        partition by ParcelID,
                     PropertyAddress,
                     SalePrice, 
                     SaleDate,
                     LegalReference
                     ORDER BY UniqueID) row_num
from NashvilleHousingData
-- order by ParcelID
)
SELECT * from RowNumCTE
WHERE row_num > 1
ORDER By PropertyAddress

-- delete duplicates 
WITH RowNumCTE as (
SELECT *, 
    row_number() OVER(
        partition by ParcelID,
                     PropertyAddress,
                     SalePrice, 
                     SaleDate,
                     LegalReference
                     ORDER BY UniqueID) row_num
from NashvilleHousingData
-- order by ParcelID
)
Delete 
from RowNumCTE
WHERE row_num > 1

-- run select * RowNumCTE from above query 

---------------------------------------------------------------------

-- Delete Unsused Columns

SELECT * 
from NashvilleHousingData

ALTER TABLE NashvilleHousingData
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress





