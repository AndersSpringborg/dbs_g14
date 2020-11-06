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
-- Name: clinicaltrial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clinicaltrial (
    title character varying(256) NOT NULL,
    startdate date,
    completiondate date,
    numberparticipants integer,
    status character varying(30),
    mainresearcher character varying(64),
    institution character varying(128)
);


ALTER TABLE public.clinicaltrial OWNER TO postgres;

--
-- Name: contains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contains (
    drugproduct character varying(256) NOT NULL,
    drugname character varying(256) NOT NULL
);


ALTER TABLE public.contains OWNER TO postgres;

--
-- Name: disease; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disease (
    diseasename character varying(256) NOT NULL
);


ALTER TABLE public.disease OWNER TO postgres;

--
-- Name: diseasecategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diseasecategory (
    catname character varying(64) NOT NULL
);


ALTER TABLE public.diseasecategory OWNER TO postgres;

--
-- Name: drug; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drug (
    name character varying(256) NOT NULL
);


ALTER TABLE public.drug OWNER TO postgres;

--
-- Name: drugcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drugcategory (
    catname character varying(64) NOT NULL
);


ALTER TABLE public.drugcategory OWNER TO postgres;

--
-- Name: drugtreats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drugtreats (
    drugname character varying(256) NOT NULL,
    diseasename character varying(256) NOT NULL
);


ALTER TABLE public.drugtreats OWNER TO postgres;

--
-- Name: hascategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hascategory (
    drug character varying(256) NOT NULL,
    category character varying(64) NOT NULL
);


ALTER TABLE public.hascategory OWNER TO postgres;

--
-- Name: hasdiseasecategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hasdiseasecategory (
    disease character varying(256) NOT NULL,
    diseasecategory character varying(64) NOT NULL
);


ALTER TABLE public.hasdiseasecategory OWNER TO postgres;

--
-- Name: hassideeffect; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hassideeffect (
    drugname character varying(256) NOT NULL,
    sideeffect character varying(64) NOT NULL
);


ALTER TABLE public.hassideeffect OWNER TO postgres;

--
-- Name: institution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institution (
    instname character varying(128) NOT NULL,
    address character varying(256),
    country character varying(32)
);


ALTER TABLE public.institution OWNER TO postgres;

--
-- Name: interacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interacts (
    drug1 character varying(256) NOT NULL,
    drug2 character varying(256) NOT NULL
);


ALTER TABLE public.interacts OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    productname character varying(256) NOT NULL,
    company character varying(128)
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: relatedcondition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.relatedcondition (
    cttitle character varying(256) NOT NULL,
    conditionname character varying(256) NOT NULL
);


ALTER TABLE public.relatedcondition OWNER TO postgres;

--
-- Name: studies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.studies (
    cttitle character varying(256) NOT NULL,
    drugname character varying(256) NOT NULL
);


ALTER TABLE public.studies OWNER TO postgres;

--
-- Data for Name: clinicaltrial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clinicaltrial (title, startdate, completiondate, numberparticipants, status, mainresearcher, institution) FROM stdin;
Can We Miss Pigmented Lesions in Psoriasis Patients?	2007-09-01	2012-04-01	6	Completed	Boni Elewski, MD	University of Alabama at Birmingham
Anti-inflammatory Treatment at the Onset of Necrotizing Enterocolitis (NEC) in Preterm Infants	2009-09-01	2012-11-01	2	Terminated	Brandy Frost	NorthShore University HealthSystem Research Institute
Organ Donation and Hydrocortisone Treatment	2008-05-01	2011-12-01	38	Terminated	Stepani Bendel	Kuopio University Hospital
Addition of Etanercept and Extracorporeal Photopheresis (ECP) to Standard Graft-Versus-Host Disease (GVHD) Prophylaxis in Stem Cell Transplant	2009-03-01	2015-09-01	48	Active, not recruiting	John Levine, MD	University of Michigan Cancer Center
Immune Response on Neoadjuvant Therapy in Non-small-cell Lung Cancer (NSCLC)	2007-01-01	2011-06-01	41	Completed	Wolfgang Hilbe	Medical University of Vienna
Beneficial Effect of Salicylates: Insulin Action, Secretion or Clearance?	2010-07-01	2013-11-01	41	Completed	Gerald M Reaven	Stanford University
Low Doses Corticosteroids as Adjuvant Therapy for the Treatment of Severe H1N1 Flu	2010-03-01	2011-12-01	40	Terminated	Djillali Annane	University of Versailles
Efficacy Study on Early Versus Late Abciximab Administration During Primary Coronary Angioplasty	2006-04-01	2008-12-01	110	Completed	Prof. Anna Sonia Petronio	University of Pisa
Mild Versus Potent Corticosteroids as Treatment for Phimosis in Children	2009-08-01	2009-09-01	0	Withdrawn	Anindya Niyogi	Chelsea and Westminster NHS Foundation Trust
Cetuximab Plus Radiotherapy Versus Cisplatin Plus Radiotherapy in Locally Advanced Head and Neck Cancer	2010-10-01	2019-12-01	70	Terminated	STEFANO M. MAGRINI, PROF	Azienda USL 4 Prato
Salsalate for Insulin Resistance in Schizophrenia	2010-08-01	2011-12-01	13	Completed	Robert W. Buchanan, M.D.	University of Maryland
Inflammation and Vascular Function in Atherosclerosis	2005-08-01	2011-02-01	44	Completed	Joshua A. Beckman, MD	Brigham and Women's Hospital
\.


