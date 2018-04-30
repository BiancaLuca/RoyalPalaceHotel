IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'OFFERS')
  BEGIN

    CREATE TABLE OFFERS (
      ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
      DESCRIPTION VARCHAR(1000) NOT NULL ,
      START_DATE DATE NOT NULL ,
      END_DATE DATE NOT NULL,
      ROOM_TYPE INT,
      QUANTITY INT NOT NULL,
      FOREIGN KEY (ROOM_TYPE) REFERENCES ROOMS_TYPE(ID) )


  END