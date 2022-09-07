-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
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
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
 
CREATE FUNCTION FormatPhone(@Phone VARCHAR(25))
RETURNS VARCHAR(25)
AS
BEGIN
DECLARE @Formatted VARCHAR(25)
DECLARE @MSG VARCHAR(25)
SET @MSG = 'wrong format'

IF (LEN(@Phone) = 13)
    SET @Formatted = '+ 994 (' + SUBSTRING(@Phone, 5, 2)
						+ ') '
						+ SUBSTRING(@Phone, 7, 3)
						+ '-'
						+ RIGHT(@Phone, 4)
ELSE IF (LEN(@Phone) = 10)
    SET @Formatted = '+ 994 (' + SUBSTRING(@Phone, 2, 2)
                    + ') '
                    + SUBSTRING(@Phone, 4, 3)
                    + '-'
                    + RIGHT(@Phone, 4)
ELSE
    SET @Formatted = @MSG

RETURN @Formatted
END
GO

