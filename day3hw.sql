--Question 1: Customers who live in Texas
-- SELECT *
-- FROM address

-- SELECT * 
-- FROM customer;
SELECT district, first_name, last_name
FROM address
FULL JOIN customer
ON address.address_id = customer.address_id
WHERE district LIKE 'Texas';

--Question 2: All payments above 6.99 with customer's full name
SELECT first_name, last_name, COUNT(payment.amount) 
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
HAVING COUNT(amount) > 6.99;
 
 
 --Question 3: Show all customer's names who made payments over $175
SELECT customer_id,first_name,last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

--Question 4: All customers who live in nepal
SELECT city, city.city_id, first_name, last_name, district
FROM city
INNER JOIN address
ON city.country_id = address.address_id
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district LIKE 'Nepal';

--Question 5: Which staff member had the most transactions
SELECT first_name, last_name, email,COUNT(payment.staff_id) AS Highest_Selling
FROM staff  
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY COUNT(payment.staff_id) DESC
LIMIT 1;

--Question 6: How many movies of each rating are there
SELECT rating, COUNT(rating) AS amount
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;

--Question 7: Show all customers who made a single payment above 6.99
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING COUNT(amount) > 6.99
	ORDER BY COUNT(amount) DESC
);
-- SELECT *
-- FROM payment
--Question 8: How many free rentals did our stores give away
SELECT amount, COUNT(amount) AS FREE_RENTAL
FROM payment
GROUP BY amount
HAVING COUNT(amount) = 0.00;