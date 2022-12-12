INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
('Agumon','2020-2-3',0,true,10.23),
('Pikachu','2021-1-7',1,false,15.04),
('Devimon','2017-5-12',5,true,11),
('Gabumon','2018-11-15',1,true,8),
('Charmander','2020-2-8',0,false,-11),
('Plantmon','2021-11-15',2,true,5),
('Squirtle','1993-4-2',3,false,-12.13),
('Angemon','2005-6-7',1,true,-45),
('Boarmon','2005-6-12',7,true,20.4),
('Blossom','1998-10-13',3,true,17),
('Ditto','2022-5-14',4,true,22);

INSERT INTO owners (full_name, age) VALUES 
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species  (name) VALUES 
('Pokemon'),
('Digimon');

--If the name ends in "mon" it will be Digimon
update animals set species_id =(SELECT id from species WHERE name like '%mon');

--All other animals are Pokemon
UPDATE animals
   SET species_id = (SELECT id from species WHERE name = 'Pokemon')
   WHERE species_id IS NULL;

--Sam Smith owns Agumon.
UPDATE animals
   SET owner_id = (SELECT id from owners WHERE full_name = 'Sam Smith')
   WHERE name = 'Agumon';

--Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals
   SET owner_id = (SELECT id from owners WHERE full_name = 'Jennifer Orwell')
   WHERE name = 'Gabumon' OR name = 'Pikachu';

-- Bob owns Devimon and Plantmon.
UPDATE animals
   SET owner_id = (SELECT id from owners WHERE full_name = 'Bob')
   WHERE name = 'Devimon' OR name = 'Plantmon';

--Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals
   SET owner_id = (SELECT id from owners WHERE full_name = 'Melody Pond')
   WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

--Dean Winchester owns Angemon and Boarmon.
UPDATE animals
   SET owner_id = (SELECT id from owners WHERE full_name = 'Dean Winchester')
   WHERE name = 'Angemon'  OR name = 'Boarmon';


INSERT INTO vets (name, age, date_of_graduation) VALUES 
('William Tatcher', 45, '2000-4-23'),
('Maisy Smith', 26, '2019-1-17'),
('Stephanie Mendez', 64, '1981-5-4'),
('Jack Harkness', 38, '2008-6-8');

INSERT INTO specializations(species_id, vet_id)
SELECT s.id, v.id
from species s, vets v
where s.name = 'Pokemon' and v.name = 'William Tatcher';

INSERT INTO specializations(species_id, vet_id)
SELECT s.id, v.id
from species s, vets v
where (s.name = 'Digimon' or s.name = 'Pokemon') and v.name = 'Stephanie Mendez';

INSERT INTO specializations(species_id, vet_id)
SELECT s.id, v.id
from species s, vets v
where s.name = 'Digimon' and v.name = 'Jack Harkness';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2020-5-24'
from animals a, vets v
where a.name = 'Agumon' and v.name = 'Jack Harkness';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2020-7-22'
from animals a, vets v
where a.name = 'Agumon' and v.name = 'Stephanie Mendez';

INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2021-2-2'
from animals a, vets v
where a.name = 'Gabumon' and v.name = 'Jack Harkness';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2020-1-5'
from animals a, vets v
where a.name = 'Pikachu' and v.name = 'Maisy Smith';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2020-3-8'
from animals a, vets v
where a.name = 'Pikachu' and v.name = 'Maisy Smith';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2020-5-14'
from animals a, vets v
where a.name = 'Pikachu' and v.name = 'Maisy Smith';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2020-5-14'
from animals a, vets v
where a.name = 'Pikachu' and v.name = 'Maisy Smith';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2021-5-4'
from animals a, vets v
where a.name = 'Devimon' and v.name = 'Stephanie Mendez';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2021-2-24'
from animals a, vets v
where a.name = 'Charmander' and v.name = 'Jack Harkness';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2019-12-21'
from animals a, vets v
where a.name = 'Plantmon' and v.name = 'Maisy Smith';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2020-8-10'
from animals a, vets v
where a.name = 'Plantmon' and v.name = 'William Tatcher';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2021-4-7'
from animals a, vets v
where a.name = 'Plantmon' and v.name = 'Maisy Smith';

INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2019-9-29'
from animals a, vets v
where a.name = 'Squirtle' and v.name = 'Stephanie Mendez';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2020-10-3'
from animals a, vets v
where a.name = 'Angemon' and v.name = 'Jack Harkness';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2020-11-4'
from animals a, vets v
where a.name = 'Angemon' and v.name = 'Jack Harkness';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2019-1-24'
from animals a, vets v
where a.name = 'Boarmon' and v.name = 'Maisy Smith';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2019-5-15'
from animals a, vets v
where a.name = 'Boarmon' and v.name = 'Maisy Smith';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2020-2-27'
from animals a, vets v
where a.name = 'Boarmon' and v.name = 'Maisy Smith';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2020-8-3'
from animals a, vets v
where a.name = 'Boarmon' and v.name = 'Maisy Smith';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2020-5-24'
from animals a, vets v
where a.name = 'Blossom' and v.name = 'Stephanie Mendez';


INSERT INTO visits(animal_id, vet_id, date_of_visit)
SELECT a.id, v.id, '2021-1-11'
from animals a, vets v
where a.name = 'Blossom' and v.name = 'William Tatcher';



-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';