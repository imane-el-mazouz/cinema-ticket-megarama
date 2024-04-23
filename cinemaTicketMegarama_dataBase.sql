CREATE DATABASE cinema_ticket_megarama;

USE cinema_ticket_megarama;

CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    img_url VARCHAR(255),
    title VARCHAR(255),
    description TEXT,
    genre ENUM('Action', 'Comedy', 'Drama', 'Horror', 'Science Fiction', 'Romance'),
    language ENUM('ar', 'en', 'fr'),
    duration TIME,
    price INT,
    rating INT,
    number_of_seats ENUM('A', 'B', 'C', 'D', 'E', 'F' ,'G', 'H', 'I', 'J' ,'K', 'L' , 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T'),
    show_time TIME,
    show_date DATE
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') NOT NULL
);

CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    movie_id INT,
    number_of_tickets INT,
    price_total INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);