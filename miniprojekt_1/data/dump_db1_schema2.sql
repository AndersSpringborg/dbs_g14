--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: condition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.condition (
    condition_id bigint,
    condition_name character varying(256)
);


ALTER TABLE public.condition OWNER TO postgres;

--
-- Name: disease; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disease (
    disease_name character varying(256),
    disease_category_id bigint
);


ALTER TABLE public.disease OWNER TO postgres;

--
-- Name: disease_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disease_category (
    disease_category_id bigint,
    disease_category_name character varying(64)
);


ALTER TABLE public.disease_category OWNER TO postgres;

--
-- Name: drug; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drug (
    drug_name character varying(256)
);


ALTER TABLE public.drug OWNER TO postgres;

--
-- Name: drug_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drug_category (
    drug_category_id bigint,
    drug_category_name character varying(64)
);


ALTER TABLE public.drug_category OWNER TO postgres;

--
-- Name: drug_in_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drug_in_category (
    drug_name character varying(256),
    drug_category_id bigint
);


ALTER TABLE public.drug_in_category OWNER TO postgres;

--
-- Name: drug_interaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drug_interaction (
    drug_name_a character varying(256),
    drug_name_b character varying(256)
);


ALTER TABLE public.drug_interaction OWNER TO postgres;

--
-- Name: institution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institution (
    institution_name character varying(128),
    address character varying(256),
    country character varying(32)
);


ALTER TABLE public.institution OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_name character varying(256),
    company_name character varying(128)
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_drug_relation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_drug_relation (
    product_name character varying(256),
    drug_name character varying(256)
);


ALTER TABLE public.product_drug_relation OWNER TO postgres;

--
-- Name: related_condition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.related_condition (
    trial_id bigint,
    condition_id bigint
);


ALTER TABLE public.related_condition OWNER TO postgres;

--
-- Name: researcher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.researcher (
    researcher_id bigint,
    researcher_name character varying(64),
    institution_name character varying(128)
);


ALTER TABLE public.researcher OWNER TO postgres;

--
-- Name: side_effect; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.side_effect (
    side_effect_id bigint,
    side_effect_name character varying(64)
);


ALTER TABLE public.side_effect OWNER TO postgres;

--
-- Name: treats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treats (
    drug_name character varying(256),
    disease_name character varying(256)
);


ALTER TABLE public.treats OWNER TO postgres;

--
-- Name: trial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trial (
    trial_id bigint,
    title character varying(256),
    start_date date,
    completion_date date,
    participants integer,
    status character varying(30),
    institution_name character varying(128),
    main_researcher_id bigint
);


ALTER TABLE public.trial OWNER TO postgres;

--
-- Name: trial_drug_disease; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trial_drug_disease (
    trial_id bigint,
    drug_name character varying(256),
    disease_name character varying(256)
);


ALTER TABLE public.trial_drug_disease OWNER TO postgres;

--
-- Name: trial_researchers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trial_researchers (
    trial_id bigint,
    researcher_id bigint
);


ALTER TABLE public.trial_researchers OWNER TO postgres;

--
-- Data for Name: condition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.condition (condition_id, condition_name) FROM stdin;
1	Atherosclerosis
2	Brain Death
3	Carcinoma, Non-small-cell Lung
4	Graft Versus Host Disease
5	Head and Neck Neoplasms
6	Influenza in Humans
7	Insulin Resistance
8	Insulin Resistant
9	Laryngeal Neoplasms
10	Melanoma
11	Mouth Neoplasms
12	Myocardial Infarction
13	Necrotizing Enterocolitis
14	Non-melanoma Skin Cancer
15	Pharyngeal Neoplasms
16	Phimosis
17	Pneumonia, Viral
18	Pre Diabetes
19	Psoriasis
20	Schizophrenia
\.


--
-- Data for Name: disease; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disease (disease_name, disease_category_id) FROM stdin;
IgG receptor I, phagocytic, familial deficiency of	7
Atherosclerosis, susceptibility to	2
Lupus nephritis, susceptibility to	4
Nonsmall cell lung cancer	1
Cortisol resistance	5
Glanzmann thrombasthenia	6
C1s deficiency, isolated	7
Dementia, vascular, susceptibility to	8
Plasminogen Tochigi disease	6
Malaria, cerebral, susceptibility to	7
Lymphoma, progression of	1
C1q deficiency, type B	7
Migraine	8
Neutropenia, alloimmune neonatal	6
Sepsis	7
Malaria, resistance to, 248310	7
Septic shock, susceptibility to	7
Interleukin-2 receptor, alpha chain, deficiency of	7
Viral infections, recurrent	7
Conjunctivitis, ligneous	10
Asthma, dimished response to antileukotriene treatment in, 600807	11
Lupus erythematosus	3
Plasminogen deficiency	6
Combined immunodeficiency	7
Obesity	9
Obesity, adrenal insufficiency, and red hair	9
Conjunctivitis, ligneous, 217090	10
Lymphoma	1
Asthma	11
Myocardial infarction, susceptibility to	2
Alzheimer disease	8
Dementia	8
Myocardial infarction	2
Alzheimer disease, late-onset, susceptibility to, 104300	8
Epilepsy, juvenile myoclonic, 606904	8
Complementary component deficiency	7
Neutropenia	6
Combined immunodeficiency, X-linked, moderate, 312863	7
Migraine without aura, susceptibility to, 157300	8
Severe combined immunodeficiency, X-linked, 300400	7
Atherosclerosis	2
Adenocarcinoma	1
Epilepsy	8
C1q deficiency, type A	7
Adenocarcinoma of lung, response to tyrosine kinase inhibitor in, 211980	1
Nonsmall cell lung cancer, response to tyrosine kinase inhibitor in, 211980	1
Glanzmann thrombasthenia, type B	6
Viral infection	7
Asthma, susceptibility to, 600807	11
Severe combined immunodeficiency	7
Malaria	7
\.


--
-- Data for Name: disease_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disease_category (disease_category_id, disease_category_name) FROM stdin;
1	Cancer
2	Cardiovascular
3	Connective%5Ftissue%5Fdisorder
4	Connective_tissue_disorder
5	Endocrine
6	Hematological
7	Immunological
8	Neurological
9	Nutritional
10	Ophthamological
11	Respiratory
\.


--
-- Data for Name: drug; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drug (drug_name) FROM stdin;
urokinase
denileukin diftitox
midodrine
abciximab
etanercept
hydrocortisone
cetuximab
butabarbital
salsalate
\.


--
-- Data for Name: drug_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drug_category (drug_category_id, drug_category_name) FROM stdin;
1	Antineoplastic agents
2	Antirheumatic agents
3	Immunomodulatory agents
4	Thrombolytic agents
\.


--
-- Data for Name: drug_in_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drug_in_category (drug_name, drug_category_id) FROM stdin;
cetuximab	1
denileukin diftitox	1
etanercept	3
etanercept	2
urokinase	4
\.