--
-- Data for Name: contains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contains (drugproduct, drugname) FROM stdin;
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
-- Data for Name: disease; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disease (diseasename) FROM stdin;
Sepsis
Septic shock, susceptibility to
Asthma
Myocardial infarction, susceptibility to
Combined immunodeficiency
Conjunctivitis, ligneous, 217090
Epilepsy
Nonsmall cell lung cancer
Migraine without aura, susceptibility to, 157300
Asthma, susceptibility to, 600807
Conjunctivitis, ligneous
Migraine
IgG receptor I, phagocytic, familial deficiency of
Obesity
Dementia
Lymphoma
Asthma, dimished response to antileukotriene treatment in, 600807
Plasminogen deficiency
Malaria, cerebral, susceptibility to
Nonsmall cell lung cancer, response to tyrosine kinase inhibitor in, 211980
Lupus erythematosus
Adenocarcinoma
Epilepsy, juvenile myoclonic, 606904
Myocardial infarction
Complementary component deficiency
Cortisol resistance
Lymphoma, progression of
C1q deficiency, type B
Combined immunodeficiency, X-linked, moderate, 312863
Dementia, vascular, susceptibility to
Malaria
Severe combined immunodeficiency, X-linked, 300400
Alzheimer disease
Lupus nephritis, susceptibility to
Obesity, adrenal insufficiency, and red hair
Glanzmann thrombasthenia, type B
Malaria, resistance to, 248310
Adenocarcinoma of lung, response to tyrosine kinase inhibitor in, 211980
Glanzmann thrombasthenia
Plasminogen Tochigi disease
Alzheimer disease, late-onset, susceptibility to, 104300
C1q deficiency, type A
Viral infection
Atherosclerosis
Viral infections, recurrent
Severe combined immunodeficiency
C1s deficiency, isolated
Neutropenia, alloimmune neonatal
Interleukin-2 receptor, alpha chain, deficiency of
Neutropenia
Atherosclerosis, susceptibility to
\.


--
-- Data for Name: diseasecategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diseasecategory (catname) FROM stdin;
Cardiovascular
Endocrine
Immunological
Connective%5Ftissue%5Fdisorder
Hematological
Ophthamological
Nutritional
Connective_tissue_disorder
Neurological
Cancer
Respiratory
\.


--
-- Data for Name: drug; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drug (name) FROM stdin;
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
-- Data for Name: drugcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drugcategory (catname) FROM stdin;
Antineoplastic agents
Immunomodulatory agents
Thrombolytic agents
Antirheumatic agents
\.


--
-- Data for Name: drugtreats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drugtreats (drugname, diseasename) FROM stdin;
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
-- Data for Name: hascategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hascategory (drug, category) FROM stdin;
urokinase	Thrombolytic agents
denileukin diftitox	Antineoplastic agents
etanercept	Immunomodulatory agents
etanercept	Antirheumatic agents
cetuximab	Antineoplastic agents
\.


