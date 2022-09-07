# SqlFormat

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


//Supported phone formats: 994552214466, +994552214466, 0552214466
