CREATE TABLE `Departments`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `Students`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `surname` VARCHAR(255) NOT NULL,
    `age` TINYINT NOT NULL,
    `mail` VARCHAR(255) NOT NULL,
    `degree_program_id` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `Teachers`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `surname` VARCHAR(255) NOT NULL,
    `age` TINYINT NOT NULL,
    `mail` VARCHAR(255) NOT NULL,
    `course_id` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `Degree_programs`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `department_id` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `Courses`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `degree_programs_id` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `Exam_sessions`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `course_id` BIGINT NOT NULL
);
CREATE TABLE `course_teacher`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `teacher_id` BIGINT UNSIGNED NOT NULL,
    `course_id` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `examSession_student`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `student_id` BIGINT UNSIGNED NOT NULL,
    `exam_session` BIGINT UNSIGNED NOT NULL,
    `vote` TINYINT NOT NULL
);
ALTER TABLE
    `Exam_sessions` ADD CONSTRAINT `exam_sessions_course_id_foreign` FOREIGN KEY(`course_id`) REFERENCES `Courses`(`id`);
ALTER TABLE
    `Degree_programs` ADD CONSTRAINT `degree_programs_department_id_foreign` FOREIGN KEY(`department_id`) REFERENCES `Departments`(`id`);
ALTER TABLE
    `Courses` ADD CONSTRAINT `courses_degree_programs_id_foreign` FOREIGN KEY(`degree_programs_id`) REFERENCES `Degree_programs`(`id`);
ALTER TABLE
    `course_teacher` ADD CONSTRAINT `course_teacher_course_id_foreign` FOREIGN KEY(`course_id`) REFERENCES `Courses`(`id`);
ALTER TABLE
    `course_teacher` ADD CONSTRAINT `course_teacher_teacher_id_foreign` FOREIGN KEY(`teacher_id`) REFERENCES `Teachers`(`id`);
ALTER TABLE
    `examSession_student` ADD CONSTRAINT `examsession_student_student_id_foreign` FOREIGN KEY(`student_id`) REFERENCES `Students`(`id`);
ALTER TABLE
    `examSession_student` ADD CONSTRAINT `examsession_student_exam_session_foreign` FOREIGN KEY(`exam_session`) REFERENCES `Exam_sessions`(`id`);
ALTER TABLE
    `Degree_programs` ADD CONSTRAINT `degree_programs_id_foreign` FOREIGN KEY(`id`) REFERENCES `Students`(`degree_program_id`);