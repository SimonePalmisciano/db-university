/*
1. Selezionare tutti gli studenti nati nel 1990  
*/
SELECT *
FROM `students`
WHERE YEAR (`students`.`date_of_birth`) = "1990%" ;

/*
2. Selezionare tutti i corsi che valgono più di 10 crediti 
*/
SELECT *
FROM `courses`
WHERE `courses`.`cfu` > "10";

/*
3. Selezionare tutti gli studenti che hanno più di 30 anni 
*/
SELECT *
FROM `students`
WHERE YEAR (`students`.`date_of_birth`) <= "1996%" ;

/*
4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
laurea (286)
*/
SELECT * 
FROM `courses`
WHERE `courses`.`period` = "I semestre" AND `courses`.`year` = "1";

/*
5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
20/06/2020 (21)
*/
SELECT *
FROM `exams`
WHERE `exams`.`date` = "2020-06-20" 
	AND `exams`.`hour` > "14:00"
	AND `exams`.`hour` < "24:00";
    
/*
6. Selezionare tutti i corsi di laurea magistrale (38)
*/
SELECT `degrees`.`name`
FROM `degrees`
WHERE `degrees`.`name` LIKE "%laurea magistrale%";

/*
7. Da quanti dipartimenti è composta l'università? (12)
*/
SELECT COUNT(*)
FROM `departments`
WHERE 1;

/*
8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
*/

SELECT COUNT(*)
FROM `teachers`
WHERE `teachers`.`phone` IS NULL;