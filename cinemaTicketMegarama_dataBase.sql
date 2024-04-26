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

CREATE TABLE reservations (
                              reservation_id INT AUTO_INCREMENT PRIMARY KEY,
                              user_id INT,
                              movie_id INT,
                              number_of_tickets ENUM('A', 'B', 'C', 'D', 'E', 'F' ,'G', 'H', 'I', 'J' ,'K', 'L' , 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T'),
                              price_total INT,
                              FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
                              FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users (user_name, email, password, role)
VALUES ('nabil', 'john@example.com', '1234', 'admin');
select * from movies;
select * from users;

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
select * from movies;
