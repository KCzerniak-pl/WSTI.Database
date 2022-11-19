--
-- Procedure 'AllProd'
--
CREATE PROCEDURE AllProd @TypeView nvarchar(3) = NULL
AS
BEGIN
  IF @TypeView = 'P'
    SELECT * FROM AllProdP;
  ELSE IF @TypeView = 'WP'
    SELECT * FROM AllProdWP;
  ELSE IF @TypeView = 'TBO'
    SELECT * FROM ProdTBO;	
  ElSE
    SELECT * FROM AllProd;  
END

-- --------------------------------------------------------

--
-- Procedure 'AllTrx'
--
CREATE PROCEDURE AllTrx @TransactionNumber nvarchar(10) = NULL
AS
BEGIN
  IF @TransactionNumber IS NULL
    SELECT * FROM AllTrx;
  ElSE
    SELECT * FROM AllDTrx Where "Nr transakcji" = @TransactionNumber;  
END