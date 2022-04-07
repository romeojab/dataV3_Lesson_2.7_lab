-- Lab | SQL Join (Part I)

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT	c.name AS Category
		, COUNT(f.film_id) AS '# Of Films'
FROM sakila.film f
	JOIN sakila.film_category fc
		ON f.film_id=fc.film_id
	JOIN sakila.category c
		ON  c.category_id=fc.category_id
GROUP BY Category
ORDER BY `# Of Films` -- Thank Erin for this quotation solution
;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT	s.first_name AS First_Name
		, s.last_name AS Last_Name
        , ROUND(SUM(p.amount)) AS 'Total Amount'
FROM sakila.payment p
	JOIN sakila.staff s
		USING (staff_id)
WHERE DATE_FORMAT(CONVERT(p.payment_date,DATE),'%m''%y') = "08'05"
GROUP BY s.staff_id
ORDER BY `Total Amount`
;

-- 3. Which actor has appeared in the most films?
SELECT	a.actor_id
		, COUNT(f.film_id) AS 'Number Of Films'
FROM sakila.actor a
	JOIN sakila.film_actor f
		USING (actor_id)
GROUP BY a.actor_id
ORDER BY `Number Of Films` DESC
;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT	CONCAT(a.first_name,' ', a.last_name) AS Customer
		, COUNT(r.inventory_id) AS 'Number Of Rentals'
FROM sakila.customer a
	JOIN sakila.rental r
		USING (customer_id)
GROUP BY a.customer_id
ORDER BY `Number Of Rentals` DESC
;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT	s.first_name AS 'First Name'
		, s.last_name AS 'Last Name'
        , a.address AS Address
FROM sakila.staff s
	JOIN sakila.address a
		USING (address_id)
;

-- 6. List each film and the number of actors who are listed for that film.
SELECT	f.title AS Film
		, COUNT(fa.actor_id) AS 'Number of actors'
FROM sakila.film f
	JOIN sakila.film_actor fa
		USING (film_id)
GROUP BY Film
 ORDER BY `Number of actors` desc
;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT	CONCAT(c.first_name, ' ', c.last_name) AS Customer 
		, SUM(p.amount) AS 'Total paid'
FROM sakila.customer c
	JOIN sakila.payment p
		USING (customer_id)
GROUP BY c.customer_id
ORDER BY c.last_name DESC
;


-- 8. List number of films per category

-- Done in number one