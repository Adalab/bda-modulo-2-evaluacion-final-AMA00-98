-- EXAMEN FINAL MÓDULO 2 - AMA --

USE sakila;

/* Ejercicio 1:
Selecciona todos los nombres de las películas sin que aparezcan duplicados --> 'DISTINCT' */ 

SELECT DISTINCT title AS nombre_peliculas
	FROM film; -- Resultado: 1000 datos

/* Ejercicio 2:
Muestra los nombres de todas las películas que tengan una clasificación de "PG-13" --> 'WHERE' */

SELECT title AS nombre_peliculas
	FROM film
    WHERE rating = "PG-13"; -- Resultado: 223 datos
    
/* Ejercicio 3:
Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción --> 'LIKE' */

SELECT title AS nombre_peliculas, description AS descripcion
	FROM film
    WHERE description LIKE "% amazing %"; -- Resultado: 48 datos

/* Ejercicio 4:
Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos --> '>' */

SELECT title AS nombre_peliculas
	FROM film
    WHERE length > 120; -- Resultado: 457 datos

/* Ejercicio 5:
 Recupera los nombres de todos los actores */
 
 SELECT first_name AS nombre_actores
	FROM actor;  -- Resultado: 200 datos
