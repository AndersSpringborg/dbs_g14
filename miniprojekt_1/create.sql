CREATE TABLE IF NOT EXISTS drug_categories(
    drug_category_id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS drugs(
	drug_id SERIAL PRIMARY KEY,
	name TEXT UNIQUE NOT NULL,
	drug_category_id INT REFERENCES drug_categories
);

CREATE TABLE IF NOT EXISTS companies(
    company_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS products
(
	product_id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	drug_id int	REFERENCES drugs,
	company int REFERENCES companies
);


CREATE TABLE IF NOT EXISTS disease_categories
(
	disease_category_id SERIAL PRIMARY KEY,
	name TEXT NOT NULL
);


CREATE TABLE IF NOT EXISTS diseases
(
	disease_id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	disease_category_id INT REFERENCES disease_categories
);

CREATE TABLE IF NOT EXISTS trials
(
	trail_id SERIAL PRIMARY KEY,
	start_date DATE NOT NULL,
	completion_date DATE,
	participants INT NOT NULL,
	drug_id INT REFERENCES drugs 
);

CREATE TABLE IF NOT EXISTS side_effects
(
	side_effect_id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
);

CREATE TABLE IF NOT EXISTS drugs_diseases
(
	drug_id INT REFERENCES drugs,
	disease_id INT REFERENCES diseases,
	CONSTRAINT drugs_diseases_pk PRIMARY KEY (drug_id, disease_id)
);

CREATE TABLE IF NOT EXISTS drug_interactions
(
	drug_id_a INT REFERENCES drugs,
	drug_id_b INT REFERENCES drugs,
	CONSTRAINT drug_interactions_pk PRIMARY KEY (drug_id_a, drug_id_b)
);

CREATE TABLE IF NOT EXISTS drug_side_effect
(
      drug_id INT REFERENCES drugs,
      side_effect_id INT REFERENCES side_effects,
      CONSTRAINT drug_side_effect_pk PRIMARY KEY (drug_id, side_effect_id)
	
);
