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