--
-- Data for Name: drug_interaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drug_interaction (drug_name_a, drug_name_b) FROM stdin;
midodrine	hydrocortisone
hydrocortisone	midodrine
hydrocortisone	butabarbital
hydrocortisone	salsalate
butabarbital	hydrocortisone
salsalate	hydrocortisone
\.


--
-- Data for Name: institution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institution (institution_name, address, country) FROM stdin;
University of Michigan Cancer Center	University of Michigan Cancer Center	United States
University of Alabama at Birmingham	UAB Dermatology	United States
University of Maryland	Baltimore VA Medical Center	United States
Chelsea and Westminster NHS Foundation Trust	Chelsea and Westminster Hospital	United Kingdom
Brigham and Women's Hospital	Brigham and Women's Hospital	United States
Stanford University	Stanford University School of Medicine	United States
NorthShore University HealthSystem Research Institute	University of Chicago Comer Childrens Hospital	United States
Azienda USL 4 Prato	Radiotherapy Dept., Arezzo Hospital	Italy
Medical University of Vienna	University Hospital, Internal Medicine	Austria
University of Versailles	Raymond Poincaré hospital	France
Kuopio University Hospital	Kuopio University Hospital	Finland
University of Pisa	Cardiothoracic Department, Ospedale Cisanello	Italy
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_name, company_name) FROM stdin;
PANDEL	PharmaDerm a division of Fougera Pharmaceuticals Inc.
Cortisone	CVS Pharmacy
SOLU-CORTEF	Cardinal Health
rexall hydrocortisone	Dolgencorp, LLC
Health Mart Pharmacy Hydrocortisone	Health Mart
Acetasol HC	Actavis Mid Atlantic LLC
care one hydrocortisone	American Sales Company
Oto End 10	Larken Laboratories, Inc.
sunmark	McKesson
Scalpicin Maximum Strength	Reckitt Benckiser LLC
Cortizone 10 Poison Ivy Relief Pads	Chattem, Inc.
Neomycin, Polymyxin B Sulfates and Hydrocortisone	Physicians Total Care, Inc.
Neomycin and Polymyxin B Sulfates and Bacitracin Zinc with Hydrocortisone Acetate	Physicians Total Care, Inc.
1 hydrocortisone	American Sales Company
anti itch	Rite Aid Corporation
NEO-POLYCIN HC	Fera Pharmaceuticals
Hydrocortisone Maximum Strength with Aloe	Stephen L. LaFrance Pharmacy, Inc.
hydrocortisone acetate pramoxine HCl	Perrigo New York Inc
Dermazene	Stratus Pharamceuticals, Inc
Proactiv Solution Anti-Itch Scalp	Guthy-Renker LLC.
Butisol Sodium	Meda Pharmaceuticals Inc.
MiCort-HC	Ferndale Laboratories, Inc.
ANUCORT-HC	Preferred Pharmaceuticals, Inc
CIPRO	Alcon Laboratories, Inc.
Cortizone 10 Intensive Healing for Eczema	Chattem, Inc.
Cicatricure	Genoma Lab USA Inc
Bioelements	Bioelements, Inc.
Hydrocortisone Plus	Walgreens
hydrocortisone acetate pramoxine hcl	Acella Pharmaceuticals, LLC
LOCOID LIPOCREAM	Ferndale Laboratories
Westcort	Ranbaxy Laboratories Inc.
Cortomycin	Major Pharmaceuticals
Western Family	Western Family Foods Inc
PROCORT	Womens Choice Pharmaceuticals LLC
Dermaquest Skin Therapy Post-Skin Resurfacing Balm	Allure Labs, Inc.
Hytone	Dermik Laboratories
Maximum Strength Hydrocortisone	DLC Laboratories, Inc
Cortizone 10 Cooling Relief	Chattem, Inc.
hydrocortisone	H E B
Pramoxine-HC	Ascend Laboratories, LLC
Cortizone 10 Hydratensive Healing Anti Itch	Chattem, Inc.
PREPARATION H HYDROCORTISONE	Pfizer Consumer Healthcare
Poli-A	Sato Pharmaceutical Co., Ltd.
ZyPram	Vertical Pharmaceuticals, Inc
Premier Value	Chain Drug Consortium
FIRST Dukes Mouthwash Compounding	CutisPharma, Inc.
equate hydrocortisone	Wal-Mart Stores Inc
Analpram E	Ferndale Laboratories, Inc.
Vagisil Satin	Combe Incorporated
DG Health Hydrocortisone	Dolgencorp, LLC
kirkland signature hydrocortisone plus	Costco Wholesale Company
Maximum-H	New GPC, Inc.
Up and Up anti itch	Target Corporation
Kinlytic	ImaRx Therapeutics, Inc.
Piyanping antiitch	Guangdong Zhanjiang Jimin Pharmaceutical Company, Ltd.
POISON OAK	DeMartini Spring Hill Pharmacy, Inc.
Medi-Cortisone	Medicine Shoppe International Inc
MyOxin	GM  Pharamceuticals, Inc
Xerese	Valeant Pharmaceuticals North America LLC
Analpram HC	Ferndale Laboratories, Inc.
LEADER HYDROCORTISONE	CARDINAL HEALTH
rexall anti itch	Dolgencorp, LLC
ENBREL	Immunex Corporation
Texacort	Mission Pharmacal Company
Procto-Pak	Rising Pharmaceuticals, Inc.
FixMySkin Healing Balm Fragrance-Free	Lovely Skin, Inc.
Dr. Sheffield Hydrocortisone Anti itch	Faria  LLC dba Sheffield Pharmaceuticals
Equate Hydrocortisone	Wal-Mart Stores Inc
Pandel	PharmaDerm, A division of Nycomed US Inc.
Alcortin A	Primus Pharmaceuticals
FixMySkin Healing Balm Vanilla Fragrance	Lovely Skin, Inc
SALSALATE	Libertas Pharma, Inc.
Up and Up anti itch ointment	Target Corporation
SAFEWAY	Safeway Inc.
MIDODRINE HYDROCHLORIDE	AvPAK
Lidocaine HCl  - Hydrocortisone Acetate	PureTek Corporation
Dermasorb HC Complete Kit	Crown Laboratories
Medi-First	Medique Products
Cortisone Maximum Strength	CVS Pharmacy
Hydrocortisone anti-itch plus	Wal-Mart Stores, Inc.
Lidocaine HCl and Hydrocortisone Acetate	E. Fougera & Co. A division of Nycomed US Inc.
FACE VALUES HYDROCORTISONE WITH ALOE	HARMON STORES INC.
HYDROCORTISONE	Lineage Therapeutics Inc
Cortef	Pharmacia and Upjohn Company
KAISER PERMANENTE	Kaiser Foundation Hospitals
FAMILY CARE HYDROCORTISONE	UNITED EXCHANGE CORP.
Cortaid	Johnson & Johnson Consumer Products Company, Division of Johnson & Johnson consumer Companies, Inc.
Fulton Street Market Anti itch	Access Business Group LLC
Atopalm Maximum Strength Anti-Itch	NeoPharm Co., Ltd.
Neosporin Essentials Trial Pack	Johnson & Johnson Consumer Products company, Division of Johnson & Johnson Consumer Companies, Inc.
REOPRO	Eli Lilly and Company
Neosporin Eczema Essentials	Johnson & Johnson  Consumer Products Company, Division of Johnson & Johnson Consumer Companies, Inc.
CAREALL Hydrocortisone	New World Imports, Inc
Quadrydern	Productos Zapotol Corp
ShopRite Hydrocortisone	Wakefern Food Corporation
NU-DERM Tolereen	OMP, Inc.
Gadaderm Hydrocortisone	Gadal Laboratories Inc
H-Releve Anti-Itch	Pure Source Inc.
Cortizone 10 Easy Relief	Chattem, Inc.
bioCorneum HC Advanced Scar Supervision Anti-Itch	Enaltus Inc
Ontak	Eisai Inc.
rexall hydrocortisone 1	Dolgencorp, LLC
LEADER HYDROCORTISONE WITH ALOE	CARDINAL HEALTH
Scarguard MD	Scarguard Labs, LLC
CVS Pharmacy Anti-itch	CVS
Duane Reade	Duane Reade
Hydrocortisone Acetate and Pramoxine Hydrochloride	Acella Pharmaceuticals, LLC
Dermasorb AF Complete Kit	Crown Laboratories
TopCare	Topco Associates LLC
Colocort	Paddock Laboratories, Inc.
Hydrocortisone Valerate	Rebel Distributors Corp
Antibiotic Ear (Neo/Polym/HC)	Physicians Total Care, Inc.
Carmol HC	PharmaDerm, A division of Fougera Pharmaceuticals Inc.
Proctocream	Alaven Pharmaceutical LLC
Cortizone 10 Hydratensive Soothing Anti Itch	Chattem, Inc.
Lidocaine Hydrochloride and Hydrocortisone Acetate	Seton Pharmaceuticals
Apres Peel Soothing Balm	CoValence, Inc.
Midodrine Hydrochloride	Mylan Pharmaceuticals Inc.
Cortifoam	Schwarz Pharma
Proctozone	Physicians Total Care, Inc.
hydrocortisone 1	CVS Pharmacy
Caldecort	Insight Pharmaceuticals
NEOMYCIN and POLYMYXIN B SULFATES and HYDROCORTISONE	STAT Rx USA LLC
equaline anti itch	Supervalu Inc
Locoid Lipocream	Triax Pharmaceuticals, LLC
Oticin HC	Teral, Inc.
Cortisporin	Physicians Total Care, Inc.
CVS	CVS Pharmacy
ATOPALM Moisturizing Hydrocortisone	NeoPharm Co., Ltd.
Hydrocortisone	Preferred Pharmaceuticals, Inc
Salsalate	A-S Medication Solutions LLC
HydroSkin	Rugby Laboratories
Scalpicin	Reckitt Benckiser LLC
Scalpicin Scalp Itch Medication Maximum Strength	Combe Incorporated
Formu Care Anti Itch	Access Business Group LLC
Hydrocortisone Regular Strength	Walgreen Company
FixMySkin Healing Balm Unflavored	Lovely Skin, Inc.
Locoid	Onset Dermatologics LLC
Family Wellness Maximum Strength Hydrocortisone	Family Dollar
procure	TWIN MED, LLC
Genuine Hydrocortisone	Genuine First Aid, LLC
DermaCort	Melaleuca, Inc.
Pediaderm HC	Arbor Pharmaceuticals, Inc.
up and up anti itch	Target Corporation
Anti Itch	Rite Aid Corporation
Hydrocortisone Butyrate Cream (lipid) 0.1%	Metacon Labs
Hydrocortisone and Acetic Acid	Taro Pharmaceuticals U.S.A., Inc.
Terra-Cortril	Roerig
meijer	Meijer Distribution Inc
Scarguard MD Physicians Formula	Scarguard Labs, LLC
Natureplex Hydrocortisone	Natureplex, LLC
Live Better	The Great Atlantic & Pacific Tea Company
Cipro HC	Stat Rx USA
Pramosone E	Ferndale Laboratories, Inc.
Cortisporin-TC	JHP Pharmaceuticals LLC
Rite Aid	Rite Aid Corporation
Soothe	Rodan & Fields, LLC.
good sense anti itch	L. Perrigo Company
Alacort	Crown Laboratories
U-Cort	Taro Pharmaceuticals U.S.A., Inc.
Neomycin and Polymyxin B Sulfates and Hydrocortisone	A-S Medication Solutions LLC
Berkley and Jensen Hydrocortisone	BJWC
Aveeno Hydrocortisone Anti Itch	Johnson & Johnson  Consumer Products Company, Division of Johnson & Johnson Consumer Companies, Inc.
hydrocortisone Iodoquinol	Perrigo New York Inc
Anusol	Salix Pharmaceuticals, Inc
Anti-itch	Medline Industries, Inc.
Neomycin and Polymyxin B Sulfates, Bacitracin Zinc and Hydrocortisone	Bausch & Lomb Incorporated
Solu-Cortef	Cardinal Health
Hydrocortisone Acetate	Paddock Laboratories, LLC
Pramosone	Ferndale Laboratories, Inc.
Lidocaine HCl - Hydrocortisone Acetate	PureTek Corporation
Thera	Zhejiang Jingwei Pharmaceutical Co., Ltd.
Advanced Hydrocortisone	Ultra Seal Corporation
FIRST Marys Mouthwash Compounding	CutisPharma, Inc.
CORTISPORIN	Pfizer Laboratories Div Pfizer Inc
smart sense anti itch	Kmart Corporation
DG Health Hydrocortisone Cream	Dolgencorp Inc
Ala Scalp	Crown Laboratories
Maximum Strength Cortizone 10 Quick Shot 360 Continuous	Chattem, Inc.
Glytone soothe calming	Genesis Pharmaceuticals
Dermarest	Insight Pharmaceuticals
NEO-POLY-BAC HYDRO	Butler Animal Health Supply
GRx HiCort	GERITREX CORP
Rodan and Fields	Cosmetic Enterprises Ltd.
CORTEF	Pharmacia and Upjohn Company
Procto-Kit	Ranbaxy Laboratories Inc
Hydrocortisone Butyrate	Glenmark Generics Inc.,USA
Up and Up Anti Itch	Target Corporation
Quality Choice	Chain Drug Marketing Association
Trioxin	Vertical Pharmaceuticals, Inc
Epifoam	Alaven Pharmaceutical LLC
Hydrocortisone Maximum Strength Plus 12 Moisturizers	The Kroger Company
Care One hydrocortisone	American Sales Company
PRAMCORT	Rochester Pharmaceuticals
Good Neighbor Pharmacy	AmerisourceBergen
Good Sense Anti Itch	L Perrigo Company
proctofoam HC	Schwarz Pharma
HYDROCORTISONE ACETATE	Galentic Pharma (India) Private Limited
Hydro Skin	Rugby Laboratories
Anti itch	Rite Aid Corporation
Neomycin and Polymyxin B Sulfates, Bacitracin Zinc, and Hydrocortisone	Akorn, Inc.
Alcortin	Primus Pharmaceuticals
good neighbor pharmacy anti itch	Amerisource Bergen
NuCort	Gentex Pharma
MedPride	Shield Line LLC
ERBITUX	ImClone LLC
cortisone	CVS Pharmacy
Midodrine HCl	Rebel Distributors Corp
Family Wellness	Zhejiang Jingwei Pharmaceutical Co., Ltd.
members mark hydrocortisone	Sam's West Inc
Hydrocortisone with Aloe	Actavis Mid Atlantic LLC
Proctofoam	Alaven Pharmaceutical LLC
A-HYDROCORT	Hospira, Inc.
Our Family	Nash-Finch Company
SHOPKO HYDROCORTISONE	UNITED EXCHANGE CORP.
ProAmatine	Shire US Manufacturing Inc.
Coly-Mycin S	JHP Pharmaceuticals LLC
NEOMYCIN AND POLYMYXIN B SULFATES AND HYDROCORTISONE	STAT RX USA LLC
KERA HC Hydrocortisone	Clinical Therapeutic Solutions
Cortenema	ANIP Acquisition Company
Cortisone Cream	Tai Guk Pharmaceutical Company, Limited
Cipro	Physicians Total Care, Inc.
Walgreens	Walgreen Company
Vytone	Artesa Labs, LLC
CortiSil MDX	BioZone Laboratories,Inc.
Immediate Comfort	Bioelements, Inc.
BudPak Anti-Itch	Budpak Inc.
FixMySkin Healing Balm Vanilla Flavor	Lovely Skin, Inc.
Cortisone Maximum Strength with Aloe	CVS Pharmacy
CVS HYDROCORTISONE WITH ALOE	CVS PHARMACY
SHOPKO HYDROCORTISONE WITH ALOE	UNITED EXCHANGE CORP
Proctocort	Salix Pharmaceuticals, Inc
Smart Sense Hydrocortisone	Kmart Corporation
Refuge HC	CoValence Inc.
Acella Hydrocortisone Acetate - Pramoxine Singles	Acella Pharmaceuticals, LLC
Family Wellness Hydrocortisone	Family Dollar Services Inc
HydroCortisone	Western Family Foods Inc
Triple Antibiotic HC	Phoenix Pharmaceutical, Inc.
healthy accents cortisone	DZA Brands LLC
Publix	Publix Super Markets Inc
VANOXIDE	Summers Laboratories Inc
Hydrocortisone Maximum Strength	Walgreen Company
Healerz for Itches	Wellco Brands LLC
Analpram Advanced	Ferndale Laboratories, Inc.
Anusol HC	Salix Pharmaceuticals, Inc
Hydrocortisone Acetate Pramoxine Hcl	Perrigo New York Inc
BIO-CORNEUM HC Advanced Scar Supervision Anti-Itch	Advanced Bio-Technologies, Inc
KELO-COTE HC Anti-Itch Scar Treatment	Advanced Bio-Technologies, Inc
\.