--
-- Data for Name: hasdiseasecategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hasdiseasecategory (disease, diseasecategory) FROM stdin;
Sepsis	Immunological
Septic shock, susceptibility to	Immunological
Asthma	Respiratory
Myocardial infarction, susceptibility to	Cardiovascular
Combined immunodeficiency	Immunological
Conjunctivitis, ligneous, 217090	Ophthamological
Epilepsy	Neurological
Nonsmall cell lung cancer	Cancer
Migraine without aura, susceptibility to, 157300	Neurological
Asthma, susceptibility to, 600807	Respiratory
Conjunctivitis, ligneous	Ophthamological
Migraine	Neurological
IgG receptor I, phagocytic, familial deficiency of	Immunological
Obesity	Nutritional
Dementia	Neurological
Lymphoma	Cancer
Asthma, dimished response to antileukotriene treatment in, 600807	Respiratory
Plasminogen deficiency	Hematological
Malaria, cerebral, susceptibility to	Immunological
Nonsmall cell lung cancer, response to tyrosine kinase inhibitor in, 211980	Cancer
Lupus erythematosus	Connective%5Ftissue%5Fdisorder
Adenocarcinoma	Cancer
Epilepsy, juvenile myoclonic, 606904	Neurological
Myocardial infarction	Cardiovascular
Complementary component deficiency	Immunological
Cortisol resistance	Endocrine
Lymphoma, progression of	Cancer
C1q deficiency, type B	Immunological
Combined immunodeficiency, X-linked, moderate, 312863	Immunological
Dementia, vascular, susceptibility to	Neurological
Malaria	Immunological
Severe combined immunodeficiency, X-linked, 300400	Immunological
Alzheimer disease	Neurological
Lupus nephritis, susceptibility to	Connective_tissue_disorder
Obesity, adrenal insufficiency, and red hair	Nutritional
Glanzmann thrombasthenia, type B	Hematological
Malaria, resistance to, 248310	Immunological
Adenocarcinoma of lung, response to tyrosine kinase inhibitor in, 211980	Cancer
Glanzmann thrombasthenia	Hematological
Plasminogen Tochigi disease	Hematological
Alzheimer disease, late-onset, susceptibility to, 104300	Neurological
C1q deficiency, type A	Immunological
Viral infection	Immunological
Atherosclerosis	Cardiovascular
Viral infections, recurrent	Immunological
Severe combined immunodeficiency	Immunological
C1s deficiency, isolated	Immunological
Neutropenia, alloimmune neonatal	Hematological
Interleukin-2 receptor, alpha chain, deficiency of	Immunological
Neutropenia	Hematological
Atherosclerosis, susceptibility to	Cardiovascular
\.


