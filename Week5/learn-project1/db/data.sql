INSERT INTO authors (first_name, last_name, title)
VALUES
('John', 'Doe', 'Author'),
('Jane', 'Smith', 'Novelist'),
('Bob', 'Johnson', 'Poet'),
('Alice', 'Williams', 'Playwright'),
('Charlie', 'Brown', 'Historian'),
('Eva', 'Miller', 'Essayist'),
('David', 'Anderson', 'Biographer'),
('Grace', 'Jones', 'Science Fiction Writer'),
('Samuel', 'Clark', 'Journalist'),
('Sophie', 'Roberts', 'Romance Novelist');

INSERT INTO orders (date_submitted, status, subtotal, shipping, tax, total, customer_id, created_at, updated_at)
VALUES
('12:30:00', 1, 100.50, 10.00, 8.05, 118.55, 1, NOW(), NOW()),
('13:45:00', 2, 75.20, 8.50, 6.75, 90.45, 2, NOW(), NOW()),
('14:15:00', 3, 120.75, 12.25, 9.80, 142.80, 3, NOW(), NOW()),
('15:00:00', 1, 50.00, 5.00, 4.00, 59.00, 4, NOW(), NOW()),
('16:20:00', 2, 90.30, 9.00, 7.25, 106.55, 5, NOW(), NOW()),
('17:30:00', 3, 110.80, 11.50, 9.25, 131.55, 1, NOW(), NOW()),
('18:45:00', 1, 65.50, 6.50, 5.25, 77.25, 2, NOW(), NOW()),
('19:10:00', 2, 80.20, 8.00, 6.40, 94.60, 3, NOW(), NOW()),
('20:00:00', 3, 95.40, 9.50, 7.60, 112.50, 4, NOW(), NOW()),
('21:15:00', 4, 55.75, 5.75, 4.60, 66.10, 5, NOW(), NOW());

INSERT INTO books (title, created_at, updated_at, author_id, year_published, isbn, price, out_of_print, views, supplier_id)
VALUES
('The Great Gatsby', NOW(), NOW(), 'author123', 1925, '978-3-16-148410-0', 25, 0, 1000, 1),
('To Kill a Mockingbird', NOW(), NOW(), 'author456', 1960, '978-3-16-148410-1', 20, 1, 800, 2),
('1984', NOW(), NOW(), 'author789', 1949, '978-3-16-148410-2', 18, 0, 1200, 3),
('Pride and Prejudice', NOW(), NOW(), 'author101', 1813, '978-3-16-148410-3', 30, 1, 950, 4),
('The Catcher in the Rye', NOW(), NOW(), 'author112', 1951, '978-3-16-148410-4', 22, 0, 900, 5),
('Brave New World', NOW(), NOW(), 'author131', 1932, '978-3-16-148410-5', 26, 1, 1100, 1),
('To the Lighthouse', NOW(), NOW(), 'author145', 1927, '978-3-16-148410-6', 28, 0, 850, 2),
('Crime and Punishment', NOW(), NOW(), 'author167', 1866, '978-3-16-148410-7', 24, 1, 950, 3),
('The Hobbit', NOW(), NOW(), 'author189', 1937, '978-3-16-148410-8', 32, 0, 1300, 4),
('Moby-Dick', NOW(), NOW(), 'author202', 1851, '978-3-16-148410-9', 35, 1, 1000, 5);


INSERT INTO reviews (title, body, rating, state, customer_id, book_id, created_at, updated_at)
VALUES
('Great Book!', 'I really enjoyed reading this book. Highly recommended!', 5, 1, 1, 1, NOW(), NOW()),
('Disappointing', 'The book did not meet my expectations. The plot was confusing.', 2, 1, 2, 2, NOW(), NOW()),
('Amazing Story', 'This book is a masterpiece. The characters and plot are captivating.', 5, 1, 3, 3, NOW(), NOW()),
('Mixed Feelings', 'The book had its moments, but overall, I had mixed feelings about it.', 3, 1, 4, 4, NOW(), NOW()),
('Must Read', 'A compelling story with a great message. Couldn''t put it down!', 4, 1, 5, 5, NOW(), NOW()),
('Couldn''t Finish', 'I struggled to finish this book. It was not engaging.', 1, 1, 1, 1, NOW(), NOW()),
('Thought-Provoking', 'The book made me think deeply about life and its complexities.', 4, 1, 2, 2, NOW(), NOW()),
('Captivating Characters', 'The characters in this book are well-developed and interesting.', 5, 1, 3, 3, NOW(), NOW()),
('Unforgettable', 'An unforgettable story that stayed with me long after I finished it.', 5, 1, 4, 4, NOW(), NOW()),
('Could be Better', 'While the book had some good parts, it could be improved in certain areas.', 3, 1, 5, 5, NOW(), NOW());

INSERT INTO books_orders (book_id, order_id)
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(1, 3),
(2, 4),
(3, 4),
(4, 5),
(5, 5);

INSERT INTO suppliers (name, created_at, updated_at)
VALUES
('Supplier A',NOW(),NOW()),
('Supplier B',NOW(),NOW()),
('Supplier C',NOW(),NOW()),
('Supplier D',NOW(),NOW()),
('Supplier E',NOW(),NOW());