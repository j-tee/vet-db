/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name = 'Luna';
SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-1-1' AND '2019-12-31';
SELECT * FROM animals WHERE neutered is true AND escape_attempts < 3;
 SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
 SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
 SELECT * FROM animals WHERE neutered is true;
 SELECT * FROM animals WHERE name != 'Gabumon' ;
 SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

 begin;
 update animals set species = 'unspecified';
 select * from animals;
 rollback;
 
 begin;
 update animals set species = 'digimon ' where name like '%mon';
 update animals set species = 'pokemon' where species is null;
 commit;

 begin;
 delete from animals;
 select * from animals;
 rollback;

 begin;
 delete from animals where date_of_birth > '2022-1-1';
 savepoint p1;
 update animals set weight_kg = weight_kg* -1;
 rollback to p1;
 update animals set weight_kg = weight_kg * -1  where weight_kg < 0;
 commit;

-- How many animals are there?
select count(*) from animals; --10

-- How many animals have never tried to escape?
select count(escape_attempts) from animals where escape_attempts = 0; --2

-- What is the average weight of animals?
select avg(weight_kg) as avgWeight from animals; --15.4800000000000000

-- Who escapes the most, neutered or not neutered animals?
 select neutered, sum(escape_attempts) as escape_attempts from animals group by neutered;--neutered
 -- neutered | escape_attempts
----------+---------------------
 --f        |               4
 --t        |              19

-- What is the minimum and maximum weight of each type of animal?
select max(weight_kg) as max_wgt, min(weight_kg) as min_wgt from animals where species = 'pokemon';
 --max_wgt | min_wgt
---------+---------
 --     17 |      11
 select max(weight_kg) as max_wgt, min(weight_kg) as min_wgt from animals where species = 'digimon';

 --max_wgt | min_wgt
---------+---------
--      45 |       5

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
select avg(escape_attempts) as escape_attempts from animals where species = 'pokemon' and  date_of_birth between '1990-1-1' and '2000-1-1';
--escape_attempts
--------------------
--3.0000000000000000

 select avg(escape_attempts) as escape_attempts from animals where species = 'digimon' and  date_of_birth
between '1990-1-1' and '2000-1-1'; --0

--escape_attempts
--------------------
 --2.6666666666666667

--What animals belong to Melody Pond?
select name as Animals from animals A join owners O on A.owner_id = O.id where O.full_name = 'Melody Pond';
--animals
------------
 --Blossom
 --Charmander
 --Squirtle

 --List of all animals that are pokemon (their type is Pokemon).
 select A.name as Animals, S.name as Species from animals A join species S on A.species_id = S.id where S.
name='Pokemon';
--animals   | species
---------------+---------
--Pikachu   | Pokemon
--Blossom   | Pokemon
--Charmander | Pokemon
--Squirtle   | Pokemon

--List all owners and their animals, remember to include those that don't own any animal.
select o.full_name, a.name from animals a right join owners o on a.owner_id = o.id;
------full_name    |    name
-----------------+------------
 --Sam Smith       | Agumon
 --Jennifer Orwell | Pikachu
 --Jennifer Orwell | Gabumon
 --Bob             | Devimon
 --Bob             | Plantmon
 --Melody Pond     | Blossom
 --Melody Pond     | Charmander
 --Melody Pond     | Squirtle
 --Dean Winchester | Boarmon
 --Dean Winchester | Angemon
 --Jodie Whittaker |

 --How many animals are there per species?
 select count(a.name) as Animals, s.name as species from animals a join species s on a.species_id = s.id g
roup by s.id;
 --animals | species
---------+---------
--   4 | Pokemon
--   6 | Digimon

--List all Digimon owned by Jennifer Orwell.
select o.full_name, s.name from owners o join animals a on o.id = a.owner_id join species s on s.id = a.species_id where s.name='Digimon' and o.full_name = 'Jennifer Orwell';
 --   full_name    |  name
-------------------+---------
-- Jennifer Orwell | Digimon

