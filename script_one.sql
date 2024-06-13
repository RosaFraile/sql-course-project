CREATE DATABASE IF NOT EXISTS university;

USE university;

CREATE TABLE IF NOT EXISTS students (
  students_id INT NOT NULL AUTO_INCREMENT,
  students_first_name VARCHAR(45) NOT NULL,
  students_last_name VARCHAR(45) NOT NULL,
  students_email VARCHAR(45) NOT NULL,
  PRIMARY KEY (students_id),
  UNIQUE INDEX students_id_UNIQUE (students_id ASC) VISIBLE,
  UNIQUE INDEX students_email_UNIQUE (students_email ASC) VISIBLE);
  
CREATE TABLE IF NOT EXISTS professors (
  professors_id INT NOT NULL AUTO_INCREMENT,
  professors_first_name VARCHAR(45) NOT NULL,
  professors_last_name VARCHAR(45) NOT NULL,
  professors_email VARCHAR(45) NOT NULL,
  PRIMARY KEY (professors_id),
  UNIQUE INDEX professors_id_UNIQUE (professors_id ASC) VISIBLE);
  
CREATE TABLE IF NOT EXISTS courses (
  courses_id INT NOT NULL AUTO_INCREMENT,
  courses_name VARCHAR(45) NOT NULL,
  courses_professors_id INT NOT NULL,
  PRIMARY KEY (courses_id),
  UNIQUE INDEX courses_id_UNIQUE (courses_id ASC) VISIBLE,
  INDEX courses_professors_id_idx (courses_professors_id ASC) VISIBLE,
  CONSTRAINT courses_professors_id
    FOREIGN KEY (courses_professors_id)
    REFERENCES professors (professors_id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);
    
CREATE TABLE IF NOT EXISTS grades (
  grades_id INT NOT NULL AUTO_INCREMENT,
  grades_students_id INT NOT NULL,
  grades_courses_id INT NOT NULL,
  grades_score DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (grades_id),
  UNIQUE INDEX grades_id_UNIQUE (grades_id ASC) VISIBLE,
  INDEX grades_students_id_idx (grades_students_id ASC) VISIBLE,
  INDEX grades_courses_id_idx (grades_courses_id ASC) VISIBLE,
  CONSTRAINT grades_students_id
    FOREIGN KEY (grades_students_id)
    REFERENCES students (students_id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT grades_courses_id
    FOREIGN KEY (grades_courses_id)
    REFERENCES courses (courses_id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);