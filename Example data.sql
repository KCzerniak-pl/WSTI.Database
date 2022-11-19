--
-- Example data for 'Manufacturers'
--
INSERT INTO Manufacturers (Name) VALUES 
('Producent 1');
INSERT INTO Manufacturers (Name) VALUES 
('Producent 2');
INSERT INTO Manufacturers (Name) VALUES 
('Producent 3');
INSERT INTO Manufacturers (Name) VALUES 
('Producent 4');
INSERT INTO Manufacturers (Name) VALUES 
('Producent 5');
INSERT INTO Manufacturers (Name) VALUES 
('Producent 6');
INSERT INTO Manufacturers (Name) VALUES 
('Producent 7');
INSERT INTO Manufacturers (Name) VALUES 
('Producent 8');
INSERT INTO Manufacturers (Name) VALUES 
('Producent 9');

-- --------------------------------------------------------

--
-- Example data for 'Types'
--
INSERT INTO Types (Type) VALUES 
('Tabletki');
INSERT INTO Types (Type) VALUES 
('Krople');
INSERT INTO Types (Type) VALUES 
('Syrop');
INSERT INTO Types (Type) VALUES 
('Granulat');
INSERT INTO Types (Type) VALUES 
('Krem');
INSERT INTO Types (Type) VALUES 
('Aerozol');
INSERT INTO Types (Type) VALUES 
('Zel');

-- --------------------------------------------------------

--
-- Example data for 'Prescription'
--
INSERT INTO Prescription (Type) VALUES 
('Nie');
INSERT INTO Prescription (Type) VALUES 
('RP');
INSERT INTO Prescription (Type) VALUES  
('RPW');

-- --------------------------------------------------------

--
-- Example data for 'Products'
--
INSERT INTO Products (Name, ManufacturerID, TypeID, Package, PrescriptionID, Description, Price, Availability) VALUES 
('Produkt 1', 1, 1, '30 szt.', '2', 'brak', 14.12, 5);
INSERT INTO Products (Name, ManufacturerID, TypeID, Package, PrescriptionID, Description, Price, Availability) VALUES 
('Produkt 2', 1, 1, '30 szt.', '2', 'brak', 3.87, 8);
INSERT INTO Products (Name, ManufacturerID, TypeID, Package, PrescriptionID, Description, Price, Availability) VALUES 
('Produkt 3', 1, 2, '10 ml.', '1', 'brak', 8.84, 10);
INSERT INTO Products (Name, ManufacturerID, TypeID, Package, PrescriptionID, Description, Price, Availability) VALUES  
('Produkt 4', 2, 3, '100 ml.', '2', 'brak', 5.37, 17);
INSERT INTO Products (Name, ManufacturerID, TypeID, Package, PrescriptionID, Description, Price, Availability) VALUES 
('Produkt 5', 3, 4, '20 saszetek', '3', 'brak', 11.19, 5);
INSERT INTO Products (Name, ManufacturerID, TypeID, Package, PrescriptionID, Description, Price, Availability) VALUES 
('Produkt 6', 4, 1, '30 szt.', '2', 'brak', 66.54, 12);	
INSERT INTO Products (Name, ManufacturerID, TypeID, Package, PrescriptionID, Description, Price, Availability) VALUES 
('Produkt 7', 5, 5, '15 g.', '2', 'brak', 12.55, 7);		
INSERT INTO Products (Name, ManufacturerID, TypeID, Package, PrescriptionID, Description, Price, Availability) VALUES 
('Produkt 8', 5, 3, '100 ml.', '2', 'brak', 15.87, 3);		
INSERT INTO Products (Name, ManufacturerID, TypeID, Package, PrescriptionID, Description, Price, Availability) VALUES 
('Produkt 9', 6, 6, '120 ml.', '3', 'brak', 105.80, 2);
INSERT INTO Products (Name, ManufacturerID, TypeID, Package, PrescriptionID, Description, Price, Availability) VALUES 
('Produkt 10', 6, 5, '150 ml.', '2', 'brak', 16.37, 4);	
INSERT INTO Products (Name, ManufacturerID, TypeID, Package, PrescriptionID, Description, Price, Availability) VALUES 
('Produkt 11', 7, 7, '40 g.', '2', 'brak', 30.40, 5);	
INSERT INTO Products (Name, ManufacturerID, TypeID, Package, PrescriptionID, Description, Price, Availability) VALUES 
('Produkt 12', 8, 3, '20 g.', '1', 'brak', 3.00, 9);		
INSERT INTO Products (Name, ManufacturerID, TypeID, Package, PrescriptionID, Description, Price, Availability) VALUES 
('Produkt 13', 9, 7, '40 g.', '1', 'brak', 19.00, 3);		

-- --------------------------------------------------------

