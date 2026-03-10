-- EXAMEN FINAL MÓDULO 2 - AMA --

USE sakila;

/* Ejercicio 1:
Selecciona todos los nombres de las películas sin que aparezcan duplicados.
Respuesta: 'DISTINCT' */ 

SELECT DISTINCT title AS nombre_pelicula
	FROM film; -- Resultado: 1000 datos

/* Ejercicio 2:
Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
Respuesta: 'WHERE' */

SELECT title AS nombre_pelicula
	FROM film
    WHERE rating = "PG-13"; -- Resultado: 223 datos
    
/* Ejercicio 3:
Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
Respuesta: 'LIKE' */

SELECT title AS nombre_pelicula, description AS descripcion
	FROM film
    WHERE description LIKE "% amazing %"; -- Resultado: 48 datos

/* Ejercicio 4:
Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
Respuesta: '>' */

SELECT title AS nombre_pelicula
	FROM film
    WHERE length > 120; -- Resultado: 457 datos

/* Ejercicio 5:
Recupera los nombres de todos los actores. */
 
SELECT first_name AS nombre_actor
	FROM actor; -- Resultado: 200 datos

/* Ejercicio 6:
Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
Respuesta: 'WHERE' */
 
SELECT first_name AS nombre_actor, last_name AS appelido
	FROM actor
    WHERE last_name = "Gibson"; -- Resultado: 1 dato
 
/* Ejercicio 7:
Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
Respuesta: 'BETWEEN' */
 
SELECT first_name AS nombre_actor, last_name AS appelido
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
    
SELECT c.customer_id AS id_cliente, c.first_name AS nombre_cliente, c.last_name AS apellido, COUNT(r.rental_id) AS total_peliculas_alquiladas -- Columnas + Alias
	FROM customer AS c -- Tabla 1 (principal)
		INNER JOIN rental AS r -- Tabla 2 (contrastar datos)
			ON c.customer_id  = r.customer_id -- FK
    GROUP BY c.customer_id,c.first_name, c.last_name; -- Resultado: 599 datos

-- Prueba con ''LEFT JOIN' - TODOS    
SELECT c.customer_id AS id_cliente, c.first_name AS nombre_cliente, c.last_name AS apellido, COUNT(r.rental_id) AS total_peliculas_alquiladas 
	FROM customer AS c 
		LEFT JOIN rental AS r
			ON c.customer_id  = r.customer_id 
    GROUP BY c.customer_id,c.first_name, c.last_name; -- Resultado: 599 datos
 
/* Ejercicio 11:
Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
Respuesta: 'COUNT()' + 'GROUP BY' + 'INNER JOIN' con 5 Tablas' */

SELECT c.name AS categoria, COUNT(r.rental_id) AS total_peliculas_alquiladas -- Columnas + Alias
	FROM category AS c -- Tabla 1 (principal)
		INNER JOIN film_category AS fc -- Tabla 2 (contrastar datos) - Hay que pasar por aquí para llegar a ambas tablas
			ON c.category_id  = fc.category_id -- FK
		INNER JOIN film AS f -- Tabla 3 (contrastar datos)
			ON fc.film_id = f.film_id -- FK
		INNER JOIN inventory AS i -- Tabla 4 (contrastar datos)
			ON f.film_id = i.film_id -- FK
		INNER JOIN rental AS r -- Tabla 5 (contrastar datos)
			ON i.inventory_id = r.inventory_id -- FK
    GROUP BY c.name; -- Resultado: 16 datos 
 
/* Ejercicio 12:
Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
Respuesta: 'AVG()' + 'GROUP BY' */
 
SELECT rating AS clasificacion, AVG(length) AS promedio_duracion
	FROM film
    GROUP BY rating; -- Resultado: 5 datos
 
/* Ejercicio 13:
Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
Respuesta: 'INNER JOIN' con 3 Tablas + 'WHERE' */
 
SELECT a.first_name AS nombre_actor, a.last_name AS apellido -- Columnas + Alias
	FROM actor AS a -- Tabla 1 (principal)
		INNER JOIN film_actor AS fa -- Tabla 2 (contrastar datos) - Hay que pasar por aquí para llegar a ambas tablas
			ON a.actor_id  = fa.actor_id -- FK
		INNER JOIN film AS f -- Tabla 3 (contrastar datos)
			ON fa.film_id = f.film_id -- FK
    WHERE f.title = "Indian Love"; -- Resultado: 10 datos 
 
/* Ejercicio 14:
Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
Respuesta: 'LIKE' + 'OR' */
 
SELECT title AS nombre_pelicula
	FROM film
	WHERE description LIKE "% dog %" OR description = "% cat %"; -- Resultado: 99 datos
 
/* Ejercicio 15:
Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor.
Respuesta: 'INNER JOIN' + 'WHERE' + 'IS NULL' */

SELECT a.first_name AS nombre_actor, a.last_name AS apellido -- Columnas + Alias
	FROM actor AS a -- Tabla 1 (principal)
		INNER JOIN film_actor AS fa -- Tabla 2 (contrastar datos) 
			ON a.actor_id  = fa.actor_id -- FK
    WHERE fa.film_id IS NULL; -- Resultado: 0 datos 

/* Ejercicio 16:
Recupera los nombres de todos los actores */