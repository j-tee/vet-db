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

