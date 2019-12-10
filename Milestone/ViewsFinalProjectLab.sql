/* CHAPTER 13 LAB --Sammi Sortzi

VIEW #1

USE carsOfTheYear;
GO
CREATE VIEW MFGRCountry
AS
SELECT CountryID, Make
FROM MFGR
GO

SELECT * FROM MFGRCountry

GO
UPDATE MFGRCountry
SET Make = 'German'
WHERE CountryID=1
GO

SELECT * FROM MFGRCountry

View #2

GO
CREATE VIEW Engines
AS
SELECT EngineSize.EngineID, EngineType, Model, StyleID
FROM EngineSize JOIN Cars ON EngineSize.EngineID = Cars.EngineID
GO

SELECT * FROM Engines

View #3

GO
CREATE VIEW CarInfo
AS
SELECT MFGR.MFGRID, Make, Model
FROM MFGR JOIN Cars ON MFGR.MFGRID = Cars.MFGRID
GO

SELECT * FROM CarInfo

View #4

GO
CREATE VIEW Countries
AS
SELECT Country.CountryID, Country, Make
FROM Country JOIN MFGR ON Country.CountryID = MFGR.CountryID
GO

SELECT * FROM Countries*/
