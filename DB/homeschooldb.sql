-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema homeschooldb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `homeschooldb` ;

-- -----------------------------------------------------
-- Schema homeschooldb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `homeschooldb` DEFAULT CHARACTER SET utf8 ;
USE `homeschooldb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teacher` ;

CREATE TABLE IF NOT EXISTS `teacher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_teacher_user1`
    FOREIGN KEY (`id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lesson_plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lesson_plan` ;

CREATE TABLE IF NOT EXISTS `lesson_plan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `teacher_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `create_date` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  `shared` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`teacher_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lesson_plan_teacher1`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `teacher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grade_level`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grade_level` ;

CREATE TABLE IF NOT EXISTS `grade_level` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `grade_number` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student` ;

CREATE TABLE IF NOT EXISTS `student` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `grade_level_id` INT NOT NULL,
  `parent_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_student_grade_level1_idx` (`grade_level_id` ASC),
  INDEX `fk_student_user1_idx` (`parent_id` ASC),
  CONSTRAINT `fk_student_user_id`
    FOREIGN KEY (`id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_grade_level1`
    FOREIGN KEY (`grade_level_id`)
    REFERENCES `grade_level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_user1`
    FOREIGN KEY (`parent_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resource` ;

CREATE TABLE IF NOT EXISTS `resource` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `url` VARCHAR(2000) NULL,
  `user_id` INT NOT NULL,
  `create_date` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_resource_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_resource_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment` ;

CREATE TABLE IF NOT EXISTS `assignment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  `duedate` DATE NOT NULL,
  `lessonplan_id` INT NOT NULL,
  `resource_id` INT NOT NULL,
  `completed` TINYINT NOT NULL,
  `grade` DOUBLE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_assignment_lessonplan1_idx` (`lessonplan_id` ASC),
  INDEX `fk_assignment_resource1_idx` (`resource_id` ASC),
  INDEX `fk_assignment_user_id_idx` (`student_id` ASC),
  CONSTRAINT `fk_assignment_user_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assignment_lessonplan1`
    FOREIGN KEY (`lessonplan_id`)
    REFERENCES `lesson_plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assignment_resource1`
    FOREIGN KEY (`resource_id`)
    REFERENCES `resource` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `message` ;

CREATE TABLE IF NOT EXISTS `message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sender_id` INT NOT NULL,
  `receiver_id` INT NOT NULL,
  `message` TEXT NOT NULL,
  `message_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `sender_id_idx` (`sender_id` ASC),
  INDEX `recevier_id_idx` (`receiver_id` ASC),
  CONSTRAINT `sender_id`
    FOREIGN KEY (`sender_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `recevier_id`
    FOREIGN KEY (`receiver_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `subject` ;

CREATE TABLE IF NOT EXISTS `subject` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `title_UNIQUE` (`title` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `standard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `standard` ;

CREATE TABLE IF NOT EXISTS `standard` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `subject_id` INT NOT NULL,
  `url` VARCHAR(2000) NOT NULL,
  `grade_level_id` INT NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  `state` VARCHAR(2) NOT NULL,
  `standard_year` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `subject_idx` (`subject_id` ASC),
  INDEX `fk_standard_grade_level1_idx` (`grade_level_id` ASC),
  CONSTRAINT `subject_id`
    FOREIGN KEY (`subject_id`)
    REFERENCES `subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_standard_grade_level1`
    FOREIGN KEY (`grade_level_id`)
    REFERENCES `grade_level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `standard_has_resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `standard_has_resource` ;

CREATE TABLE IF NOT EXISTS `standard_has_resource` (
  `standard_id` INT NOT NULL,
  `resource_id` INT NOT NULL,
  PRIMARY KEY (`standard_id`, `resource_id`),
  INDEX `fk_standard_has_resource_resource1_idx` (`resource_id` ASC),
  INDEX `fk_standard_has_resource_standard1_idx` (`standard_id` ASC),
  CONSTRAINT `fk_standard_has_resource_standard1`
    FOREIGN KEY (`standard_id`)
    REFERENCES `standard` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_standard_has_resource_resource1`
    FOREIGN KEY (`resource_id`)
    REFERENCES `resource` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS teacher@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'teacher'@'localhost' IDENTIFIED BY 'teacher';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'teacher'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `enabled`) VALUES (1, 'john', 'doe', 'johndoe1', '1234', '1', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `teacher`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `teacher` (`id`, `email`) VALUES (1, 'teacher1@mail.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `lesson_plan`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `lesson_plan` (`id`, `teacher_id`, `title`, `description`, `create_date`, `last_update`, `shared`) VALUES (1, 1, 'how to teach math', 'still math', '2022-01-02', '2022-01-03', 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `grade_level`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `grade_level` (`id`, `name`, `grade_number`) VALUES (1, 'mom', '1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `student`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `student` (`id`, `grade_level_id`, `parent_id`) VALUES (1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `resource`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `resource` (`id`, `title`, `url`, `user_id`, `create_date`, `last_update`) VALUES (1, 'math01', 'google,com', 1, '2022-01-02', '2022-01-02');

COMMIT;


-- -----------------------------------------------------
-- Data for table `assignment`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `assignment` (`id`, `student_id`, `title`, `description`, `duedate`, `lessonplan_id`, `resource_id`, `completed`, `grade`) VALUES (1, 1, 'math', '1+1', '2022-02-03', 1, 1, 0, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `message`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `message` (`id`, `sender_id`, `receiver_id`, `message`, `message_date`) VALUES (1, 1, 1, 'hi', '2022-01-02');

COMMIT;


-- -----------------------------------------------------
-- Data for table `subject`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `subject` (`id`, `title`) VALUES (1, 'math');

COMMIT;


-- -----------------------------------------------------
-- Data for table `standard`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (1, 1, 'google.com', 1, 'math', 'CO', 2013);

COMMIT;