--
-- Data for Name: hassideeffect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hassideeffect (drugname, sideeffect) FROM stdin;
urokinase	chest pain
urokinase	cerebrovascular accident
urokinase	rash
urokinase	cyanosis
urokinase	myocardial infarction
urokinase	increased sweating
urokinase	bleeding
urokinase	anaphylactic reaction
urokinase	recurrent pulmonary embolism
urokinase	cardiac arrest
urokinase	hypotension
urokinase	hypoxia
urokinase	edema
urokinase	dyspnea
urokinase	bronchospasm
urokinase	back pain
urokinase	arrhythmia
urokinase	substernal chest pain
urokinase	hypertension
urokinase	rigors
urokinase	allergy
urokinase	tachycardia
urokinase	thrombocytopenia
urokinase	embolism
urokinase	fever
urokinase	vomiting
urokinase	hemiplegia
urokinase	itching
urokinase	infarction
urokinase	nausea
urokinase	decreased hematocrit
urokinase	chills
urokinase	pulmonary embolism
urokinase	pain
urokinase	urticaria
urokinase	pulmonary edema
urokinase	acidosis
denileukin diftitox	chest pain
denileukin diftitox	pancreatitis
denileukin diftitox	vascular disorders
denileukin diftitox	infectious
denileukin diftitox	ulceration
denileukin diftitox	rash
denileukin diftitox	dehydration
denileukin diftitox	superficial thrombophlebitis
denileukin diftitox	rhinitis
denileukin diftitox	sweating
denileukin diftitox	acute renal insufficiency
denileukin diftitox	cough
denileukin diftitox	abnormal vision
denileukin diftitox	embolus
denileukin diftitox	hypotension
denileukin diftitox	thrombosis
denileukin diftitox	hypothyroidism
denileukin diftitox	microscopic hematuria
denileukin diftitox	venous thrombosis
denileukin diftitox	asthenia
denileukin diftitox	congestive heart failure
denileukin diftitox	peripheral vascular disorder
denileukin diftitox	tachycardia
denileukin diftitox	heart failure
denileukin diftitox	albuminuria
denileukin diftitox	infection
denileukin diftitox	renal insufficiency
denileukin diftitox	lung disorder
denileukin diftitox	fever
denileukin diftitox	thrombophlebitis
denileukin diftitox	vomiting
denileukin diftitox	constipation
denileukin diftitox	chills
denileukin diftitox	dyspepsia
denileukin diftitox	pharyngitis
denileukin diftitox	flu
denileukin diftitox	lymphocytopenia
denileukin diftitox	weight decreased
denileukin diftitox	vasodilatation
denileukin diftitox	pyuria
denileukin diftitox	injection site reaction
denileukin diftitox	myocardial infarction
denileukin diftitox	ctcl
denileukin diftitox	leukopenia
denileukin diftitox	mouth ulcer
denileukin diftitox	myalgia
denileukin diftitox	hypocalcemia
denileukin diftitox	hypoalbuminemia
denileukin diftitox	edema
denileukin diftitox	arterial thrombosis
denileukin diftitox	thyrotoxicosis
denileukin diftitox	dyspnea
denileukin diftitox	anorexia
denileukin diftitox	nervousness
denileukin diftitox	dysphagia
denileukin diftitox	arrhythmia
denileukin diftitox	dizziness
denileukin diftitox	hypertension
denileukin diftitox	toxic epidermal necrolysis
denileukin diftitox	insomnia
denileukin diftitox	allergy
denileukin diftitox	hypokalemia
denileukin diftitox	confusion
denileukin diftitox	thrombocytopenia
denileukin diftitox	thyroiditis
denileukin diftitox	arthralgia
denileukin diftitox	hematuria
denileukin diftitox	anemia
denileukin diftitox	paresthesia
denileukin diftitox	headache
denileukin diftitox	diarrhea
denileukin diftitox	itching
denileukin diftitox	infarction
denileukin diftitox	nausea
denileukin diftitox	artery disorder
denileukin diftitox	coronary artery disorder
denileukin diftitox	lymphoma
denileukin diftitox	pulmonary embolism
denileukin diftitox	pain
denileukin diftitox	urticaria
denileukin diftitox	hyperthyroidism
denileukin diftitox	gastrointestinal toxicity
denileukin diftitox	deep venous thrombosis
etanercept	cerebrovascular accident
etanercept	infectious
etanercept	respiratory failure
etanercept	neutropenia
etanercept	ulceration
etanercept	autoimmune diseases
etanercept	optic neuritis
etanercept	bleeding
etanercept	aseptic meningitis
etanercept	cough
etanercept	urinary tract infection
etanercept	nph
etanercept	cerebral ischemia
etanercept	bacteremia
etanercept	pulmonary tuberculosis
etanercept	venous thrombosis
etanercept	hydrocephalus
etanercept	cutaneous vasculitis
etanercept	asthenia
etanercept	congestive heart failure
etanercept	heart failure
etanercept	fibrosis
etanercept	generalized pain
etanercept	death
etanercept	prostate
etanercept	respiratory infection
etanercept	plaque psoriasis
etanercept	erythema
etanercept	coagulation disorder
etanercept	abdominal pain
etanercept	wound infection
etanercept	upper respiratory tract infection
etanercept	myocardial infarction
etanercept	leukopenia
etanercept	septic arthritis
etanercept	mouth ulcer
etanercept	pulmonary fibrosis
etanercept	personality disorder
etanercept	juvenile rheumatoid arthritis
etanercept	angioedema
etanercept	anorexia
etanercept	rheumatoid factor positive
etanercept	septic shock
etanercept	rheumatoid arthritis
etanercept	leg ulcer
etanercept	skin cancer
etanercept	psoriasis
etanercept	sarcoidosis
etanercept	anemia
etanercept	bursitis
etanercept	hepatitis a
etanercept	headache
etanercept	diarrhea
etanercept	infarction
etanercept	nausea
etanercept	cholecystitis
etanercept	pulmonary embolism
etanercept	pain
etanercept	melanoma
etanercept	abscess
etanercept	ankylosing spondylitis
etanercept	deep venous thrombosis
etanercept	foot abscess
etanercept	pancreatitis
etanercept	chest pain
etanercept	arthritis
etanercept	appendicitis
etanercept	rash
etanercept	rhinitis
etanercept	pneumonia
etanercept	tuberculosis
etanercept	diabetes
etanercept	neuritis
etanercept	varicella
etanercept	sarcoidosis skin
etanercept	osteomyelitis
etanercept	respiratory system disorders
etanercept	cellulitis
etanercept	aplastic anemia
etanercept	hypotension
etanercept	thrombosis
etanercept	myocardial ischemia
etanercept	pyelonephritis
etanercept	meningitis
etanercept	alopecia
etanercept	mgn
etanercept	pancytopenia
etanercept	infection
etanercept	spondylitis
etanercept	lymphadenopathy
etanercept	fever
etanercept	fatigue
etanercept	thrombophlebitis
etanercept	vomiting
etanercept	abdominal abscess
etanercept	swelling
etanercept	bronchitis
etanercept	dyspepsia
etanercept	pharyngitis
etanercept	flu
etanercept	sinusitis
etanercept	psoriatic arthritis
etanercept	vasodilatation
etanercept	gastroenteritis
etanercept	positive ana
etanercept	gastritis
etanercept	skin melanoma
etanercept	injection site hemorrhage
etanercept	injection site reaction
etanercept	flushing
etanercept	redness
etanercept	tumors
etanercept	multiple sclerosis
etanercept	polymyositis
etanercept	vasculitis
etanercept	edema
etanercept	dyspnea
etanercept	dizziness
etanercept	hypertension
etanercept	shock
etanercept	intestinal perforation
etanercept	dry mouth
etanercept	thrombocytopenia
etanercept	skin ulcer
etanercept	weight gain
etanercept	embolism
etanercept	solid tumors
etanercept	esophagitis
etanercept	seizures
etanercept	hepatitis
etanercept	ischemia
etanercept	itching
etanercept	sepsis
etanercept	bacterial pneumonia
etanercept	lymphoma
etanercept	malignant neoplasm
etanercept	urticaria
etanercept	glomerulonephropathy
etanercept	lupus
etanercept	tuberculous arthritis
etanercept	peripheral edema
etanercept	gastrointestinal bleeding
etanercept	plaque
cetuximab	rash
cetuximab	dehydration
cetuximab	somnolence
cetuximab	cough
cetuximab	acne
cetuximab	anaphylactoid reactions
cetuximab	embolus
cetuximab	hypotension
cetuximab	bronchospasm
cetuximab	conjunctivitis
cetuximab	back pain
cetuximab	asthenia
cetuximab	alopecia
cetuximab	cough increased
cetuximab	infection
cetuximab	carcinoma
cetuximab	lung disorder
cetuximab	fever
cetuximab	vomiting
cetuximab	constipation
cetuximab	colorectal cancer
cetuximab	hoarseness
cetuximab	chills
cetuximab	dyspepsia
cetuximab	malaise
cetuximab	maculopapular rash
cetuximab	abdominal pain
cetuximab	stridor
cetuximab	weight decreased
cetuximab	renal failure
cetuximab	interstitial lung disease
cetuximab	nail disorder
cetuximab	leukopenia
cetuximab	chills and fever
cetuximab	stomatitis
cetuximab	airways obstruction
cetuximab	edema
cetuximab	dyspnea
cetuximab	anorexia
cetuximab	obstruction
cetuximab	skin disorder
cetuximab	insomnia
cetuximab	allergy
cetuximab	pustular rash
cetuximab	anemia
cetuximab	headache
cetuximab	diarrhea
cetuximab	itching
cetuximab	sepsis
cetuximab	colorectal carcinoma
cetuximab	nausea
cetuximab	pulmonary embolism
cetuximab	malignant neoplasm
cetuximab	pain
cetuximab	urticaria
cetuximab	peripheral edema
cetuximab	metastatic colorectal cancer
\.


