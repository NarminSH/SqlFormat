-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER customers_format_phone
ON Customers
AFTER INSERT
AS
BEGIN
UPDATE Customers
SET Phone = 
        CASE 
			WHEN LEN(i.phone) = 12
					THEN '+ 994 (' + SUBSTRING(i.phone, 4, 2)
						+ ') '
						+ SUBSTRING(i.phone, 6, 3)
						+ '-'
						+ RIGHT(i.phone, 4)
            WHEN LEN(i.phone) = 8
                THEN '+ 994 (' + left(i.phone, 2)
                    + ') '
                    + SUBSTRING(i.phone, 3, 3)
                    + '-'
                    + RIGHT(i.phone, 4)
            ELSE    
               'Wrong phone format'
        END
    FROM
        inserted i
    JOIN
        Customers 
        ON Customers.CustomerID = i.CustomerID;
END


