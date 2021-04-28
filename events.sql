DROP DATABASE IF EXISTS lav_florists;

CREATE DATABASE lav_florists;
USE lav_florists;

DROP TABLE IF EXISTS consultants;

CREATE TABLE consultants(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30),
    is_active TINYINT UNSIGNED,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS events;

CREATE TABLE events(
    id INT NOT NULL AUTO_INCREMENT,
    event_location TEXT,
    event_date DATE,
    event_time TIME,
    photographer VARCHAR(50),
    photo_phone TEXT,
    photo_location TEXT,
    photo_date DATE,
    photo_time TIME,
    recept_location TEXT,
    recept_date DATE,
    recept_time TIME,
    rehearsal_location TEXT,
    rehearsal_date DATE,
    rehearsal_time TIME,
    del_type CHAR(1),
    del_date DATE,
    del_time TIME,
    id_consultant INT,
    notes TEXT,
    source VARCHAR(20),
    tax_rate DECIMAL(4, 2),
    total DECIMAL(7, 2),
    date_add DATE,
    date_mod DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (id_consultant) REFERENCES consultants(id)
);

DROP TABLE IF EXISTS contacts;

CREATE TABLE contacts(
    id INT NOT NULL AUTO_INCREMENT,
    id_event INT,
    role VARCHAR(50),
    name VARCHAR(50),
    address TEXT,
    phone1 TEXT,
    phone2 TEXT,
    email TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_event) REFERENCES events(id)
);

DROP TABLE IF EXISTS deposits;

CREATE TABLE deposits(
    id INT NOT NULL AUTO_INCREMENT,
    id_event INT,
    id_contact INT,
    salutation TEXT,
    body TEXT,
    date_sent DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (id_event) REFERENCES events(id),
    FOREIGN KEY (id_contact) REFERENCES contacts(id)
);

DROP TABLE IF EXISTS letters;

CREATE TABLE letters(
    id INT NOT NULL AUTO_INCREMENT,
    id_event INT,
    id_contact INT,
    salutation TEXT,
    body TEXT,
    date_sent DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (id_event) REFERENCES events(id),
    FOREIGN KEY (id_contact) REFERENCES contacts(id)
);

DROP TABLE IF EXISTS item_cats;

CREATE TABLE item_cats(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30),
    sort_order TINYINT UNSIGNED,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS items;

CREATE TABLE items(
    id INT NOT NULL AUTO_INCREMENT,
    id_event INT,
    id_cat INT,
    name TEXT,
    description TEXT,
    quantity SMALLINT UNSIGNED,
    unit_price DECIMAL(7, 2),
    sort_order TINYINT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (id_event) REFERENCES events(id),
    FOREIGN KEY (id_cat) REFERENCES item_cats(id)
);

DROP TABLE IF EXISTS templates;

CREATE TABLE templates(
    id INT NOT NULL AUTO_INCREMENT,
    name TEXT,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS template_items;

CREATE TABLE template_items(
    id INT NOT NULL AUTO_INCREMENT,
    id_template INT,
    name TEXT,
    description TEXT,
    sort_order TINYINT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (id_template) REFERENCES templates(id)
);