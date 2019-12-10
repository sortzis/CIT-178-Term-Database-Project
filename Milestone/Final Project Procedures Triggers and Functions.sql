/* Final Project Procedures 

USE carsOfTheYear;
GO
CREATE PROC spMakeAndModel
AS
SELECT Make, Model
FROM MFGR JOIN Cars
ON Cars.MFGRID = MFGR.MFGRID
ORDER BY Model
EXEC spMakeAndModel;

USE carsOfTheYear
GO
CREATE PROC spEngineSize
	@EngineID varchar(15)
AS
BEGIN
	SELECT EngineType
	FROM EngineSize
	WHERE EngineID LIKE @EngineID
END
GO
EXEC spEngineSize '5';

USE carsOfTheYear;
GO
CREATE PROC spBMWModels
	@MFGRID int,
	@Model nvarchar(15) OUTPUT
AS
SELECT @MFGRID = MFGRID, @Model = Model
FROM Cars
WHERE MFGRID = @MFGRID
GO

DECLARE @Model nvarchar(15);
EXEC spBMWModels 1, @Model OUTPUT
SELECT @Model AS 'Models';

USE carsOfTheYear;
GO
CREATE PROC spCarsCount
AS
DECLARE @CarsCount int;
SELECT @CarsCount = COUNT(*)
FROM Cars
RETURN @CarsCount
GO

DECLARE @CarsCount int;
EXEC @CarsCount = spCarsCount;
PRINT 'There are ' + CONVERT(varchar, @CarsCount) + ' cars in your database';
GO

Final Project User Defined Functions

-- Scalar Function
USE carsOfTheYear;
GO
CREATE FUNCTION fnSelectPerformance
    (@Perform nvarchar(20) = '%')
    RETURNS varchar(20)
BEGIN
    RETURN (SELECT Style FROM Performance WHERE Style Like @Perform);
END; 
GO
SELECT PerformanceID, Style FROM Performance
WHERE Style = dbo.fnSelectPerformance('Sp%');

--Table Function
USE carsOfTheYear;
GO
CREATE FUNCTION fnCountries
	(@Countries nvarchar(30) = '%')
	RETURNS table
RETURN
	(SELECT * FROM Country WHERE Country LIKE @Countries);
GO
SELECT * FROM dbo.fnCountries('U%');

Final Project Triggers

USE carsOfTheYear;
GO
SELECT * INTO CarsArchive
FROM Cars
WHERE 1=0;

ALTER TABLE CarsArchive
ADD Activity varchar(50);
GO

CREATE TRIGGER CarsArchive_INSERT ON Cars
	AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @CarID int
		DECLARE @Model nvarchar(20)
		DECLARE @MFGRID int
		DECLARE @StyleID int
		DECLARE @PerformanceID int
		DECLARE @EngineID int

	SELECT @CarID =INSERTED.CarID, @Model = INSERTED.Model, @MFGRID = INSERTED.MFGRID,
	@StyleID = INSERTED.StyleID, @PerformanceID = INSERTED.StyleID, @EngineID = INSERTED.EngineID
		FROM INSERTED

	INSERT INTO CarsArchive VALUES(@CarID,@Model,@MFGRID,@StyleID,@PerformanceID,@EngineID, 'INSERTED')
END
GO

INSERT INTO Cars VALUES(21, 'A9',9,2,4,3);
GO

SELECT * FROM CarsArchive;
GO

CREATE TRIGGER CustomerArchive_Delete ON Cars
	AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @CarID int
		DECLARE @Model nvarchar(20)
		DECLARE @MFGRID int
		DECLARE @StyleID int
		DECLARE @PerformanceID int
		DECLARE @EngineID int

	SELECT @CarID =DELETED.CarID, @Model = DELETED.Model, @MFGRID = DELETED.MFGRID,
	@StyleID = DELETED.StyleID, @PerformanceID = DELETED.StyleID, @EngineID = DELETED.EngineID
		FROM DELETED

	INSERT INTO CarsArchive VALUES(@CarID,@Model,@MFGRID,@StyleID,@PerformanceID,@EngineID, 'Deleted')
END
GO

DELETE FROM Cars WHERE CarID = 21;
GO

SELECT * FROM CarsArchive

CREATE TRIGGER CustomerArchive_Update ON Cars
	AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @CarID int
		DECLARE @Model nvarchar(20)
		DECLARE @MFGRID int
		DECLARE @StyleID int
		DECLARE @PerformanceID int
		DECLARE @EngineID int

	SELECT @CarID =INSERTED.CarID, @Model = INSERTED.Model, @MFGRID = INSERTED.MFGRID,
	@StyleID = INSERTED.StyleID, @PerformanceID = INSERTED.StyleID, @EngineID = INSERTED.EngineID
		FROM INSERTED

	INSERT INTO CarsArchive VALUES(@CarID,@Model,@MFGRID,@StyleID,@PerformanceID,@EngineID, 'Updated')
END
GO

INSERT INTO Cars VALUES(22,'Eclipse',9,2,4,3)
GO
UPDATE Cars
SET Model = 'Jetta'
WHERE CarID = 22;
GO
SELECT * FROM CarsArchive;*/