IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CUSTOMER' AND COLUMN_NAME = 'CNP')
  BEGIN

    EXEC sp_RENAME 'CUSTOMER.CNP' , 'ID_NUMBER', 'COLUMN'

  END