
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    COLUMN_TYPE,
    IS_NULLABLE,
    COLUMN_KEY,
    EXTRA,
    COLUMN_DEFAULT 
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE   
    TABLE_SCHEMA = 'alx_book_store'
    AND TABLE_NAME = 'Books', 'Authors', 'Customers', 'Orders', 'Order_Details';