--
-- Data for Name: product_drug_relation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_drug_relation (product_name, drug_name) FROM stdin;
PANDEL	hydrocortisone
Cortisone	hydrocortisone
SOLU-CORTEF	hydrocortisone
rexall hydrocortisone	hydrocortisone
Health Mart Pharmacy Hydrocortisone	hydrocortisone
Acetasol HC	hydrocortisone
care one hydrocortisone	hydrocortisone
Oto End 10	hydrocortisone
sunmark	hydrocortisone
Scalpicin Maximum Strength	hydrocortisone
Cortizone 10 Poison Ivy Relief Pads	hydrocortisone
Neomycin, Polymyxin B Sulfates and Hydrocortisone	hydrocortisone
Neomycin and Polymyxin B Sulfates and Bacitracin Zinc with Hydrocortisone Acetate	hydrocortisone
1 hydrocortisone	hydrocortisone
anti itch	hydrocortisone
NEO-POLYCIN HC	hydrocortisone
Hydrocortisone Maximum Strength with Aloe	hydrocortisone
hydrocortisone acetate pramoxine HCl	hydrocortisone
Dermazene	hydrocortisone
Proactiv Solution Anti-Itch Scalp	hydrocortisone
Butisol Sodium	butabarbital
MiCort-HC	hydrocortisone
ANUCORT-HC	hydrocortisone
CIPRO	hydrocortisone
Cortizone 10 Intensive Healing for Eczema	hydrocortisone
Cicatricure	hydrocortisone
Bioelements	hydrocortisone
Hydrocortisone Plus	hydrocortisone
hydrocortisone acetate pramoxine hcl	hydrocortisone
LOCOID LIPOCREAM	hydrocortisone
Westcort	hydrocortisone
Cortomycin	hydrocortisone
Western Family	hydrocortisone
PROCORT	hydrocortisone
Dermaquest Skin Therapy Post-Skin Resurfacing Balm	hydrocortisone
Hytone	hydrocortisone
Maximum Strength Hydrocortisone	hydrocortisone
Cortizone 10 Cooling Relief	hydrocortisone
hydrocortisone	hydrocortisone
Pramoxine-HC	hydrocortisone
Cortizone 10 Hydratensive Healing Anti Itch	hydrocortisone
PREPARATION H HYDROCORTISONE	hydrocortisone
Poli-A	hydrocortisone
ZyPram	hydrocortisone
Premier Value	hydrocortisone
FIRST Dukes Mouthwash Compounding	hydrocortisone
equate hydrocortisone	hydrocortisone
Analpram E	hydrocortisone
Vagisil Satin	hydrocortisone
DG Health Hydrocortisone	hydrocortisone
kirkland signature hydrocortisone plus	hydrocortisone
Maximum-H	hydrocortisone
Up and Up anti itch	hydrocortisone
Kinlytic	urokinase
Piyanping antiitch	hydrocortisone
POISON OAK	hydrocortisone
Medi-Cortisone	hydrocortisone
MyOxin	hydrocortisone
Xerese	hydrocortisone
Analpram HC	hydrocortisone
LEADER HYDROCORTISONE	hydrocortisone
rexall anti itch	hydrocortisone
ENBREL	etanercept
Texacort	hydrocortisone
Procto-Pak	hydrocortisone
FixMySkin Healing Balm Fragrance-Free	hydrocortisone
Dr. Sheffield Hydrocortisone Anti itch	hydrocortisone
Equate Hydrocortisone	hydrocortisone
Pandel	hydrocortisone
Alcortin A	hydrocortisone
FixMySkin Healing Balm Vanilla Fragrance	hydrocortisone
SALSALATE	salsalate
Up and Up anti itch ointment	hydrocortisone
SAFEWAY	hydrocortisone
MIDODRINE HYDROCHLORIDE	midodrine
Lidocaine HCl  - Hydrocortisone Acetate	hydrocortisone
Dermasorb HC Complete Kit	hydrocortisone
Medi-First	hydrocortisone
Cortisone Maximum Strength	hydrocortisone
Hydrocortisone anti-itch plus	hydrocortisone
Lidocaine HCl and Hydrocortisone Acetate	hydrocortisone
FACE VALUES HYDROCORTISONE WITH ALOE	hydrocortisone
HYDROCORTISONE	hydrocortisone
Cortef	hydrocortisone
KAISER PERMANENTE	hydrocortisone
FAMILY CARE HYDROCORTISONE	hydrocortisone
Cortaid	hydrocortisone
Fulton Street Market Anti itch	hydrocortisone
Atopalm Maximum Strength Anti-Itch	hydrocortisone
Neosporin Essentials Trial Pack	hydrocortisone
REOPRO	abciximab
Neosporin Eczema Essentials	hydrocortisone
CAREALL Hydrocortisone	hydrocortisone
Quadrydern	hydrocortisone
ShopRite Hydrocortisone	hydrocortisone
NU-DERM Tolereen	hydrocortisone
Gadaderm Hydrocortisone	hydrocortisone
H-Releve Anti-Itch	hydrocortisone
Cortizone 10 Easy Relief	hydrocortisone
bioCorneum HC Advanced Scar Supervision Anti-Itch	hydrocortisone
Ontak	denileukin diftitox
rexall hydrocortisone 1	hydrocortisone
LEADER HYDROCORTISONE WITH ALOE	hydrocortisone
Scarguard MD	hydrocortisone
CVS Pharmacy Anti-itch	hydrocortisone
Duane Reade	hydrocortisone
Hydrocortisone Acetate and Pramoxine Hydrochloride	hydrocortisone
Dermasorb AF Complete Kit	hydrocortisone
TopCare	hydrocortisone
Colocort	hydrocortisone
Hydrocortisone Valerate	hydrocortisone
Antibiotic Ear (Neo/Polym/HC)	hydrocortisone
Carmol HC	hydrocortisone
Proctocream	hydrocortisone
Cortizone 10 Hydratensive Soothing Anti Itch	hydrocortisone
Lidocaine Hydrochloride and Hydrocortisone Acetate	hydrocortisone
Apres Peel Soothing Balm	hydrocortisone
Midodrine Hydrochloride	midodrine
Cortifoam	hydrocortisone
Proctozone	hydrocortisone
hydrocortisone 1	hydrocortisone
Caldecort	hydrocortisone
NEOMYCIN and POLYMYXIN B SULFATES and HYDROCORTISONE	hydrocortisone
equaline anti itch	hydrocortisone
Locoid Lipocream	hydrocortisone
Oticin HC	hydrocortisone
Cortisporin	hydrocortisone
CVS	hydrocortisone
ATOPALM Moisturizing Hydrocortisone	hydrocortisone
Hydrocortisone	hydrocortisone
Salsalate	salsalate
HydroSkin	hydrocortisone
Scalpicin	hydrocortisone
Scalpicin Scalp Itch Medication Maximum Strength	hydrocortisone
Formu Care Anti Itch	hydrocortisone
Hydrocortisone Regular Strength	hydrocortisone
FixMySkin Healing Balm Unflavored	hydrocortisone
Locoid	hydrocortisone
Family Wellness Maximum Strength Hydrocortisone	hydrocortisone
procure	hydrocortisone
Genuine Hydrocortisone	hydrocortisone
DermaCort	hydrocortisone
Pediaderm HC	hydrocortisone
up and up anti itch	hydrocortisone
Anti Itch	hydrocortisone
Hydrocortisone Butyrate Cream (lipid) 0.1%	hydrocortisone
Hydrocortisone and Acetic Acid	hydrocortisone
Terra-Cortril	hydrocortisone
meijer	hydrocortisone
Scarguard MD Physicians Formula	hydrocortisone
Natureplex Hydrocortisone	hydrocortisone
Live Better	hydrocortisone
Cipro HC	hydrocortisone
Pramosone E	hydrocortisone
Cortisporin-TC	hydrocortisone
Rite Aid	hydrocortisone
Soothe	hydrocortisone
good sense anti itch	hydrocortisone
Alacort	hydrocortisone
U-Cort	hydrocortisone
Neomycin and Polymyxin B Sulfates and Hydrocortisone	hydrocortisone
Berkley and Jensen Hydrocortisone	hydrocortisone
Aveeno Hydrocortisone Anti Itch	hydrocortisone
hydrocortisone Iodoquinol	hydrocortisone
Anusol	hydrocortisone
Anti-itch	hydrocortisone
Neomycin and Polymyxin B Sulfates, Bacitracin Zinc and Hydrocortisone	hydrocortisone
Solu-Cortef	hydrocortisone
Hydrocortisone Acetate	hydrocortisone
Pramosone	hydrocortisone
Lidocaine HCl - Hydrocortisone Acetate	hydrocortisone
Thera	hydrocortisone
Advanced Hydrocortisone	hydrocortisone
FIRST Marys Mouthwash Compounding	hydrocortisone
CORTISPORIN	hydrocortisone
smart sense anti itch	hydrocortisone
DG Health Hydrocortisone Cream	hydrocortisone
Ala Scalp	hydrocortisone
Maximum Strength Cortizone 10 Quick Shot 360 Continuous	hydrocortisone
Glytone soothe calming	hydrocortisone
Dermarest	hydrocortisone
NEO-POLY-BAC HYDRO	hydrocortisone
GRx HiCort	hydrocortisone
Rodan and Fields	hydrocortisone
CORTEF	hydrocortisone
Procto-Kit	hydrocortisone
Hydrocortisone Butyrate	hydrocortisone
Up and Up Anti Itch	hydrocortisone
Quality Choice	hydrocortisone
Trioxin	hydrocortisone
Epifoam	hydrocortisone
Hydrocortisone Maximum Strength Plus 12 Moisturizers	hydrocortisone
Care One hydrocortisone	hydrocortisone
PRAMCORT	hydrocortisone
Good Neighbor Pharmacy	hydrocortisone
Good Sense Anti Itch	hydrocortisone
proctofoam HC	hydrocortisone
HYDROCORTISONE ACETATE	hydrocortisone
Hydro Skin	hydrocortisone
Anti itch	hydrocortisone
Neomycin and Polymyxin B Sulfates, Bacitracin Zinc, and Hydrocortisone	hydrocortisone
Alcortin	hydrocortisone
good neighbor pharmacy anti itch	hydrocortisone
NuCort	hydrocortisone
MedPride	hydrocortisone
ERBITUX	cetuximab
cortisone	hydrocortisone
Midodrine HCl	midodrine
Family Wellness	hydrocortisone
members mark hydrocortisone	hydrocortisone
Hydrocortisone with Aloe	hydrocortisone
Proctofoam	hydrocortisone
A-HYDROCORT	hydrocortisone
Our Family	hydrocortisone
SHOPKO HYDROCORTISONE	hydrocortisone
ProAmatine	midodrine
Coly-Mycin S	hydrocortisone
NEOMYCIN AND POLYMYXIN B SULFATES AND HYDROCORTISONE	hydrocortisone
KERA HC Hydrocortisone	hydrocortisone
Cortenema	hydrocortisone
Cortisone Cream	hydrocortisone
Cipro	hydrocortisone
Walgreens	hydrocortisone
Vytone	hydrocortisone
CortiSil MDX	hydrocortisone
Immediate Comfort	hydrocortisone
BudPak Anti-Itch	hydrocortisone
FixMySkin Healing Balm Vanilla Flavor	hydrocortisone
Cortisone Maximum Strength with Aloe	hydrocortisone
CVS HYDROCORTISONE WITH ALOE	hydrocortisone
SHOPKO HYDROCORTISONE WITH ALOE	hydrocortisone
Proctocort	hydrocortisone
Smart Sense Hydrocortisone	hydrocortisone
Refuge HC	hydrocortisone
Acella Hydrocortisone Acetate - Pramoxine Singles	hydrocortisone
Family Wellness Hydrocortisone	hydrocortisone
HydroCortisone	hydrocortisone
Triple Antibiotic HC	hydrocortisone
healthy accents cortisone	hydrocortisone
Publix	hydrocortisone
VANOXIDE	hydrocortisone
Hydrocortisone Maximum Strength	hydrocortisone
Healerz for Itches	hydrocortisone
Analpram Advanced	hydrocortisone
Anusol HC	hydrocortisone
Hydrocortisone Acetate Pramoxine Hcl	hydrocortisone
BIO-CORNEUM HC Advanced Scar Supervision Anti-Itch	hydrocortisone
KELO-COTE HC Anti-Itch Scar Treatment	hydrocortisone
\.


