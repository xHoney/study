-- Inserting data into the book_categories table
INSERT INTO book_categories (category_id, category_name) VALUES
    (1, 'Fiction'),
    (2, 'Mystery'),
    (3, 'Romance'),
    (4, 'Science Fiction');

-- Inserting data into the authors table
INSERT INTO authors (author_id, author_name) VALUES
    (1, 'Jane Austen'),
    (2, 'Agatha Christie'),
    (3, 'J.K. Rowling'),
    (4, 'Isaac Asimov');

-- Inserting data into the books table
INSERT INTO books (book_id, title, isbn, publication_year, category_id, author_id, price) VALUES
    (1, 'Pride and Prejudice', '9780141439518', 1813, 1, 1, 10.99),
    (2, 'Murder on the Orient Express', '9780062073501', 1934, 2, 2, 9.49),
    (3, 'Harry Potter and the Sorcerer''s Stone', '9780590353427', 1997, 1, 3, 12.99),
    (4, 'Foundation', '9780553293357', 1951, 4, 4, 8.79);

-- Inserting data into the customers table
INSERT INTO customers (customer_id, first_name, last_name, email, phone) VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '+1234567890'),
    (2, 'Emily', 'Smith', 'emily.smith@example.com', '+9876543210'),
    (3, 'Michael', 'Johnson', 'michael.j@example.com', '+4445556666');

-- Inserting data into the orders table
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
    (1, 1, '2023-07-15', 33.47),
    (2, 2, '2023-07-16', 21.98),
    (3, 1, '2023-07-17', 12.99);

-- Inserting data into the order_details table
INSERT INTO order_details (order_detail_id, order_id, book_id, quantity, subtotal) VALUES
    (1, 1, 1, 2, 21.98),
    (2, 1, 3, 1, 12.99),
    (3, 2, 2, 1, 9.49),
    (4, 3, 4, 1, 8.79);

-- Inserting data into the book_inventory table
INSERT INTO book_inventory (book_id, quantity_in_stock) VALUES
    (1, 10),
    (2, 15),
    (3, 5),
    (4, 8);

-- Inserting data into the book_editions table
INSERT INTO book_editions (edition_id, book_id, edition_name, publication_year) VALUES
    (1, 1, 'First Edition', 1813),
    (2, 2, 'Reprint', 1934),
    (3, 3, 'First Edition', 1997),
    (4, 4, 'First Edition', 1951);

-- Inserting data into the staff table
INSERT INTO employees (employee_id, first_name, last_name, job_title, hire_date, salary) VALUES
    (1, 'Alice', 'Johnson', 'Store Manager', '2022-01-15', 45000),
    (2, 'Robert', 'Williams', 'Sales Associate', '2022-03-20', 35000),
    (3, 'Emma', 'Brown', 'Book Buyer', '2022-04-10', 40000);

-- Inserting data into the employee_sales table
INSERT INTO employee_sales (sale_id, employee_id, sale_date, total_sales) VALUES
    (1, 1, '2023-07-15', 250.00),
    (2, 2, '2023-07-16', 135.75),
    (3, 1, '2023-07-17', 100.50);

-- Inserting data into the book_reviews table
INSERT INTO book_reviews (review_id, book_id, customer_id, rating, review_text) VALUES
    (1, 1, 1, 4, 'I loved this book!'),
    (2, 2, 2, 5, 'A gripping mystery.'),
    (3, 3, 1, 5, 'Magical adventure.'),
    (4, 4, 3, 4, 'Fascinating science fiction.');

-- Inserting data into the book_promotions table
INSERT INTO book_promotions (promotion_id, book_id, discount_percent, start_date, end_date) VALUES
    (1, 1, 10.0, '2023-07-01', '2023-07-31'),
    (2, 2, 15.0, '2023-07-10', '2023-07-20'),
    (3, 3, 20.0, '2023-07-15', '2023-07-25'),
    (4, 4, 5.0, '2023-07-05', '2023-07-15');

-- Inserting data into the payment_methods table
INSERT INTO payment_methods (payment_method_id, method_name) VALUES
    (1, 'Credit Card'),
    (2, 'Cash'),
    (3, 'PayPal');

-- Inserting data into the payments table
INSERT INTO payments (payment_id, order_id, payment_method_id, payment_date, amount_paid) VALUES
    (1, 1, 1, '2023-07-15', 33.47),
    (2, 2, 2, '2023-07-16', 21.98),
    (3, 3, 3, '2023-07-17', 12.99);

-- Inserting data into the wishlists table
INSERT INTO wishlists (wishlist_id, customer_id, book_id) VALUES
    (1, 1, 2),
    (2, 1, 3),
    (3, 2, 1),
    (4, 3, 4);

-- Inserting data into the book_ratings table
INSERT INTO book_ratings (rating_id, book_id, customer_id, rating) VALUES
    (1, 1, 1, 4),
    (2, 2, 2, 5),
    (3, 3, 1, 5),
    (4, 4, 3, 4);

-- Inserting data into the book_recommendations table
INSERT INTO book_recommendations (recommendation_id, book_id, recommended_book_id) VALUES
    (1, 1, 3),
    (2, 2, 4),
    (3, 3, 2),
    (4, 4, 1);

-- Inserting data into the staff_reviews table
INSERT INTO staff_reviews (review_id, book_id, employee_id, review_text) VALUES
    (1, 1, 1, 'A timeless classic.'),
    (2, 2, 2, 'A compelling mystery novel.'),
    (3, 3, 3, 'A magical journey.'),
    (4, 4, 1, 'A visionary science fiction.');

-- Inserting data into the book_sales table
INSERT INTO book_sales (sale_id, book_id, sale_date, sale_quantity, sale_amount) VALUES
    (1, 1, '2023-07-15', 5, 54.95),
    (2, 2, '2023-07-16', 3, 28.47),
    (3, 3, '2023-07-17', 2, 25.98),
    (4, 4, '2023-07-18', 1, 8.79);

-- Inserting data into the customer_addresses table
INSERT INTO customer_addresses (address_id, customer_id, address_line1, address_line2, city, postal_code) VALUES
    (1, 1, '123 Main St', 'Apt 4', 'New York', '10001'),
    (2, 2, '456 Elm St', NULL, 'Los Angeles', '90001'),
    (3, 3, '789 Oak St', 'Unit 9', 'Chicago', '60601');

-- Inserting data into the book_inventory table
INSERT INTO book_inventory (book_id, quantity_in_stock) VALUES
    (1, 5),
    (2, 10),
    (3, 8),
    (4, 3);

-- Inserting data into the book_editions table
INSERT INTO book_editions (edition_id, book_id, edition_name, publication_year) VALUES
    (5, 1, 'Collector''s Edition', 2023),
    (6, 2, 'Paperback Edition', 2022),
    (7, 3, '20th Anniversary Edition', 2017),
    (8, 4, 'Revised Edition', 1966);

-- Inserting data into the staff_assignments table
INSERT INTO staff_assignments (assignment_id, employee_id, assignment_details) VALUES
    (1, 1, 'Managing store operations and inventory'),
    (2, 2, 'Assisting customers and processing sales'),
    (3, 3, 'Selecting and purchasing new book titles');

-- Committing the data
COMMIT;