--
-- Data for Name: institution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institution (instname, address, country) FROM stdin;
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
-- Data for Name: interacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interacts (drug1, drug2) FROM stdin;
midodrine	hydrocortisone
hydrocortisone	midodrine
hydrocortisone	butabarbital
hydrocortisone	salsalate
butabarbital	hydrocortisone
salsalate	hydrocortisone
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (productname, company) FROM stdin;
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
-- Data for Name: relatedcondition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.relatedcondition (cttitle, conditionname) FROM stdin;
Can We Miss Pigmented Lesions in Psoriasis Patients?	Non-melanoma Skin Cancer
Can We Miss Pigmented Lesions in Psoriasis Patients?	Psoriasis
Can We Miss Pigmented Lesions in Psoriasis Patients?	Melanoma
Anti-inflammatory Treatment at the Onset of Necrotizing Enterocolitis (NEC) in Preterm Infants	Necrotizing Enterocolitis
Organ Donation and Hydrocortisone Treatment	Brain Death
Addition of Etanercept and Extracorporeal Photopheresis (ECP) to Standard Graft-Versus-Host Disease (GVHD) Prophylaxis in Stem Cell Transplant	Graft Versus Host Disease
Immune Response on Neoadjuvant Therapy in Non-small-cell Lung Cancer (NSCLC)	Carcinoma, Non-small-cell Lung
Beneficial Effect of Salicylates: Insulin Action, Secretion or Clearance?	Pre Diabetes
Beneficial Effect of Salicylates: Insulin Action, Secretion or Clearance?	Insulin Resistant
Low Doses Corticosteroids as Adjuvant Therapy for the Treatment of Severe H1N1 Flu	Pneumonia, Viral
Low Doses Corticosteroids as Adjuvant Therapy for the Treatment of Severe H1N1 Flu	Influenza in Humans
Efficacy Study on Early Versus Late Abciximab Administration During Primary Coronary Angioplasty	Myocardial Infarction
Mild Versus Potent Corticosteroids as Treatment for Phimosis in Children	Phimosis
Cetuximab Plus Radiotherapy Versus Cisplatin Plus Radiotherapy in Locally Advanced Head and Neck Cancer	Mouth Neoplasms
Cetuximab Plus Radiotherapy Versus Cisplatin Plus Radiotherapy in Locally Advanced Head and Neck Cancer	Head and Neck Neoplasms
Cetuximab Plus Radiotherapy Versus Cisplatin Plus Radiotherapy in Locally Advanced Head and Neck Cancer	Pharyngeal Neoplasms
Cetuximab Plus Radiotherapy Versus Cisplatin Plus Radiotherapy in Locally Advanced Head and Neck Cancer	Laryngeal Neoplasms
Salsalate for Insulin Resistance in Schizophrenia	Insulin Resistance
Salsalate for Insulin Resistance in Schizophrenia	Schizophrenia
Inflammation and Vascular Function in Atherosclerosis	Atherosclerosis
\.