--
-- Data for Name: related_condition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.related_condition (trial_id, condition_id) FROM stdin;
8	1
11	2
7	3
1	4
5	5
9	6
12	7
3	8
5	9
4	10
5	11
6	12
2	13
4	14
5	15
10	16
9	17
3	18
4	19
12	20
\.


--
-- Data for Name: researcher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.researcher (researcher_id, researcher_name, institution_name) FROM stdin;
1	Anindya Niyogi	Chelsea and Westminster NHS Foundation Trust
2	Boni Elewski, MD	University of Alabama at Birmingham
3	Brandy Frost	NorthShore University HealthSystem Research Institute
4	Djillali Annane	University of Versailles
5	Gerald M Reaven	Stanford University
6	John Levine, MD	University of Michigan Cancer Center
7	Joshua A. Beckman, MD	Brigham and Women's Hospital
8	Prof. Anna Sonia Petronio	University of Pisa
9	Robert W. Buchanan, M.D.	University of Maryland
10	STEFANO M. MAGRINI, PROF	Azienda USL 4 Prato
11	Stepani Bendel	Kuopio University Hospital
12	Wolfgang Hilbe	Medical University of Vienna
\.


--
-- Data for Name: side_effect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.side_effect (side_effect_id, side_effect_name) FROM stdin;
1	abdominal abscess
2	abdominal pain
3	abnormal vision
4	abscess
5	acidosis
6	acne
7	acute renal insufficiency
8	airways obstruction
9	albuminuria
10	allergy
11	alopecia
12	anaphylactic reaction
13	anaphylactoid reactions
14	anemia
15	angioedema
16	ankylosing spondylitis
17	anorexia
18	aplastic anemia
19	appendicitis
20	arrhythmia
21	arterial thrombosis
22	artery disorder
23	arthralgia
24	arthritis
25	aseptic meningitis
26	asthenia
27	autoimmune diseases
28	back pain
29	bacteremia
30	bacterial pneumonia
31	bleeding
32	bronchitis
33	bronchospasm
34	bursitis
35	carcinoma
36	cardiac arrest
37	cellulitis
38	cerebral ischemia
39	cerebrovascular accident
40	chest pain
41	chills
42	chills and fever
43	cholecystitis
44	coagulation disorder
45	colorectal cancer
46	colorectal carcinoma
47	confusion
48	congestive heart failure
49	conjunctivitis
50	constipation
51	coronary artery disorder
52	cough
53	cough increased
54	ctcl
55	cutaneous vasculitis
56	cyanosis
57	death
58	decreased hematocrit
59	deep venous thrombosis
60	dehydration
61	diabetes
62	diarrhea
63	dizziness
64	dry mouth
65	dyspepsia
66	dysphagia
67	dyspnea
68	edema
69	embolism
70	embolus
71	erythema
72	esophagitis
73	fatigue
74	fever
75	fibrosis
76	flu
77	flushing
78	foot abscess
79	gastritis
80	gastroenteritis
81	gastrointestinal bleeding
82	gastrointestinal toxicity
83	generalized pain
84	glomerulonephropathy
85	headache
86	heart failure
87	hematuria
88	hemiplegia
89	hepatitis
90	hepatitis a
91	hoarseness
92	hydrocephalus
93	hypertension
94	hyperthyroidism
95	hypoalbuminemia
96	hypocalcemia
97	hypokalemia
98	hypotension
99	hypothyroidism
100	hypoxia
101	increased sweating
102	infarction
103	infection
104	infectious
105	injection site hemorrhage
106	injection site reaction
107	insomnia
108	interstitial lung disease
109	intestinal perforation
110	ischemia
111	itching
112	juvenile rheumatoid arthritis
113	leg ulcer
114	leukopenia
115	lung disorder
116	lupus
117	lymphadenopathy
118	lymphocytopenia
119	lymphoma
120	maculopapular rash
121	malaise
122	malignant neoplasm
123	melanoma
124	meningitis
125	metastatic colorectal cancer
126	mgn
127	microscopic hematuria
128	mouth ulcer
129	multiple sclerosis
130	myalgia
131	myocardial infarction
132	myocardial ischemia
133	nail disorder
134	nausea
135	nervousness
136	neuritis
137	neutropenia
138	nph
139	obstruction
140	optic neuritis
141	osteomyelitis
142	pain
143	pancreatitis
144	pancytopenia
145	paresthesia
146	peripheral edema
147	peripheral vascular disorder
148	personality disorder
149	pharyngitis
150	plaque
151	plaque psoriasis
152	pneumonia
153	polymyositis
154	positive ana
155	prostate
156	psoriasis
157	psoriatic arthritis
158	pulmonary edema
159	pulmonary embolism
160	pulmonary fibrosis
161	pulmonary tuberculosis
162	pustular rash
163	pyelonephritis
164	pyuria
165	rash
166	recurrent pulmonary embolism
167	redness
168	renal failure
169	renal insufficiency
170	respiratory failure
171	respiratory infection
172	respiratory system disorders
173	rheumatoid arthritis
174	rheumatoid factor positive
175	rhinitis
176	rigors
177	sarcoidosis
178	sarcoidosis skin
179	seizures
180	sepsis
181	septic arthritis
182	septic shock
183	shock
184	sinusitis
185	skin cancer
186	skin disorder
187	skin melanoma
188	skin ulcer
189	solid tumors
190	somnolence
191	spondylitis
192	stomatitis
193	stridor
194	substernal chest pain
195	superficial thrombophlebitis
196	sweating
197	swelling
198	tachycardia
199	thrombocytopenia
200	thrombophlebitis
201	thrombosis
202	thyroiditis
203	thyrotoxicosis
204	toxic epidermal necrolysis
205	tuberculosis
206	tuberculous arthritis
207	tumors
208	ulceration
209	upper respiratory tract infection
210	urinary tract infection
211	urticaria
212	varicella
213	vascular disorders
214	vasculitis
215	vasodilatation
216	venous thrombosis
217	vomiting
218	weight decreased
219	weight gain
220	wound infection
\.


