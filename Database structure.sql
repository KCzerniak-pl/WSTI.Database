--
-- Database: 'Pharmacy'
--

-- --------------------------------------------------------

--
-- Table structure for 'Products'
--
CREATE TABLE Products (
  ID INT IDENTITY(1,1),
  Name CHAR(25) NOT NULL,
  ManufacturerID INT NOT NULL,
  TypeID INT NOT NULL,
  Package CHAR(25) NOT NULL,
  PrescriptionID INT NOT NULL,
  Description TEXT,
  Price MONEY NOT NULL,
  Availability INT NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE (Name, ManufacturerID, TypeID, Package)
);

-- --------------------------------------------------------

--
-- Table structure for 'Manufacturers'
--
CREATE TABLE Manufacturers (
  ID INT IDENTITY(1,1),
  Name CHAR(25) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE (Name)
);

-- --------------------------------------------------------

--
-- Table structure for 'Types'
--
CREATE TABLE Types (
  ID INT IDENTITY(1,1),
  Type CHAR(25) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE (Type)
);

-- --------------------------------------------------------

--
-- Table structure for 'Prescription'
--
CREATE TABLE Prescription (
  ID INT IDENTITY(1,1),
  Type CHAR(7) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE (Type)
);

-- --------------------------------------------------------

--
-- Table structure for 'Transactions'
--
CREATE TABLE Transactions (
  ID INT IDENTITY(1,1),
  TransactionNumber INT NOT NULL,
  PrescriptionID INT,
  ProductID INT NOT NULL,
  Quantity  INT NOT NULL,
  EmployeeID INT NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE (TransactionNumber, ProductID)
);

-- --------------------------------------------------------

--
-- Table structure for 'Prescriptions'
--
CREATE TABLE Prescriptions (
  ID INT IDENTITY(1,1),
  PrescriptionNumber INT NOT NULL,
  PrescriptionDate DATE,
  DoctorID INT,
  PatientID INT,
  PRIMARY KEY (ID),
  UNIQUE (PrescriptionNumber)  
);

-- --------------------------------------------------------

--
-- Table structure for 'Patients'
--
CREATE TABLE Patients (
  ID INT IDENTITY(1,1), 
  Name CHAR(25) NOT NULL,
  Surname CHAR(25) NOT NULL,
  Pesel CHAR(11) NOT NULL,
  Sex varchar(1) not null, check (upper(Sex)='M' or upper(Sex) = 'F'), 
  PRIMARY KEY (ID),
  UNIQUE (Pesel)
);

-- --------------------------------------------------------

--
-- Table structure for 'Doctors'
--
CREATE TABLE Doctors (
  ID INT IDENTITY(1,1), 
  DoctorNumber INT NOT NULL, 
  Name CHAR(25) NOT NULL,
  Surname CHAR(25) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE (DoctorNumber)  
);

-- --------------------------------------------------------

--
-- Table structure for 'Employees'
--
CREATE TABLE Employees (
  ID INT IDENTITY(1,1), 
  EmployeeNumber INT NOT NULL, 
  Name CHAR(25) NOT NULL,
  Surname CHAR(25) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE (EmployeeNumber, Name, Surname)
);

-- --------------------------------------------------------

--
-- Table structure for 'ToBeOrdered'
--
CREATE TABLE ToBeOrdered (
  ID INT IDENTITY(1,1), 
  ProductID INT NOT NULL,
  PRIMARY KEY (ID)
);

-- --------------------------------------------------------

--
-- Relationship
--
alter table Products add foreign key (ManufacturerID) references Manufacturers(ID);
alter table Products add foreign key (TypeID) references Types(ID);
alter table Products add foreign key (PrescriptionID) references Prescription(ID);

alter table Transactions add foreign key (PrescriptionID) references Prescriptions(ID);
alter table Transactions add foreign key (ProductID) references Products(ID);
alter table Transactions add foreign key (EmployeeID) references Employees(ID);

alter table Prescriptions add foreign key (DoctorID) references Doctors(ID);
alter table Prescriptions add foreign key (PatientID) references Patients(ID);

alter table ToBeOrdered add foreign key (ProductID) references Products(ID);