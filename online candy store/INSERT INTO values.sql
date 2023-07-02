
-- inserting candy category for our online candy store

INSERT INTO category (Category_name)
VALUE   ('boiled sweets'), 
        ('chewy sweets'), 
        ('fizzy sweets'), 
        ('sour sweets'), 
        ('Traditional Sweets'), 
        ('chocolate');

-- inserting different example products 

INSERT INTO product (category_id, name, description, price, quantity)
VALUE   (1, 'Yorkshire Mixture', ' Beautifully shaped sweets with a classic selection of traditional boilings including pear drops and you always get a fish! Made from fine quality ingredients. ', 3.25, 100),
        (1, 'Sherbet Lemons', 'Sherbet Lemons are a very traditional sweet. They have a bobbly outer hard shell with a fizzy sour sherbet centre. Tastes of lemon throughout! Yum yum! Sherbet Lemons are a very traditional sweet. ', 3.25, 50),
        (1, 'Kola Cubes', 'These classic hard boiled sweets are sure to get your mouth watering. True to tradition these Kola Cubes contains the chewy centre which we all know and love. Kola flavoured hard cubes with a sugar coating. ', 3.25, 200),
        (2, 'Dusted Milk Bottles', 'The original dusted milk bottles!', 3.50, 20),
        (2, 'Jelly Babies', 'A traditional fruit flavoured gum. Known as "unclaimed Babies" in the victorian era! (how mean!) Dusted in icing sugar! As seen on BBC Nigel Slater: Life is Sweets.', 3.25, 350),
        (3, 'Fizzy Bubblegum Bottles', 'These classic pink and blue fizzy sweets are flavoured with bubblegum', 1.00, 340),
        (4, 'Jelly Mania Sour Worms', 'Classic jelly worm shaped sweets with a sugar coating and slightly sour flavour', 1.00, 59),
        (4, 'Maynards Tangy Wine Gums', 'Sour sugar coating on the traditional wine gums makes for a surprisingly nice taste – these are a real winner on the website!', 1.25, 321),
        (4, 'Bebeto Sour Strawberry Spaghetti', 'These sour strawberry laces are bursting with flavour and come in a Bebeto bag for freshness direct from manufacturer.', 0.50, 39),
        (5, 'Bristows Toffee Bonbons', 'These bonbons are soft round balls of chewy goodness with the flavour of toffee.', 1.50, 98),
        (5, 'Bristows Strawberry Bonbons', 'Strawberry bonbons are one of our most popular sweets and it is easy to see why – they taste delicious!', 1.50, 130),
        (5, 'Bristows Lemon Bonbons', 'These bonbons are soft round balls of chewy goodness with the flavour of lemon.', 1.50, 321),
        (6, 'Cadbury Bournville Old Jamaica Block', 'Classic Old Jamaica bar has returned – this is a dark chocolate bar with rum and raisin flavour', 0.85, 10);

-- inserting example users 


INSERT INTO users (username, name, lastname, email, password, data_regist)
VALUES  ('asd', 'Anir', 'Murphy', 'asd@gmail.com', 'b89eaac7e61417341b710b727768294d0e6a277b', '2013-01-21'),
        ('sdf', 'Alia', 'Lowery', 'sdf@gmail.com', 'b89eaac7e61417341b710b727768294d0e6a277b', '2020-12-01'),
        ('qwe', 'Erik', 'Snow', 'qwe@gmail.com', 'b89eaac7e61417341b710b727768294d0e6a277b', '2019-06-12');

-- Used random example hash 

-- making some orders for our "users"


INSERT INTO orders (user_id, order_date, order_status)
VALUE   (1, '2023-06-20', 'in process'),
        (3, '2023-05-24', 'finished'),
        (3, '2023-06-29', 'pending');

--inserting each order detail

INSERT INTO order_details (order_id, product_id, quantity)
VALUE   (1, 2, 3),
        (1, 5, 10),
        (2, 1, 2),
        (2, 2 , 3),
        (3, 7, 1),
        (3, 8, 1);