--
-- Data for Name: treats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treats (drug_name, disease_name) FROM stdin;
urokinase	Alzheimer disease
urokinase	Conjunctivitis, ligneous, 217090
urokinase	Plasminogen deficiency
urokinase	Plasminogen Tochigi disease
urokinase	Conjunctivitis, ligneous
urokinase	Alzheimer disease, late-onset, susceptibility to, 104300
denileukin diftitox	Combined immunodeficiency, X-linked, moderate, 312863
denileukin diftitox	Severe combined immunodeficiency, X-linked, 300400
denileukin diftitox	Interleukin-2 receptor, alpha chain, deficiency of
denileukin diftitox	Severe combined immunodeficiency
denileukin diftitox	Combined immunodeficiency
abciximab	IgG receptor I, phagocytic, familial deficiency of
abciximab	Viral infections, recurrent
abciximab	Lymphoma
abciximab	C1s deficiency, isolated
abciximab	Lupus erythematosus
abciximab	Neutropenia, alloimmune neonatal
abciximab	Complementary component deficiency
abciximab	Neutropenia
abciximab	Lupus nephritis, susceptibility to
abciximab	Glanzmann thrombasthenia, type B
abciximab	Glanzmann thrombasthenia
abciximab	Lymphoma, progression of
abciximab	C1q deficiency, type A
abciximab	Viral infection
abciximab	C1q deficiency, type B
etanercept	Dementia, vascular, susceptibility to
etanercept	Malaria
etanercept	Sepsis
etanercept	Septic shock, susceptibility to
etanercept	Asthma
etanercept	Myocardial infarction, susceptibility to
etanercept	Lupus nephritis, susceptibility to
etanercept	Migraine without aura, susceptibility to, 157300
etanercept	Asthma, susceptibility to, 600807
etanercept	Migraine
etanercept	C1q deficiency, type A
etanercept	Viral infection
etanercept	IgG receptor I, phagocytic, familial deficiency of
etanercept	Dementia
etanercept	Viral infections, recurrent
etanercept	Lymphoma
etanercept	C1s deficiency, isolated
etanercept	Malaria, cerebral, susceptibility to
etanercept	Lupus erythematosus
etanercept	Myocardial infarction
etanercept	Neutropenia, alloimmune neonatal
etanercept	Complementary component deficiency
etanercept	Neutropenia
etanercept	Lymphoma, progression of
etanercept	C1q deficiency, type B
hydrocortisone	Obesity
hydrocortisone	Atherosclerosis
hydrocortisone	Malaria
hydrocortisone	Asthma, dimished response to antileukotriene treatment in, 600807
hydrocortisone	Atherosclerosis, susceptibility to
hydrocortisone	Obesity, adrenal insufficiency, and red hair
hydrocortisone	Cortisol resistance
hydrocortisone	Malaria, resistance to, 248310
hydrocortisone	Asthma
cetuximab	IgG receptor I, phagocytic, familial deficiency of
cetuximab	Viral infections, recurrent
cetuximab	Lymphoma
cetuximab	C1s deficiency, isolated
cetuximab	Nonsmall cell lung cancer, response to tyrosine kinase inhibitor in, 211980
cetuximab	Lupus erythematosus
cetuximab	Adenocarcinoma
cetuximab	Neutropenia, alloimmune neonatal
cetuximab	Complementary component deficiency
cetuximab	Neutropenia
cetuximab	Nonsmall cell lung cancer
cetuximab	Lupus nephritis, susceptibility to
cetuximab	Adenocarcinoma of lung, response to tyrosine kinase inhibitor in, 211980
cetuximab	Lymphoma, progression of
cetuximab	C1q deficiency, type A
cetuximab	Viral infection
cetuximab	C1q deficiency, type B
butabarbital	Epilepsy
butabarbital	Epilepsy, juvenile myoclonic, 606904
\.


