create database HIV_DATA;

use HIV_DATA ;

CREATE TABLE countries (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) UNIQUE NOT NULL,
    who_region VARCHAR(100)
);

CREATE TABLE art_coverage_people (
    acp_id INT PRIMARY KEY AUTO_INCREMENT,
    country_id INT,
    reported_people_receiving_art INT,
    estimated_people_living_with_hiv INT,
    estimated_art_coverage_percent DECIMAL(5,2),

    estimated_people_living_with_hiv_median INT,
    estimated_people_living_with_hiv_min INT,
    estimated_people_living_with_hiv_max INT,
    estimated_art_coverage_percent_median DECIMAL(5,2),
    estimated_art_coverage_percent_min DECIMAL(5,2),
    estimated_art_coverage_percent_max DECIMAL(5,2),

    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

ALTER TABLE art_coverage_people
CHANGE COLUMN record_id acp_id INT NOT NULL;

Select * from art_coverage_people;

CREATE TABLE art_coverage_children (
    acc_id INT PRIMARY KEY AUTO_INCREMENT,
    country_id INT,
    reported_children_receiving_art INT,
    estimated_children_needing_art INT,
    estimated_art_coverage_percent DECIMAL(5,2),

    estimated_children_needing_art_median INT,
    estimated_children_needing_art_min INT,
    estimated_children_needing_art_max INT,
    estimated_art_coverage_percent_median DECIMAL(5,2),
    estimated_art_coverage_percent_min DECIMAL(5,2),
    estimated_art_coverage_percent_max DECIMAL(5,2),

    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

ALTER TABLE art_coverage_children
CHANGE COLUMN record_id acc_id INT NOT NULL;

CREATE TABLE hiv_adults (
    hiv_adults_id INT PRIMARY KEY AUTO_INCREMENT,
    country_id INT,
    year INT,
    count  DECIMAL(4,2), 
    prevalence_median DECIMAL(4,2),
    prevalence_min DECIMAL(4,2),
    prevalence_max DECIMAL(4,2),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

ALTER TABLE hiv_adults
CHANGE COLUMN record_id hiv_adults_id INT NOT NULL;

CREATE TABLE hiv_deaths (
    hiv_deaths_id INT PRIMARY KEY AUTO_INCREMENT,
    country_id INT,
    year INT,
    estimated_deaths INT,
    deaths_median INT,
    deaths_min INT,
    deaths_max INT,
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

ALTER TABLE hiv_deaths
CHANGE COLUMN record_id hiv_deaths_id INT NOT NULL;

CREATE TABLE people_living_with_hiv (
    plwh_id INT PRIMARY KEY AUTO_INCREMENT,
    country_id INT,
    year INT,
    estimated_count INT,
    count_median INT,
    count_min INT,
    count_max INT,
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

ALTER TABLE people_living_with_hiv
CHANGE COLUMN record_id plwh_id INT NOT NULL;

CREATE TABLE prevention_mother_child_transmission (
    pmct_id INT PRIMARY KEY AUTO_INCREMENT,
    country_id INT,
    received_art INT,
    needing_art INT,
    percent_received DECIMAL(5,2),
    needing_art_median INT,
    needing_art_min INT,
    needing_art_max INT,
    percent_received_median DECIMAL(5,2),
    percent_received_min DECIMAL(5,2),
    percent_received_max DECIMAL(5,2),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

ALTER TABLE prevention_mother_child_transmission
CHANGE COLUMN record_id pmct_id INT NOT NULL;

insert into countries  (country_name,who_region)
values
('Afghanistan', 'Eastern Mediterranean'),
('Albania', 'Europe'),
('Algeria', 'Africa'),
('Angola', 'Africa'),
('Argentina', 'Americas'),
('Armenia', 'Europe');

select * from countries; 

insert into art_coverage_people (
    country_id, reported_people_receiving_art, estimated_people_living_with_hiv,
    estimated_art_coverage_percent, estimated_people_living_with_hiv_median,
    estimated_people_living_with_hiv_min, estimated_people_living_with_hiv_max,
    estimated_art_coverage_percent_median, estimated_art_coverage_percent_min,
    estimated_art_coverage_percent_max
)
values

(1, 920, 7200, 13, 7200, 4100, 11000, 13, 7, 20),

(2, 580, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),

(3, 12800, 16000, 81, 16000, 15000, 17000, 81, 75, 86),

(4, 88700, 330000, 27, 330000, 290000, 390000, 27, 23, 31),

(5, 85500, 140000, 61, 140000, 130000, 150000, 61, 55, 67),

(6, 1900, 3500, 53, 3500, 3000, 4400, 53, 44, 65);


insert into art_coverage_children (
    country_id, reported_children_receiving_art, estimated_children_needing_art,
    estimated_art_coverage_percent,
    estimated_children_needing_art_median, estimated_children_needing_art_min, estimated_children_needing_art_max,
    estimated_art_coverage_percent_median, estimated_art_coverage_percent_min, estimated_art_coverage_percent_max
) 
VALUES
(1, 60, 500, 17, 500, 500, 530, 17, 10, 26),
(2, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 770, 500, 95, 500, 500, 520, 95, 95, 95),
(4, 4800, 38000, 13, 38000, 30000, 47000, 13, 10, 16);

insert into hiv_adults (country_id, year, count, prevalence_median, prevalence_min, prevalence_max ) 

VALUES
(1, 2018, 0.1, 0.1, 0.1, 0.1),
(2, 2018, NULL, NULL, NULL, NULL),
(3, 2018, 0.1, 0.1, 0.1, 0.1);

insert into hiv_deaths (country_id, year, estimated_deaths, deaths_median, deaths_min, deaths_max
) 
VALUES
(1, 2018, 500, 500, 200, 610),
(2, 2018, NULL, NULL, NULL, NULL),
(3, 2018, 200, 200, 200, 200),
(4, 2018, 14000, 14000, 9500, 18000);

insert into people_living_with_hiv (country_id, year, estimated_count, count_median, count_min, count_max
) 
VALUES
(1, 2018, 7200, 7200, 4100, 11000),
(2, 2018, NULL, NULL, NULL, NULL),
(3, 2018, 16000, 16000, 15000, 17000),
(4, 2018, 330000, 330000, 290000, 390000),
(5, 2018, 140000, 140000, 130000, 150000);

INSERT INTO prevention_mother_child_transmission (
    country_id, received_art, needing_art, percent_received,
    needing_art_median, needing_art_min, needing_art_max,
    percent_received_median, percent_received_min, percent_received_max
) VALUES
(1, 20, 200, 11, 200, 100, 500, 11, 7, 18),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 320, 500, 74, 500, 500, 500, 74, 69, 78),
(4, 9600, 25000, 38, 25000, 19000, 32000, 38, 29, 48),
(5, 1800, 1800, 95, 1800, 1600, 2000, 95, 85, 95),
(6, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

