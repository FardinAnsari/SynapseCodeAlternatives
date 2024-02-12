CREATE TABLE production.products (
	product_id 		INT IDENTITY (1, 1) ],
	product_name 	VARCHAR (255) NOT NULL,
	brand_id 		INT NOT NULL,
	category_id 	INT NOT NULL,
	model_year 		SMALLINT NOT NULL,
	list_price 		INT NOT NULL
);

DECLARE 
    @product_name VARCHAR(MAX), 
    @list_price   DECIMAL;

DECLARE cursor_product CURSOR
FOR SELECT 
        product_name, 
        list_price
    FROM 
        production.products;

OPEN cursor_product;

FETCH NEXT FROM cursor_product INTO 
    @product_name, 
    @list_price;

WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @product_name + CAST(@list_price AS varchar);
        FETCH NEXT FROM cursor_product INTO 
            @product_name, 
            @list_price;
    END;

CLOSE cursor_product;

DEALLOCATE cursor_product;