--
-- Data for Name: trial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trial (trial_id, title, start_date, completion_date, participants, status, institution_name, main_researcher_id) FROM stdin;
1	Addition of Etanercept and Extracorporeal Photopheresis (ECP) to Standard Graft-Versus-Host Disease (GVHD) Prophylaxis in Stem Cell Transplant	2009-03-01	2015-09-01	48	Active, not recruiting	University of Michigan Cancer Center	6
2	Anti-inflammatory Treatment at the Onset of Necrotizing Enterocolitis (NEC) in Preterm Infants	2009-09-01	2012-11-01	2	Terminated	NorthShore University HealthSystem Research Institute	3
3	Beneficial Effect of Salicylates: Insulin Action, Secretion or Clearance?	2010-07-01	2013-11-01	41	Completed	Stanford University	5
4	Can We Miss Pigmented Lesions in Psoriasis Patients?	2007-09-01	2012-04-01	6	Completed	University of Alabama at Birmingham	2
5	Cetuximab Plus Radiotherapy Versus Cisplatin Plus Radiotherapy in Locally Advanced Head and Neck Cancer	2010-10-01	2019-12-01	70	Terminated	Azienda USL 4 Prato	10
6	Efficacy Study on Early Versus Late Abciximab Administration During Primary Coronary Angioplasty	2006-04-01	2008-12-01	110	Completed	University of Pisa	8
7	Immune Response on Neoadjuvant Therapy in Non-small-cell Lung Cancer (NSCLC)	2007-01-01	2011-06-01	41	Completed	Medical University of Vienna	12
8	Inflammation and Vascular Function in Atherosclerosis	2005-08-01	2011-02-01	44	Completed	Brigham and Women's Hospital	7
9	Low Doses Corticosteroids as Adjuvant Therapy for the Treatment of Severe H1N1 Flu	2010-03-01	2011-12-01	40	Terminated	University of Versailles	4
10	Mild Versus Potent Corticosteroids as Treatment for Phimosis in Children	2009-08-01	2009-09-01	0	Withdrawn	Chelsea and Westminster NHS Foundation Trust	1
11	Organ Donation and Hydrocortisone Treatment	2008-05-01	2011-12-01	38	Terminated	Kuopio University Hospital	11
12	Salsalate for Insulin Resistance in Schizophrenia	2010-08-01	2011-12-01	13	Completed	University of Maryland	9
\.


