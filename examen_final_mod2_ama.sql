-- EXAMEN FINAL MÓDULO 2 - AMA --

USE sakila;

/* Ejercicio 1:
Selecciona todos los nombres de las películas sin que aparezcan duplicados.
Respuesta: 'DISTINCT' */ 

SELECT DISTINCT title AS nombre_peliculas
	FROM film; -- Resultado: 1000 datos

/* Ejercicio 2:
Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
Respuesta: 'WHERE' */

SELECT title AS nombre_peliculas
	FROM film
    WHERE rating = "PG-13"; -- Resultado: 223 datos
    
/* Ejercicio 3:
Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
Respuesta: 'LIKE' */

SELECT title AS nombre_peliculas, description AS descripcion
	FROM film
    WHERE description LIKE "% amazing %"; -- Resultado: 48 datos

/* Ejercicio 4:
Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
Respuesta: '>' */

SELECT title AS nombre_peliculas
	FROM film
    WHERE length > 120; -- Resultado: 457 datos

/* Ejercicio 5:
Recupera los nombres de todos los actores. */
 
SELECT first_name AS nombre_actores
	FROM actor; -- Resultado: 200 datos

/* Ejercicio 6:
Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
Respuesta: 'WHERE' */
 
SELECT first_name AS nombre, last_name AS appelido
	FROM actor
    WHERE last_name = "Gibson"; -- Resultado: 1 dato
 
 /* Ejercicio 7:
Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
Respuesta: 'BETWEEN' */
 
SELECT first_name AS nombre, last_name AS appelido
	FROM actor
    WHERE actor_id BETWEEN 10 AND 20; -- Resultado: 11 datos
 
 /* Ejercicio 8:
Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
Respuesta: 'NOT IN()' */
 
SELECT title AS nombre_peliculas
	FROM film
    WHERE rating NOT IN ("R", "PG-13"); -- Resultado: 582 datos
 
 /* Ejercicio 9:
Encuentra la cantidad total de películas en cada clasificación de la tabla film y muetra la clasificación junto con el recuento.
Respuesta: 'COUNT()' + 'GROUP BY' */

SELECT rating AS clasificacion, COUNT(rating) AS total_peliculas
	FROM film
    GROUP BY rating; -- Resultado: 5 datos
    
 /* Ejercicio 10:
Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
Respuesta: 'COUNT()' + 'GROUP BY' + 'INNER JOIN' 
Pd: No uso un 'LEFT JOIN' porque si el cliente no ha alquilado nunca alguna película, su nombre no aparecería */
    
SELECT c.customer_id AS id_cliente, c.first_name AS nombre, c.last_name AS apellido, COUNT(r.rental_id) AS total_peliculas_alquiladas 
	FROM customer AS c
		INNER JOIN rental AS r
			ON c.customer_id  = r.customer_id 
    GROUP BY c.customer_id,c.first_name, c.last_name; -- Resultado: 599 datos

-- Prueba con ''LEFT JOIN' - TODOS    
SELECT c.customer_id AS id_cliente, c.first_name AS nombre, c.last_name AS apellido, COUNT(r.rental_id) AS total_peliculas_alquiladas 
	FROM customer AS c
		LEFT JOIN rental AS r
			ON c.customer_id  = r.customer_id 
    GROUP BY c.customer_id,c.first_name, c.last_name; -- Resultado: 599 datos
 
 /* Ejercicio 11:
 Recupera los nombres de todos los actores */