--
-- Data for Name: studies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.studies (cttitle, drugname) FROM stdin;
Can We Miss Pigmented Lesions in Psoriasis Patients?	etanercept
Anti-inflammatory Treatment at the Onset of Necrotizing Enterocolitis (NEC) in Preterm Infants	hydrocortisone
Organ Donation and Hydrocortisone Treatment	hydrocortisone
Addition of Etanercept and Extracorporeal Photopheresis (ECP) to Standard Graft-Versus-Host Disease (GVHD) Prophylaxis in Stem Cell Transplant	etanercept
Immune Response on Neoadjuvant Therapy in Non-small-cell Lung Cancer (NSCLC)	cetuximab
Beneficial Effect of Salicylates: Insulin Action, Secretion or Clearance?	salsalate
Low Doses Corticosteroids as Adjuvant Therapy for the Treatment of Severe H1N1 Flu	hydrocortisone
Efficacy Study on Early Versus Late Abciximab Administration During Primary Coronary Angioplasty	abciximab
Mild Versus Potent Corticosteroids as Treatment for Phimosis in Children	hydrocortisone
Cetuximab Plus Radiotherapy Versus Cisplatin Plus Radiotherapy in Locally Advanced Head and Neck Cancer	cetuximab
Salsalate for Insulin Resistance in Schizophrenia	salsalate
Inflammation and Vascular Function in Atherosclerosis	salsalate
\.


--
-- Name: clinicaltrial clinicaltrial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clinicaltrial
    ADD CONSTRAINT clinicaltrial_pkey PRIMARY KEY (title);


--
-- Name: contains contains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_pkey PRIMARY KEY (drugproduct, drugname);


--
-- Name: disease disease_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_pkey PRIMARY KEY (diseasename);


--
-- Name: diseasecategory diseasecategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diseasecategory
    ADD CONSTRAINT diseasecategory_pkey PRIMARY KEY (catname);


