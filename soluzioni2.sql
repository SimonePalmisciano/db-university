/* JOIN */
/*
1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
*/
SELECT *
FROM `students` AS `s`
	JOIN `degrees` AS `d`
		ON `d`.`id` = `s`.`degree_id`
WHERE `d`.`name` LIKE "Corso di Laurea in Economia";

/*
2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di
Neuroscienze
*/
SELECT *
FROM `degrees`
	JOIN `departments`
		ON `degrees`.`department_id` = `departments`.`id`
WHERE `degrees`.`name` LIKE "%Magistrale%"
	AND `departments`.`name` LIKE "%Neuroscienze";
    
/*
3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
*/
SELECT *
FROM `teachers` 
	JOIN `course_teacher` 
		ON `course_teacher`.`teacher_id` = `teachers`.`id`
	JOIN `courses`
		ON `course_teacher`.`course_id` = `courses`.`id`
WHERE `teachers`.`id` = 44;

/*
4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
nome
*/
SELECT *
FROM `students` AS `s`
	JOIN `degrees`
		ON `degrees`.`id` = `s`.`degree_id`
	JOIN `departments`
		ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `s`.`name`, `s`.`surname`;

/*
5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
*/
SELECT *
FROM `degrees` as `d`
	JOIN `courses`
		ON `courses`.`degree_id` = `d`.`id`
	JOIN `course_teacher`
		ON `course_teacher`.`course_id` = `courses`.`id`
	JOIN `teachers`
		ON `course_teacher`.`teacher_id` = `teachers`.`id`;
        
/*
6. Selezionare tutti i docenti che insegnano nel Dipartimento di
Matematica (54)
*/
SELECT DISTINCT `t`.*
FROM `teachers` AS `t`
	JOIN `course_teacher`
		ON `course_teacher`.`teacher_id` = `t`.`id`
	JOIN `courses`
		ON `course_teacher`.`course_id` = `courses`.`id`
	JOIN `degrees`
		ON `courses`.`degree_id` = `degrees`.`id`
	JOIN `departments`
		ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = "dipartimento di matematica";