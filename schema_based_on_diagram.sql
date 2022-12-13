CREATE TABLE patients  (
    id integer GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth date,
    primary key(id)
);

CREATE TABLE invoices  (
    id integer GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    paid_at TIMESTAMP,
    medical_history_id INTEGER,
    primary key(id),

    CONSTRAINT fk_medical_histories
      FOREIGN KEY(medical_history_id) 
	  REFERENCES medical_histories(id)
	  ON DELETE CASCADE
);


CREATE TABLE medical_histories  (
    id integer GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INTEGER,
    status VARCHAR(20),
    primary key(id),

    CONSTRAINT fk_patient
      FOREIGN KEY(patient_id) 
	  REFERENCES patients(id)
	  ON DELETE CASCADE
);

--- create treatments table
CREATE TABLE treatments (
  id SERIAL NOT NULL,
  type VARCHAR(250),
  name VARCHAR(250),
  PRIMARY KEY (id)
);

--- create invoice_items table
CREATE TABLE invoice_items (
  id SERIAL NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  quantity INT NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  invoice_id INT,
  treatment_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id),
);

--- Create treatment_histories join table
CREATE TABLE treatment_histories (
  id SERIAL NOT NULL,
  medical_history_id INT,
  treatment_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id),
);


































--- create treatments table
CREATE TABLE treatments (
  id SERIAL NOT NULL,
  type VARCHAR(250),
  name VARCHAR(250),
  PRIMARY KEY (id)
);

--- create invoice_items table
CREATE TABLE invoice_items (
  id SERIAL NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  quantity INT NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  invoice_id INT,
  treatment_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id),
);
CREATE TABLE patients  (
    id integer GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth date,
    primary key(id)
);

CREATE TABLE invoices  (
    id integer GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    paid_at TIMESTAMP,
    medical_history_id INTEGER,
    primary key(id),

    CONSTRAINT fk_medical_histories
      FOREIGN KEY(medical_history_id) 
	  REFERENCES medical_histories(id)
	  ON DELETE CASCADE
);


CREATE TABLE medical_histories  (
    id integer GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INTEGER,
    status VARCHAR(20),
    primary key(id),
