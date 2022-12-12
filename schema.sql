/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id integer GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal,
    species_id integer,
    owner_id integer,
     CONSTRAINT fk_species
      FOREIGN KEY(species_id) 
	  REFERENCES species(id)
	  ON DELETE CASCADE,

      CONSTRAINT fk_owners
      FOREIGN KEY(owner_id) 
	  REFERENCES owners(id)
	  ON DELETE CASCADE,

    primary key(id)
);

CREATE TABLE owners (
    id integer GENERATED ALWAYS AS IDENTITY,
    full_name varchar(100),
    age integer,
    primary key(id)
);

CREATE TABLE species (
    id integer GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    primary key(id)
);

CREATE TABLE vets (
    id integer GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    age integer,
    date_of_graduation date,
    primary key(id)
);

CREATE TABLE specializations (
    species_id integer,
    vet_id integer,
    CONSTRAINT fk_species_specializations
      FOREIGN KEY(species_id) 
	  REFERENCES species(id)
	  ON DELETE CASCADE,

    CONSTRAINT fk_vet_specializations
      FOREIGN KEY(vet_id) 
	  REFERENCES vets(id)
	  ON DELETE CASCADE
);

CREATE TABLE visits  (
    animal_id integer,
    vet_id integer,
    CONSTRAINT fk_visits_animals
      FOREIGN KEY(animal_id) 
	  REFERENCES animals(id)
	  ON DELETE CASCADE,
      CONSTRAINT fk_visits_vets
      FOREIGN KEY(vet_id) 
	  REFERENCES vets(id)
	  ON DELETE CASCADE
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);


--- Add animal_name col to visits table
ALTER TABLE visits
ADD COLUMN animal_name VARCHAR(50);

--- Create a non-clustered index for visits table
CREATE INDEX animal_name_asc ON visits (animal_name ASC);


