-- the employee incorrectly entered the quantity in the order so we need to set the correct value

UPDATE order_details
SET quantity = 10 
WHERE order_id = 3;

-- customer wants to add product to open order

-- after several orders, we decided to add notes to the order details

ALTER TABLE order_details
ADD COLUMN order_note VARCHAR(50);

-- customer decided to add products to his order and change the quantity to 5 of the ordered product 8

-- change the quantity

UPDATE order_details
SET quantity = 5
WHERE product_id = 8;

-- note for employee about changes in quantity

UPDATE order_details
SET order_note = 'order changes(quantity)'
WHERE product_id = 8;

-- customer wants to add product to order

INSERT INTO order_details (order_id, product_id, quantity, order_note)
VALUE (3, 2, 13, 'additional order');

-- we decide to add primary key to order details

ALTER TABLE order_details
ADD CONSTRAINT details_pk PRIMARY KEY (order_id, product_id);
