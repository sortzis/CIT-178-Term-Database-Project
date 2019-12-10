/*CREATE DATABASE carsOfTheYear;

GO
USE carsOfTheYear;
CREATE TABLE Cars(
	CarID int NOT NULL,
	Model varchar(20) NOT NULL,
	MFGRID int,
	StyleID int,
	PerformanceID int,
	EngineID int,
	PRIMARY KEY(CarID)
);
CREATE TABLE Style(
	StyleID int NOT NULL,
	StyleName varchar(15),
	PRIMARY KEY(StyleID)
);
CREATE TABLE Performance(
	PerformanceID int NOT NULL,
	Style varchar(15),
	PRIMARY KEY(PerformanceID)
);
CREATE TABLE MFGR(
	MFGRID int NOT NULL,
	Make varchar(15),
	CountryID int NOT NULL,
	PRIMARY KEY(MFGRID)
);
CREATE TABLE Country(
	CountryID int NOT NULL,
	Country varchar(10),
	PRIMARY KEY(CountryID)
);
CREATE TABLE EngineSize(
	EngineID int NOT NULL,
	EngineType varchar(15),
	PRIMARY KEY(EngineID)
);*/
