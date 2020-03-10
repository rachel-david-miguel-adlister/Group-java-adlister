USE adlister_db;

DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS joiner;


CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       username VARCHAR(240) UNIQUE NOT NULL ,
                       email VARCHAR(240) NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE ads (
                     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                     user_id INT UNSIGNED NOT NULL,
                     title VARCHAR(240) NOT NULL,
                     description TEXT NOT NULL,
                     PRIMARY KEY (id),
                     FOREIGN KEY (user_id) REFERENCES users(id)
                         ON DELETE CASCADE
);

CREATE TABLE categories (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        category varchar(240) not null,
                        primary key (id)
);

CREATE TABLE joiner (
                    ad_id int unsigned not null,
                    cat_id int unsigned not null ,
                    foreign key (ad_id) references ads(id),
                    foreign key (cat_id) references categories(id)
);
