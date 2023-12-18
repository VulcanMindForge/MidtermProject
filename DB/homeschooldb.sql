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
  `id` INT NOT NULL AUTO_INCREMENT,
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
  `last_update` DATETIME NULL,
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
  `teacher_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_student_grade_level1_idx` (`grade_level_id` ASC),
  INDEX `fk_student_user1_idx` (`parent_id` ASC),
  INDEX `fk_teacher_idx` (`teacher_id` ASC),
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
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `teacher` (`id`)
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
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
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
  `description` TEXT NOT NULL,
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
  `description` TEXT NOT NULL,
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
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `enabled`) VALUES (2, 'mom', 'doe', 'mom1', '1234', 'Teacher', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `enabled`) VALUES (3, 'son', 'doe', 'son1', '1234', 'Student', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `enabled`) VALUES (4, 'kid1', 'doe', 'kid1', '1234', 'Student', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `enabled`) VALUES (5, 'kid2', 'doe', 'kid2', '1234', 'Student', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `enabled`) VALUES (6, 'dad', 'brown', 'dad1', '1234', 'Teacher', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `teacher`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `teacher` (`id`, `email`) VALUES (1, 'teacher1@mail.com');
INSERT INTO `teacher` (`id`, `email`) VALUES (2, 'teacher2@mail.com');
INSERT INTO `teacher` (`id`, `email`) VALUES (6, 'teacher2@mail.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `lesson_plan`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `lesson_plan` (`id`, `teacher_id`, `title`, `description`, `create_date`, `last_update`, `shared`) VALUES (1, 1, 'how to teach math', 'still math', '2022-01-02', '2022-01-03', 0);
INSERT INTO `lesson_plan` (`id`, `teacher_id`, `title`, `description`, `create_date`, `last_update`, `shared`) VALUES (2, 1, 'how to teach science', 'still science', '2022-01-02', NULL, NULL);
INSERT INTO `lesson_plan` (`id`, `teacher_id`, `title`, `description`, `create_date`, `last_update`, `shared`) VALUES (3, 1, 'how to teach social studies', 'still social studies', '2022-01-02', NULL, NULL);
INSERT INTO `lesson_plan` (`id`, `teacher_id`, `title`, `description`, `create_date`, `last_update`, `shared`) VALUES (4, 1, 'how to teach computer science', 'still computer science', '2022-01-02', NULL, NULL);
INSERT INTO `lesson_plan` (`id`, `teacher_id`, `title`, `description`, `create_date`, `last_update`, `shared`) VALUES (5, 1, 'how to teach language arts', 'still language arts', '2022-01-02', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `grade_level`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `grade_level` (`id`, `name`, `grade_number`) VALUES (1, '1st grade', '1');
INSERT INTO `grade_level` (`id`, `name`, `grade_number`) VALUES (2, '2nd grade', '2');
INSERT INTO `grade_level` (`id`, `name`, `grade_number`) VALUES (3, '3rd grade', '3');
INSERT INTO `grade_level` (`id`, `name`, `grade_number`) VALUES (4, '4th grade', '4');
INSERT INTO `grade_level` (`id`, `name`, `grade_number`) VALUES (5, '5th grade', '5');
INSERT INTO `grade_level` (`id`, `name`, `grade_number`) VALUES (6, '6th grade', '6');
INSERT INTO `grade_level` (`id`, `name`, `grade_number`) VALUES (7, '7th grade', '7');
INSERT INTO `grade_level` (`id`, `name`, `grade_number`) VALUES (8, '8th grade', '8');
INSERT INTO `grade_level` (`id`, `name`, `grade_number`) VALUES (9, '9th grade', '9');
INSERT INTO `grade_level` (`id`, `name`, `grade_number`) VALUES (10, '10th grade', '10');
INSERT INTO `grade_level` (`id`, `name`, `grade_number`) VALUES (11, '11th grade', '11');
INSERT INTO `grade_level` (`id`, `name`, `grade_number`) VALUES (12, '12th grade', '12');
INSERT INTO `grade_level` (`id`, `name`, `grade_number`) VALUES (13, '13th grade', '13');

COMMIT;


-- -----------------------------------------------------
-- Data for table `student`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `student` (`id`, `grade_level_id`, `parent_id`, `teacher_id`) VALUES (1, 1, 1, 1);
INSERT INTO `student` (`id`, `grade_level_id`, `parent_id`, `teacher_id`) VALUES (3, 2, 1, 2);
INSERT INTO `student` (`id`, `grade_level_id`, `parent_id`, `teacher_id`) VALUES (4, 2, 1, 6);
INSERT INTO `student` (`id`, `grade_level_id`, `parent_id`, `teacher_id`) VALUES (5, 3, 2, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `resource`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `resource` (`id`, `title`, `url`, `user_id`, `create_date`, `last_update`) VALUES (1, 'math01', 'google,com', 1, '2022-01-02', '2022-01-02');
INSERT INTO `resource` (`id`, `title`, `url`, `user_id`, `create_date`, `last_update`) VALUES (2, 'science01', 'https://ket.pbslearningmedia.org/collection/btl07-ex/', 1, '2022-01-02', NULL);
INSERT INTO `resource` (`id`, `title`, `url`, `user_id`, `create_date`, `last_update`) VALUES (3, 'history01', 'https://www.historyforkids.net/', 1, '2022-01-02', NULL);
INSERT INTO `resource` (`id`, `title`, `url`, `user_id`, `create_date`, `last_update`) VALUES (4, 'compsci01', 'https://climatekids.nasa.gov/', 1, '2022-01-02', NULL);
INSERT INTO `resource` (`id`, `title`, `url`, `user_id`, `create_date`, `last_update`) VALUES (5, 'reading01', NULL, 1, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `assignment`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `assignment` (`id`, `student_id`, `title`, `description`, `duedate`, `lessonplan_id`, `resource_id`, `completed`, `grade`) VALUES (1, 1, 'math', '1+1', '2022-02-03', 1, 1, 0, NULL);
INSERT INTO `assignment` (`id`, `student_id`, `title`, `description`, `duedate`, `lessonplan_id`, `resource_id`, `completed`, `grade`) VALUES (2, 1, 'science', 'don\'t mix these', '2022-02-06', 2, 2, 0, NULL);
INSERT INTO `assignment` (`id`, `student_id`, `title`, `description`, `duedate`, `lessonplan_id`, `resource_id`, `completed`, `grade`) VALUES (3, 1, 'social studies', 'this happened when?', '2022-02-05', 3, 3, 0, NULL);
INSERT INTO `assignment` (`id`, `student_id`, `title`, `description`, `duedate`, `lessonplan_id`, `resource_id`, `completed`, `grade`) VALUES (4, 1, 'computer science', 'type type type delete type', '2022-02-04', 4, 4, 0, NULL);
INSERT INTO `assignment` (`id`, `student_id`, `title`, `description`, `duedate`, `lessonplan_id`, `resource_id`, `completed`, `grade`) VALUES (5, 1, 'language arts', 'read this out loud', '2022-02-04', 5, 5, 0, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `message`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `message` (`id`, `sender_id`, `receiver_id`, `message`, `message_date`) VALUES (1, 1, 1, 'hi', '2022-01-02');
INSERT INTO `message` (`id`, `sender_id`, `receiver_id`, `message`, `message_date`) VALUES (2, 1, 2, 'hi', '2022-01-02');
INSERT INTO `message` (`id`, `sender_id`, `receiver_id`, `message`, `message_date`) VALUES (3, 1, 2, 'how are you?', '2022-01-02');
INSERT INTO `message` (`id`, `sender_id`, `receiver_id`, `message`, `message_date`) VALUES (4, 2, 1, 'i\'m good', '2022-01-02');
INSERT INTO `message` (`id`, `sender_id`, `receiver_id`, `message`, `message_date`) VALUES (5, 2, 1, 'how are you?', '2022-01-02');

COMMIT;


-- -----------------------------------------------------
-- Data for table `subject`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `subject` (`id`, `title`) VALUES (1, 'Math');
INSERT INTO `subject` (`id`, `title`) VALUES (2, 'Science');
INSERT INTO `subject` (`id`, `title`) VALUES (3, 'Social Studies');
INSERT INTO `subject` (`id`, `title`) VALUES (4, 'Computer Science');
INSERT INTO `subject` (`id`, `title`) VALUES (5, 'Language Arts');
INSERT INTO `subject` (`id`, `title`) VALUES (6, 'Physical Education');

COMMIT;


-- -----------------------------------------------------
-- Data for table `standard`
-- -----------------------------------------------------
START TRANSACTION;
USE `homeschooldb`;
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (1, 1, 'https://www.cde.state.co.us/apps/standards/4,2,0', 1, 'Kindergarten Math', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (2, 2, 'https://www.cde.state.co.us/apps/standards/7,2,0', 1, 'Kindergarten Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (3, 4, 'https://www.cde.state.co.us/apps/standards/8,2,0', 1, 'Kindergarten Social Studies', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (4, 5, 'https://www.cde.state.co.us/apps/standards/6,2,0', 1, 'Kindergarten Language Arts', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (5, 6, 'https://www.cde.state.co.us/apps/standards/11,2,0', 1, 'Kindergarten Physical Education', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (6, 1, 'https://www.cde.state.co.us/apps/standards/4,3,0', 2, 'First Grade Math', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (7, 2, 'https://www.cde.state.co.us/apps/standards/7,3,0', 2, 'First Grade Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (8, 4, 'https://www.cde.state.co.us/apps/standards/8,3,0', 2, 'First Grade Social Studies', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (9, 5, 'https://www.cde.state.co.us/apps/standards/6,3,0', 2, 'First Grade Language Arts', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (10, 6, 'https://www.cde.state.co.us/apps/standards/11,3,0', 2, 'First Grade Physical Education', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (11, 1, 'https://www.cde.state.co.us/apps/standards/4,4,0', 3, 'Second Grade Math', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (12, 2, 'https://www.cde.state.co.us/apps/standards/7,4,0', 3, 'Second Grade Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (13, 4, 'https://www.cde.state.co.us/apps/standards/8,4,0', 3, 'Second Grade Social Studies', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (14, 5, 'https://www.cde.state.co.us/apps/standards/6,4,0', 3, 'Second Grade Language Arts', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (15, 6, 'https://www.cde.state.co.us/apps/standards/11,4,0', 3, 'Second Grade Physical Education', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (16, 1, 'https://www.cde.state.co.us/apps/standards/4,5,0', 4, 'Third Grade Math', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (17, 2, 'https://www.cde.state.co.us/apps/standards/7,5,0', 4, 'Third Grade Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (18, 4, 'https://www.cde.state.co.us/apps/standards/8,5,0', 4, 'Third Grade Social Studies', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (19, 5, 'https://www.cde.state.co.us/apps/standards/6,5,0', 4, 'Third Grade Language Arts', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (20, 6, 'https://www.cde.state.co.us/apps/standards/11,5,0', 4, 'Third Grade Physical Education', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (21, 1, 'https://www.cde.state.co.us/apps/standards/4,6,0', 5, 'Fourth Grade Math', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (22, 2, 'https://www.cde.state.co.us/apps/standards/7,6,0', 5, 'Fourth Grade Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (23, 4, 'https://www.cde.state.co.us/apps/standards/8,6,0', 5, 'Fourth Grade Social Studies', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (24, 5, 'https://www.cde.state.co.us/apps/standards/6,6,0', 5, 'Fourth Grade Language Arts', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (25, 6, 'https://www.cde.state.co.us/apps/standards/11,6,0', 5, 'Fourth Grade Physical Education', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (26, 1, 'https://www.cde.state.co.us/apps/standards/4,7,0', 6, 'Fifth Grade Math', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (27, 2, 'https://www.cde.state.co.us/apps/standards/7,7,0', 6, 'Fifth Grade Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (28, 4, 'https://www.cde.state.co.us/apps/standards/8,7,0', 6, 'Fifth Grade Social Studies', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (29, 5, 'https://www.cde.state.co.us/apps/standards/6,7,0', 6, 'Fifth Grade Language Arts', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (30, 6, 'https://www.cde.state.co.us/apps/standards/11,7,0', 6, 'Fifth Grade Physical Education', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (31, 1, 'https://www.cde.state.co.us/apps/standards/4,8,0', 7, 'Sixth Grade Math', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (32, 2, 'https://www.cde.state.co.us/apps/standards/7,8,0', 7, 'Sixth Grade Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (33, 4, 'https://www.cde.state.co.us/apps/standards/8,8,0', 7, 'Sixth Grade Social Studies', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (34, 5, 'https://www.cde.state.co.us/apps/standards/6,8,0', 7, 'Sixth Grade Language Arts', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (35, 6, 'https://www.cde.state.co.us/apps/standards/11,8,0', 7, 'Sixth Grade Physical Education', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (36, 1, 'https://www.cde.state.co.us/apps/standards/4,9,0', 8, 'Seventh Grade Math', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (37, 2, 'https://www.cde.state.co.us/apps/standards/7,9,0', 8, 'Seventh Grade Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (38, 4, 'https://www.cde.state.co.us/apps/standards/8,9,0', 8, 'Seventh Grade Social Studies', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (39, 5, 'https://www.cde.state.co.us/apps/standards/6,9,0', 8, 'Seventh Grade Language Arts', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (40, 6, 'https://www.cde.state.co.us/apps/standards/11,9,0', 8, 'Seventh Grade Physical Education', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (41, 1, 'https://www.cde.state.co.us/apps/standards/4,9,0', 9, 'Eighth Grade Math', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (42, 2, 'https://www.cde.state.co.us/apps/standards/7,9,0', 9, 'Eighth Grade Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (43, 4, 'https://www.cde.state.co.us/apps/standards/8,9,0', 9, 'Eighth Grade Social Studies', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (44, 5, 'https://www.cde.state.co.us/apps/standards/6,9,0', 9, 'Eighth Grade Language Arts', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (45, 6, 'https://www.cde.state.co.us/apps/standards/11,9,0', 9, 'Eighth Grade Physical Education', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (46, 1, 'https://www.cde.state.co.us/apps/standards/4,15,0', 10, 'Freshman Math', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (47, 2, 'https://www.cde.state.co.us/apps/standards/7,15,0', 10, 'Freshman Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (48, 3, 'https://www.cde.state.co.us/apps/standards/12,15,0', 10, 'Freshman Comp Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (49, 4, 'https://www.cde.state.co.us/apps/standards/8,15,0', 10, 'Freshman Social Studies', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (50, 5, 'https://www.cde.state.co.us/apps/standards/6,15,0', 10, 'Freshman Language Arts', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (51, 6, 'https://www.cde.state.co.us/apps/standards/11,15,0', 10, 'Freshman Physical Education', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (52, 1, 'https://www.cde.state.co.us/apps/standards/4,15,0', 11, 'Sophmore Math', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (53, 2, 'https://www.cde.state.co.us/apps/standards/7,15,0', 11, 'Sophmore Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (54, 3, 'https://www.cde.state.co.us/apps/standards/12,15,0', 11, 'Sophmore Comp Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (55, 4, 'https://www.cde.state.co.us/apps/standards/8,15,0', 11, 'Sophmore Social Studies', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (56, 5, 'https://www.cde.state.co.us/apps/standards/6,15,0', 11, 'Sophmore Language Arts', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (57, 6, 'https://www.cde.state.co.us/apps/standards/11,15,0', 11, 'Sophmore Physical Education', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (58, 1, 'https://www.cde.state.co.us/apps/standards/4,15,0', 12, 'Junior Math', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (59, 2, 'https://www.cde.state.co.us/apps/standards/7,15,0', 12, 'Junior Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (60, 3, 'https://www.cde.state.co.us/apps/standards/12,15,0', 12, 'Junior Comp Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (61, 4, 'https://www.cde.state.co.us/apps/standards/8,15,0', 12, 'Junior Social Studies', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (62, 5, 'https://www.cde.state.co.us/apps/standards/6,15,0', 12, 'Junior Language Arts', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (63, 6, 'https://www.cde.state.co.us/apps/standards/11,15,0', 12, 'Junior Physical Education', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (64, 1, 'https://www.cde.state.co.us/apps/standards/4,15,0', 13, 'Senior Math', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (65, 2, 'https://www.cde.state.co.us/apps/standards/7,15,0', 13, 'Senior Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (66, 3, 'https://www.cde.state.co.us/apps/standards/12,15,0', 13, 'Senior Comp Science', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (67, 4, 'https://www.cde.state.co.us/apps/standards/8,15,0', 13, 'Senior Social Studies', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (68, 5, 'https://www.cde.state.co.us/apps/standards/6,15,0', 13, 'Senior Language Arts', 'CO', 2023);
INSERT INTO `standard` (`id`, `subject_id`, `url`, `grade_level_id`, `description`, `state`, `standard_year`) VALUES (69, 6, 'https://www.cde.state.co.us/apps/standards/11,15,0', 13, 'Senior Physical Education', 'CO', 2023);

COMMIT;

