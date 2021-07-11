# users table creation
CREATE TABLE users
(id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(255) UNIQUE,
created_at TIMESTAMP DEFAULT NOW());

# Insert some data on users table
INSERT INTO users (username)
VALUES("BlueTheCat"),
	  ("CharlieBrown"),
	  ("John Melon");

# photos table creation
CREATE TABLE photos
(id INT AUTO_INCREMENT PRIMARY KEY,
image_url VARCHAR(255) NOT NULL,
user_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY (user_id) REFERENCES users(id));

# Insert some data on photos table
INSERT INTO photos (image_url, user_id)
VALUES("/alskjd76", 1),
	  ("/lkajsd98", 2),
	  ("/90jddlkj", 2);

# Simple join
SELECT
	image_url,
	username
FROM photos p
INNER JOIN users u
	ON p.user_id = u.id;

# comments table creation
CREATE TABLE comments
(id INT AUTO_INCREMENT PRIMARY KEY,
comment_text VARCHAR(255),
user_id INT NOT NULL,
photo_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (photo_id) REFERENCES photos(id));

# Insert some data on comments table
INSERT INTO comments(comment_text, user_id, photo_id)
VALUES("Meow!", 1, 2),
	  ("Amazing Shot!", 3, 2),
	  ("I <3 This!", 2, 1);

# Insert some data on comments table
INSERT INTO comments(comment_text, user_id, photo_id)
VALUES("Meow!", 1, 2),
	  ("Amazing Shot!", 3, 2),
	  ("I <3 This!", 2, 1);

# likes table creation
CREATE TABLE likes
(user_id INT NOT NULL,
photo_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (photo_id) REFERENCES photos(id),
PRIMARY KEY(user_id, photo_id));

# Insert some data on comments table
INSERT INTO likes (user_id, photo_id)
VALUES (1, 1),
	   (2, 1),
	   (1, 2),
	   (1, 3),
	   (3, 3);

# follows table creation
CREATE TABLE follows
(follower_id INT NOT NULL,
followee_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY (follower_id) REFERENCES users(id),
FOREIGN KEY (followee_id) REFERENCES users(id),
PRIMARY KEY (follower_id, followee_id));

# Insert some data on follows table
INSERT INTO follows(follower_id, followee_id)
VALUES(1, 2),
	  (1, 3),
	  (3, 1),
	  (2, 3);

# tags table creation
CREATE TABLE tags
(id INT AUTO_INCREMENT PRIMARY KEY,
tag_name VARCHAR(255) UNIQUE,
created_at TIMESTAMP DEFAULT NOW());


# Insert some data on tags table
INSERT INTO tags(tag_name)
VALUES ("adorable"),
	   ("cute"),
	   ("sunrise");

# photo_tags table creation
CREATE TABLE photo_tags
(photo_id INT NOT NULL,
tag_id INT NOT NULL,
FOREIGN KEY(photo_id) REFERENCES photos(id),
FOREIGN KEY(tag_id) REFERENCES tags(id),
PRIMARY KEY(photo_id, tag_id));


# Insert some data on photo_tags table
INSERT INTO photo_tags(photo_id, tag_id)
VALUES(1, 1),
	  (1, 2),
	  (2, 3),
	  (3, 2);