--
-- Name: drug drug_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drug
    ADD CONSTRAINT drug_pkey PRIMARY KEY (name);


--
-- Name: drugcategory drugcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drugcategory
    ADD CONSTRAINT drugcategory_pkey PRIMARY KEY (catname);


--
-- Name: drugtreats drugtreats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drugtreats
    ADD CONSTRAINT drugtreats_pkey PRIMARY KEY (drugname, diseasename);


--
-- Name: hascategory hascategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hascategory
    ADD CONSTRAINT hascategory_pkey PRIMARY KEY (drug, category);


--
-- Name: hassideeffect hassideeffect_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hassideeffect
    ADD CONSTRAINT hassideeffect_pkey PRIMARY KEY (drugname, sideeffect);


--
-- Name: institution institution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institution
    ADD CONSTRAINT institution_pkey PRIMARY KEY (instname);


--
-- Name: interacts interacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interacts
    ADD CONSTRAINT interacts_pkey PRIMARY KEY (drug1, drug2);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (productname);


--
-- Name: relatedcondition relatedcondition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relatedcondition
    ADD CONSTRAINT relatedcondition_pkey PRIMARY KEY (cttitle, conditionname);


--
-- Name: studies studies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studies
    ADD CONSTRAINT studies_pkey PRIMARY KEY (cttitle, drugname);


--
-- Name: clinicaltrial clinicaltrial_institution_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clinicaltrial
    ADD CONSTRAINT clinicaltrial_institution_fkey FOREIGN KEY (institution) REFERENCES public.institution(instname);


--
-- Name: contains contains_drugname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_drugname_fkey FOREIGN KEY (drugname) REFERENCES public.drug(name);


--
-- Name: contains contains_drugproduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_drugproduct_fkey FOREIGN KEY (drugproduct) REFERENCES public.product(productname);


--
-- Name: drugtreats drugtreats_diseasename_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drugtreats
    ADD CONSTRAINT drugtreats_diseasename_fkey FOREIGN KEY (diseasename) REFERENCES public.disease(diseasename);


--
-- Name: drugtreats drugtreats_drugname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drugtreats
    ADD CONSTRAINT drugtreats_drugname_fkey FOREIGN KEY (drugname) REFERENCES public.drug(name);


--
-- Name: hascategory hascategory_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hascategory
    ADD CONSTRAINT hascategory_category_fkey FOREIGN KEY (category) REFERENCES public.drugcategory(catname);


--
-- Name: hascategory hascategory_drug_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hascategory
    ADD CONSTRAINT hascategory_drug_fkey FOREIGN KEY (drug) REFERENCES public.drug(name);


--
-- Name: hasdiseasecategory hasdiseasecategory_disease_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasdiseasecategory
    ADD CONSTRAINT hasdiseasecategory_disease_fkey FOREIGN KEY (disease) REFERENCES public.disease(diseasename);


--
-- Name: hasdiseasecategory hasdiseasecategory_diseasecategory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasdiseasecategory
    ADD CONSTRAINT hasdiseasecategory_diseasecategory_fkey FOREIGN KEY (diseasecategory) REFERENCES public.diseasecategory(catname);


--
-- Name: hassideeffect hassideeffect_drugname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hassideeffect
    ADD CONSTRAINT hassideeffect_drugname_fkey FOREIGN KEY (drugname) REFERENCES public.drug(name);


--
-- Name: interacts interacts_drug1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interacts
    ADD CONSTRAINT interacts_drug1_fkey FOREIGN KEY (drug1) REFERENCES public.drug(name);


--
-- Name: interacts interacts_drug2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interacts
    ADD CONSTRAINT interacts_drug2_fkey FOREIGN KEY (drug2) REFERENCES public.drug(name);


--
-- Name: relatedcondition relatedcondition_cttitle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relatedcondition
    ADD CONSTRAINT relatedcondition_cttitle_fkey FOREIGN KEY (cttitle) REFERENCES public.clinicaltrial(title);


--
-- Name: studies studies_cttitle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studies
    ADD CONSTRAINT studies_cttitle_fkey FOREIGN KEY (cttitle) REFERENCES public.clinicaltrial(title);


--
-- Name: studies studies_drugname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studies
    ADD CONSTRAINT studies_drugname_fkey FOREIGN KEY (drugname) REFERENCES public.drug(name);


--
-- PostgreSQL database dump complete
--

