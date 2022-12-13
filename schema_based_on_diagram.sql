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