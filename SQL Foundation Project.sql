use mavenmovies;

/* 1. count the number of characters except for the spaces for each actor. 
Return the first 10 actors' name lengths along with their names.*/

select * from actor;
select concat(first_name,' ',last_name) as full_name,
length(trim(concat(first_name,last_name))) as name_length from actor
limit 10;

/* 2. List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names.*/

select * from actor_award;
select concat(first_name," ",last_name) as full_name,length(concat(first_name,last_name)) as name_length from actor_award
where awards like ('%oscar%');


/* 3. Find the actors who have acted in the film ‘Frost Head.*/
select * from actor; -- actor_id
select * from film_actor; -- actor_id,film_id
select * from film; -- film_id

select ac.first_name, ac.last_name from actor ac
inner join film_actor fa on ac.actor_id=fa.actor_id
inner join film fm on fa.film_id=fm.film_id
where fm.title='Frost Head';


/* 4. Pull all the films acted by the actor ‘Will Wilson.’*/
select * from film; -- film_id
select * from film_actor; -- film_id,actor_id
select * from actor; -- actor_id

select fm.title from film fm
left join film_actor fa on fm.film_id=fa.film_id
left join actor ac on fa.actor_id=ac.actor_id
where concat(first_name,' ',last_name)='Will Wilson';

-- 5. Pull all the films which were rented and return them in the month of May.
select * from rental; -- inventory_id
select * from film;  -- film_id
select * from inventory; -- film_id,inventiry_id


select fm.title from film fm
left join inventory iy on fm.film_id=iy.film_id
left join rental rl on iy.inventory_id=rl.inventory_id
where month(rl.rental_date)=5 and month(rl.return_date)=5;


-- 6. Pull all the films with ‘Comedy’ category.
select * from film_category; -- film_id, category_id
select * from category;  -- categroy_id
select * from film;   -- Film_id

select fm.title from film fm
left join film_category fc on fm.film_id=fc.film_id
left join category cy on fc.category_id=cy.category_id
where cy.name='Comedy';
















