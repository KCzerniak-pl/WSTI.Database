--
-- List all products - view 'AllProd'
--
CREATE VIEW AllProd AS 
SELECT PR.Name AS "Nazwa", MF.Name AS "Producent", CONCAT(TRIM(TP.Type), ' - ' , PR.Package) AS "Opakowanie", PP.Type AS 'Produkt na recepte', PR.Description AS "Uwagi", CONCAT(PR.Price, ' zl') AS Cena, CONCAT(PR.Availability, ' szt.') AS 'Stan magazynowy' 
FROM Products AS PR 
LEFT JOIN Manufacturers AS MF ON PR.ManufacturerID = MF.ID
LEFT JOIN Types AS TP ON PR.TypeID = TP.ID
LEFT JOIN Prescription AS PP ON PR.PrescriptionID = PP.ID;

-- --------------------------------------------------------

--
-- List all products on prescription - view 'AllProdP'
--
CREATE VIEW AllProdP AS 
SELECT PR.Name AS "Nazwa", MF.Name AS "Producent", CONCAT(TRIM(TP.Type), ' - ' , PR.Package) AS "Opakowanie", PP.Type AS 'Produkt na recepte', PR.Description AS "Uwagi", CONCAT(PR.Price, ' zl') AS Cena, CONCAT(PR.Availability, ' szt.') AS 'Stan magazynowy' 
FROM Products AS PR 
LEFT JOIN Manufacturers AS MF ON PR.ManufacturerID = MF.ID
LEFT JOIN Types AS TP ON PR.TypeID = TP.ID
LEFT JOIN Prescription AS PP ON PR.PrescriptionID = PP.ID
WHERE PP.Type!='Nie';

-- --------------------------------------------------------

--
-- List all products without prescription - view 'AllProdWP'
--
CREATE VIEW AllProdWP AS 
SELECT PR.Name AS "Nazwa", MF.Name AS "Producent", CONCAT(TRIM(TP.Type), ' - ' , PR.Package) AS "Opakowanie", PP.Type AS 'Produkt na recepte', PR.Description AS "Uwagi", CONCAT(PR.Price, ' zl') AS Cena, CONCAT(PR.Availability, ' szt.') AS 'Stan magazynowy' 
FROM Products AS PR 
LEFT JOIN Manufacturers AS MF ON PR.ManufacturerID = MF.ID
LEFT JOIN Types AS TP ON PR.TypeID = TP.ID
LEFT JOIN Prescription AS PP ON PR.PrescriptionID = PP.ID
WHERE PP.Type='Nie';

-- --------------------------------------------------------

--
-- List products to be ordered - view 'ProdTBO'
--
CREATE VIEW ProdTBO AS 
SELECT PR.Name AS "Nazwa", MF.Name AS "Producent", CONCAT(TRIM(TP.Type), ' - ' , PR.Package) AS "Opakowanie", PP.Type AS 'Produkt na recepte', PR.Description AS "Uwagi", CONCAT(PR.Price, ' zl') AS Cena, CONCAT(PR.Availability, ' szt.') AS 'Stan magazynowy' 
FROM Products AS PR 
LEFT JOIN Manufacturers AS MF ON PR.ManufacturerID = MF.ID
LEFT JOIN Types AS TP ON PR.TypeID = TP.ID
LEFT JOIN Prescription AS PP ON PR.PrescriptionID = PP.ID
RIGHT JOIN ToBeOrdered AS TBO ON PR.ID = TBO.ProductID;

-- --------------------------------------------------------

--
-- List all transactions - view 'AllTrx'
--
CREATE VIEW AllTrx AS 
SELECT TRX.TransactionNumber AS 'Nr transakcji', SUM(TRX.Quantity) AS 'Ilosc produktow', CONCAT(SUM(PR.Price * TRX.Quantity), ' zl') AS 'Naleznosc' 
FROM Transactions AS TRX 
LEFT JOIN Products AS PR ON TRX.ProductID = PR.ID
GROUP BY TRX.TransactionNumber;

-- --------------------------------------------------------

--
-- Detailed list all transactions - view 'AllDTrx'
--
CREATE VIEW AllDTrx AS 
SELECT TRX.TransactionNumber AS 'Nr transakcji', PPS.PrescriptionNumber AS 'Nr recepty', PPS.PrescriptionDate AS 'Data wystawienia recepty', CONCAT(TRIM(DR.Name), ' ', TRIM(DR.Surname)) AS 'Lekarz wystawiajacy recepte', DR.DoctorNumber AS 'Nr lekarza', CONCAT(TRIM(PT.Name), ' ', TRIM(PT.Surname)) AS 'Pacjent', PT.Pesel AS "Nr Pesel", CONCAT(TRIM(PR.Name), ' - ', TRIM(PR.Package)) AS 'Nazwa produktu', MF.Name AS 'Producent', PP.Type AS 'Produkt na recepte', CONCAT(PR.Price, ' zl') AS 'Cena za szt.', CONCAT(TRX.Quantity, ' szt.') AS 'Ilosc', CONCAT(PR.Price * TRX.Quantity, ' zl') AS 'Suma'
FROM Transactions AS TRX 
LEFT JOIN Prescriptions AS PPS ON TRX.PrescriptionID = PPS.ID
LEFT JOIN Doctors AS DR ON PPS.DoctorID = DR.ID
LEFT JOIN Patients AS PT ON PPS.PatientID = PT.ID
LEFT JOIN Products AS PR ON TRX.ProductID = PR.ID
LEFT JOIN Manufacturers AS MF ON PR.ManufacturerID = MF.ID
LEFT JOIN Prescription AS PP ON PR.PrescriptionID = PP.ID;