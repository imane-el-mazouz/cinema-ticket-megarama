CREATE DATABASE cinema_ticket_megarama;

USE cinema_ticket_megarama;

CREATE TABLE movies (
                        movie_id INT AUTO_INCREMENT PRIMARY KEY,
                        img_url VARCHAR(255),
                        title VARCHAR(255),
                        description TEXT,
                        genre ENUM('Action', 'Comedy', 'Drama', 'Horror', 'Science', 'Romance'),
                        language ENUM('ar', 'en', 'fr'),
                        duration TIME,
                        price INT,
                        rating INT,
                        number_of_seats INT,
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

CREATE TABLE available_seats (
                                 available_seat_id INT AUTO_INCREMENT PRIMARY KEY,
                                 movie_id INT,
                                 seat_number VARCHAR(10),
                                 is_available BOOLEAN DEFAULT TRUE,
                                 FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);


CREATE TABLE reservations (
                              reservation_id INT AUTO_INCREMENT PRIMARY KEY,
                              user_id INT,
                              movie_id INT,
                              seat_id INT,
                              price_total INT,
                              FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
                              FOREIGN KEY (user_id) REFERENCES users(user_id),
                              FOREIGN KEY (seat_id) REFERENCES available_seats(available_seat_id)
);


INSERT INTO users (user_name, email, password, role)
VALUES ('admin', 'john@example.com', '1234', 'admin'),
       ('user', 'john@example.com', '1234', 'user');


INSERT INTO movies (img_url, title, description, genre, language, duration, price, rating, number_of_seats, show_time, show_date) VALUES
                                                                                                                                      ('https://i.etsystatic.com/35681979/r/il/a80bfd/3957854063/il_fullxfull.3957854063_5dfy.jpg', 'Inception', 'A thief who enters the dreams of others to steal their secrets.', 'Action', 'en', '02:28:00', 10, 9, 200, '19:00:00', '2024-05-01'),
                                                                                                                                      ('https://m.media-amazon.com/images/M/MV5BMzUzNDM2NzM2MV5BMl5BanBnXkFtZTgwNTM3NTg4OTE@._V1_.jpg', 'La La Land', 'A jazz pianist falls for an aspiring actress in Los Angeles.', 'Romance', 'en', '02:08:00', 8, 8, 180, '18:30:00', '2024-05-02'),
                                                                                                                                      ('https://m.media-amazon.com/images/M/MV5BNGVjNWI4ZGUtNzE0MS00YTJmLWE0ZDctN2ZiYTk2YmI3NTYyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg', 'Joker', 'A mentally troubled comedian becomes a psychopathic criminal.', 'Drama', 'en', '02:02:00', 11, 8, 180, '21:30:00', '2024-05-04'),
                                                                                                                                      ('https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg', 'The Dark Knight', 'Batman faces the Joker in a battle for Gotham City.', 'Action', 'en', '02:32:00', 9, 9, 220, '20:15:00', '2024-05-05'),
                                                                                                                                      ('https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_FMjpg_UX1000_.jpg', 'The Shawshank Redemption', 'Two imprisoned men bond over a number of years.', 'Drama', 'en', '02:22:00', 10, 9, 190, '19:45:00', '2024-05-06'),
                                                                                                                                      ('https://www.coverwhiz.com/uploads/movies/the-matrix-reloaded.jpg', 'The Matrix', 'A computer hacker learns about the true nature of reality.', 'Science', 'en', '02:16:00', 8, 9, 210, '18:00:00', '2024-05-08'),
                                                                                                                                      ('https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg', 'Forrest Gump', 'A man with low IQ accomplishes great things in his life.', 'Drama', 'en', '02:22:00', 7, 8, 180, '17:30:00', '2024-05-09'),
                                                                                                                                      ('https://fr.web.img6.acsta.net/pictures/14/09/24/12/08/158828.jpg', 'Interstellar', 'A team of explorers travel through a wormhole in space.', 'Science', 'en', '02:49:00', 10, 9, 200, '20:30:00', '2024-05-11'),
                                                                                                                                      ('https://m.media-amazon.com/images/M/MV5BOGUyZDUxZjEtMmIzMC00MzlmLTg4MGItZWJmMzBhZjE0Mjc1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg', 'The Social Network', 'The story of the founding of Facebook.', 'Drama', 'en', '02:00:00', 8, 8, 190, '21:00:00', '2024-05-12'),
                                                                                                                                      ('https://www.coverwhiz.com/uploads/movies/avengers-infinity-war.jpg', 'The Avengers', 'Earthâ€™s mightiest heroes come together to fight Loki and his alien army.', 'Action', 'en', '02:23:00', 9, 8, 220, '18:45:00', '2024-05-14'),
                                                                                                                                      ('https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'Gladiator', 'A former Roman General seeks vengeance for the murder of his family.', 'Action', 'en', '02:35:00', 10, 8, 200, '19:30:00', '2024-05-15'),
                                                                                                                                      ('https://m.media-amazon.com/images/M/MV5BOTA5NDZlZGUtMjAxOS00YTRkLTkwYmMtYWQ0NWEwZDZiNjEzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', 'Whiplash', 'A promising young drummer enrolls at a cutthroat music conservatory.', 'Drama', 'en', '01:47:00', 7, 9, 190, '19:00:00', '2024-05-17'),
                                                                                                                                      ('https://collider.com/wp-content/uploads/2020/08/the-prestige-poster.jpg', 'The Prestige', 'Rival magicians engage in competitive one-upmanship in 19th-century London.', 'Drama', 'en', '02:10:00', 8, 9, 180, '20:45:00', '2024-05-19');

-- Movie 1
INSERT INTO available_seats (movie_id, seat_number, is_available) VALUES
                                                                      (1, 'A1', TRUE), (1, 'A2', TRUE), (1, 'A3', TRUE), (1, 'A4', TRUE), (1, 'A5', TRUE),
                                                                      (1, 'A6', TRUE), (1, 'A7', TRUE), (1, 'A8', TRUE), (1, 'A9', TRUE), (1, 'A10', TRUE),
                                                                      (1, 'B1', TRUE), (1, 'B2', TRUE), (1, 'B3', TRUE), (1, 'B4', TRUE), (1, 'B5', TRUE),
                                                                      (1, 'B6', TRUE), (1, 'B7', TRUE), (1, 'B8', TRUE), (1, 'B9', TRUE), (1, 'B10', TRUE);

-- Movie 2
INSERT INTO available_seats (movie_id, seat_number, is_available) VALUES
                                                                      (2, 'A1', TRUE), (2, 'A2', TRUE), (2, 'A3', TRUE), (2, 'A4', TRUE), (2, 'A5', TRUE),
                                                                      (2, 'A6', TRUE), (2, 'A7', TRUE), (2, 'A8', TRUE), (2, 'A9', TRUE), (2, 'A10', TRUE),
                                                                      (2, 'B1', TRUE), (2, 'B2', TRUE), (2, 'B3', TRUE), (2, 'B4', TRUE), (2, 'B5', TRUE),
                                                                      (2, 'B6', TRUE), (2, 'B7', TRUE), (2, 'B8', TRUE), (2, 'B9', TRUE), (2, 'B10', TRUE);

-- Movie 3
INSERT INTO available_seats (movie_id, seat_number, is_available) VALUES
                                                                      (3, 'A1', TRUE), (3, 'A2', TRUE), (3, 'A3', TRUE), (3, 'A4', TRUE), (3, 'A5', TRUE),
                                                                      (3, 'A6', TRUE), (3, 'A7', TRUE), (3, 'A8', TRUE), (3, 'A9', TRUE), (3, 'A10', TRUE),
                                                                      (3, 'B1', TRUE), (3, 'B2', TRUE), (3, 'B3', TRUE), (3, 'B4', TRUE), (3, 'B5', TRUE),
                                                                      (3, 'B6', TRUE), (3, 'B7', TRUE), (3, 'B8', TRUE), (3, 'B9', TRUE), (3, 'B10', TRUE);

-- Movie 4
INSERT INTO available_seats (movie_id, seat_number, is_available) VALUES
                                                                      (4, 'A1', TRUE), (4, 'A2', TRUE), (4, 'A3', TRUE), (4, 'A4', TRUE), (4, 'A5', TRUE),
                                                                      (4, 'A6', TRUE), (4, 'A7', TRUE), (4, 'A8', TRUE), (4, 'A9', TRUE), (4, 'A10', TRUE),
                                                                      (4, 'B1', TRUE), (4, 'B2', TRUE), (4, 'B3', TRUE), (4, 'B4', TRUE), (4, 'B5', TRUE),
                                                                      (4, 'B6', TRUE), (4, 'B7', TRUE), (4, 'B8', TRUE), (4, 'B9', TRUE), (4, 'B10', TRUE);

-- Movie 5
INSERT INTO available_seats (movie_id, seat_number, is_available) VALUES
                                                                      (5, 'A1', TRUE), (5, 'A2', TRUE), (5, 'A3', TRUE), (5, 'A4', TRUE), (5, 'A5', TRUE),
                                                                      (5, 'A6', TRUE), (5, 'A7', TRUE), (5, 'A8', TRUE), (5, 'A9', TRUE), (5, 'A10', TRUE),
                                                                      (5, 'B1', TRUE), (5, 'B2', TRUE), (5, 'B3', TRUE), (5, 'B4', TRUE), (5, 'B5', TRUE),
                                                                      (5, 'B6', TRUE), (5, 'B7', TRUE), (5, 'B8', TRUE), (5, 'B9', TRUE), (5, 'B10', TRUE);

-- Movie 6
INSERT INTO available_seats (movie_id, seat_number, is_available) VALUES
                                                                      (6, 'A1', TRUE), (6, 'A2', TRUE), (6, 'A3', TRUE), (6, 'A4', TRUE), (6, 'A5', TRUE),
                                                                      (6, 'A6', TRUE), (6, 'A7', TRUE), (6, 'A8', TRUE), (6, 'A9', TRUE), (6, 'A10', TRUE),
                                                                      (6, 'B1', TRUE), (6, 'B2', TRUE), (6, 'B3', TRUE), (6, 'B4', TRUE), (6, 'B5', TRUE),
                                                                      (6, 'B6', TRUE), (6, 'B7', TRUE), (6, 'B8', TRUE), (6, 'B9', TRUE), (6, 'B10', TRUE);

-- Movie 7
INSERT INTO available_seats (movie_id, seat_number, is_available) VALUES
                                                                      (7, 'A1', TRUE), (7, 'A2', TRUE), (7, 'A3', TRUE), (7, 'A4', TRUE), (7, 'A5', TRUE),
                                                                      (7, 'A6', TRUE), (7, 'A7', TRUE), (7, 'A8', TRUE), (7, 'A9', TRUE), (7, 'A10', TRUE),
                                                                      (7, 'B1', TRUE), (7, 'B2', TRUE), (7, 'B3', TRUE), (7, 'B4', TRUE), (7, 'B5', TRUE),
                                                                      (7, 'B6', TRUE), (7, 'B7', TRUE), (7, 'B8', TRUE), (7, 'B9', TRUE), (7, 'B10', TRUE);

-- Movie 8
INSERT INTO available_seats (movie_id, seat_number, is_available) VALUES
                                                                      (8, 'A1', TRUE), (8, 'A2', TRUE), (8, 'A3', TRUE), (8, 'A4', TRUE), (8, 'A5', TRUE),
                                                                      (8, 'A6', TRUE), (8, 'A7', TRUE), (8, 'A8', TRUE), (8, 'A9', TRUE), (8, 'A10', TRUE),
                                                                      (8, 'B1', TRUE), (8, 'B2', TRUE), (8, 'B3', TRUE), (8, 'B4', TRUE), (8, 'B5', TRUE),
                                                                      (8, 'B6', TRUE), (8, 'B7', TRUE), (8, 'B8', TRUE), (8, 'B9', TRUE), (8, 'B10', TRUE);

-- Movie 9
INSERT INTO available_seats (movie_id, seat_number, is_available) VALUES
                                                                      (9, 'A1', TRUE), (9, 'A2', TRUE), (9, 'A3', TRUE), (9, 'A4', TRUE), (9, 'A5', TRUE),
                                                                      (9, 'A6', TRUE), (9, 'A7', TRUE), (9, 'A8', TRUE), (9, 'A9', TRUE), (9, 'A10', TRUE),
                                                                      (9, 'B1', TRUE), (9, 'B2', TRUE), (9, 'B3', TRUE), (9, 'B4', TRUE), (9, 'B5', TRUE),
                                                                      (9, 'B6', TRUE), (9, 'B7', TRUE), (9, 'B8', TRUE), (9, 'B9', TRUE), (9, 'B10', TRUE);

-- Movie 10
INSERT INTO available_seats (movie_id, seat_number, is_available) VALUES
                                                                      (10, 'A1', TRUE), (10, 'A2', TRUE), (10, 'A3', TRUE), (10, 'A4', TRUE), (10, 'A5', TRUE),
                                                                      (10, 'A6', TRUE), (10, 'A7', TRUE), (10, 'A8', TRUE), (10, 'A9', TRUE), (10, 'A10', TRUE),
                                                                      (10, 'B1', TRUE), (10, 'B2', TRUE), (10, 'B3', TRUE), (10, 'B4', TRUE), (10, 'B5', TRUE),
                                                                      (10, 'B6', TRUE), (10, 'B7', TRUE), (10, 'B8', TRUE), (10, 'B9', TRUE), (10, 'B10', TRUE);

-- Movie 11
INSERT INTO available_seats (movie_id, seat_number, is_available) VALUES
                                                                      (11, 'A1', TRUE), (11, 'A2', TRUE), (11, 'A3', TRUE), (11, 'A4', TRUE), (11, 'A5', TRUE),
                                                                      (11, 'A6', TRUE), (11, 'A7', TRUE), (11, 'A8', TRUE), (11, 'A9', TRUE), (11, 'A10', TRUE),
                                                                      (11, 'B1', TRUE), (11, 'B2', TRUE), (11, 'B3', TRUE), (11, 'B4', TRUE), (11, 'B5', TRUE),
                                                                      (11, 'B6', TRUE), (11, 'B7', TRUE), (11, 'B8', TRUE), (11, 'B9', TRUE), (11, 'B10', TRUE);

-- Movie 12
INSERT INTO available_seats (movie_id, seat_number, is_available) VALUES
                                                                      (12, 'A1', TRUE), (12, 'A2', TRUE), (12, 'A3', TRUE), (12, 'A4', TRUE), (12, 'A5', TRUE),
                                                                      (12, 'A6', TRUE), (12, 'A7', TRUE), (12, 'A8', TRUE), (12, 'A9', TRUE), (12, 'A10', TRUE),
                                                                      (12, 'B1', TRUE), (12, 'B2', TRUE), (12, 'B3', TRUE), (12, 'B4', TRUE), (12, 'B5', TRUE),
                                                                      (12, 'B6', TRUE), (12, 'B7', TRUE), (12, 'B8', TRUE), (12, 'B9', TRUE), (12, 'B10', TRUE);

-- Movie 13
INSERT INTO available_seats (movie_id, seat_number, is_available) VALUES
                                                                      (13, 'A1', TRUE), (13, 'A2', TRUE), (13, 'A3', TRUE), (13, 'A4', TRUE), (13, 'A5', TRUE),
                                                                      (13, 'A6', TRUE), (13, 'A7', TRUE), (13, 'A8', TRUE), (13, 'A9', TRUE), (13, 'A10', TRUE),
                                                                      (13, 'B1', TRUE), (13, 'B2', TRUE), (13, 'B3', TRUE), (13, 'B4', TRUE), (13, 'B5', TRUE),
                                                                      (13, 'B6', TRUE), (13, 'B7', TRUE), (13, 'B8', TRUE), (13, 'B9', TRUE), (13, 'B10', TRUE);


select * from movies;
select * from users;
select * from available_seats;
