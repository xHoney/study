CREATE DATABASE bookstore;

-- Use the newly created database
\c bookstore;

-- Table for storing book categories
CREATE TABLE book_categories (
    category_id SERIAL PRIMARY KEY,
    category_name TEXT NOT NULL
);

-- Table for storing book authors
CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    author_name TEXT NOT NULL
);

-- Table for storing books
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    isbn TEXT UNIQUE NOT NULL,
    publication_year INTEGER,
    category_id INTEGER REFERENCES book_categories(category_id),
    author_id INTEGER REFERENCES authors(author_id),
    price NUMERIC NOT NULL
);

-- Table for storing customer information
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    phone TEXT
);

-- Table for storing orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    order_date DATE NOT NULL,
    total_amount NUMERIC NOT NULL
);

-- Table for storing order details (books in each order)
CREATE TABLE order_details (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id),
    book_id INTEGER REFERENCES books(book_id),
    quantity INTEGER NOT NULL,
    subtotal NUMERIC NOT NULL
);

-- Table for storing publishers
CREATE TABLE publishers (
    publisher_id SERIAL PRIMARY KEY,
    publisher_name TEXT NOT NULL
);

-- Table for storing book inventory
CREATE TABLE book_inventory (
    book_id INTEGER REFERENCES books(book_id),
    quantity_in_stock INTEGER NOT NULL,
    PRIMARY KEY (book_id)
);

-- Table for storing customer addresses
CREATE TABLE customer_addresses (
    address_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    address_line1 TEXT NOT NULL,
    address_line2 TEXT,
    city TEXT NOT NULL,
    postal_code TEXT NOT NULL
);

-- Table for storing employee information
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    job_title TEXT NOT NULL,
    hire_date DATE NOT NULL,
    salary NUMERIC NOT NULL
);

-- Table for storing employee sales (performance tracking)
CREATE TABLE employee_sales (
    sale_id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES employees(employee_id),
    sale_date DATE NOT NULL,
    total_sales NUMERIC NOT NULL
);
-- Adding more tables to the bookstore database

-- Table for storing reviews for books
CREATE TABLE book_reviews (
    review_id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES books(book_id),
    customer_id INTEGER REFERENCES customers(customer_id),
    rating INTEGER NOT NULL,
    review_text TEXT
);

-- Table for storing book promotions or discounts
CREATE TABLE book_promotions (
    promotion_id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES books(book_id),
    discount_percent NUMERIC NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Table for storing payment methods
CREATE TABLE payment_methods (
    payment_method_id SERIAL PRIMARY KEY,
    method_name TEXT NOT NULL
);

-- Table for storing payments for orders
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id),
    payment_method_id INTEGER REFERENCES payment_methods(payment_method_id),
    payment_date DATE NOT NULL,
    amount_paid NUMERIC NOT NULL
);

-- Table for storing book formats (e.g., hardcover, paperback, ebook)
CREATE TABLE book_formats (
    format_id SERIAL PRIMARY KEY,
    format_name TEXT NOT NULL
);

-- Table for storing book editions (e.g., first edition, second edition)
CREATE TABLE book_editions (
    edition_id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES books(book_id),
    edition_name TEXT NOT NULL,
    publication_year INTEGER NOT NULL
);

-- Table for storing book sales
CREATE TABLE book_sales (
    sale_id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES books(book_id),
    sale_date DATE NOT NULL,
    sale_quantity INTEGER NOT NULL,
    sale_amount NUMERIC NOT NULL
);

-- Table for storing staff assignments (e.g., assigning employees to specific tasks)
CREATE TABLE staff_assignments (
    assignment_id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES employees(employee_id),
    assignment_details TEXT NOT NULL
);

-- Table for storing customer wishlists
CREATE TABLE wishlists (
    wishlist_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    book_id INTEGER REFERENCES books(book_id)
);

-- Table for storing book ratings
CREATE TABLE book_ratings (
    rating_id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES books(book_id),
    customer_id INTEGER REFERENCES customers(customer_id),
    rating INTEGER NOT NULL
);

-- Table for storing book recommendations
CREATE TABLE book_recommendations (
    recommendation_id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES books(book_id),
    recommended_book_id INTEGER REFERENCES books(book_id)
);

-- Table for storing staff reviews of books
CREATE TABLE staff_reviews (
    review_id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES books(book_id),
    employee_id INTEGER REFERENCES employees(employee_id),
    review_text TEXT NOT NULL
);
