/*  1. actors name,name length without spaces, limit 10*/

select 
concat(first_name,' ',last_name)AS full_name,
length(trim(concat(first_name,'',last_name)))AS namelength
from
actor
limit 10;



/* 2. list of all oscar awardees,their names,their names lengths*/

select actor_award_id,awards,concat(first_name,'  ',last_name)as full_name,length(concat(first_name,' ',last_name))as length from actor_award
where awards='oscar';



/* 3. actors who have acted in the film 'frost head'*/

select concat(first_name,' ',last_name)as full_name,title from actor a
join film_actor f_a on a.actor_id=f_a.actor_id
join film f on f_a.film_id=f.film_id
where title='frost head';



/*  4.all the films acted by the 'will wilson'*/

select concat(first_name,' ',last_name)as full_name,title from actor a
join film_actor f_a on a.actor_id=f_a.actor_id
join film f on f_a.film_id=f.film_id
where first_name='will'and last_name='wilson';



/*  5.films which were rented,returned in the month of 'may'*/


SELECT title,rental_date,return_date FROM rental r
join inventory i on r.inventory_id=i.inventory_id
join film f on i.film_id=f.film_id
where rental_date between '2005-04-30'and'2005-06-01'and return_date between '2005-04-30'and'2005-06-01';



/*   6.all the films in comedy category*/

select title,name from film f
join film_category f_c on f.film_id=f_c.film_id
join category c on f_c.category_id=c.category_id
where name='comedy';
