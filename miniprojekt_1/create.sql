create schema if not exists miniproject_1;

create table if not exists miniproject_1.drug_categories(
    drug_category_id serial
        constraint drug_category_pk
            primary key,
    name text not null
);

create table if not exists miniproject_1.drugs
(
	drug_id serial
		constraint drugs_pk
			primary key,
	name text not null,
	drug_category_id int
        references miniproject_1.drug_categories(drug_category_id)
);

create table if not exists miniproject_1.companies(
    company_id serial
        constraint companies_pk
            primary key,
    name text not null
);

create table if not exists miniproject_1.products
(
	product_id serial
		constraint products_pk
			primary key,
	name text not null,
	drug_id int
		constraint drug_fk
			references miniproject_1.drugs,
	company int
        references miniproject_1.companies(company_id)
);




create table if not exists miniproject_1.disease_categories
(
	disease_category_id serial
		constraint disease_categories_pk
			primary key,
	name text
);

create table if not exists miniproject_1.diseases
(
	disease_id serial
		constraint diseases_pk
			primary key,
	name text,
	disease_category_id int
		constraint disease_category_id_fk
			references miniproject_1.disease_categories
);

create table if not exists miniproject_1.trials
(
	trail_id serial
		constraint trials_pk
			primary key,
	start_date date,
	completion_date date,
	participants int,
	drug_id int
		references miniproject_1.drugs(drug_id)
);

create table if not exists miniproject_1.side_effects
(
	side_effect_id serial
		constraint side_effects_pk
			primary key,
	name text
);

create table if not exists miniproject_1.drugs_diseases
(
	drug_id int
		constraint drug_fk
			references miniproject_1.drugs,
	disease_id int
		constraint disease_fk
			references miniproject_1.diseases,
	constraint drugs_diseases_pk
		primary key (drug_id, disease_id)
);

create table if not exists miniproject_1.drug_interactions
(
	drug_id_a int
		constraint drug_a_fk
			references miniproject_1.drugs,
	drug_id_b int
		constraint drug_b_fk
			references miniproject_1.drugs,
	constraint drug_interactions_pk
		primary key (drug_id_a, drug_id_b)
);

create table if not exists miniproject_1.drug_side_effect
(
	drug_id int
		constraint drug_fk
			references miniproject_1.drugs,
	side_effect_id int
		constraint side_effect_fk
			references miniproject_1.side_effects,
	constraint drug_side_effect_pk
		primary key (drug_id, side_effect_id)
);
