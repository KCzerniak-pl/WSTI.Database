--
-- Update availability after added new transacton - trigger 'UpdateAvailability'
--
CREATE TRIGGER UpdateAvailability
  ON Transactions
AFTER INSERT
AS
BEGIN
  DECLARE @quantity INT, @id INT
  SELECT @quantity = Quantity FROM INSERTED
  SELECT @id = ProductID FROM INSERTED  

  UPDATE Products
  SET Products.Availability = Products.Availability - @quantity
  WHERE Products.ID = @id;
END;

-- --------------------------------------------------------

--
-- Adding product to be ordered if its availability is less than 2 - trigger 'InsertToBeOrdered'
--
CREATE TRIGGER InsertToBeOrdered
  ON Transactions
AFTER INSERT 
AS
BEGIN
  DECLARE @quantity INT, @id INT
  SELECT @quantity = Quantity FROM INSERTED
  SELECT @id = ProductID FROM INSERTED 

  IF (SELECT Availability FROM Products WHERE ID = @id) - @quantity < 2
    INSERT INTO ToBeOrdered (ProductID) VALUES (@id);
END;