--List all animals owned by Dean Winchester that haven't tried to escape.
select o.full_name, a.name from owners o join animals a on o.id = a.owner_id where a.escape_attempts = 0 and o.full_name = 'Dean Winchester';
-- full_name | name
-----------+------
--(0 rows)

--Who owns the most animals?
select o.full_name as Owners, count(a.name) as animals from animals a join owners o on a.owner_id = o.id
group by o.full_name;
----   owners      | animals
-----------------+------------
-- Dean Winchester |       2
-- Melody Pond     |       3
-- Bob             |       2
-- Jennifer Orwell |       2
-- Sam Smith       |       1



---Who was the last animal seen by William Tatcher?
 select a.name, v.date_of_visit
from animals a join visits v on a.id = v.animal_id
join vets ve on ve.id = v.vet_id
where ve.name = 'William Tatcher'
order by v.date_of_visit desc limit 1;

--How many different animals did Stephanie Mendez see?
 select a.name
from animals a join visits v on a.id = v.animal_id
join vets ve on ve.id = v.vet_id
where ve.name = 'Stephanie Mendez';

-----List all vets and their specialties, including vets with no specialties.
select * from vets v join specializations s on v.id = s.vet_id;

--List all vets and their specialties, including vets with no specialties.
select v.name as Vet, s.name as Speciality from species s 
right join specializations sp on s.id = sp.species_id right join vets v on v.id = sp.vet_id;

--List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
select a.name, v.date_of_visit from animals a 
join visits v on a.id = v.animal_id 
join vets ve on v.vet_id = ve.id 
where v.date_of_visit between '2020-4-1' and '2020-8-30';

--What animal has the most visits to vets?
select a.name, count(v.animal_id) as visits from visits v 
join animals a on v.animal_id = a.id group by a.name
having count(v.animal_id) = (select count(animal_id) as cnt 
from visits group by animal_id  order by cnt desc limit 1);
 -- name   | visits
-----------+--------
 --Boarmon |      4   


 --Who was Maisy Smith's first visit?
select a.name, v.date_of_visit from animals a 
join visits v on a.id = v.animal_id 
join vets ve on ve.id = v.vet_id 
where ve.name = 'Maisy Smith' and 
v.date_of_visit = (select date_of_visit from visits order by date_of_visit asc limit 1);

  --name   | date_of_visit
-----------+---------------
 --Boarmon | 2019-01-24

--Details for most recent visit: animal information, vet information, and date of visit.
select a.name as animal, s.name as species_type, v.date_of_visit, ve.name as vet_officer, 
ve.date_of_graduation from species s join animals a on s.id = a.species_id  
join visits v on a.id = v.animal_id join vets ve on ve.id = v.vet_id 
where date_of_visit = (select date_of_visit from visits order by date_of_visit desc limit 1);
 --animal  | species_type | date_of_visit |   vet_officer    | date_of_graduation
-----------+--------------+---------------+------------------+--------------------
 --Devimon | Digimon      | 2021-05-04    | Stephanie Mendez | 1981-05-04


--How many visits were with a vet that did not specialize in that animal's species?
select ve.name, count(animal_id) from visits v join vets ve on v.vet_id = ve.id 
where vet_id in (select id from vets 
where id not in (select vet_id from specializations)) group by ve.name;
--    name     | count
---------------+-------
-- Maisy Smith |     9

--What specialty should Maisy Smith consider getting? Look for the species she gets the most.
select ve.name as vet, sp.name as species, count(animal_id) as no_of_visits 
from visits v join vets ve on v.vet_id = ve.id join animals a 
on a.id = v.animal_id join species sp on sp.id = a.species_id where vet_id in (select id 
from vets where id not in (select vet_id from specializations)) group by ve.name, sp.name;
---     vet     | species | no_of_visits
----------------+---------+--------------
--- Maisy Smith | Digimon |            6
--- Maisy Smith | Pokemon |            3

--Answer: Digimon


--- Decrease execution time by using the animal name
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';