--
-- Data for Name: trial_drug_disease; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trial_drug_disease (trial_id, drug_name, disease_name) FROM stdin;
1	etanercept	C1q deficiency, type B
1	etanercept	Lymphoma, progression of
1	etanercept	Neutropenia
1	etanercept	Complementary component deficiency
1	etanercept	Neutropenia, alloimmune neonatal
1	etanercept	Myocardial infarction
1	etanercept	Lupus erythematosus
1	etanercept	Malaria, cerebral, susceptibility to
1	etanercept	C1s deficiency, isolated
1	etanercept	Lymphoma
1	etanercept	Viral infections, recurrent
1	etanercept	Dementia
1	etanercept	IgG receptor I, phagocytic, familial deficiency of
1	etanercept	Viral infection
1	etanercept	C1q deficiency, type A
1	etanercept	Migraine
1	etanercept	Asthma, susceptibility to, 600807
1	etanercept	Migraine without aura, susceptibility to, 157300
1	etanercept	Lupus nephritis, susceptibility to
1	etanercept	Myocardial infarction, susceptibility to
1	etanercept	Asthma
1	etanercept	Septic shock, susceptibility to
1	etanercept	Sepsis
1	etanercept	Malaria
1	etanercept	Dementia, vascular, susceptibility to
2	hydrocortisone	Asthma
2	hydrocortisone	Malaria, resistance to, 248310
2	hydrocortisone	Cortisol resistance
2	hydrocortisone	Obesity, adrenal insufficiency, and red hair
2	hydrocortisone	Atherosclerosis, susceptibility to
2	hydrocortisone	Asthma, dimished response to antileukotriene treatment in, 600807
2	hydrocortisone	Malaria
2	hydrocortisone	Atherosclerosis
2	hydrocortisone	Obesity
4	etanercept	C1q deficiency, type B
4	etanercept	Lymphoma, progression of
4	etanercept	Neutropenia
4	etanercept	Complementary component deficiency
4	etanercept	Neutropenia, alloimmune neonatal
4	etanercept	Myocardial infarction
4	etanercept	Lupus erythematosus
4	etanercept	Malaria, cerebral, susceptibility to
4	etanercept	C1s deficiency, isolated
4	etanercept	Lymphoma
4	etanercept	Viral infections, recurrent
4	etanercept	Dementia
4	etanercept	IgG receptor I, phagocytic, familial deficiency of
4	etanercept	Viral infection
4	etanercept	C1q deficiency, type A
4	etanercept	Migraine
4	etanercept	Asthma, susceptibility to, 600807
4	etanercept	Migraine without aura, susceptibility to, 157300
4	etanercept	Lupus nephritis, susceptibility to
4	etanercept	Myocardial infarction, susceptibility to
4	etanercept	Asthma
4	etanercept	Septic shock, susceptibility to
4	etanercept	Sepsis
4	etanercept	Malaria
4	etanercept	Dementia, vascular, susceptibility to
5	cetuximab	C1q deficiency, type B
5	cetuximab	Viral infection
5	cetuximab	C1q deficiency, type A
5	cetuximab	Lymphoma, progression of
5	cetuximab	Adenocarcinoma of lung, response to tyrosine kinase inhibitor in, 211980
5	cetuximab	Lupus nephritis, susceptibility to
5	cetuximab	Nonsmall cell lung cancer
5	cetuximab	Neutropenia
5	cetuximab	Complementary component deficiency
5	cetuximab	Neutropenia, alloimmune neonatal
5	cetuximab	Adenocarcinoma
5	cetuximab	Lupus erythematosus
5	cetuximab	Nonsmall cell lung cancer, response to tyrosine kinase inhibitor in, 211980
5	cetuximab	C1s deficiency, isolated
5	cetuximab	Lymphoma
5	cetuximab	Viral infections, recurrent
5	cetuximab	IgG receptor I, phagocytic, familial deficiency of
6	abciximab	C1q deficiency, type B
6	abciximab	Viral infection
6	abciximab	C1q deficiency, type A
6	abciximab	Lymphoma, progression of
6	abciximab	Glanzmann thrombasthenia
6	abciximab	Glanzmann thrombasthenia, type B
6	abciximab	Lupus nephritis, susceptibility to
6	abciximab	Neutropenia
6	abciximab	Complementary component deficiency
6	abciximab	Neutropenia, alloimmune neonatal
6	abciximab	Lupus erythematosus
6	abciximab	C1s deficiency, isolated
6	abciximab	Lymphoma
6	abciximab	Viral infections, recurrent
6	abciximab	IgG receptor I, phagocytic, familial deficiency of
7	cetuximab	C1q deficiency, type B
7	cetuximab	Viral infection
7	cetuximab	C1q deficiency, type A
7	cetuximab	Lymphoma, progression of
7	cetuximab	Adenocarcinoma of lung, response to tyrosine kinase inhibitor in, 211980
7	cetuximab	Lupus nephritis, susceptibility to
7	cetuximab	Nonsmall cell lung cancer
7	cetuximab	Neutropenia
7	cetuximab	Complementary component deficiency
7	cetuximab	Neutropenia, alloimmune neonatal
7	cetuximab	Adenocarcinoma
7	cetuximab	Lupus erythematosus
7	cetuximab	Nonsmall cell lung cancer, response to tyrosine kinase inhibitor in, 211980
7	cetuximab	C1s deficiency, isolated
7	cetuximab	Lymphoma
7	cetuximab	Viral infections, recurrent
7	cetuximab	IgG receptor I, phagocytic, familial deficiency of
9	hydrocortisone	Asthma
9	hydrocortisone	Malaria, resistance to, 248310
9	hydrocortisone	Cortisol resistance
9	hydrocortisone	Obesity, adrenal insufficiency, and red hair
9	hydrocortisone	Atherosclerosis, susceptibility to
9	hydrocortisone	Asthma, dimished response to antileukotriene treatment in, 600807
9	hydrocortisone	Malaria
9	hydrocortisone	Atherosclerosis
9	hydrocortisone	Obesity
10	hydrocortisone	Asthma
10	hydrocortisone	Malaria, resistance to, 248310
10	hydrocortisone	Cortisol resistance
10	hydrocortisone	Obesity, adrenal insufficiency, and red hair
10	hydrocortisone	Atherosclerosis, susceptibility to
10	hydrocortisone	Asthma, dimished response to antileukotriene treatment in, 600807
10	hydrocortisone	Malaria
10	hydrocortisone	Atherosclerosis
10	hydrocortisone	Obesity
11	hydrocortisone	Asthma
11	hydrocortisone	Malaria, resistance to, 248310
11	hydrocortisone	Cortisol resistance
11	hydrocortisone	Obesity, adrenal insufficiency, and red hair
11	hydrocortisone	Atherosclerosis, susceptibility to
11	hydrocortisone	Asthma, dimished response to antileukotriene treatment in, 600807
11	hydrocortisone	Malaria
11	hydrocortisone	Atherosclerosis
11	hydrocortisone	Obesity
\.


--
-- Data for Name: trial_researchers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trial_researchers (trial_id, researcher_id) FROM stdin;
1	6
2	3
3	5
4	2
5	10
6	8
7	12
8	7
9	4
10	1
11	11
12	9
\.


--
-- PostgreSQL database dump complete
--