--
-- Example data for 'Patients'
--
INSERT INTO Patients (Name, Surname, Pesel, Sex) VALUES 
('Jan', 'Kowalski', 29088400030, 'M');
INSERT INTO Patients (Name, Surname, Pesel, Sex) VALUES 
('Edward', 'Nowak', 31098500040, 'F');
INSERT INTO Patients (Name, Surname, Pesel, Sex) VALUES 
('Anna', 'Kowalczyk', 18038000030, 'M');
INSERT INTO Patients (Name, Surname, Pesel, Sex) VALUES 
('Zbigniew', 'Lewandowski', 21057400030, 'M');

-- --------------------------------------------------------

--
-- Przyk³adowe dane dla tabeli 'Doctors'
--
INSERT INTO Doctors (DoctorNumber, Name, Surname) VALUES 
(123425, 'Agnieszka', 'Mazur');
INSERT INTO Doctors (DoctorNumber, Name, Surname) VALUES  
(231433, 'Andrzej', 'Kaczmarek');
INSERT INTO Doctors (DoctorNumber, Name, Surname) VALUES 
(831643, 'Robert', 'Nowak');

-- --------------------------------------------------------

--
-- Przyk³adowe dane dla tabeli 'Prescriptions'
--
INSERT INTO Prescriptions (PrescriptionNumber, PrescriptionDate, DoctorID, PatientID) VALUES 
(1246438543, '2019-06-07', 1, 1);
INSERT INTO Prescriptions (PrescriptionNumber, PrescriptionDate, DoctorID, PatientID) VALUES 
(1446410116, '2019-06-07', 2, 2);
INSERT INTO Prescriptions (PrescriptionNumber, PrescriptionDate, DoctorID, PatientID) VALUES 
(1365487574, '2019-06-08', 1, 3);
INSERT INTO Prescriptions (PrescriptionNumber, PrescriptionDate, DoctorID, PatientID) VALUES  
(1100477521, '2019-06-09', 3, 4);

-- --------------------------------------------------------

--
-- Przyk³adowe dane dla tabeli 'Employees'
--
INSERT INTO Employees (EmployeeNumber, Name, Surname) VALUES 
(1230472521, 'Anna', 'Krawczyk');
INSERT INTO Employees (EmployeeNumber, Name, Surname) VALUES 
(1260427228, 'Monika', 'Grabowska');

-- --------------------------------------------------------

--
-- Przyk³adowe dane dla tabeli 'Transactions'
--
INSERT INTO Transactions (TransactionNumber, PrescriptionID, ProductID, Quantity, EmployeeID) VALUES 
(0706090001, 1, 1, 1, 1);
INSERT INTO Transactions (TransactionNumber, PrescriptionID, ProductID, Quantity, EmployeeID) VALUES 
(0706090001, 1, 2, 1, 1);
INSERT INTO Transactions (TransactionNumber, PrescriptionID, ProductID, Quantity, EmployeeID) VALUES 
(0706090001, 1, 4, 2, 1);
INSERT INTO Transactions (TransactionNumber, PrescriptionID, ProductID, Quantity, EmployeeID) VALUES 
(0706090001, NULL, 3, 2, 1);

INSERT INTO Transactions (TransactionNumber, PrescriptionID, ProductID, Quantity, EmployeeID) VALUES  
(0706090002, 2, 5, 2, 1);
INSERT INTO Transactions (TransactionNumber, PrescriptionID, ProductID, Quantity, EmployeeID) VALUES 
(0706090002, 2, 6, 1, 1);

INSERT INTO Transactions (TransactionNumber, PrescriptionID, ProductID, Quantity, EmployeeID) VALUES 
(0806090001, 3, 7, 1, 2);
INSERT INTO Transactions (TransactionNumber, PrescriptionID, ProductID, Quantity, EmployeeID) VALUES 
(0806090001, 3, 8, 1, 2);

INSERT INTO Transactions (TransactionNumber, PrescriptionID, ProductID, Quantity, EmployeeID) VALUES 
(0906090001, 4, 9, 1, 2);
INSERT INTO Transactions (TransactionNumber, PrescriptionID, ProductID, Quantity, EmployeeID) VALUES 
(0906090001, 4, 10, 1, 2);
INSERT INTO Transactions (TransactionNumber, PrescriptionID, ProductID, Quantity, EmployeeID) VALUES 
(0906090001, 4, 11, 1, 2);
INSERT INTO Transactions (TransactionNumber, PrescriptionID, ProductID, Quantity, EmployeeID) VALUES 
(0906090001, NULL, 12, 3, 2);
INSERT INTO Transactions (TransactionNumber, PrescriptionID, ProductID, Quantity, EmployeeID) VALUES 
(0906090001, NULL, 13, 2, 2);