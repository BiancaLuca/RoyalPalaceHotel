IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CUSTOMER' AND COLUMN_NAME = 'GENDER')
  BEGIN

    ALTER TABLE [dbo].[Customer] DROP COLUMN GENDER

  END


IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CUSTOMER' AND COLUMN_NAME = 'ID_NUMBER')
  BEGIN

    ALTER TABLE [dbo].[Customer] DROP COLUMN ID_NUMBER

  END

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CUSTOMER' AND COLUMN_NAME = 'CUSTOMER_PHONE')
  BEGIN

    EXEC sp_RENAME 'CUSTOMER.CUSTOMER_PHONE' , 'GUEST_PHONE', 'COLUMN'

  END

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CUSTOMER' AND COLUMN_NAME = 'CUSTOMER_EMAIL')
  BEGIN

    EXEC sp_RENAME 'CUSTOMER.CUSTOMER_EMAIL' , 'GUEST_EMAIL', 'COLUMN'

  END