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
