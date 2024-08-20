/* Data Analyst Portfolio Project | Data Cleaning in SQL

Project Overview:
In this project, we will perform data cleaning tasks on a dataset containing Nashville housing data. The dataset includes various details such as property addresses, sale dates, owner information, and other related data. The focus will be on standardizing the data, handling missing values, splitting data into separate columns, and removing duplicates. The end goal is to have a clean and well-structured dataset that can be used for further analysis.

Steps Involved:

1. Standardize Date Format:
    - The `SaleDate` column initially includes both date and time. Since the time portion is unnecessary, we will convert the `SaleDate` column to a standard date format.
    - If the update does not apply directly, we'll add a new column `SaleDateConverted` and populate it with the converted date values. */


    -- Convert SaleDate to Date format
    
    Update NashvilleHousing
    SET SaleDate = CONVERT(Date, SaleDate);

    -- If the update does not apply, use the following approach:
   
    ALTER TABLE NashvilleHousing
    ADD SaleDateConverted Date;

    Update NashvilleHousing
    SET SaleDateConverted = CONVERT(Date, SaleDate);
  
/*
2. Populate Missing Property Address Data:
    - Some entries may have missing property addresses. To fill in these gaps, we will compare rows with the same `ParcelID` and populate the missing `PropertyAddress` using available data from other rows with the same `ParcelID`.
*/
  
    -- Populate missing PropertyAddress data
    
    Update a
    SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
    From PortfolioProject.dbo.NashvilleHousing a
    JOIN PortfolioProject.dbo.NashvilleHousing b
    ON a.ParcelID = b.ParcelID AND a.[UniqueID ] <> b.[UniqueID ]
    WHERE a.PropertyAddress is null;

/*
3. Breaking Down Address into Individual Columns:
    - The `PropertyAddress` and `OwnerAddress` columns contain full addresses, including street, city, and state. We will break these into separate columns for better clarity and easier analysis.
*/
    -- Split PropertyAddress into Address and City

    ALTER TABLE NashvilleHousing
    ADD PropertySplitAddress NVARCHAR(255),
        PropertySplitCity NVARCHAR(255);

    Update NashvilleHousing
    SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1),
        PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress));

    
    -- Split OwnerAddress into Address, City, and State

    ALTER TABLE NashvilleHousing
    ADD OwnerSplitAddress NVARCHAR(255),
        OwnerSplitCity NVARCHAR(255),
        OwnerSplitState NVARCHAR(255);

    Update NashvilleHousing
    SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3),
        OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2),
        OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1);

/*
4. Standardize "Sold as Vacant" Field:
    - The `SoldAsVacant` field contains values like 'Y' and 'N'. We will standardize these values to 'Yes' and 'No' for better readability.
*/

    -- Convert 'Y'/'N' to 'Yes'/'No'
    Update NashvilleHousing
    SET SoldAsVacant = CASE 
        WHEN SoldAsVacant = 'Y' THEN 'Yes'
        WHEN SoldAsVacant = 'N' THEN 'No'
        ELSE SoldAsVacant
    END;
   
/*
5. Remove Duplicate Records:
    - We will identify and remove duplicate rows based on certain key fields like `ParcelID`, `PropertyAddress`, `SalePrice`, `SaleDate`, and `LegalReference`.
*/
   
    -- Remove duplicates based on key fields
    WITH RowNumCTE AS (
        SELECT *,
            ROW_NUMBER() OVER (
                PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference
                ORDER BY UniqueID
            ) as row_num
        FROM PortfolioProject.dbo.NashvilleHousing
    )
    DELETE FROM PortfolioProject.dbo.NashvilleHousing
    WHERE UniqueID IN (
        SELECT UniqueID FROM RowNumCTE WHERE row_num > 1
    );


/*
6. Delete Unused Columns:
    - After completing the necessary data cleaning tasks, some columns may no longer be required. We will remove these to streamline the dataset.
*/
   
    -- Drop unused columns
    ALTER TABLE PortfolioProject.dbo.NashvilleHousing
    DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate;
   

/* Conclusion:
By following the above steps, we've cleaned and structured the Nashville housing dataset, ensuring it is ready for analysis. This project highlights essential data cleaning techniques in SQL, including date formatting, missing data handling, data splitting, and duplicate removal. These skills are crucial for any data analyst working with raw datasets.
*/