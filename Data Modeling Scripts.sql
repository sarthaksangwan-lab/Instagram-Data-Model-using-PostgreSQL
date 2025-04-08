-- Scripts to create the data model

CREATE TABLE users(
	user_id SERIAL,
	name varchar(50) NOT NULL,
	phone_number varchar(10) UNIQUE,
	email_id varchar(50) UNIQUE,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (user_id)
);

CREATE TABLE posts(
	post_id SERIAL,
	user_id int NOT NULL,
	caption varchar(120),
	image_url varchar NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (post_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE comments(
	comment_id SERIAL,
	user_id int NOT NULL,
	post_id int NOT NULL,
	comment_text varchar(120) NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (comment_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (post_id) REFERENCES posts(post_id)
);

CREATE TABLE likes(
	likes_id SERIAL,
	user_id int NOT NULL,
	post_id int NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (likes_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (post_id) REFERENCES posts(post_id)
);

CREATE TABLE followers(
	followers_id SERIAL,
	user_id int NOT NULL,
	followers_user_id int NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (followers_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (followers_user_id) REFERENCES users(user_id)
);