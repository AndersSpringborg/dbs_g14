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
-- Name: drug_side_effects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drug_side_effects (
    drug_name character varying(256),
    side_effect_id bigint
);


ALTER TABLE public.drug_side_effects OWNER TO postgres;

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
1	AIDS
2	Abscess
3	Achilles Tendinopathy
4	Acute Coronary Syndrome
5	Acute Kidney Injury
6	Acute Lymphoblastic Leukemia
7	Acute Renal Failure
8	Alzheimer Disease
9	Angioplasty
10	Angioplasty, Transluminal, Percutaneous Coronary
11	Anthocyanin Metabolism
12	Asthma
13	Atherosclerosis
14	Atrial Fibrillation
15	Atrial Flutter
16	Binge Eating Disorder
17	Bleeding
18	Bleeding in the Brain
19	Blood Cancer
20	Blood Platelets
21	Brain Death
22	Breast Cancer
23	CVD
24	Candidiasis
25	Cardiovascular Disease
26	Carotid Atherosclerosis
27	Central Nervous System Tumor, Pediatric
28	Chronic Bronchitis
29	Chronic Central Serous Chorioretinopathy
30	Chronic Hepatitis C
31	Chronic Kidney Disease
32	Chronic Laryngitis
33	Chronic Myeloproliferative Disorders
34	Chronic Obstructive Pulmonary Disease
35	Clostridium Difficile Infection
36	Cocaine Addictions
37	Cocaine-Related Disorders
38	Contraception
39	Coronary Heart Disease
40	Cough
41	Cowden's Disease
42	Cryptococcal Meningitis
43	Delirium
44	Diabetes
45	Diabetes Mellitus
46	Diabetes Mellitus Type 2
47	Diabetic Nephropathy
48	Diaphragmatic Dysfunction
49	Dyskeratosis Congenita
50	Dyslipidemia
51	Dyslipidemias
52	Dyspepsia
53	Efavirenz, Metabolism and Pharmacokinetics Changes
54	End-stage Renal Disease
55	Epilepsy
56	Fanconi Anemia
57	Folliculitis
58	Fungal Infection
59	GVHD
60	Gastroesophageal Reflux
61	Gastroesophageal Reflux Disease (GERD)
62	Genotype-related Drug Metabolism
63	Gout
64	Graft Versus Host Disease
65	H-pylori
66	HIV
67	HIV Infection
68	HIV Infections
69	HIV-1 Infection
70	Hamartoma Syndrome, Multiple
71	Headache
72	Healthy
73	Healthy Volunteers
74	Heart Disease
75	Heart Failure, Congestive
76	Heart Failure, Diastolic
77	Hydroxymethylglutaryl-CoA Reductase Inhibitors
78	Hypercholesterolemia
79	Hypertension, Pulmonary
80	Icu Delirium
81	IgA Nephropathy
82	Infection
83	Inflammation
84	Influenza in Humans
85	Injection Pain
86	Insomnia
87	Insulin Resistance
88	Insulin Resistant
89	Intrahepatic Cholestasis
90	Intraventricular Hemorrhage (IVH)
91	Invasive Aspergillosis
92	Invasive Fungal Infection
93	Ischemic Heart Disease
94	Ischemic Stroke
95	Juvenile Chronic Polyarthritis
96	Juvenile Idiopathic Arthritis
97	Juvenile Rheumatoid Arthritis
98	Kidney Transplantation
99	Leukemia
100	Light Chain Deposition Disease
101	Liver Transplant
102	Lung Cancer
103	Lupus Nephritis
104	Lymphatic Filariasis
105	Lymphoma
106	Lymphoproliferative Disorder
107	Malaria
108	Metabolic Syndrome
109	Methamphetamine Addiction
110	Migraine
111	Mucositis
112	Multiple Myeloma
113	Multiple Myeloma and Plasma Cell Neoplasm
114	Muscle Fatigue
115	Muscle Weakness
116	Musculoskeletal Complications
117	Myelodysplastic Syndromes
118	Myelodysplastic/Myeloproliferative Neoplasms
119	Myocardial Infarction
120	Necrotizing Enterocolitis
121	Neonatal Seizures
122	Neuroblastoma
123	Obesity
124	Obsessive-Compulsive Disorder
125	Oligohydramnios
126	Opioid Abuse
127	Opioid Addiction
128	Opioid Induced Pharyngeal and Esophageal Dysfunction
129	Pain
130	Pediatric Bipolar Disorder
131	Pediatric OCD
132	Peptic Ulcer
133	Peripheral Arterial Disease
134	Phimosis
135	Pneumonia, Viral
136	Post Stroke Fatigue
137	Post-Operative Delirium
138	Pre Diabetes
139	Precancerous Condition
140	Pregnancy
141	Prematurity
142	Preterm Labor With Intact Membranes
143	Primary Systemic Amyloidosis
144	Renal Transplant
145	Renal Transplantation
146	Rhytidoplasty
147	Sarcoma
148	Schizoaffective Disorder
149	Schizophrenia
150	Secondary Myelofibrosis
151	Simple Hand Lacerations
152	Sleep Initiation and Maintenance Disorders
153	Smoking
154	Smoking Cessation
155	Soft Tissue Injury
156	Staphylococcal Infection
157	Staphylococcal Skin Infection
158	Statins, HMG-CoA
159	Stem Cell Transplantation
160	Stimulant Abuse
161	Stimulant Addiction
162	Stroke
163	Subarachnoid Haemorrhage
164	Surgery
165	The Focus of the Study is to Monitor MRI Signal Changes and Inflammatory Biomarkers With Use of Aspirin in Patients With Unruptured Cerebral Aneurysm
166	Tobacco Use Disorder
167	Trachoma
168	Tuberculosis
169	Tuberculosis, Pulmonary
170	Type 1 Diabetes Mellitus
171	Type 2 Diabetes
172	Type 2 Diabetes Mellitus
173	Ulcerative Colitis
174	Unspecified Adult Solid Tumor, Protocol Specific
175	Unspecified Childhood Solid Tumor, Protocol Specific
176	Vascular Calcification
177	Venous Thromboembolism
178	Very Low Birth Weight Infants
\.


--
-- Data for Name: disease; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disease (disease_name, disease_category_id) FROM stdin;
Congestive heart failure	3
Schizophrenia	15
IgG receptor I, phagocytic, familial deficiency of	10
Acquired long QT syndrome	3
Platelet defect/deficiency	9
Pancreatitis, idiopathic	8
Hyperprothrombinemia	9
Warfarin resistance/sensitivity	9
Malaria, cerebral, susceptibility to	10
Lupus nephritis, susceptibility to	5
Ventricular fibrillation, idiopathic	3
Kaposi sarcoma, susceptibility to, 148000	10
Gastrointestinal stromal tumor, somatic, 606764	2
Beta-2-adrenoreceptor agonist, reduced response to	19
Dubin-Johnson syndrome, 237500	11
Hypoprothrombinemia	9
Diabetes mellitus	7
Cerebral amyloid angiopathy	12
Oculodentodigital dysplasia	18
Statins	11
C1q deficiency, type A	10
Hypertension, susceptibility to, 145500	3
Coronary artery disease in familial hypercholesterolemia, protection against, 143890	3
Anorexia nervosa	13
Cystic fibrosis, 219700	17
Persistent hyperinsulinemic hypoglycemia of infancy, 256450	11
Ventricular fibrillation, idiopathic, 603829	3
Leukemia	2
Medullary thyroid carcinoma	2
Alzheimer disease	12
Hypolactasia, adult type, 223100	11
Anxiety-related personality traits	15
Amyloid neuropathy, familial, several allelic types	12
Glioblastoma	2
Central hypoventilation syndrome, congenital, 209880	17
Kaposi sarcoma	10
Long QT syndrome	3
Hypobetalipoproteinemia	11
Brugada syndrome	3
Obesity, adrenal insufficiency, and red hair	13
Hypoglycemia of infancy, persistent hyperinsulinemic, 256450	11
ABCD syndrome, 600501	20
Hirschsprung disease-2, 600155	8
Asthma	17
Epilepsy, severe myoclonic, of infancy, 607208	12
Lipodystrophy	11
Platelet ADP receptor defect	9
Tall stature, susceptibility to	18
Heinz body anemia	9
Acromegaly	7
Cholestasis	8
Night blindness	14
Hypertension, essential, susceptibility to, 145500	3
Schizophrenia, susceptibility to, 181500	15
Timothy syndrome, 601005	20
Atherosclerosis	3
Myeloproliferative disorder	2
Malaria	10
Xanthinuria, type I	11
Chylomicronemia syndrome, familial	11
Heinz body anemias, alpha-	9
Costello syndrome, 218040	20
Diabetes mellitus, permanent neonatal, with neurologic features, 606176	7
Thyroid carcinoma	2
Hypolactasia, adult type	11
Thalassemias	9
Diabetes, permanent neonatal, 606176	7
Blood group, Yt system, 112100	9
Cardiomyopathy	3
Malignant hyperthermia susceptibility 5, 601887	12
Mastocytosis with associated hematologic disorder	10
Epilepsy, generalized idiopathic, 600669	12
Syndactyly, type III, 186100	18
Carpal tunnel syndrome, familial	19
Renal tubular dysgenesis	16
Cerebral amyloid angiopathy, 105150	12
Coronary artery disease	3
Hyperapobetalipoproteinemia	11
DNA topoisomerase II, resistance to inhibition of, by amsacrine	11
Atrioventricular block	3
Methemoglobinemia	9
Insensitivity to pain, congenital, with anhidrosis, 256800	12
Neutropenia, alloimmune neonatal	9
Hypertension, pregnancy-induced, 189800	3
Dysalbuminemic hyperthyroxinemia	9
Costello syndrome	20
Myelomonocytic leukemia, chronic	2
Hypokalemic periodic paralysis, 170400	16
Hyperapobetalipoproteinemia, susceptibility to	11
Myelogenous leukemia	2
Hypogonadotropic hypogonadism	7
Tuberculosis	17
Bladder cancer, somatic, 109800	2
Pancreatitis	8
Methemoglobinemias, alpha-	9
Preeclampsia	3
Preeclampsia, susceptibility to	3
Sweat chloride elevation without CF	19
Tuberculosis, susceptibility to, 607948	17
Colonic aganglionosis, total, with small bowel involvement	8
Statins, attenuated cholesterol lowering by	11
Mast cell leukemia	2
Coronary artery spasm, susceptibility to	3
Lymphoma, progression of	2
Placental abruption	19
Hypertrypsinemia, neonatal	8
Benzene toxicity, susceptibility to	19
Medullary thyroid carcinoma, 155240	2
Diabetes mellitus, insulin-resistant, with acanthosis nigricans and hypertension, 604367	7
Alpha-methylacetoacetic aciduria, 203750	11
Syndactyly	18
Dubin-Johnson syndrome	11
Hypereosinophilic syndrome	9
Migraine, susceptibility to, 157300	12
Myeloid malignancy, predisposition to	2
Dystonia	12
Viral infection	10
Acromegaly, 102200	7
Waardenburg-Shah syndrome	20
Osteolysis, idiopathic, Saudi type, 605156	1
DNA topoisomerase	11
Xanthinuria, type I, 278300	11
Oculodentodigital dysplasia, 164200	18
Viral infections, recurrent	10
Sick sinus syndrome, 608567	3
Hypertension	3
Piebaldism	6
Multiple endocrine neoplasia IIA, 171400	2
Combined hyperlipemia, familial	11
Anorexia nervosa, susceptibility to, 606788	13
Aplastic anemia	9
Bladder cancer	2
Renal tubular dysgenesis, 267430	16
Dementia	12
Combined hyperlipemia	11
Long QT syndrome-2	3
Migraine, resistance to, 157300	12
HDL cholesterol level QTL	11
Renal tubular acidosis-osteopetrosis syndrome	16
Familial Mediterranean fever	10
Multiple endocrine neoplasia	2
Insulin resistance, severe, digenic, 604367	11
Obsessive-compulsive disorder, susceptibility to, 164230	15
Erythremias	9
Resting heart rate, 607276	3
Hypercholesterolemia	11
Coronary spasms	3
AIDS, rapid progression to, 609423	10
Multiple endocrine neoplasia IIB, 162300	2
Migraine without aura, susceptibility to, 157300	12
Acquired long QT syndrome, susceptibility to	3
Dystransthyretinemic hyperthyroxinemia	9
Sick sinus syndrome	3
Bartter syndrome	20
Immunodeficiency, X-linked, with hyper-IgM, 308230	10
Analbuminemia	9
Hypercholesterolemia, due to ligand-defective apo B, 144010	11
Orthostatic intolerance, 604715	3
Epilepsy	12
Lymphoma	2
Cystic fibrosis	17
Hirschsprung disease	8
Hypoplastic left heart syndrome	3
Dysprothrombinemia	9
Leukemia, Philadelphia chromosome-positive, resistant to imatinib	2
Tuberous sclerosis	20
Renal tubular acidosis	16
Coronary heart disease, susceptibility to	3
Congenital bilateral absence of vas deferens, 277180	19
Ezetimibe, nonresponse to	19
Erythremias, alpha-	9
Asthma, nocturnal, susceptibility to	17
Neutropenia	9
Immunodeficiency	10
Persistent hyperinsulinemic hypoglycemia of infancy	11
Alzheimer disease, late-onset, susceptibility to, 104300	12
Sepsis	10
Dystransthyretinemic hyperthyroxinemia(3)	9
Gastrointestinal stromal tumor	2
Familial Mediterranean fever, 249100	10
Leukocyte adhesion deficiency, 116920	10
Obsessive-compulsive disorder 1, 164230	15
Resting heart rate	3
Coronary artery disease, susceptibility to	3
Complementary component deficiency	10
Blood group, Colton, 110450	9
Cardiomyopathy, dilated, with ventricular tachycardia, 608569	3
Coronary spasms, susceptibility to	3
Amyloid neuropathy	12
Myeloproliferative disorder with eosinophilia, 131440	2
Ataxia	12
Alcohol dependence	19
Obesity, hyperphagia, and developmental delay	13
Warfarin resistance, 122700	9
Obesity, susceptibility to, 601665	13
Malaria, resistance to, 248310	10
Thyroid carcinoma, follicular, somatic, 188470	2
Cholestasis, progressive familial intrahepatic 2, 601847	8
Insulin resistance	11
Leukocyte adhesion deficiency	10
Malignant hyperthermia susceptibility	12
Lipoprotein lipase deficiency	11
Amyloidosis	12
Long QT syndrome-3, 603830	3
Bartter syndrome, type 2, 241200	20
Medullary thyroid carcinoma, familial, 155240	2
Dystonia, myoclonic, 159900	12
Abetalipoproteinemia	11
Brugada syndrome, 601144	3
Epilepsy, juvenile myoclonic, 606904	12
Congestive heart failure, susceptibility to	3
Alcohol dependence, susceptibility to, 103780	19
Obesity, resistance to	13
ABCD syndrome	20
Hypokalemic periodic paralysis	16
Hypoglycemia	11
Lipodystrophy, familial partial, 151660	11
Hypertrypsinemia	8
Seasonal affective disorder, susceptibility to, 608516	15
Blood group	9
Timothy syndrome	20
Colchicine resistance	19
Fertile eunuch syndrome, 228300	7
Thyrotoxic periodic paralysis	7
Septic shock, susceptibility to	10
C1q deficiency, type B	10
Thyrotoxic periodic paralysis, susceptibility to, 188580	7
Asthma, dimished response to antileukotriene treatment in, 600807	17
Thalassemias, alpha-	9
Alpha-methylacetoacetic aciduria	11
Diabetic retinopathy, NIDDM-related, susceptibility to, 125853	7
Mental retardation	12
Night blindness, congenital stationary, X-linked, type 2, 300071	14
Orthostatic intolerance	3
Hypoplastic left heart syndrome, 241550	3
Obesity	13
Immunodeficiency with hyper-IgM, type 3, 606843	10
Hirschsprung disease, 142623	8
Lupus erythematosus	4
Waardenburg-Shah syndrome, 277580	20
Dementia, vascular, susceptibility to	12
Heart block, progressive, type I, 113900	3
HDL response to hormone replacement, augmented	11
Heart block	3
Atherosclerosis, susceptibility to	3
Diabetes mellitus, 125853	7
Asthma, susceptibility to, 600807	17
Hypoglycemia of infancy, leucine-sensitive, 240800	11
Insensitivity to pain	12
Heart block, nonprogressive, 113900	3
Vitamin K-dependent coagulation defect, 277450	9
Seasonal affective disorder	15
Vitamin K-dependent clotting factors, combined deficiency of, 2, 607473	9
Central hypoventilation syndrome	17
Aplastic anemia, 609135	9
HDL deficiency, familial, 604091	11
AIDS	10
Benzene toxicity	19
Immunodeficiency due to defect in CD3-epsilon	10
Migraine	12
Cortisol resistance	7
Obesity, severe, 601665	13
Tangier disease, 205400	11
Congenital bilateral absence of vas deferens	19
Osteolysis	1
Amyloidosis, senile systemic	12
Estrogen resistance	7
Hypereosinophilic syndrome, idiopathic, resistant to imatinib, 607685	9
Leukemia, post-chemotherapy, susceptibility to	2
Tangier disease	11
Obsessive-compulsive disorder	15
C1s deficiency, isolated	10
Ataxia, episodic	12
Vitamin K-dependent coagulation defect	9
Glioblastoma, susceptibility to, 137800	2
Germ cell tumors, 273300	2
Epilepsy, generalized, with febrile seizures plus, type 2, 604233	12
TSC2 angiomyolipomas, renal, modifier of, 191100	20
Leukemia, acute myeloid, 601626	2
Atrioventricular septal defect, 600309	3
Aquaporin-1 deficiency	19
Tall stature	18
Germ cell tumor	2
Fertile eunuch syndrome	7
\.


--
-- Data for Name: disease_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disease_category (disease_category_id, disease_category_name) FROM stdin;
1	Bone
2	Cancer
3	Cardiovascular
4	Connective%5Ftissue%5Fdisorder
5	Connective_tissue_disorder
6	Dermatological
7	Endocrine
8	Gastrointestinal
9	Hematological
10	Immunological
11	Metabolic
12	Neurological
13	Nutritional
14	Ophthamological
15	Psychiatric
16	Renal
17	Respiratory
18	Skeletal
19	Unclassified
20	multiple
\.


--
-- Data for Name: drug; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drug (drug_name) FROM stdin;
efavirenz
atorvastatin
muromonab
mephenytoin
caspofungin
ketoprofen
clindamycin
cerivastatin
ciprofloxacin
amphotericin b
sulindac
methylphenobarbital
dicumarol
sibutramine
glipizide
pentobarbital
probucol
norfloxacin
methotrexate
rifabutin
neostigmine
indinavir
oxaprozin
warfarin
posaconazole
colchicine
sevelamer
nefazodone
nabumetone
sulfinpyrazone
troglitazone
fenoprofen
ambenonium
methylphenidate
sulfasalazine
fosamprenavir
bismuth subsalicylate
oxcarbazepine
orlistat
colestipol
naproxen
nafcillin
glibenclamide
hydrocortisone
rifampin
carvedilol
tenoxicam
cholestyramine
fluvastatin
butalbital
ursodeoxycholic acid
ezetimibe
ketoconazole
quinupristin
bupropion
sulfadiazine
glimepiride
digoxin
terbinafine
voriconazole
atazanavir
ritonavir
secobarbital
ibuprofen
mestranol
clarithromycin
ethotoin
pyridostigmine
nifedipine
fosphenytoin
tacrolimus
chloramphenicol
ticlopidine
lovastatin
etodolac
octreotide
nicardipine
bosentan
chloroquine
ethinyl estradiol
acetazolamide
diclofenac
methohexital
omeprazole
butabarbital
indomethacin
griseofulvin
cyclosporine
diltiazem
etoposide
talbutal
itraconazole
phenobarbital
carbamazepine
danazol
pravastatin
amiodarone
rosuvastatin
metoclopramide
meclofenamic acid
tolmetin
amprenavir
melphalan
midodrine
acenocoumarol
aspirin
phenytoin
fluoxetine
nelfinavir
saquinavir
piroxicam
sulfamethoxazole
imatinib
mefenamic acid
roxithromycin
allopurinol
telithromycin
anisindione
primidone
erythromycin
butethal
flurbiprofen
sirolimus
imipenem
simvastatin
propafenone
verapamil
cilastatin
pyrazinamide
foscarnet
troleandomycin
salsalate
hexobarbital
azithromycin
modafinil
repaglinide
fluconazole
edrophonium
\.


--
-- Data for Name: drug_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drug_category (drug_category_id, drug_category_name) FROM stdin;
1	Abortifacient agents
2	Abortifacient agents, nonsteroidal
3	Allylamines
4	Analgesics
5	Analgesics, non-narcotic
6	Anorexigenic agents
7	Anti-bacterial agents
8	Anti-hiv agents
9	Anti-infective agents
10	Anti-infectives
11	Anti-inflammatory agents
12	Anti-inflammatory agents, non-steroidal
13	Anti-obesity agents
14	Anti-ulcer agents
15	Antibacterial agents
16	Antibiotics
17	Antibiotics, antifungal
18	Antibiotics, antineoplastic
19	Antibiotics, antitubercular
20	Anticholesteremic agents
21	Anticoagulants
22	Anticonvulsants
23	Antiemetics
24	Antifungal agents
25	Antifungals
26	Antihypertensive agents
27	Antilipemic agents
28	Antimanic agents
29	Antimetabolites
30	Antimetabolites, antineoplastic
31	Antineoplastic agents
32	Antiprotozoal agents
33	Antiprotozoals
34	Antirheumatic agents
35	Antituberculosis agents
36	Cardiovascular agents
37	Central nervous system agents
38	Central nervous system stimulants
39	Cholesterol absorption inhibitors
40	Cyclooxygenase inhibitors
41	Dermatologic agents
42	Dopamine antagonists
43	Enzyme inhibitors
44	Estrogens
45	Fibrinolytic agents
46	Folic acid antagonists
47	Gout suppressants
48	Hiv protease inhibitors
49	Hmg-coa reductase inhibitors
50	Hydroxymethylglutaryl-coa reductase inhibitors
51	Hypoglycemic agents
52	Immunomodulatory agents
53	Immunosuppressive agents
54	Ketolides
55	Leprostatic agents
56	Meglitinides
57	Neuroprotective agents
58	Nonnucleoside reverse transcriptase inhibitors
59	Nonsteroidal antiinflammatory agents(nsaids)
60	Nucleic acid synthesis inhibitors
61	Other macrolides
62	Platelet aggregation inhibitors
63	Prokinetic agents
64	Protease inhibitors
65	Protein synthesis inhibitors
66	Proton-pump inhibitors
67	Quinolones
68	Reverse transcriptase inhibitors
69	Salicylates
70	Stimulants
71	Sulfonamides
72	Tocolytic agents
73	Trypanocidal agents
74	Vasodilator agents
\.


--
-- Data for Name: drug_in_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drug_in_category (drug_name, drug_category_id) FROM stdin;
clarithromycin	65
terbinafine	43
azithromycin	61
modafinil	38
norfloxacin	7
lovastatin	49
itraconazole	24
methotrexate	53
posaconazole	17
indomethacin	36
methotrexate	34
metoclopramide	63
etodolac	59
simvastatin	27
rifampin	60
ketoprofen	40
troglitazone	74
terbinafine	24
methotrexate	31
lovastatin	50
metoclopramide	42
nabumetone	31
ezetimibe	20
etodolac	12
pravastatin	20
tacrolimus	53
modafinil	57
carbamazepine	22
atazanavir	8
sulfamethoxazole	9
glipizide	51
naproxen	47
piroxicam	12
simvastatin	20
sirolimus	7
simvastatin	50
methotrexate	60
sirolimus	53
ibuprofen	40
indomethacin	47
metoclopramide	23
pravastatin	49
rifampin	16
clarithromycin	61
azithromycin	7
itraconazole	32
cyclosporine	34
cyclosporine	24
lovastatin	31
telithromycin	54
cyclosporine	43
indomethacin	11
imipenem	7
orlistat	43
norfloxacin	10
erythromycin	7
rifampin	19
rifampin	35
oxcarbazepine	22
ibuprofen	59
pravastatin	50
ritonavir	8
posaconazole	73
efavirenz	58
ritonavir	48
methotrexate	46
indomethacin	12
rifampin	43
bosentan	26
ibuprofen	5
methotrexate	1
methotrexate	30
omeprazole	14
orlistat	13
ethotoin	22
atazanavir	64
methotrexate	41
terbinafine	3
cyclosporine	52
etodolac	40
rifampin	55
voriconazole	24
ezetimibe	39
aspirin	62
indomethacin	72
troglitazone	45
cyclosporine	41
modafinil	37
ethinyl estradiol	44
ketoprofen	12
quinupristin	15
sirolimus	18
cyclosporine	53
carbamazepine	4
sulfamethoxazole	71
sulfamethoxazole	10
efavirenz	68
indomethacin	40
terbinafine	73
nabumetone	12
naproxen	12
itraconazole	25
aspirin	12
voriconazole	25
indomethacin	59
rifabutin	7
efavirenz	8
repaglinide	51
rifabutin	19
troglitazone	31
methotrexate	43
carbamazepine	5
sirolimus	24
omeprazole	66
piroxicam	40
sirolimus	25
methotrexate	29
aspirin	21
methotrexate	2
repaglinide	56
carbamazepine	28
clarithromycin	7
ibuprofen	4
telithromycin	7
itraconazole	33
aspirin	40
terbinafine	25
modafinil	6
troglitazone	62
ibuprofen	11
omeprazole	43
aspirin	69
aspirin	45
norfloxacin	43
modafinil	70
atazanavir	48
naproxen	40
lovastatin	20
norfloxacin	60
ibuprofen	12
troglitazone	51
norfloxacin	67
\.


--
-- Data for Name: drug_interaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drug_interaction (drug_name_a, drug_name_b) FROM stdin;
efavirenz	cyclosporine
efavirenz	saquinavir
efavirenz	simvastatin
efavirenz	atorvastatin
efavirenz	clarithromycin
efavirenz	voriconazole
efavirenz	lovastatin
efavirenz	atazanavir
efavirenz	indinavir
atorvastatin	efavirenz
atorvastatin	tacrolimus
atorvastatin	rifampin
atorvastatin	bosentan
atorvastatin	nelfinavir
atorvastatin	saquinavir
atorvastatin	imatinib
atorvastatin	telithromycin
atorvastatin	ketoconazole
atorvastatin	quinupristin
atorvastatin	erythromycin
atorvastatin	cyclosporine
atorvastatin	verapamil
atorvastatin	diltiazem
atorvastatin	rifabutin
atorvastatin	itraconazole
atorvastatin	atazanavir
atorvastatin	ritonavir
atorvastatin	carbamazepine
atorvastatin	indinavir
atorvastatin	colchicine
atorvastatin	nefazodone
atorvastatin	fluconazole
atorvastatin	clarithromycin
atorvastatin	fosamprenavir
atorvastatin	amprenavir
muromonab	cyclosporine
mephenytoin	cyclosporine
mephenytoin	oxcarbazepine
mephenytoin	chloramphenicol
mephenytoin	hydrocortisone
mephenytoin	methotrexate
mephenytoin	rifampin
mephenytoin	ticlopidine
mephenytoin	itraconazole
mephenytoin	fluoxetine
mephenytoin	amiodarone
mephenytoin	ethinyl estradiol
mephenytoin	ciprofloxacin
mephenytoin	imatinib
mephenytoin	omeprazole
mephenytoin	fluconazole
caspofungin	cyclosporine
caspofungin	rifampin
ketoprofen	cyclosporine
ketoprofen	acenocoumarol
ketoprofen	methotrexate
ketoprofen	dicumarol
ketoprofen	anisindione
ketoprofen	warfarin
clindamycin	cyclosporine
cerivastatin	quinupristin
cerivastatin	erythromycin
cerivastatin	cyclosporine
cerivastatin	diltiazem
cerivastatin	rifampin
cerivastatin	rifabutin
cerivastatin	itraconazole
cerivastatin	bosentan
cerivastatin	colchicine
cerivastatin	nefazodone
cerivastatin	imatinib
cerivastatin	clarithromycin
cerivastatin	ketoconazole
ciprofloxacin	sevelamer
ciprofloxacin	fosphenytoin
ciprofloxacin	cyclosporine
ciprofloxacin	acenocoumarol
ciprofloxacin	methotrexate
ciprofloxacin	ethotoin
ciprofloxacin	dicumarol
ciprofloxacin	mephenytoin
ciprofloxacin	foscarnet
ciprofloxacin	anisindione
ciprofloxacin	warfarin
ciprofloxacin	phenytoin
amphotericin b	cyclosporine
sulindac	cyclosporine
sulindac	methotrexate
methylphenobarbital	griseofulvin
methylphenobarbital	cyclosporine
methylphenobarbital	ethinyl estradiol
methylphenobarbital	hydrocortisone
methylphenobarbital	nifedipine
dicumarol	fosphenytoin
dicumarol	chloramphenicol
dicumarol	lovastatin
dicumarol	etodolac
dicumarol	bosentan
dicumarol	ketoprofen
dicumarol	ethinyl estradiol
dicumarol	ciprofloxacin
dicumarol	diclofenac
dicumarol	indomethacin
dicumarol	griseofulvin
dicumarol	norfloxacin
dicumarol	rifabutin
dicumarol	itraconazole
dicumarol	phenobarbital
dicumarol	indinavir
dicumarol	oxaprozin
dicumarol	carbamazepine
dicumarol	danazol
dicumarol	nabumetone
dicumarol	amiodarone
dicumarol	fenoprofen
dicumarol	fosamprenavir
dicumarol	amprenavir
dicumarol	orlistat
dicumarol	colestipol
dicumarol	naproxen
dicumarol	glibenclamide
dicumarol	hydrocortisone
dicumarol	aspirin
dicumarol	rifampin
dicumarol	tenoxicam
dicumarol	phenytoin
dicumarol	cholestyramine
dicumarol	fluoxetine
dicumarol	nelfinavir
dicumarol	piroxicam
dicumarol	fluvastatin
dicumarol	imatinib
dicumarol	mefenamic acid
dicumarol	allopurinol
dicumarol	telithromycin
dicumarol	ketoconazole
dicumarol	primidone
dicumarol	erythromycin
dicumarol	flurbiprofen
dicumarol	propafenone
dicumarol	terbinafine
dicumarol	atazanavir
dicumarol	ibuprofen
dicumarol	azithromycin
dicumarol	clarithromycin
dicumarol	fluconazole
sibutramine	erythromycin
sibutramine	fluoxetine
sibutramine	nefazodone
sibutramine	cyclosporine
sibutramine	ketoconazole
glipizide	cyclosporine
glipizide	chloramphenicol
glipizide	aspirin
glipizide	carvedilol
glipizide	rifampin
glipizide	repaglinide
pentobarbital	griseofulvin
pentobarbital	cyclosporine
pentobarbital	ethinyl estradiol
pentobarbital	hydrocortisone
pentobarbital	nifedipine
probucol	cyclosporine
norfloxacin	cyclosporine
norfloxacin	acenocoumarol
norfloxacin	dicumarol
norfloxacin	foscarnet
norfloxacin	anisindione
norfloxacin	warfarin
methotrexate	fosphenytoin
methotrexate	nafcillin
methotrexate	naproxen
methotrexate	aspirin
methotrexate	mephenytoin
methotrexate	etodolac
methotrexate	phenytoin
methotrexate	ketoprofen
methotrexate	cholestyramine
methotrexate	piroxicam
methotrexate	sulfamethoxazole
methotrexate	ciprofloxacin
methotrexate	diclofenac
methotrexate	mefenamic acid
methotrexate	sulindac
methotrexate	omeprazole
methotrexate	indomethacin
methotrexate	cyclosporine
methotrexate	sulfadiazine
methotrexate	flurbiprofen
methotrexate	digoxin
methotrexate	ibuprofen
methotrexate	oxaprozin
methotrexate	salsalate
methotrexate	nabumetone
methotrexate	fenoprofen
methotrexate	ethotoin
methotrexate	meclofenamic acid
methotrexate	tolmetin
methotrexate	bismuth subsalicylate
rifabutin	acenocoumarol
rifabutin	atorvastatin
rifabutin	tacrolimus
rifabutin	lovastatin
rifabutin	saquinavir
rifabutin	cerivastatin
rifabutin	fluvastatin
rifabutin	ethinyl estradiol
rifabutin	dicumarol
rifabutin	anisindione
rifabutin	bupropion
rifabutin	erythromycin
rifabutin	cyclosporine
rifabutin	sirolimus
rifabutin	simvastatin
rifabutin	propafenone
rifabutin	voriconazole
rifabutin	itraconazole
rifabutin	atazanavir
rifabutin	ritonavir
rifabutin	warfarin
rifabutin	indinavir
rifabutin	posaconazole
rifabutin	mestranol
rifabutin	fluconazole
rifabutin	clarithromycin
rifabutin	fosamprenavir
rifabutin	amprenavir
neostigmine	hydrocortisone
indinavir	quinupristin
indinavir	efavirenz
indinavir	cyclosporine
indinavir	acenocoumarol
indinavir	atorvastatin
indinavir	tacrolimus
indinavir	rifampin
indinavir	rifabutin
indinavir	atazanavir
indinavir	carbamazepine
indinavir	warfarin
indinavir	saquinavir
indinavir	amiodarone
indinavir	omeprazole
indinavir	clarithromycin
indinavir	dicumarol
indinavir	ketoconazole
indinavir	anisindione
warfarin	fosphenytoin
warfarin	chloramphenicol
warfarin	lovastatin
warfarin	etodolac
warfarin	bosentan
warfarin	ketoprofen
warfarin	ethinyl estradiol
warfarin	ciprofloxacin
warfarin	diclofenac
warfarin	indomethacin
warfarin	griseofulvin
warfarin	norfloxacin
warfarin	rifabutin
warfarin	itraconazole
warfarin	phenobarbital
warfarin	indinavir
warfarin	oxaprozin
warfarin	carbamazepine
warfarin	danazol
warfarin	nabumetone
warfarin	amiodarone
warfarin	fenoprofen
warfarin	fosamprenavir
warfarin	amprenavir
warfarin	orlistat
warfarin	colestipol
warfarin	naproxen
warfarin	hydrocortisone
warfarin	aspirin
warfarin	rifampin
warfarin	tenoxicam
warfarin	phenytoin
warfarin	cholestyramine
warfarin	fluoxetine
warfarin	nelfinavir
warfarin	piroxicam
warfarin	fluvastatin
warfarin	imatinib
warfarin	mefenamic acid
warfarin	allopurinol
warfarin	telithromycin
warfarin	ketoconazole
warfarin	primidone
warfarin	erythromycin
warfarin	flurbiprofen
warfarin	propafenone
warfarin	terbinafine
warfarin	atazanavir
warfarin	ibuprofen
warfarin	azithromycin
warfarin	clarithromycin
warfarin	fluconazole
oxaprozin	cyclosporine
oxaprozin	acenocoumarol
oxaprozin	methotrexate
oxaprozin	dicumarol
oxaprozin	anisindione
oxaprozin	warfarin
posaconazole	fosphenytoin
posaconazole	cyclosporine
posaconazole	rifabutin
posaconazole	phenytoin
colchicine	erythromycin
colchicine	cyclosporine
colchicine	atorvastatin
colchicine	simvastatin
colchicine	verapamil
colchicine	lovastatin
colchicine	troleandomycin
colchicine	pravastatin
colchicine	cerivastatin
colchicine	fluvastatin
colchicine	rosuvastatin
colchicine	clarithromycin
colchicine	telithromycin
sevelamer	cyclosporine
sevelamer	ciprofloxacin
nefazodone	cyclosporine
nefazodone	cerivastatin
nefazodone	atorvastatin
nefazodone	tacrolimus
nefazodone	simvastatin
nefazodone	sibutramine
nefazodone	lovastatin
nefazodone	carbamazepine
nabumetone	cyclosporine
nabumetone	acenocoumarol
nabumetone	methotrexate
nabumetone	dicumarol
nabumetone	anisindione
nabumetone	warfarin
sulfinpyrazone	cyclosporine
sulfinpyrazone	aspirin
fenoprofen	cyclosporine
fenoprofen	acenocoumarol
fenoprofen	methotrexate
fenoprofen	dicumarol
fenoprofen	anisindione
fenoprofen	warfarin
troglitazone	cholestyramine
troglitazone	cyclosporine
troglitazone	ethinyl estradiol
ambenonium	hydrocortisone
methylphenidate	cyclosporine
methylphenidate	carbamazepine
sulfasalazine	cyclosporine
sulfasalazine	digoxin
fosamprenavir	cyclosporine
fosamprenavir	amiodarone
fosamprenavir	acenocoumarol
fosamprenavir	tacrolimus
fosamprenavir	simvastatin
fosamprenavir	atorvastatin
fosamprenavir	rifampin
fosamprenavir	rifabutin
fosamprenavir	dicumarol
fosamprenavir	lovastatin
fosamprenavir	anisindione
fosamprenavir	warfarin
bismuth subsalicylate	acetazolamide
bismuth subsalicylate	glibenclamide
bismuth subsalicylate	hydrocortisone
bismuth subsalicylate	methotrexate
bismuth subsalicylate	atazanavir
bismuth subsalicylate	amprenavir
oxcarbazepine	mestranol
oxcarbazepine	fosphenytoin
oxcarbazepine	cyclosporine
oxcarbazepine	ethinyl estradiol
oxcarbazepine	ethotoin
oxcarbazepine	mephenytoin
oxcarbazepine	phenytoin
orlistat	cyclosporine
orlistat	acenocoumarol
orlistat	dicumarol
orlistat	anisindione
orlistat	warfarin
colestipol	fluvastatin
colestipol	acenocoumarol
colestipol	digoxin
colestipol	ursodeoxycholic acid
colestipol	hydrocortisone
colestipol	dicumarol
colestipol	anisindione
colestipol	warfarin
nafcillin	cyclosporine
nafcillin	ethinyl estradiol
nafcillin	methotrexate
naproxen	cyclosporine
naproxen	acenocoumarol
naproxen	methotrexate
naproxen	dicumarol
naproxen	anisindione
naproxen	warfarin
glibenclamide	cyclosporine
glibenclamide	chloramphenicol
glibenclamide	aspirin
glibenclamide	repaglinide
glibenclamide	carvedilol
glibenclamide	rifampin
glibenclamide	dicumarol
glibenclamide	bosentan
glibenclamide	bismuth subsalicylate
glibenclamide	salsalate
hydrocortisone	fosphenytoin
hydrocortisone	midodrine
hydrocortisone	acenocoumarol
hydrocortisone	colestipol
hydrocortisone	aspirin
hydrocortisone	rifampin
hydrocortisone	mephenytoin
hydrocortisone	phenytoin
hydrocortisone	cholestyramine
hydrocortisone	butalbital
hydrocortisone	methohexital
hydrocortisone	methylphenobarbital
hydrocortisone	dicumarol
hydrocortisone	butabarbital
hydrocortisone	anisindione
hydrocortisone	primidone
hydrocortisone	butethal
hydrocortisone	pentobarbital
hydrocortisone	talbutal
hydrocortisone	phenobarbital
hydrocortisone	neostigmine
hydrocortisone	secobarbital
hydrocortisone	warfarin
hydrocortisone	salsalate
hydrocortisone	hexobarbital
hydrocortisone	ambenonium
hydrocortisone	ethotoin
hydrocortisone	pyridostigmine
hydrocortisone	edrophonium
hydrocortisone	bismuth subsalicylate
rifampin	fosphenytoin
rifampin	acenocoumarol
rifampin	atorvastatin
rifampin	tacrolimus
rifampin	chloramphenicol
rifampin	glibenclamide
rifampin	hydrocortisone
rifampin	mephenytoin
rifampin	lovastatin
rifampin	phenytoin
rifampin	caspofungin
rifampin	nelfinavir
rifampin	saquinavir
rifampin	cerivastatin
rifampin	fluvastatin
rifampin	ethinyl estradiol
rifampin	imatinib
rifampin	diclofenac
rifampin	dicumarol
rifampin	telithromycin
rifampin	ketoconazole
rifampin	anisindione
rifampin	bupropion
rifampin	erythromycin
rifampin	glipizide
rifampin	cyclosporine
rifampin	glimepiride
rifampin	sirolimus
rifampin	simvastatin
rifampin	propafenone
rifampin	verapamil
rifampin	diltiazem
rifampin	terbinafine
rifampin	voriconazole
rifampin	itraconazole
rifampin	atazanavir
rifampin	ritonavir
rifampin	indinavir
rifampin	warfarin
rifampin	mestranol
rifampin	amiodarone
rifampin	repaglinide
rifampin	fluconazole
rifampin	clarithromycin
rifampin	ethotoin
rifampin	fosamprenavir
rifampin	nifedipine
rifampin	amprenavir
carvedilol	indomethacin
carvedilol	fluoxetine
carvedilol	glipizide
carvedilol	cyclosporine
carvedilol	piroxicam
carvedilol	digoxin
carvedilol	verapamil
carvedilol	glibenclamide
carvedilol	repaglinide
carvedilol	ibuprofen
tenoxicam	cyclosporine
tenoxicam	acenocoumarol
tenoxicam	dicumarol
tenoxicam	anisindione
tenoxicam	warfarin
cholestyramine	fluvastatin
cholestyramine	acenocoumarol
cholestyramine	digoxin
cholestyramine	troglitazone
cholestyramine	ursodeoxycholic acid
cholestyramine	hydrocortisone
cholestyramine	methotrexate
cholestyramine	dicumarol
cholestyramine	ezetimibe
cholestyramine	anisindione
cholestyramine	warfarin
fluvastatin	colchicine
fluvastatin	cholestyramine
fluvastatin	cyclosporine
fluvastatin	acenocoumarol
fluvastatin	colestipol
fluvastatin	rifampin
fluvastatin	rifabutin
fluvastatin	fluconazole
fluvastatin	dicumarol
fluvastatin	anisindione
fluvastatin	warfarin
butalbital	griseofulvin
butalbital	cyclosporine
butalbital	ethinyl estradiol
butalbital	hydrocortisone
butalbital	nifedipine
ursodeoxycholic acid	cholestyramine
ursodeoxycholic acid	cyclosporine
ursodeoxycholic acid	ethinyl estradiol
ursodeoxycholic acid	colestipol
ezetimibe	cholestyramine
ezetimibe	cyclosporine
ketoconazole	cyclosporine
ketoconazole	glimepiride
ketoconazole	acenocoumarol
ketoconazole	atorvastatin
ketoconazole	tacrolimus
ketoconazole	sirolimus
ketoconazole	simvastatin
ketoconazole	rifampin
ketoconazole	lovastatin
ketoconazole	ritonavir
ketoconazole	bosentan
ketoconazole	indinavir
ketoconazole	carbamazepine
ketoconazole	warfarin
ketoconazole	mestranol
ketoconazole	saquinavir
ketoconazole	cerivastatin
ketoconazole	ethinyl estradiol
ketoconazole	imatinib
ketoconazole	omeprazole
ketoconazole	dicumarol
ketoconazole	sibutramine
ketoconazole	anisindione
quinupristin	erythromycin
quinupristin	fosphenytoin
quinupristin	cyclosporine
quinupristin	atorvastatin
quinupristin	tacrolimus
quinupristin	simvastatin
quinupristin	verapamil
quinupristin	diltiazem
quinupristin	etoposide
quinupristin	lovastatin
quinupristin	octreotide
quinupristin	nicardipine
quinupristin	ritonavir
quinupristin	foscarnet
quinupristin	indinavir
quinupristin	carbamazepine
quinupristin	cerivastatin
quinupristin	clarithromycin
quinupristin	nifedipine
bupropion	cyclosporine
bupropion	rifampin
bupropion	rifabutin
bupropion	ritonavir
bupropion	carbamazepine
sulfadiazine	fosphenytoin
sulfadiazine	cyclosporine
sulfadiazine	methotrexate
sulfadiazine	phenytoin
glimepiride	cyclosporine
glimepiride	rifampin
glimepiride	repaglinide
glimepiride	ketoconazole
digoxin	erythromycin
digoxin	cyclosporine
digoxin	colestipol
digoxin	propafenone
digoxin	verapamil
digoxin	methotrexate
digoxin	carvedilol
digoxin	itraconazole
digoxin	ritonavir
digoxin	cholestyramine
digoxin	amiodarone
digoxin	sulfasalazine
digoxin	clarithromycin
digoxin	telithromycin
terbinafine	cyclosporine
terbinafine	acenocoumarol
terbinafine	rifampin
terbinafine	dicumarol
terbinafine	anisindione
terbinafine	warfarin
voriconazole	primidone
voriconazole	fosphenytoin
voriconazole	efavirenz
voriconazole	cyclosporine
voriconazole	rifampin
voriconazole	rifabutin
voriconazole	omeprazole
voriconazole	phenobarbital
voriconazole	bosentan
voriconazole	carbamazepine
voriconazole	phenytoin
atazanavir	efavirenz
atazanavir	cyclosporine
atazanavir	acenocoumarol
atazanavir	atorvastatin
atazanavir	tacrolimus
atazanavir	sirolimus
atazanavir	simvastatin
atazanavir	diltiazem
atazanavir	rifampin
atazanavir	rifabutin
atazanavir	lovastatin
atazanavir	ritonavir
atazanavir	indinavir
atazanavir	warfarin
atazanavir	amiodarone
atazanavir	omeprazole
atazanavir	clarithromycin
atazanavir	dicumarol
atazanavir	anisindione
atazanavir	bismuth subsalicylate
ritonavir	quinupristin
ritonavir	bupropion
ritonavir	erythromycin
ritonavir	cyclosporine
ritonavir	atorvastatin
ritonavir	digoxin
ritonavir	propafenone
ritonavir	diltiazem
ritonavir	rifampin
ritonavir	rifabutin
ritonavir	itraconazole
ritonavir	atazanavir
ritonavir	lovastatin
ritonavir	carbamazepine
ritonavir	fluoxetine
ritonavir	piroxicam
ritonavir	amiodarone
ritonavir	ethinyl estradiol
ritonavir	ketoconazole
secobarbital	griseofulvin
secobarbital	cyclosporine
secobarbital	ethinyl estradiol
secobarbital	hydrocortisone
secobarbital	nifedipine
ibuprofen	cyclosporine
ibuprofen	acenocoumarol
ibuprofen	aspirin
ibuprofen	methotrexate
ibuprofen	carvedilol
ibuprofen	dicumarol
ibuprofen	anisindione
ibuprofen	warfarin
mestranol	primidone
mestranol	fosphenytoin
mestranol	griseofulvin
mestranol	cyclosporine
mestranol	oxcarbazepine
mestranol	rifampin
mestranol	rifabutin
mestranol	itraconazole
mestranol	phenobarbital
mestranol	bosentan
mestranol	carbamazepine
mestranol	phenytoin
mestranol	nelfinavir
mestranol	modafinil
mestranol	ketoconazole
mestranol	amprenavir
clarithromycin	fosphenytoin
clarithromycin	efavirenz
clarithromycin	acenocoumarol
clarithromycin	atorvastatin
clarithromycin	tacrolimus
clarithromycin	rifampin
clarithromycin	lovastatin
clarithromycin	phenytoin
clarithromycin	fluoxetine
clarithromycin	cerivastatin
clarithromycin	imatinib
clarithromycin	dicumarol
clarithromycin	anisindione
clarithromycin	quinupristin
clarithromycin	cyclosporine
clarithromycin	digoxin
clarithromycin	sirolimus
clarithromycin	simvastatin
clarithromycin	rifabutin
clarithromycin	itraconazole
clarithromycin	atazanavir
clarithromycin	indinavir
clarithromycin	carbamazepine
clarithromycin	warfarin
clarithromycin	colchicine
clarithromycin	amiodarone
clarithromycin	repaglinide
ethotoin	cyclosporine
ethotoin	oxcarbazepine
ethotoin	chloramphenicol
ethotoin	hydrocortisone
ethotoin	methotrexate
ethotoin	rifampin
ethotoin	ticlopidine
ethotoin	itraconazole
ethotoin	fluoxetine
ethotoin	amiodarone
ethotoin	ethinyl estradiol
ethotoin	ciprofloxacin
ethotoin	imatinib
ethotoin	omeprazole
ethotoin	fluconazole
pyridostigmine	hydrocortisone
nifedipine	quinupristin
nifedipine	primidone
nifedipine	butethal
nifedipine	cyclosporine
nifedipine	pentobarbital
nifedipine	tacrolimus
nifedipine	rifampin
nifedipine	talbutal
nifedipine	phenobarbital
nifedipine	secobarbital
nifedipine	hexobarbital
nifedipine	imatinib
nifedipine	butalbital
nifedipine	methohexital
nifedipine	methylphenobarbital
nifedipine	butabarbital
fosphenytoin	oxcarbazepine
fosphenytoin	acenocoumarol
fosphenytoin	tacrolimus
fosphenytoin	chloramphenicol
fosphenytoin	hydrocortisone
fosphenytoin	rifampin
fosphenytoin	ticlopidine
fosphenytoin	fluoxetine
fosphenytoin	ethinyl estradiol
fosphenytoin	ciprofloxacin
fosphenytoin	imatinib
fosphenytoin	omeprazole
fosphenytoin	dicumarol
fosphenytoin	telithromycin
fosphenytoin	anisindione
fosphenytoin	quinupristin
fosphenytoin	cyclosporine
fosphenytoin	sulfadiazine
fosphenytoin	sirolimus
fosphenytoin	methotrexate
fosphenytoin	voriconazole
fosphenytoin	itraconazole
fosphenytoin	warfarin
fosphenytoin	posaconazole
fosphenytoin	mestranol
fosphenytoin	amiodarone
fosphenytoin	clarithromycin
fosphenytoin	fluconazole
tacrolimus	quinupristin
tacrolimus	erythromycin
tacrolimus	fosphenytoin
tacrolimus	cyclosporine
tacrolimus	atorvastatin
tacrolimus	chloramphenicol
tacrolimus	diltiazem
tacrolimus	rifampin
tacrolimus	rifabutin
tacrolimus	itraconazole
tacrolimus	atazanavir
tacrolimus	lovastatin
tacrolimus	indinavir
tacrolimus	phenytoin
tacrolimus	danazol
tacrolimus	nelfinavir
tacrolimus	nefazodone
tacrolimus	clarithromycin
tacrolimus	fluconazole
tacrolimus	telithromycin
tacrolimus	fosamprenavir
tacrolimus	ketoconazole
tacrolimus	nifedipine
tacrolimus	amprenavir
chloramphenicol	fosphenytoin
chloramphenicol	glipizide
chloramphenicol	cyclosporine
chloramphenicol	acenocoumarol
chloramphenicol	tacrolimus
chloramphenicol	glibenclamide
chloramphenicol	rifampin
chloramphenicol	mephenytoin
chloramphenicol	warfarin
chloramphenicol	phenytoin
chloramphenicol	ethotoin
chloramphenicol	dicumarol
chloramphenicol	anisindione
ticlopidine	fosphenytoin
ticlopidine	cyclosporine
ticlopidine	aspirin
ticlopidine	ethotoin
ticlopidine	mephenytoin
ticlopidine	carbamazepine
ticlopidine	phenytoin
lovastatin	efavirenz
lovastatin	acenocoumarol
lovastatin	tacrolimus
lovastatin	rifampin
lovastatin	bosentan
lovastatin	nelfinavir
lovastatin	imatinib
lovastatin	dicumarol
lovastatin	telithromycin
lovastatin	ketoconazole
lovastatin	anisindione
lovastatin	quinupristin
lovastatin	erythromycin
lovastatin	cyclosporine
lovastatin	verapamil
lovastatin	diltiazem
lovastatin	rifabutin
lovastatin	itraconazole
lovastatin	atazanavir
lovastatin	ritonavir
lovastatin	carbamazepine
lovastatin	warfarin
lovastatin	danazol
lovastatin	colchicine
lovastatin	nefazodone
lovastatin	azithromycin
lovastatin	clarithromycin
lovastatin	fluconazole
lovastatin	fosamprenavir
lovastatin	amprenavir
etodolac	cyclosporine
etodolac	acenocoumarol
etodolac	methotrexate
etodolac	dicumarol
etodolac	anisindione
etodolac	warfarin
octreotide	quinupristin
octreotide	cyclosporine
nicardipine	quinupristin
nicardipine	cyclosporine
bosentan	cyclosporine
bosentan	acenocoumarol
bosentan	atorvastatin
bosentan	simvastatin
bosentan	glibenclamide
bosentan	voriconazole
bosentan	itraconazole
bosentan	lovastatin
bosentan	warfarin
bosentan	mestranol
bosentan	cerivastatin
bosentan	ethinyl estradiol
bosentan	dicumarol
bosentan	ketoconazole
bosentan	anisindione
chloroquine	cyclosporine
ethinyl estradiol	fosphenytoin
ethinyl estradiol	oxcarbazepine
ethinyl estradiol	acenocoumarol
ethinyl estradiol	nafcillin
ethinyl estradiol	rifampin
ethinyl estradiol	mephenytoin
ethinyl estradiol	bosentan
ethinyl estradiol	phenytoin
ethinyl estradiol	nelfinavir
ethinyl estradiol	butalbital
ethinyl estradiol	ursodeoxycholic acid
ethinyl estradiol	methohexital
ethinyl estradiol	methylphenobarbital
ethinyl estradiol	dicumarol
ethinyl estradiol	butabarbital
ethinyl estradiol	ketoconazole
ethinyl estradiol	anisindione
ethinyl estradiol	primidone
ethinyl estradiol	butethal
ethinyl estradiol	griseofulvin
ethinyl estradiol	cyclosporine
ethinyl estradiol	pentobarbital
ethinyl estradiol	rifabutin
ethinyl estradiol	talbutal
ethinyl estradiol	itraconazole
ethinyl estradiol	phenobarbital
ethinyl estradiol	ritonavir
ethinyl estradiol	secobarbital
ethinyl estradiol	carbamazepine
ethinyl estradiol	warfarin
ethinyl estradiol	hexobarbital
ethinyl estradiol	troglitazone
ethinyl estradiol	modafinil
ethinyl estradiol	ethotoin
ethinyl estradiol	amprenavir
acetazolamide	cyclosporine
acetazolamide	aspirin
acetazolamide	bismuth subsalicylate
diclofenac	cyclosporine
diclofenac	methotrexate
diclofenac	rifampin
diclofenac	dicumarol
diclofenac	anisindione
diclofenac	warfarin
methohexital	griseofulvin
methohexital	cyclosporine
methohexital	ethinyl estradiol
methohexital	hydrocortisone
methohexital	nifedipine
omeprazole	fosphenytoin
omeprazole	cyclosporine
omeprazole	methotrexate
omeprazole	ethotoin
omeprazole	voriconazole
omeprazole	itraconazole
omeprazole	mephenytoin
omeprazole	atazanavir
omeprazole	ketoconazole
omeprazole	indinavir
omeprazole	phenytoin
butabarbital	griseofulvin
butabarbital	cyclosporine
butabarbital	ethinyl estradiol
butabarbital	hydrocortisone
butabarbital	nifedipine
indomethacin	cyclosporine
indomethacin	acenocoumarol
indomethacin	methotrexate
indomethacin	carvedilol
indomethacin	dicumarol
indomethacin	anisindione
indomethacin	warfarin
griseofulvin	primidone
griseofulvin	butethal
griseofulvin	cyclosporine
griseofulvin	pentobarbital
griseofulvin	acenocoumarol
griseofulvin	aspirin
griseofulvin	talbutal
griseofulvin	phenobarbital
griseofulvin	secobarbital
griseofulvin	warfarin
griseofulvin	mestranol
griseofulvin	hexobarbital
griseofulvin	ethinyl estradiol
griseofulvin	butalbital
griseofulvin	methohexital
griseofulvin	methylphenobarbital
griseofulvin	dicumarol
griseofulvin	butabarbital
griseofulvin	anisindione
cyclosporine	efavirenz
cyclosporine	atorvastatin
cyclosporine	muromonab
cyclosporine	mephenytoin
cyclosporine	caspofungin
cyclosporine	ketoprofen
cyclosporine	clindamycin
cyclosporine	cerivastatin
cyclosporine	ciprofloxacin
cyclosporine	amphotericin b
cyclosporine	sulindac
cyclosporine	methylphenobarbital
cyclosporine	sibutramine
cyclosporine	glipizide
cyclosporine	pentobarbital
cyclosporine	probucol
cyclosporine	norfloxacin
cyclosporine	methotrexate
cyclosporine	rifabutin
cyclosporine	indinavir
cyclosporine	oxaprozin
cyclosporine	posaconazole
cyclosporine	colchicine
cyclosporine	sevelamer
cyclosporine	nefazodone
cyclosporine	nabumetone
cyclosporine	sulfinpyrazone
cyclosporine	fenoprofen
cyclosporine	troglitazone
cyclosporine	methylphenidate
cyclosporine	sulfasalazine
cyclosporine	fosamprenavir
cyclosporine	oxcarbazepine
cyclosporine	orlistat
cyclosporine	naproxen
cyclosporine	glibenclamide
cyclosporine	nafcillin
cyclosporine	carvedilol
cyclosporine	rifampin
cyclosporine	tenoxicam
cyclosporine	fluvastatin
cyclosporine	butalbital
cyclosporine	ursodeoxycholic acid
cyclosporine	ezetimibe
cyclosporine	ketoconazole
cyclosporine	quinupristin
cyclosporine	bupropion
cyclosporine	sulfadiazine
cyclosporine	glimepiride
cyclosporine	digoxin
cyclosporine	terbinafine
cyclosporine	voriconazole
cyclosporine	atazanavir
cyclosporine	ritonavir
cyclosporine	secobarbital
cyclosporine	ibuprofen
cyclosporine	mestranol
cyclosporine	clarithromycin
cyclosporine	ethotoin
cyclosporine	nifedipine
cyclosporine	fosphenytoin
cyclosporine	chloramphenicol
cyclosporine	tacrolimus
cyclosporine	ticlopidine
cyclosporine	lovastatin
cyclosporine	etodolac
cyclosporine	nicardipine
cyclosporine	octreotide
cyclosporine	bosentan
cyclosporine	chloroquine
cyclosporine	acetazolamide
cyclosporine	ethinyl estradiol
cyclosporine	diclofenac
cyclosporine	methohexital
cyclosporine	omeprazole
cyclosporine	butabarbital
cyclosporine	indomethacin
cyclosporine	griseofulvin
cyclosporine	diltiazem
cyclosporine	etoposide
cyclosporine	talbutal
cyclosporine	itraconazole
cyclosporine	phenobarbital
cyclosporine	carbamazepine
cyclosporine	danazol
cyclosporine	pravastatin
cyclosporine	amiodarone
cyclosporine	rosuvastatin
cyclosporine	metoclopramide
cyclosporine	meclofenamic acid
cyclosporine	tolmetin
cyclosporine	amprenavir
cyclosporine	melphalan
cyclosporine	phenytoin
cyclosporine	fluoxetine
cyclosporine	nelfinavir
cyclosporine	saquinavir
cyclosporine	piroxicam
cyclosporine	sulfamethoxazole
cyclosporine	imatinib
cyclosporine	roxithromycin
cyclosporine	mefenamic acid
cyclosporine	allopurinol
cyclosporine	telithromycin
cyclosporine	primidone
cyclosporine	erythromycin
cyclosporine	butethal
cyclosporine	flurbiprofen
cyclosporine	sirolimus
cyclosporine	imipenem
cyclosporine	simvastatin
cyclosporine	propafenone
cyclosporine	verapamil
cyclosporine	cilastatin
cyclosporine	pyrazinamide
cyclosporine	foscarnet
cyclosporine	troleandomycin
cyclosporine	hexobarbital
cyclosporine	azithromycin
cyclosporine	modafinil
cyclosporine	repaglinide
cyclosporine	fluconazole
diltiazem	quinupristin
diltiazem	cyclosporine
diltiazem	atorvastatin
diltiazem	tacrolimus
diltiazem	sirolimus
diltiazem	simvastatin
diltiazem	rifampin
diltiazem	atazanavir
diltiazem	lovastatin
diltiazem	ritonavir
diltiazem	carbamazepine
diltiazem	cerivastatin
diltiazem	amiodarone
etoposide	quinupristin
etoposide	cyclosporine
talbutal	griseofulvin
talbutal	cyclosporine
talbutal	ethinyl estradiol
talbutal	hydrocortisone
talbutal	nifedipine
itraconazole	fosphenytoin
itraconazole	acenocoumarol
itraconazole	atorvastatin
itraconazole	tacrolimus
itraconazole	rifampin
itraconazole	mephenytoin
itraconazole	lovastatin
itraconazole	bosentan
itraconazole	phenytoin
itraconazole	cerivastatin
itraconazole	ethinyl estradiol
itraconazole	imatinib
itraconazole	omeprazole
itraconazole	dicumarol
itraconazole	anisindione
itraconazole	erythromycin
itraconazole	cyclosporine
itraconazole	digoxin
itraconazole	sirolimus
itraconazole	simvastatin
itraconazole	rifabutin
itraconazole	phenobarbital
itraconazole	ritonavir
itraconazole	carbamazepine
itraconazole	warfarin
itraconazole	mestranol
itraconazole	clarithromycin
itraconazole	ethotoin
phenobarbital	griseofulvin
phenobarbital	cyclosporine
phenobarbital	acenocoumarol
phenobarbital	verapamil
phenobarbital	hydrocortisone
phenobarbital	itraconazole
phenobarbital	voriconazole
phenobarbital	warfarin
phenobarbital	mestranol
phenobarbital	ethinyl estradiol
phenobarbital	imatinib
phenobarbital	dicumarol
phenobarbital	anisindione
phenobarbital	nifedipine
carbamazepine	acenocoumarol
carbamazepine	atorvastatin
carbamazepine	ticlopidine
carbamazepine	lovastatin
carbamazepine	fluoxetine
carbamazepine	ethinyl estradiol
carbamazepine	imatinib
carbamazepine	dicumarol
carbamazepine	telithromycin
carbamazepine	ketoconazole
carbamazepine	anisindione
carbamazepine	quinupristin
carbamazepine	bupropion
carbamazepine	erythromycin
carbamazepine	cyclosporine
carbamazepine	simvastatin
carbamazepine	verapamil
carbamazepine	diltiazem
carbamazepine	itraconazole
carbamazepine	voriconazole
carbamazepine	ritonavir
carbamazepine	troleandomycin
carbamazepine	indinavir
carbamazepine	warfarin
carbamazepine	danazol
carbamazepine	mestranol
carbamazepine	nefazodone
carbamazepine	methylphenidate
carbamazepine	clarithromycin
carbamazepine	fluconazole
danazol	cyclosporine
danazol	acenocoumarol
danazol	tacrolimus
danazol	dicumarol
danazol	lovastatin
danazol	anisindione
danazol	carbamazepine
danazol	warfarin
pravastatin	colchicine
pravastatin	cyclosporine
amiodarone	erythromycin
amiodarone	fosphenytoin
amiodarone	cyclosporine
amiodarone	acenocoumarol
amiodarone	digoxin
amiodarone	simvastatin
amiodarone	diltiazem
amiodarone	rifampin
amiodarone	mephenytoin
amiodarone	atazanavir
amiodarone	ritonavir
amiodarone	indinavir
amiodarone	warfarin
amiodarone	phenytoin
amiodarone	nelfinavir
amiodarone	saquinavir
amiodarone	clarithromycin
amiodarone	ethotoin
amiodarone	dicumarol
amiodarone	telithromycin
amiodarone	fosamprenavir
amiodarone	anisindione
amiodarone	amprenavir
rosuvastatin	colchicine
rosuvastatin	cyclosporine
metoclopramide	cyclosporine
meclofenamic acid	cyclosporine
meclofenamic acid	methotrexate
tolmetin	cyclosporine
tolmetin	methotrexate
amprenavir	cyclosporine
amprenavir	acenocoumarol
amprenavir	atorvastatin
amprenavir	tacrolimus
amprenavir	simvastatin
amprenavir	rifampin
amprenavir	rifabutin
amprenavir	lovastatin
amprenavir	warfarin
amprenavir	mestranol
amprenavir	amiodarone
amprenavir	ethinyl estradiol
amprenavir	dicumarol
amprenavir	anisindione
amprenavir	bismuth subsalicylate
melphalan	cyclosporine
acenocoumarol	fosphenytoin
acenocoumarol	chloramphenicol
acenocoumarol	lovastatin
acenocoumarol	etodolac
acenocoumarol	bosentan
acenocoumarol	ketoprofen
acenocoumarol	ethinyl estradiol
acenocoumarol	ciprofloxacin
acenocoumarol	indomethacin
acenocoumarol	griseofulvin
acenocoumarol	norfloxacin
acenocoumarol	rifabutin
acenocoumarol	itraconazole
acenocoumarol	phenobarbital
acenocoumarol	indinavir
acenocoumarol	oxaprozin
acenocoumarol	carbamazepine
acenocoumarol	danazol
acenocoumarol	nabumetone
acenocoumarol	amiodarone
acenocoumarol	fenoprofen
acenocoumarol	fosamprenavir
acenocoumarol	amprenavir
acenocoumarol	orlistat
acenocoumarol	colestipol
acenocoumarol	naproxen
acenocoumarol	hydrocortisone
acenocoumarol	aspirin
acenocoumarol	rifampin
acenocoumarol	tenoxicam
acenocoumarol	phenytoin
acenocoumarol	cholestyramine
acenocoumarol	fluoxetine
acenocoumarol	nelfinavir
acenocoumarol	piroxicam
acenocoumarol	fluvastatin
acenocoumarol	imatinib
acenocoumarol	mefenamic acid
acenocoumarol	allopurinol
acenocoumarol	telithromycin
acenocoumarol	ketoconazole
acenocoumarol	primidone
acenocoumarol	erythromycin
acenocoumarol	flurbiprofen
acenocoumarol	propafenone
acenocoumarol	terbinafine
acenocoumarol	atazanavir
acenocoumarol	ibuprofen
acenocoumarol	azithromycin
acenocoumarol	clarithromycin
acenocoumarol	fluconazole
midodrine	hydrocortisone
aspirin	griseofulvin
aspirin	glipizide
aspirin	acenocoumarol
aspirin	glibenclamide
aspirin	hydrocortisone
aspirin	methotrexate
aspirin	ticlopidine
aspirin	ibuprofen
aspirin	warfarin
aspirin	sulfinpyrazone
aspirin	acetazolamide
aspirin	dicumarol
aspirin	anisindione
phenytoin	oxcarbazepine
phenytoin	acenocoumarol
phenytoin	chloramphenicol
phenytoin	tacrolimus
phenytoin	hydrocortisone
phenytoin	rifampin
phenytoin	ticlopidine
phenytoin	fluoxetine
phenytoin	ethinyl estradiol
phenytoin	ciprofloxacin
phenytoin	imatinib
phenytoin	omeprazole
phenytoin	dicumarol
phenytoin	telithromycin
phenytoin	anisindione
phenytoin	cyclosporine
phenytoin	sulfadiazine
phenytoin	sirolimus
phenytoin	methotrexate
phenytoin	itraconazole
phenytoin	voriconazole
phenytoin	warfarin
phenytoin	posaconazole
phenytoin	mestranol
phenytoin	amiodarone
phenytoin	clarithromycin
phenytoin	fluconazole
nelfinavir	cyclosporine
nelfinavir	acenocoumarol
nelfinavir	atorvastatin
nelfinavir	tacrolimus
nelfinavir	simvastatin
nelfinavir	rifampin
nelfinavir	lovastatin
nelfinavir	warfarin
nelfinavir	mestranol
nelfinavir	amiodarone
nelfinavir	ethinyl estradiol
nelfinavir	dicumarol
nelfinavir	anisindione
fluoxetine	erythromycin
fluoxetine	fosphenytoin
fluoxetine	cyclosporine
fluoxetine	acenocoumarol
fluoxetine	propafenone
fluoxetine	carvedilol
fluoxetine	mephenytoin
fluoxetine	ritonavir
fluoxetine	troleandomycin
fluoxetine	carbamazepine
fluoxetine	phenytoin
fluoxetine	warfarin
fluoxetine	clarithromycin
fluoxetine	ethotoin
fluoxetine	dicumarol
fluoxetine	sibutramine
fluoxetine	anisindione
saquinavir	efavirenz
saquinavir	cyclosporine
saquinavir	amiodarone
saquinavir	atorvastatin
saquinavir	rifampin
saquinavir	rifabutin
saquinavir	ketoconazole
saquinavir	indinavir
piroxicam	cyclosporine
piroxicam	acenocoumarol
piroxicam	methotrexate
piroxicam	carvedilol
piroxicam	dicumarol
piroxicam	ritonavir
piroxicam	anisindione
piroxicam	warfarin
sulfamethoxazole	cyclosporine
sulfamethoxazole	methotrexate
imatinib	erythromycin
imatinib	fosphenytoin
imatinib	cyclosporine
imatinib	acenocoumarol
imatinib	atorvastatin
imatinib	simvastatin
imatinib	rifampin
imatinib	itraconazole
imatinib	phenobarbital
imatinib	mephenytoin
imatinib	lovastatin
imatinib	carbamazepine
imatinib	phenytoin
imatinib	warfarin
imatinib	cerivastatin
imatinib	clarithromycin
imatinib	ethotoin
imatinib	dicumarol
imatinib	ketoconazole
imatinib	anisindione
imatinib	nifedipine
mefenamic acid	cyclosporine
mefenamic acid	acenocoumarol
mefenamic acid	methotrexate
mefenamic acid	dicumarol
mefenamic acid	anisindione
mefenamic acid	warfarin
roxithromycin	cyclosporine
allopurinol	cyclosporine
allopurinol	acenocoumarol
allopurinol	dicumarol
allopurinol	anisindione
allopurinol	warfarin
telithromycin	fosphenytoin
telithromycin	cyclosporine
telithromycin	acenocoumarol
telithromycin	atorvastatin
telithromycin	digoxin
telithromycin	tacrolimus
telithromycin	simvastatin
telithromycin	verapamil
telithromycin	rifampin
telithromycin	lovastatin
telithromycin	carbamazepine
telithromycin	phenytoin
telithromycin	warfarin
telithromycin	colchicine
telithromycin	amiodarone
telithromycin	dicumarol
telithromycin	anisindione
anisindione	fosphenytoin
anisindione	chloramphenicol
anisindione	lovastatin
anisindione	etodolac
anisindione	bosentan
anisindione	ketoprofen
anisindione	ethinyl estradiol
anisindione	ciprofloxacin
anisindione	diclofenac
anisindione	indomethacin
anisindione	griseofulvin
anisindione	norfloxacin
anisindione	rifabutin
anisindione	itraconazole
anisindione	phenobarbital
anisindione	indinavir
anisindione	oxaprozin
anisindione	carbamazepine
anisindione	danazol
anisindione	nabumetone
anisindione	amiodarone
anisindione	fenoprofen
anisindione	fosamprenavir
anisindione	amprenavir
anisindione	orlistat
anisindione	colestipol
anisindione	naproxen
anisindione	hydrocortisone
anisindione	aspirin
anisindione	rifampin
anisindione	tenoxicam
anisindione	phenytoin
anisindione	cholestyramine
anisindione	fluoxetine
anisindione	nelfinavir
anisindione	piroxicam
anisindione	fluvastatin
anisindione	imatinib
anisindione	mefenamic acid
anisindione	allopurinol
anisindione	telithromycin
anisindione	ketoconazole
anisindione	primidone
anisindione	erythromycin
anisindione	flurbiprofen
anisindione	propafenone
anisindione	terbinafine
anisindione	atazanavir
anisindione	ibuprofen
anisindione	azithromycin
anisindione	clarithromycin
anisindione	fluconazole
primidone	mestranol
primidone	griseofulvin
primidone	cyclosporine
primidone	acenocoumarol
primidone	ethinyl estradiol
primidone	verapamil
primidone	hydrocortisone
primidone	dicumarol
primidone	voriconazole
primidone	anisindione
primidone	nifedipine
primidone	warfarin
erythromycin	acenocoumarol
erythromycin	atorvastatin
erythromycin	tacrolimus
erythromycin	rifampin
erythromycin	lovastatin
erythromycin	fluoxetine
erythromycin	cerivastatin
erythromycin	imatinib
erythromycin	dicumarol
erythromycin	sibutramine
erythromycin	anisindione
erythromycin	quinupristin
erythromycin	cyclosporine
erythromycin	digoxin
erythromycin	sirolimus
erythromycin	simvastatin
erythromycin	verapamil
erythromycin	rifabutin
erythromycin	itraconazole
erythromycin	ritonavir
erythromycin	carbamazepine
erythromycin	warfarin
erythromycin	colchicine
erythromycin	amiodarone
erythromycin	repaglinide
butethal	griseofulvin
butethal	cyclosporine
butethal	ethinyl estradiol
butethal	hydrocortisone
butethal	nifedipine
flurbiprofen	cyclosporine
flurbiprofen	acenocoumarol
flurbiprofen	methotrexate
flurbiprofen	dicumarol
flurbiprofen	anisindione
flurbiprofen	warfarin
simvastatin	quinupristin
simvastatin	erythromycin
simvastatin	efavirenz
simvastatin	cyclosporine
simvastatin	diltiazem
simvastatin	rifampin
simvastatin	rifabutin
simvastatin	itraconazole
simvastatin	atazanavir
simvastatin	bosentan
simvastatin	carbamazepine
simvastatin	colchicine
simvastatin	nelfinavir
simvastatin	nefazodone
simvastatin	amiodarone
simvastatin	imatinib
simvastatin	clarithromycin
simvastatin	fluconazole
simvastatin	telithromycin
simvastatin	fosamprenavir
simvastatin	ketoconazole
simvastatin	amprenavir
sirolimus	erythromycin
sirolimus	fosphenytoin
sirolimus	cyclosporine
sirolimus	diltiazem
sirolimus	rifampin
sirolimus	rifabutin
sirolimus	clarithromycin
sirolimus	itraconazole
sirolimus	atazanavir
sirolimus	ketoconazole
sirolimus	phenytoin
imipenem	cyclosporine
verapamil	quinupristin
verapamil	primidone
verapamil	erythromycin
verapamil	cyclosporine
verapamil	atorvastatin
verapamil	digoxin
verapamil	carvedilol
verapamil	rifampin
verapamil	phenobarbital
verapamil	lovastatin
verapamil	carbamazepine
verapamil	colchicine
verapamil	telithromycin
propafenone	fluoxetine
propafenone	cyclosporine
propafenone	acenocoumarol
propafenone	digoxin
propafenone	rifampin
propafenone	rifabutin
propafenone	dicumarol
propafenone	ritonavir
propafenone	anisindione
propafenone	warfarin
cilastatin	cyclosporine
foscarnet	quinupristin
foscarnet	cyclosporine
foscarnet	norfloxacin
foscarnet	ciprofloxacin
troleandomycin	colchicine
troleandomycin	fluoxetine
troleandomycin	cyclosporine
troleandomycin	carbamazepine
pyrazinamide	cyclosporine
salsalate	glibenclamide
salsalate	hydrocortisone
salsalate	methotrexate
hexobarbital	griseofulvin
hexobarbital	cyclosporine
hexobarbital	ethinyl estradiol
hexobarbital	hydrocortisone
hexobarbital	nifedipine
azithromycin	cyclosporine
azithromycin	acenocoumarol
azithromycin	dicumarol
azithromycin	lovastatin
azithromycin	anisindione
azithromycin	warfarin
modafinil	mestranol
modafinil	cyclosporine
modafinil	ethinyl estradiol
repaglinide	erythromycin
repaglinide	glipizide
repaglinide	cyclosporine
repaglinide	glimepiride
repaglinide	glibenclamide
repaglinide	carvedilol
repaglinide	rifampin
repaglinide	clarithromycin
fluconazole	fosphenytoin
fluconazole	cyclosporine
fluconazole	acenocoumarol
fluconazole	atorvastatin
fluconazole	tacrolimus
fluconazole	simvastatin
fluconazole	rifampin
fluconazole	rifabutin
fluconazole	mephenytoin
fluconazole	lovastatin
fluconazole	carbamazepine
fluconazole	phenytoin
fluconazole	warfarin
fluconazole	fluvastatin
fluconazole	ethotoin
fluconazole	dicumarol
fluconazole	anisindione
edrophonium	hydrocortisone
\.


--
-- Data for Name: drug_side_effects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drug_side_effects (drug_name, side_effect_id) FROM stdin;
efavirenz	1165
efavirenz	46
efavirenz	530
efavirenz	173
efavirenz	1100
efavirenz	1069
efavirenz	26
efavirenz	735
efavirenz	44
efavirenz	283
efavirenz	230
efavirenz	136
efavirenz	373
efavirenz	98
efavirenz	963
efavirenz	101
efavirenz	702
efavirenz	1053
efavirenz	414
efavirenz	246
efavirenz	531
efavirenz	304
efavirenz	831
efavirenz	415
efavirenz	385
efavirenz	616
efavirenz	532
efavirenz	6
efavirenz	777
efavirenz	911
efavirenz	396
efavirenz	1141
efavirenz	584
efavirenz	795
efavirenz	638
efavirenz	386
efavirenz	1119
efavirenz	705
efavirenz	1157
efavirenz	961
efavirenz	72
efavirenz	547
efavirenz	809
efavirenz	54
efavirenz	679
efavirenz	229
efavirenz	813
efavirenz	863
efavirenz	496
efavirenz	289
efavirenz	962
efavirenz	1026
efavirenz	281
efavirenz	798
efavirenz	423
efavirenz	924
efavirenz	871
efavirenz	864
efavirenz	557
efavirenz	467
efavirenz	872
efavirenz	449
efavirenz	980
efavirenz	814
efavirenz	925
efavirenz	1159
efavirenz	68
efavirenz	490
efavirenz	22
efavirenz	450
efavirenz	621
efavirenz	1094
efavirenz	641
efavirenz	424
efavirenz	417
efavirenz	384
efavirenz	79
efavirenz	1219
efavirenz	802
efavirenz	236
efavirenz	328
efavirenz	728
efavirenz	879
efavirenz	844
efavirenz	681
efavirenz	614
efavirenz	908
efavirenz	709
efavirenz	184
efavirenz	630
efavirenz	727
efavirenz	436
efavirenz	353
efavirenz	782
efavirenz	815
efavirenz	357
efavirenz	1124
efavirenz	75
efavirenz	333
efavirenz	62
efavirenz	395
efavirenz	71
efavirenz	613
efavirenz	86
efavirenz	370
efavirenz	303
efavirenz	1151
efavirenz	649
efavirenz	1095
efavirenz	238
efavirenz	493
efavirenz	1089
efavirenz	10
efavirenz	91
efavirenz	763
efavirenz	882
efavirenz	1093
efavirenz	529
efavirenz	668
efavirenz	1087
efavirenz	309
efavirenz	278
efavirenz	922
efavirenz	729
oxcarbazepine	488
oxcarbazepine	380
oxcarbazepine	1165
oxcarbazepine	505
oxcarbazepine	24
oxcarbazepine	1100
oxcarbazepine	1069
oxcarbazepine	421
oxcarbazepine	244
oxcarbazepine	466
oxcarbazepine	44
oxcarbazepine	874
oxcarbazepine	759
oxcarbazepine	312
oxcarbazepine	1216
oxcarbazepine	239
oxcarbazepine	1110
oxcarbazepine	500
oxcarbazepine	182
oxcarbazepine	1040
oxcarbazepine	736
oxcarbazepine	330
oxcarbazepine	998
oxcarbazepine	580
oxcarbazepine	39
oxcarbazepine	1007
oxcarbazepine	1215
oxcarbazepine	385
oxcarbazepine	388
oxcarbazepine	381
oxcarbazepine	1178
oxcarbazepine	595
oxcarbazepine	1141
oxcarbazepine	584
oxcarbazepine	45
oxcarbazepine	403
oxcarbazepine	875
oxcarbazepine	1172
oxcarbazepine	386
oxcarbazepine	1157
oxcarbazepine	70
oxcarbazepine	1104
oxcarbazepine	54
oxcarbazepine	573
oxcarbazepine	982
oxcarbazepine	878
oxcarbazepine	983
oxcarbazepine	334
oxcarbazepine	786
oxcarbazepine	339
oxcarbazepine	512
oxcarbazepine	336
oxcarbazepine	798
oxcarbazepine	1126
oxcarbazepine	871
oxcarbazepine	1212
oxcarbazepine	944
oxcarbazepine	609
oxcarbazepine	674
oxcarbazepine	198
oxcarbazepine	980
oxcarbazepine	925
oxcarbazepine	224
oxcarbazepine	487
oxcarbazepine	932
oxcarbazepine	30
oxcarbazepine	602
oxcarbazepine	859
oxcarbazepine	116
oxcarbazepine	621
oxcarbazepine	1022
oxcarbazepine	510
oxcarbazepine	1231
oxcarbazepine	420
oxcarbazepine	424
oxcarbazepine	717
oxcarbazepine	647
oxcarbazepine	328
oxcarbazepine	909
oxcarbazepine	148
oxcarbazepine	697
oxcarbazepine	1224
oxcarbazepine	1047
oxcarbazepine	347
oxcarbazepine	920
oxcarbazepine	453
oxcarbazepine	400
oxcarbazepine	324
oxcarbazepine	630
oxcarbazepine	436
oxcarbazepine	830
oxcarbazepine	1124
oxcarbazepine	338
oxcarbazepine	552
oxcarbazepine	367
oxcarbazepine	1123
oxcarbazepine	345
oxcarbazepine	333
oxcarbazepine	62
oxcarbazepine	395
oxcarbazepine	1209
oxcarbazepine	613
oxcarbazepine	1151
oxcarbazepine	649
oxcarbazepine	1130
oxcarbazepine	1225
oxcarbazepine	668
oxcarbazepine	262
oxcarbazepine	569
oxcarbazepine	1184
oxcarbazepine	589
oxcarbazepine	522
oxcarbazepine	835
oxcarbazepine	645
oxcarbazepine	232
oxcarbazepine	46
oxcarbazepine	1079
oxcarbazepine	965
oxcarbazepine	277
oxcarbazepine	132
oxcarbazepine	27
oxcarbazepine	1181
oxcarbazepine	735
oxcarbazepine	912
oxcarbazepine	327
oxcarbazepine	283
oxcarbazepine	821
oxcarbazepine	373
oxcarbazepine	560
oxcarbazepine	626
oxcarbazepine	98
oxcarbazepine	101
oxcarbazepine	963
oxcarbazepine	438
oxcarbazepine	810
oxcarbazepine	941
oxcarbazepine	1223
oxcarbazepine	290
oxcarbazepine	412
oxcarbazepine	99
oxcarbazepine	616
oxcarbazepine	544
oxcarbazepine	6
oxcarbazepine	186
oxcarbazepine	748
oxcarbazepine	80
oxcarbazepine	317
oxcarbazepine	696
oxcarbazepine	638
oxcarbazepine	906
oxcarbazepine	343
oxcarbazepine	585
oxcarbazepine	661
oxcarbazepine	72
oxcarbazepine	809
oxcarbazepine	688
oxcarbazepine	1009
oxcarbazepine	974
oxcarbazepine	685
oxcarbazepine	525
oxcarbazepine	229
oxcarbazepine	959
oxcarbazepine	509
oxcarbazepine	81
oxcarbazepine	623
oxcarbazepine	699
oxcarbazepine	496
oxcarbazepine	1109
oxcarbazepine	289
oxcarbazepine	605
oxcarbazepine	1074
oxcarbazepine	432
oxcarbazepine	864
oxcarbazepine	237
oxcarbazepine	462
oxcarbazepine	563
oxcarbazepine	1084
oxcarbazepine	1020
oxcarbazepine	601
oxcarbazepine	22
oxcarbazepine	14
oxcarbazepine	55
oxcarbazepine	938
oxcarbazepine	1092
oxcarbazepine	641
oxcarbazepine	708
oxcarbazepine	417
oxcarbazepine	79
oxcarbazepine	1219
oxcarbazepine	858
oxcarbazepine	236
oxcarbazepine	109
oxcarbazepine	162
oxcarbazepine	730
oxcarbazepine	728
oxcarbazepine	503
oxcarbazepine	593
oxcarbazepine	778
oxcarbazepine	206
oxcarbazepine	383
oxcarbazepine	1193
oxcarbazepine	1085
oxcarbazepine	357
oxcarbazepine	329
oxcarbazepine	303
oxcarbazepine	577
oxcarbazepine	1167
oxcarbazepine	238
oxcarbazepine	592
oxcarbazepine	315
oxcarbazepine	1045
oxcarbazepine	126
oxcarbazepine	91
oxcarbazepine	869
oxcarbazepine	763
oxcarbazepine	394
oxcarbazepine	1087
oxcarbazepine	278
oxcarbazepine	914
oxcarbazepine	141
oxcarbazepine	913
oxcarbazepine	698
oxcarbazepine	716
oxcarbazepine	280
oxcarbazepine	411
tacrolimus	191
tacrolimus	361
tacrolimus	1165
tacrolimus	1100
tacrolimus	1069
tacrolimus	1206
tacrolimus	244
tacrolimus	1078
tacrolimus	204
tacrolimus	157
tacrolimus	1149
tacrolimus	604
tacrolimus	541
tacrolimus	245
tacrolimus	1110
tacrolimus	1053
tacrolimus	182
tacrolimus	597
tacrolimus	580
tacrolimus	715
tacrolimus	615
tacrolimus	952
tacrolimus	1139
tacrolimus	385
tacrolimus	381
tacrolimus	127
tacrolimus	1178
tacrolimus	595
tacrolimus	396
tacrolimus	1141
tacrolimus	465
tacrolimus	978
tacrolimus	475
tacrolimus	945
tacrolimus	770
tacrolimus	564
tacrolimus	1157
tacrolimus	725
tacrolimus	1148
tacrolimus	70
tacrolimus	1104
tacrolimus	562
tacrolimus	54
tacrolimus	663
tacrolimus	669
tacrolimus	982
tacrolimus	267
tacrolimus	905
tacrolimus	799
tacrolimus	1161
tacrolimus	459
tacrolimus	339
tacrolimus	336
tacrolimus	798
tacrolimus	1060
tacrolimus	871
tacrolimus	545
tacrolimus	25
tacrolimus	29
tacrolimus	557
tacrolimus	793
tacrolimus	198
tacrolimus	872
tacrolimus	92
tacrolimus	582
tacrolimus	51
tacrolimus	1198
tacrolimus	156
tacrolimus	980
tacrolimus	814
tacrolimus	925
tacrolimus	224
tacrolimus	69
tacrolimus	287
tacrolimus	1195
tacrolimus	1051
tacrolimus	405
tacrolimus	556
tacrolimus	30
tacrolimus	855
tacrolimus	1008
tacrolimus	602
tacrolimus	996
tacrolimus	1057
tacrolimus	1135
tacrolimus	694
tacrolimus	450
tacrolimus	859
tacrolimus	804
tacrolimus	919
tacrolimus	116
tacrolimus	621
tacrolimus	348
tacrolimus	800
tacrolimus	314
tacrolimus	677
tacrolimus	326
tacrolimus	424
tacrolimus	717
tacrolimus	337
tacrolimus	675
tacrolimus	1073
tacrolimus	540
tacrolimus	857
tacrolimus	328
tacrolimus	909
tacrolimus	433
tacrolimus	1117
tacrolimus	1168
tacrolimus	897
tacrolimus	1047
tacrolimus	446
tacrolimus	453
tacrolimus	324
tacrolimus	918
tacrolimus	1163
tacrolimus	250
tacrolimus	65
tacrolimus	1194
tacrolimus	1196
tacrolimus	1056
tacrolimus	1124
tacrolimus	789
tacrolimus	915
tacrolimus	838
tacrolimus	345
tacrolimus	333
tacrolimus	823
tacrolimus	62
tacrolimus	1131
tacrolimus	1209
tacrolimus	86
tacrolimus	649
tacrolimus	534
tacrolimus	1179
tacrolimus	554
tacrolimus	848
tacrolimus	1130
tacrolimus	1225
tacrolimus	612
tacrolimus	1140
tacrolimus	882
tacrolimus	529
tacrolimus	668
tacrolimus	1160
tacrolimus	733
tacrolimus	1184
tacrolimus	589
tacrolimus	695
tacrolimus	899
tacrolimus	1
tacrolimus	344
tacrolimus	701
tacrolimus	46
tacrolimus	247
tacrolimus	910
tacrolimus	132
tacrolimus	277
tacrolimus	1181
tacrolimus	499
tacrolimus	283
tacrolimus	617
tacrolimus	234
tacrolimus	560
tacrolimus	316
tacrolimus	98
tacrolimus	963
tacrolimus	219
tacrolimus	438
tacrolimus	1218
tacrolimus	49
tacrolimus	567
tacrolimus	175
tacrolimus	926
tacrolimus	1152
tacrolimus	276
tacrolimus	99
tacrolimus	220
tacrolimus	599
tacrolimus	6
tacrolimus	63
tacrolimus	1033
tacrolimus	1030
tacrolimus	968
tacrolimus	995
tacrolimus	58
tacrolimus	620
tacrolimus	1190
tacrolimus	1023
tacrolimus	795
tacrolimus	696
tacrolimus	539
tacrolimus	636
tacrolimus	343
tacrolimus	407
tacrolimus	608
tacrolimus	585
tacrolimus	860
tacrolimus	72
tacrolimus	257
tacrolimus	809
tacrolimus	1054
tacrolimus	35
tacrolimus	974
tacrolimus	445
tacrolimus	229
tacrolimus	594
tacrolimus	509
tacrolimus	50
tacrolimus	623
tacrolimus	67
tacrolimus	170
tacrolimus	496
tacrolimus	289
tacrolimus	432
tacrolimus	864
tacrolimus	237
tacrolimus	462
tacrolimus	596
tacrolimus	928
tacrolimus	255
tacrolimus	559
tacrolimus	739
tacrolimus	1084
tacrolimus	145
tacrolimus	622
tacrolimus	275
tacrolimus	340
tacrolimus	1020
tacrolimus	687
tacrolimus	811
tacrolimus	66
tacrolimus	183
tacrolimus	22
tacrolimus	783
tacrolimus	904
tacrolimus	55
tacrolimus	938
tacrolimus	102
tacrolimus	11
tacrolimus	641
tacrolimus	708
tacrolimus	366
tacrolimus	1134
tacrolimus	79
tacrolimus	1219
tacrolimus	858
tacrolimus	236
tacrolimus	802
tacrolimus	162
tacrolimus	202
tacrolimus	166
tacrolimus	341
tacrolimus	730
tacrolimus	728
tacrolimus	402
tacrolimus	1038
tacrolimus	94
tacrolimus	279
tacrolimus	1200
tacrolimus	454
tacrolimus	627
tacrolimus	273
tacrolimus	497
tacrolimus	542
tacrolimus	1210
tacrolimus	624
tacrolimus	684
tacrolimus	1193
tacrolimus	1085
tacrolimus	782
tacrolimus	196
tacrolimus	357
tacrolimus	329
tacrolimus	303
tacrolimus	577
tacrolimus	93
tacrolimus	1176
tacrolimus	976
tacrolimus	238
tacrolimus	592
tacrolimus	315
tacrolimus	493
tacrolimus	1063
tacrolimus	208
tacrolimus	10
tacrolimus	91
tacrolimus	767
tacrolimus	763
tacrolimus	394
tacrolimus	434
tacrolimus	1032
tacrolimus	227
tacrolimus	1034
tacrolimus	914
tacrolimus	724
tacrolimus	587
tacrolimus	913
tacrolimus	1035
tacrolimus	259
tacrolimus	120
tacrolimus	456
tacrolimus	457
orlistat	872
orlistat	92
orlistat	645
orlistat	980
orlistat	628
orlistat	294
orlistat	418
orlistat	1181
orlistat	759
orlistat	163
orlistat	4
orlistat	116
orlistat	316
orlistat	641
orlistat	417
orlistat	1007
orlistat	76
orlistat	384
orlistat	322
orlistat	79
orlistat	1219
orlistat	831
orlistat	858
orlistat	6
orlistat	433
orlistat	180
orlistat	620
orlistat	1172
orlistat	65
orlistat	1193
orlistat	782
orlistat	1116
orlistat	984
orlistat	486
orlistat	345
orlistat	961
orlistat	70
orlistat	1148
orlistat	303
orlistat	93
orlistat	750
orlistat	54
orlistat	1064
orlistat	714
orlistat	496
orlistat	289
orlistat	836
orlistat	529
orlistat	668
orlistat	309
orlistat	798
orlistat	432
orlistat	864
orlistat	1184
orlistat	886
orlistat	589
orlistat	165
naproxen	191
naproxen	1165
naproxen	505
naproxen	958
naproxen	1100
naproxen	1069
naproxen	244
naproxen	157
naproxen	473
naproxen	604
naproxen	231
naproxen	883
naproxen	1110
naproxen	500
naproxen	245
naproxen	1107
naproxen	260
naproxen	998
naproxen	1055
naproxen	580
naproxen	1011
naproxen	392
naproxen	1215
naproxen	158
naproxen	476
naproxen	385
naproxen	381
naproxen	1178
naproxen	127
naproxen	264
naproxen	1086
naproxen	1141
naproxen	396
naproxen	153
naproxen	584
naproxen	1222
naproxen	475
naproxen	790
naproxen	770
naproxen	386
naproxen	460
naproxen	705
naproxen	749
naproxen	564
naproxen	1157
naproxen	700
naproxen	892
naproxen	70
naproxen	1104
naproxen	19
naproxen	562
naproxen	54
naproxen	1113
naproxen	669
naproxen	982
naproxen	799
naproxen	983
naproxen	512
naproxen	336
naproxen	798
naproxen	1126
naproxen	871
naproxen	806
naproxen	674
naproxen	872
naproxen	198
naproxen	92
naproxen	980
naproxen	925
naproxen	224
naproxen	69
naproxen	287
naproxen	487
naproxen	932
naproxen	1051
naproxen	405
naproxen	30
naproxen	1008
naproxen	602
naproxen	375
naproxen	804
naproxen	116
naproxen	1214
naproxen	934
naproxen	800
naproxen	314
naproxen	514
naproxen	326
naproxen	629
naproxen	873
naproxen	424
naproxen	717
naproxen	337
naproxen	675
naproxen	868
naproxen	652
naproxen	328
naproxen	909
naproxen	148
naproxen	697
naproxen	124
naproxen	433
naproxen	1047
naproxen	453
naproxen	324
naproxen	630
naproxen	918
naproxen	1163
naproxen	65
naproxen	933
naproxen	250
naproxen	203
naproxen	815
naproxen	889
naproxen	452
naproxen	367
naproxen	838
naproxen	345
naproxen	501
naproxen	333
naproxen	780
naproxen	62
naproxen	1131
naproxen	1209
naproxen	133
naproxen	86
naproxen	1151
naproxen	794
naproxen	649
naproxen	893
naproxen	1043
naproxen	633
naproxen	1130
naproxen	848
naproxen	1225
naproxen	389
naproxen	931
naproxen	882
naproxen	1021
naproxen	529
naproxen	668
naproxen	492
naproxen	144
naproxen	1184
naproxen	589
naproxen	899
naproxen	1
naproxen	816
naproxen	46
naproxen	247
naproxen	132
naproxen	95
naproxen	1181
naproxen	637
naproxen	912
naproxen	283
naproxen	136
naproxen	373
naproxen	234
naproxen	560
naproxen	376
naproxen	626
naproxen	316
naproxen	98
naproxen	18
naproxen	49
naproxen	175
naproxen	683
naproxen	1223
naproxen	290
naproxen	304
naproxen	1025
naproxen	648
naproxen	99
naproxen	616
naproxen	544
naproxen	6
naproxen	748
naproxen	995
naproxen	80
naproxen	795
naproxen	696
naproxen	179
naproxen	636
naproxen	670
naproxen	860
naproxen	257
naproxen	72
naproxen	809
naproxen	1054
naproxen	853
naproxen	974
naproxen	1019
naproxen	525
naproxen	229
naproxen	1144
naproxen	509
naproxen	623
naproxen	67
naproxen	496
naproxen	289
naproxen	444
naproxen	281
naproxen	640
naproxen	518
naproxen	432
naproxen	1074
naproxen	864
naproxen	237
naproxen	21
naproxen	563
naproxen	1084
naproxen	479
naproxen	145
naproxen	622
naproxen	430
naproxen	275
naproxen	1020
naproxen	687
naproxen	221
naproxen	1118
naproxen	1003
naproxen	551
naproxen	490
naproxen	66
naproxen	83
naproxen	22
naproxen	746
naproxen	783
naproxen	1166
naproxen	55
naproxen	1183
naproxen	393
naproxen	641
naproxen	708
naproxen	366
naproxen	384
naproxen	79
naproxen	1219
naproxen	858
naproxen	236
naproxen	802
naproxen	491
naproxen	1120
naproxen	202
naproxen	162
naproxen	341
naproxen	730
naproxen	728
naproxen	372
naproxen	951
naproxen	1200
naproxen	1182
naproxen	454
naproxen	187
naproxen	778
naproxen	497
naproxen	206
naproxen	383
naproxen	803
naproxen	1193
naproxen	1085
naproxen	782
naproxen	357
naproxen	455
naproxen	1199
naproxen	742
naproxen	20
naproxen	329
naproxen	303
naproxen	577
naproxen	1167
naproxen	93
naproxen	238
naproxen	1115
naproxen	1064
naproxen	493
naproxen	315
naproxen	515
naproxen	826
naproxen	10
naproxen	47
naproxen	91
naproxen	619
naproxen	767
naproxen	763
naproxen	394
naproxen	227
naproxen	999
naproxen	1034
naproxen	801
naproxen	914
naproxen	1136
naproxen	913
naproxen	292
naproxen	1180
naproxen	259
naproxen	698
naproxen	456
naproxen	457
aspirin	1165
aspirin	505
aspirin	1100
aspirin	1069
aspirin	26
aspirin	244
aspirin	284
aspirin	473
aspirin	807
aspirin	163
aspirin	1082
aspirin	1080
aspirin	231
aspirin	1110
aspirin	500
aspirin	260
aspirin	570
aspirin	385
aspirin	764
aspirin	777
aspirin	1141
aspirin	396
aspirin	1001
aspirin	790
aspirin	386
aspirin	705
aspirin	305
aspirin	700
aspirin	1157
aspirin	70
aspirin	1104
aspirin	562
aspirin	832
aspirin	54
aspirin	669
aspirin	878
aspirin	983
aspirin	682
aspirin	336
aspirin	798
aspirin	1126
aspirin	298
aspirin	871
aspirin	97
aspirin	29
aspirin	185
aspirin	929
aspirin	872
aspirin	198
aspirin	51
aspirin	92
aspirin	980
aspirin	937
aspirin	925
aspirin	932
aspirin	176
aspirin	602
aspirin	1214
aspirin	306
aspirin	873
aspirin	997
aspirin	424
aspirin	717
aspirin	675
aspirin	986
aspirin	652
aspirin	328
aspirin	148
aspirin	885
aspirin	433
aspirin	527
aspirin	453
aspirin	324
aspirin	436
aspirin	65
aspirin	838
aspirin	345
aspirin	501
aspirin	333
aspirin	395
aspirin	1209
aspirin	133
aspirin	215
aspirin	86
aspirin	1151
aspirin	649
aspirin	374
aspirin	1043
aspirin	893
aspirin	1130
aspirin	1031
aspirin	612
aspirin	882
aspirin	529
aspirin	668
aspirin	309
aspirin	144
aspirin	606
aspirin	1184
aspirin	589
aspirin	1052
aspirin	901
aspirin	46
aspirin	1010
aspirin	132
aspirin	654
aspirin	283
aspirin	657
aspirin	373
aspirin	560
aspirin	234
aspirin	626
aspirin	98
aspirin	219
aspirin	410
aspirin	1111
aspirin	290
aspirin	304
aspirin	32
aspirin	99
aspirin	6
aspirin	968
aspirin	995
aspirin	317
aspirin	696
aspirin	638
aspirin	930
aspirin	72
aspirin	257
aspirin	809
aspirin	35
aspirin	84
aspirin	974
aspirin	1017
aspirin	229
aspirin	948
aspirin	509
aspirin	67
aspirin	496
aspirin	289
aspirin	640
aspirin	432
aspirin	864
aspirin	622
aspirin	275
aspirin	1003
aspirin	752
aspirin	490
aspirin	66
aspirin	83
aspirin	22
aspirin	746
aspirin	211
aspirin	331
aspirin	55
aspirin	938
aspirin	1018
aspirin	641
aspirin	417
aspirin	706
aspirin	79
aspirin	1219
aspirin	236
aspirin	802
aspirin	202
aspirin	341
aspirin	730
aspirin	951
aspirin	755
aspirin	935
aspirin	497
aspirin	383
aspirin	603
aspirin	1002
aspirin	803
aspirin	1085
aspirin	782
aspirin	881
aspirin	214
aspirin	1199
aspirin	742
aspirin	535
aspirin	303
aspirin	269
aspirin	577
aspirin	216
aspirin	655
aspirin	238
aspirin	493
aspirin	315
aspirin	515
aspirin	826
aspirin	208
aspirin	47
aspirin	91
aspirin	394
aspirin	1032
aspirin	227
aspirin	999
aspirin	1087
aspirin	1034
aspirin	913
aspirin	1180
aspirin	716
aspirin	456
aspirin	692
rifampin	449
rifampin	980
rifampin	247
rifampin	224
rifampin	132
rifampin	373
rifampin	234
rifampin	626
rifampin	1214
rifampin	101
rifampin	963
rifampin	41
rifampin	219
rifampin	1070
rifampin	1072
rifampin	514
rifampin	1226
rifampin	708
rifampin	997
rifampin	424
rifampin	417
rifampin	615
rifampin	1223
rifampin	1219
rifampin	304
rifampin	652
rifampin	802
rifampin	202
rifampin	616
rifampin	385
rifampin	186
rifampin	777
rifampin	433
rifampin	995
rifampin	957
rifampin	266
rifampin	829
rifampin	463
rifampin	890
rifampin	37
rifampin	778
rifampin	436
rifampin	696
rifampin	300
rifampin	65
rifampin	803
rifampin	386
rifampin	407
rifampin	513
rifampin	1199
rifampin	501
rifampin	345
rifampin	333
rifampin	72
rifampin	303
rifampin	368
rifampin	1151
rifampin	35
rifampin	1043
rifampin	54
rifampin	1115
rifampin	974
rifampin	147
rifampin	669
rifampin	515
rifampin	525
rifampin	229
rifampin	1130
rifampin	47
rifampin	509
rifampin	378
rifampin	67
rifampin	1161
rifampin	496
rifampin	289
rifampin	529
rifampin	668
rifampin	1160
rifampin	1153
rifampin	798
rifampin	298
rifampin	891
rifampin	956
rifampin	432
rifampin	864
rifampin	1184
rifampin	650
lovastatin	198
lovastatin	872
lovastatin	92
lovastatin	901
lovastatin	745
lovastatin	247
lovastatin	814
lovastatin	980
lovastatin	902
lovastatin	490
lovastatin	284
lovastatin	689
lovastatin	373
lovastatin	807
lovastatin	626
lovastatin	98
lovastatin	352
lovastatin	211
lovastatin	55
lovastatin	182
lovastatin	1018
lovastatin	690
lovastatin	410
lovastatin	424
lovastatin	706
lovastatin	79
lovastatin	1219
lovastatin	744
lovastatin	236
lovastatin	802
lovastatin	990
lovastatin	574
lovastatin	202
lovastatin	385
lovastatin	328
lovastatin	730
lovastatin	6
lovastatin	777
lovastatin	1044
lovastatin	527
lovastatin	935
lovastatin	324
lovastatin	436
lovastatin	696
lovastatin	65
lovastatin	782
lovastatin	386
lovastatin	930
lovastatin	103
lovastatin	881
lovastatin	1157
lovastatin	1199
lovastatin	333
lovastatin	72
lovastatin	70
lovastatin	1209
lovastatin	834
lovastatin	535
lovastatin	303
lovastatin	1151
lovastatin	216
lovastatin	649
lovastatin	54
lovastatin	974
lovastatin	691
lovastatin	89
lovastatin	315
lovastatin	669
lovastatin	515
lovastatin	525
lovastatin	1130
lovastatin	826
lovastatin	208
lovastatin	713
lovastatin	91
lovastatin	619
lovastatin	67
lovastatin	878
lovastatin	882
lovastatin	496
lovastatin	289
lovastatin	529
lovastatin	668
lovastatin	798
lovastatin	295
lovastatin	144
lovastatin	432
lovastatin	864
lovastatin	1184
lovastatin	913
lovastatin	842
lovastatin	716
lovastatin	1052
lovastatin	557
lovastatin	929
etodolac	191
etodolac	816
etodolac	1165
etodolac	973
etodolac	505
etodolac	1100
etodolac	1069
etodolac	132
etodolac	912
etodolac	473
etodolac	283
etodolac	887
etodolac	373
etodolac	234
etodolac	560
etodolac	626
etodolac	253
etodolac	98
etodolac	231
etodolac	207
etodolac	1110
etodolac	500
etodolac	260
etodolac	385
etodolac	99
etodolac	6
etodolac	1178
etodolac	1141
etodolac	396
etodolac	995
etodolac	790
etodolac	696
etodolac	179
etodolac	386
etodolac	705
etodolac	1157
etodolac	72
etodolac	257
etodolac	70
etodolac	809
etodolac	1104
etodolac	656
etodolac	54
etodolac	974
etodolac	853
etodolac	669
etodolac	229
etodolac	509
etodolac	67
etodolac	983
etodolac	496
etodolac	289
etodolac	1026
etodolac	640
etodolac	336
etodolac	798
etodolac	1126
etodolac	871
etodolac	319
etodolac	432
etodolac	864
etodolac	674
etodolac	1187
etodolac	872
etodolac	980
etodolac	1020
etodolac	925
etodolac	224
etodolac	932
etodolac	1003
etodolac	66
etodolac	83
etodolac	602
etodolac	568
etodolac	1214
etodolac	746
etodolac	55
etodolac	873
etodolac	641
etodolac	997
etodolac	424
etodolac	717
etodolac	675
etodolac	79
etodolac	1219
etodolac	236
etodolac	652
etodolac	802
etodolac	162
etodolac	202
etodolac	328
etodolac	341
etodolac	728
etodolac	730
etodolac	909
etodolac	697
etodolac	1047
etodolac	951
etodolac	527
etodolac	453
etodolac	324
etodolac	630
etodolac	497
etodolac	436
etodolac	1210
etodolac	624
etodolac	383
etodolac	65
etodolac	803
etodolac	203
etodolac	1085
etodolac	838
etodolac	1199
etodolac	345
etodolac	501
etodolac	333
etodolac	742
etodolac	1209
etodolac	133
etodolac	86
etodolac	303
etodolac	577
etodolac	1167
etodolac	1151
etodolac	649
etodolac	374
etodolac	1043
etodolac	893
etodolac	238
etodolac	493
etodolac	315
etodolac	515
etodolac	1130
etodolac	208
etodolac	47
etodolac	882
etodolac	394
etodolac	227
etodolac	529
etodolac	999
etodolac	668
etodolac	1034
etodolac	144
etodolac	1184
etodolac	913
etodolac	259
bosentan	500
bosentan	525
bosentan	1130
bosentan	980
bosentan	966
bosentan	436
bosentan	417
bosentan	213
bosentan	797
bosentan	496
bosentan	972
bosentan	668
bosentan	56
bosentan	602
bosentan	345
bosentan	871
bosentan	328
bosentan	70
bosentan	577
bosentan	216
bosentan	54
bosentan	266
ketoprofen	1165
ketoprofen	505
ketoprofen	1100
ketoprofen	1069
ketoprofen	132
ketoprofen	95
ketoprofen	283
ketoprofen	821
ketoprofen	373
ketoprofen	163
ketoprofen	234
ketoprofen	231
ketoprofen	207
ketoprofen	1170
ketoprofen	1110
ketoprofen	500
ketoprofen	1053
ketoprofen	747
ketoprofen	304
ketoprofen	1025
ketoprofen	385
ketoprofen	6
ketoprofen	381
ketoprofen	1012
ketoprofen	595
ketoprofen	1141
ketoprofen	396
ketoprofen	995
ketoprofen	790
ketoprofen	386
ketoprofen	460
ketoprofen	906
ketoprofen	343
ketoprofen	407
ketoprofen	72
ketoprofen	809
ketoprofen	656
ketoprofen	840
ketoprofen	54
ketoprofen	853
ketoprofen	974
ketoprofen	1019
ketoprofen	669
ketoprofen	525
ketoprofen	229
ketoprofen	509
ketoprofen	623
ketoprofen	67
ketoprofen	983
ketoprofen	496
ketoprofen	289
ketoprofen	459
ketoprofen	640
ketoprofen	975
ketoprofen	682
ketoprofen	798
ketoprofen	1126
ketoprofen	518
ketoprofen	871
ketoprofen	432
ketoprofen	864
ketoprofen	806
ketoprofen	872
ketoprofen	1198
ketoprofen	92
ketoprofen	980
ketoprofen	1020
ketoprofen	224
ketoprofen	287
ketoprofen	405
ketoprofen	490
ketoprofen	996
ketoprofen	1214
ketoprofen	746
ketoprofen	1166
ketoprofen	904
ketoprofen	55
ketoprofen	331
ketoprofen	514
ketoprofen	641
ketoprofen	1219
ketoprofen	236
ketoprofen	652
ketoprofen	802
ketoprofen	202
ketoprofen	328
ketoprofen	730
ketoprofen	909
ketoprofen	1224
ketoprofen	1200
ketoprofen	453
ketoprofen	324
ketoprofen	497
ketoprofen	624
ketoprofen	383
ketoprofen	65
ketoprofen	803
ketoprofen	916
ketoprofen	1085
ketoprofen	782
ketoprofen	345
ketoprofen	333
ketoprofen	62
ketoprofen	742
ketoprofen	1209
ketoprofen	86
ketoprofen	303
ketoprofen	577
ketoprofen	1151
ketoprofen	649
ketoprofen	1043
ketoprofen	893
ketoprofen	493
ketoprofen	315
ketoprofen	167
ketoprofen	1130
ketoprofen	1225
ketoprofen	461
ketoprofen	47
ketoprofen	619
ketoprofen	763
ketoprofen	882
ketoprofen	529
ketoprofen	668
ketoprofen	1184
ketoprofen	913
ketoprofen	1035
ketoprofen	456
ketoprofen	1046
piroxicam	1165
piroxicam	505
piroxicam	1100
piroxicam	1069
piroxicam	132
piroxicam	473
piroxicam	283
piroxicam	234
piroxicam	560
piroxicam	626
piroxicam	98
piroxicam	231
piroxicam	48
piroxicam	1110
piroxicam	500
piroxicam	260
piroxicam	304
piroxicam	385
piroxicam	99
piroxicam	6
piroxicam	381
piroxicam	1141
piroxicam	396
piroxicam	995
piroxicam	790
piroxicam	696
piroxicam	386
piroxicam	705
piroxicam	1157
piroxicam	72
piroxicam	257
piroxicam	70
piroxicam	809
piroxicam	1104
piroxicam	562
piroxicam	840
piroxicam	54
piroxicam	974
piroxicam	669
piroxicam	229
piroxicam	509
piroxicam	67
piroxicam	983
piroxicam	496
piroxicam	289
piroxicam	1026
piroxicam	640
piroxicam	336
piroxicam	798
piroxicam	871
piroxicam	432
piroxicam	864
piroxicam	806
piroxicam	872
piroxicam	406
piroxicam	980
piroxicam	925
piroxicam	69
piroxicam	932
piroxicam	1003
piroxicam	83
piroxicam	602
piroxicam	746
piroxicam	55
piroxicam	873
piroxicam	641
piroxicam	424
piroxicam	717
piroxicam	675
piroxicam	79
piroxicam	1219
piroxicam	236
piroxicam	652
piroxicam	802
piroxicam	1101
piroxicam	328
piroxicam	341
piroxicam	730
piroxicam	223
piroxicam	433
piroxicam	951
piroxicam	453
piroxicam	935
piroxicam	630
piroxicam	497
piroxicam	383
piroxicam	65
piroxicam	803
piroxicam	1085
piroxicam	838
piroxicam	1199
piroxicam	345
piroxicam	501
piroxicam	333
piroxicam	742
piroxicam	1209
piroxicam	133
piroxicam	613
piroxicam	86
piroxicam	303
piroxicam	577
piroxicam	649
piroxicam	374
piroxicam	238
piroxicam	1039
piroxicam	493
piroxicam	315
piroxicam	515
piroxicam	1130
piroxicam	47
piroxicam	907
piroxicam	882
piroxicam	394
piroxicam	227
piroxicam	529
piroxicam	668
piroxicam	1034
piroxicam	144
piroxicam	1184
piroxicam	913
piroxicam	589
sulfamethoxazole	872
sulfamethoxazole	816
sulfamethoxazole	973
sulfamethoxazole	980
sulfamethoxazole	53
sulfamethoxazole	811
sulfamethoxazole	95
sulfamethoxazole	244
sulfamethoxazole	252
sulfamethoxazole	473
sulfamethoxazole	283
sulfamethoxazole	83
sulfamethoxazole	373
sulfamethoxazole	738
sulfamethoxazole	626
sulfamethoxazole	301
sulfamethoxazole	101
sulfamethoxazole	746
sulfamethoxazole	894
sulfamethoxazole	78
sulfamethoxazole	308
sulfamethoxazole	805
sulfamethoxazole	424
sulfamethoxazole	417
sulfamethoxazole	1223
sulfamethoxazole	384
sulfamethoxazole	1219
sulfamethoxazole	652
sulfamethoxazole	802
sulfamethoxazole	792
sulfamethoxazole	202
sulfamethoxazole	385
sulfamethoxazole	6
sulfamethoxazole	1027
sulfamethoxazole	595
sulfamethoxazole	1141
sulfamethoxazole	396
sulfamethoxazole	995
sulfamethoxazole	80
sulfamethoxazole	957
sulfamethoxazole	527
sulfamethoxazole	600
sulfamethoxazole	839
sulfamethoxazole	696
sulfamethoxazole	65
sulfamethoxazole	803
sulfamethoxazole	1085
sulfamethoxazole	782
sulfamethoxazole	386
sulfamethoxazole	838
sulfamethoxazole	333
sulfamethoxazole	72
sulfamethoxazole	70
sulfamethoxazole	809
sulfamethoxazole	1209
sulfamethoxazole	613
sulfamethoxazole	562
sulfamethoxazole	1151
sulfamethoxazole	368
sulfamethoxazole	649
sulfamethoxazole	238
sulfamethoxazole	54
sulfamethoxazole	1039
sulfamethoxazole	974
sulfamethoxazole	506
sulfamethoxazole	493
sulfamethoxazole	669
sulfamethoxazole	515
sulfamethoxazole	1130
sulfamethoxazole	208
sulfamethoxazole	47
sulfamethoxazole	91
sulfamethoxazole	67
sulfamethoxazole	496
sulfamethoxazole	1109
sulfamethoxazole	289
sulfamethoxazole	529
sulfamethoxazole	668
sulfamethoxazole	798
sulfamethoxazole	864
sulfamethoxazole	1184
sulfamethoxazole	913
sulfamethoxazole	458
sulfamethoxazole	758
sulfamethoxazole	589
sulfamethoxazole	716
ethinyl estradiol	191
ethinyl estradiol	768
ethinyl estradiol	380
ethinyl estradiol	247
ethinyl estradiol	1227
ethinyl estradiol	847
ethinyl estradiol	516
ethinyl estradiol	132
ethinyl estradiol	1181
ethinyl estradiol	244
ethinyl estradiol	157
ethinyl estradiol	759
ethinyl estradiol	286
ethinyl estradiol	137
ethinyl estradiol	1204
ethinyl estradiol	98
ethinyl estradiol	245
ethinyl estradiol	182
ethinyl estradiol	209
ethinyl estradiol	175
ethinyl estradiol	825
ethinyl estradiol	1007
ethinyl estradiol	290
ethinyl estradiol	59
ethinyl estradiol	987
ethinyl estradiol	158
ethinyl estradiol	142
ethinyl estradiol	437
ethinyl estradiol	1013
ethinyl estradiol	385
ethinyl estradiol	99
ethinyl estradiol	6
ethinyl estradiol	186
ethinyl estradiol	2
ethinyl estradiol	1186
ethinyl estradiol	748
ethinyl estradiol	397
ethinyl estradiol	1213
ethinyl estradiol	1190
ethinyl estradiol	155
ethinyl estradiol	364
ethinyl estradiol	943
ethinyl estradiol	1172
ethinyl estradiol	790
ethinyl estradiol	386
ethinyl estradiol	355
ethinyl estradiol	749
ethinyl estradiol	201
ethinyl estradiol	564
ethinyl estradiol	585
ethinyl estradiol	521
ethinyl estradiol	257
ethinyl estradiol	439
ethinyl estradiol	70
ethinyl estradiol	1148
ethinyl estradiol	809
ethinyl estradiol	1133
ethinyl estradiol	38
ethinyl estradiol	1054
ethinyl estradiol	54
ethinyl estradiol	427
ethinyl estradiol	679
ethinyl estradiol	669
ethinyl estradiol	100
ethinyl estradiol	861
ethinyl estradiol	862
ethinyl estradiol	623
ethinyl estradiol	496
ethinyl estradiol	1109
ethinyl estradiol	289
ethinyl estradiol	1189
ethinyl estradiol	1067
ethinyl estradiol	640
ethinyl estradiol	798
ethinyl estradiol	876
ethinyl estradiol	1212
ethinyl estradiol	969
ethinyl estradiol	432
ethinyl estradiol	864
ethinyl estradiol	545
ethinyl estradiol	274
ethinyl estradiol	872
ethinyl estradiol	60
ethinyl estradiol	1197
ethinyl estradiol	980
ethinyl estradiol	294
ethinyl estradiol	1020
ethinyl estradiol	687
ethinyl estradiol	224
ethinyl estradiol	811
ethinyl estradiol	711
ethinyl estradiol	30
ethinyl estradiol	192
ethinyl estradiol	66
ethinyl estradiol	704
ethinyl estradiol	1135
ethinyl estradiol	996
ethinyl estradiol	1185
ethinyl estradiol	116
ethinyl estradiol	342
ethinyl estradiol	326
ethinyl estradiol	641
ethinyl estradiol	664
ethinyl estradiol	504
ethinyl estradiol	366
ethinyl estradiol	417
ethinyl estradiol	424
ethinyl estradiol	384
ethinyl estradiol	1134
ethinyl estradiol	523
ethinyl estradiol	1219
ethinyl estradiol	151
ethinyl estradiol	448
ethinyl estradiol	162
ethinyl estradiol	195
ethinyl estradiol	1155
ethinyl estradiol	23
ethinyl estradiol	328
ethinyl estradiol	447
ethinyl estradiol	909
ethinyl estradiol	697
ethinyl estradiol	433
ethinyl estradiol	426
ethinyl estradiol	1047
ethinyl estradiol	85
ethinyl estradiol	454
ethinyl estradiol	1097
ethinyl estradiol	921
ethinyl estradiol	353
ethinyl estradiol	1163
ethinyl estradiol	933
ethinyl estradiol	1193
ethinyl estradiol	782
ethinyl estradiol	357
ethinyl estradiol	741
ethinyl estradiol	889
ethinyl estradiol	435
ethinyl estradiol	345
ethinyl estradiol	122
ethinyl estradiol	303
ethinyl estradiol	577
ethinyl estradiol	649
ethinyl estradiol	1176
ethinyl estradiol	9
ethinyl estradiol	750
ethinyl estradiol	1115
ethinyl estradiol	208
ethinyl estradiol	193
ethinyl estradiol	1225
ethinyl estradiol	461
ethinyl estradiol	354
ethinyl estradiol	387
ethinyl estradiol	365
ethinyl estradiol	91
ethinyl estradiol	767
ethinyl estradiol	763
ethinyl estradiol	646
ethinyl estradiol	668
ethinyl estradiol	569
ethinyl estradiol	189
ethinyl estradiol	363
ethinyl estradiol	754
ethinyl estradiol	1071
ethinyl estradiol	733
ethinyl estradiol	867
ethinyl estradiol	1184
ethinyl estradiol	751
ethinyl estradiol	716
ethinyl estradiol	698
ethinyl estradiol	1
omeprazole	43
omeprazole	645
omeprazole	816
omeprazole	361
omeprazole	1006
omeprazole	1165
omeprazole	46
omeprazole	247
omeprazole	323
omeprazole	106
omeprazole	847
omeprazole	1069
omeprazole	757
omeprazole	132
omeprazole	244
omeprazole	1181
omeprazole	667
omeprazole	44
omeprazole	526
omeprazole	499
omeprazole	346
omeprazole	283
omeprazole	1127
omeprazole	373
omeprazole	107
omeprazole	560
omeprazole	316
omeprazole	98
omeprazole	1110
omeprazole	313
omeprazole	1223
omeprazole	290
omeprazole	926
omeprazole	990
omeprazole	648
omeprazole	142
omeprazole	385
omeprazole	6
omeprazole	381
omeprazole	1178
omeprazole	595
omeprazole	1141
omeprazole	80
omeprazole	978
omeprazole	475
omeprazole	1172
omeprazole	317
omeprazole	272
omeprazole	846
omeprazole	696
omeprazole	737
omeprazole	300
omeprazole	386
omeprazole	705
omeprazole	1157
omeprazole	756
omeprazole	585
omeprazole	961
omeprazole	72
omeprazole	70
omeprazole	809
omeprazole	834
omeprazole	138
omeprazole	562
omeprazole	1099
omeprazole	54
omeprazole	561
omeprazole	974
omeprazole	669
omeprazole	229
omeprazole	73
omeprazole	594
omeprazole	509
omeprazole	67
omeprazole	496
omeprazole	289
omeprazole	566
omeprazole	444
omeprazole	1005
omeprazole	798
omeprazole	871
omeprazole	432
omeprazole	864
omeprazole	596
omeprazole	198
omeprazole	872
omeprazole	1121
omeprazole	1198
omeprazole	51
omeprazole	980
omeprazole	814
omeprazole	925
omeprazole	69
omeprazole	811
omeprazole	490
omeprazole	602
omeprazole	704
omeprazole	689
omeprazole	694
omeprazole	634
omeprazole	116
omeprazole	451
omeprazole	314
omeprazole	55
omeprazole	64
omeprazole	873
omeprazole	641
omeprazole	708
omeprazole	664
omeprazole	1004
omeprazole	845
omeprazole	424
omeprazole	417
omeprazole	771
omeprazole	79
omeprazole	1219
omeprazole	647
omeprazole	236
omeprazole	652
omeprazole	802
omeprazole	1101
omeprazole	730
omeprazole	148
omeprazole	951
omeprazole	527
omeprazole	324
omeprazole	778
omeprazole	8
omeprazole	827
omeprazole	1163
omeprazole	65
omeprazole	803
omeprazole	665
omeprazole	1085
omeprazole	782
omeprazole	1208
omeprazole	1232
omeprazole	1049
omeprazole	1123
omeprazole	345
omeprazole	572
omeprazole	1209
omeprazole	174
omeprazole	303
omeprazole	577
omeprazole	1151
omeprazole	649
omeprazole	592
omeprazole	493
omeprazole	315
omeprazole	515
omeprazole	1130
omeprazole	848
omeprazole	1225
omeprazole	390
omeprazole	47
omeprazole	907
omeprazole	91
omeprazole	389
omeprazole	767
omeprazole	931
omeprazole	882
omeprazole	434
omeprazole	1032
omeprazole	529
omeprazole	668
omeprazole	1034
omeprazole	425
omeprazole	144
omeprazole	1184
omeprazole	913
omeprazole	292
omeprazole	589
omeprazole	105
omeprazole	899
omeprazole	457
ezetimibe	901
ezetimibe	745
ezetimibe	247
ezetimibe	757
ezetimibe	244
ezetimibe	284
ezetimibe	779
ezetimibe	373
ezetimibe	807
ezetimibe	626
ezetimibe	98
ezetimibe	352
ezetimibe	182
ezetimibe	690
ezetimibe	410
ezetimibe	1007
ezetimibe	1048
ezetimibe	574
ezetimibe	385
ezetimibe	6
ezetimibe	777
ezetimibe	248
ezetimibe	1172
ezetimibe	696
ezetimibe	1000
ezetimibe	386
ezetimibe	930
ezetimibe	705
ezetimibe	343
ezetimibe	1157
ezetimibe	961
ezetimibe	72
ezetimibe	70
ezetimibe	54
ezetimibe	974
ezetimibe	691
ezetimibe	669
ezetimibe	67
ezetimibe	878
ezetimibe	781
ezetimibe	496
ezetimibe	289
ezetimibe	798
ezetimibe	295
ezetimibe	1212
ezetimibe	205
ezetimibe	432
ezetimibe	864
ezetimibe	842
ezetimibe	929
ezetimibe	198
ezetimibe	872
ezetimibe	92
ezetimibe	980
ezetimibe	814
ezetimibe	902
ezetimibe	490
ezetimibe	1008
ezetimibe	116
ezetimibe	211
ezetimibe	55
ezetimibe	1018
ezetimibe	641
ezetimibe	417
ezetimibe	424
ezetimibe	706
ezetimibe	79
ezetimibe	1219
ezetimibe	647
ezetimibe	744
ezetimibe	236
ezetimibe	802
ezetimibe	448
ezetimibe	202
ezetimibe	328
ezetimibe	402
ezetimibe	730
ezetimibe	909
ezetimibe	235
ezetimibe	433
ezetimibe	1047
ezetimibe	152
ezetimibe	527
ezetimibe	935
ezetimibe	324
ezetimibe	436
ezetimibe	206
ezetimibe	65
ezetimibe	782
ezetimibe	881
ezetimibe	1049
ezetimibe	1199
ezetimibe	333
ezetimibe	1209
ezetimibe	535
ezetimibe	303
ezetimibe	1151
ezetimibe	216
ezetimibe	649
ezetimibe	515
ezetimibe	1130
ezetimibe	826
ezetimibe	208
ezetimibe	713
ezetimibe	91
ezetimibe	619
ezetimibe	808
ezetimibe	882
ezetimibe	533
ezetimibe	529
ezetimibe	668
ezetimibe	309
ezetimibe	867
ezetimibe	1184
ezetimibe	913
ezetimibe	716
ezetimibe	1052
telithromycin	872
telithromycin	980
telithromycin	247
telithromycin	1100
telithromycin	1129
telithromycin	1069
telithromycin	473
telithromycin	602
telithromycin	470
telithromycin	4
telithromycin	207
telithromycin	783
telithromycin	352
telithromycin	104
telithromycin	708
telithromycin	1173
telithromycin	417
telithromycin	7
telithromycin	79
telithromycin	290
telithromycin	1219
telithromycin	236
telithromycin	802
telithromycin	385
telithromycin	328
telithromycin	6
telithromycin	148
telithromycin	527
telithromycin	454
telithromycin	443
telithromycin	453
telithromycin	1190
telithromycin	324
telithromycin	630
telithromycin	436
telithromycin	638
telithromycin	65
telithromycin	1193
telithromycin	1085
telithromycin	386
telithromycin	705
telithromycin	343
telithromycin	407
telithromycin	345
telithromycin	72
telithromycin	70
telithromycin	1209
telithromycin	86
telithromycin	303
telithromycin	649
telithromycin	54
telithromycin	315
telithromycin	669
telithromycin	525
telithromycin	848
telithromycin	767
telithromycin	882
telithromycin	496
telithromycin	289
telithromycin	529
telithromycin	668
telithromycin	625
telithromycin	798
telithromycin	144
telithromycin	784
telithromycin	871
telithromycin	432
telithromycin	864
telithromycin	1184
quinupristin	191
quinupristin	361
quinupristin	1165
quinupristin	247
quinupristin	910
quinupristin	1100
quinupristin	896
quinupristin	132
quinupristin	321
quinupristin	219
quinupristin	1110
quinupristin	580
quinupristin	753
quinupristin	648
quinupristin	220
quinupristin	6
quinupristin	186
quinupristin	595
quinupristin	483
quinupristin	607
quinupristin	300
quinupristin	895
quinupristin	1157
quinupristin	608
quinupristin	139
quinupristin	70
quinupristin	1104
quinupristin	1099
quinupristin	54
quinupristin	84
quinupristin	669
quinupristin	880
quinupristin	229
quinupristin	509
quinupristin	67
quinupristin	496
quinupristin	289
quinupristin	1005
quinupristin	798
quinupristin	871
quinupristin	864
quinupristin	87
quinupristin	29
quinupristin	479
quinupristin	198
quinupristin	872
quinupristin	980
quinupristin	814
quinupristin	687
quinupristin	66
quinupristin	981
quinupristin	176
quinupristin	602
quinupristin	919
quinupristin	348
quinupristin	783
quinupristin	514
quinupristin	873
quinupristin	641
quinupristin	1004
quinupristin	424
quinupristin	1134
quinupristin	79
quinupristin	1219
quinupristin	236
quinupristin	328
quinupristin	728
quinupristin	957
quinupristin	1200
quinupristin	918
quinupristin	65
quinupristin	1193
quinupristin	1085
quinupristin	782
quinupristin	345
quinupristin	333
quinupristin	613
quinupristin	86
quinupristin	303
quinupristin	368
quinupristin	649
quinupristin	1043
quinupristin	238
quinupristin	147
quinupristin	942
quinupristin	515
quinupristin	1063
quinupristin	848
quinupristin	91
quinupristin	767
quinupristin	882
quinupristin	1021
quinupristin	529
quinupristin	668
quinupristin	598
quinupristin	1207
quinupristin	801
quinupristin	401
quinupristin	425
quinupristin	606
quinupristin	1184
quinupristin	589
quinupristin	899
quinupristin	456
erythromycin	872
erythromycin	497
erythromycin	224
erythromycin	65
erythromycin	386
erythromycin	1208
erythromycin	1149
erythromycin	373
erythromycin	72
erythromycin	86
erythromycin	1151
erythromycin	54
erythromycin	238
erythromycin	1110
erythromycin	525
erythromycin	708
erythromycin	997
erythromycin	384
erythromycin	289
erythromycin	1219
erythromycin	529
erythromycin	979
erythromycin	798
erythromycin	385
erythromycin	956
erythromycin	864
erythromycin	1184
erythromycin	6
erythromycin	1103
glipizide	980
glipizide	247
glipizide	1020
glipizide	687
glipizide	1100
glipizide	1069
glipizide	932
glipizide	132
glipizide	470
glipizide	14
glipizide	234
glipizide	98
glipizide	1041
glipizide	641
glipizide	580
glipizide	1007
glipizide	1219
glipizide	79
glipizide	236
glipizide	1105
glipizide	202
glipizide	328
glipizide	6
glipizide	909
glipizide	553
glipizide	1012
glipizide	595
glipizide	584
glipizide	528
glipizide	1172
glipizide	436
glipizide	933
glipizide	782
glipizide	460
glipizide	1157
glipizide	345
glipizide	780
glipizide	333
glipizide	72
glipizide	809
glipizide	1209
glipizide	1104
glipizide	86
glipizide	303
glipizide	577
glipizide	649
glipizide	669
glipizide	229
glipizide	461
glipizide	91
glipizide	763
glipizide	882
glipizide	496
glipizide	289
glipizide	668
glipizide	336
glipizide	798
glipizide	1126
glipizide	141
glipizide	144
glipizide	432
glipizide	864
glipizide	1184
glipizide	589
glipizide	698
glipizide	456
indomethacin	92
indomethacin	1165
indomethacin	302
indomethacin	224
indomethacin	611
indomethacin	1118
indomethacin	1069
indomethacin	132
indomethacin	379
indomethacin	5
indomethacin	450
indomethacin	137
indomethacin	1166
indomethacin	964
indomethacin	175
indomethacin	946
indomethacin	417
indomethacin	1223
indomethacin	79
indomethacin	1219
indomethacin	304
indomethacin	236
indomethacin	988
indomethacin	328
indomethacin	730
indomethacin	80
indomethacin	454
indomethacin	778
indomethacin	300
indomethacin	1085
indomethacin	501
indomethacin	72
indomethacin	809
indomethacin	1209
indomethacin	656
indomethacin	832
indomethacin	303
indomethacin	1167
indomethacin	649
indomethacin	893
indomethacin	1019
indomethacin	669
indomethacin	229
indomethacin	389
indomethacin	983
indomethacin	496
indomethacin	289
indomethacin	529
indomethacin	798
indomethacin	432
indomethacin	864
indomethacin	456
cyclosporine	488
cyclosporine	1165
cyclosporine	1100
cyclosporine	1069
cyclosporine	985
cyclosporine	244
cyclosporine	900
cyclosporine	157
cyclosporine	473
cyclosporine	163
cyclosporine	541
cyclosporine	992
cyclosporine	500
cyclosporine	182
cyclosporine	260
cyclosporine	1007
cyclosporine	15
cyclosporine	1139
cyclosporine	476
cyclosporine	381
cyclosporine	1178
cyclosporine	127
cyclosporine	1141
cyclosporine	37
cyclosporine	584
cyclosporine	820
cyclosporine	1172
cyclosporine	233
cyclosporine	790
cyclosporine	299
cyclosporine	564
cyclosporine	749
cyclosporine	1157
cyclosporine	725
cyclosporine	961
cyclosporine	70
cyclosporine	1148
cyclosporine	439
cyclosporine	832
cyclosporine	562
cyclosporine	54
cyclosporine	761
cyclosporine	267
cyclosporine	1161
cyclosporine	983
cyclosporine	336
cyclosporine	798
cyclosporine	1212
cyclosporine	545
cyclosporine	25
cyclosporine	198
cyclosporine	872
cyclosporine	92
cyclosporine	582
cyclosporine	980
cyclosporine	814
cyclosporine	294
cyclosporine	925
cyclosporine	287
cyclosporine	487
cyclosporine	932
cyclosporine	405
cyclosporine	902
cyclosporine	30
cyclosporine	1008
cyclosporine	1135
cyclosporine	1057
cyclosporine	1214
cyclosporine	1022
cyclosporine	1221
cyclosporine	424
cyclosporine	717
cyclosporine	337
cyclosporine	1108
cyclosporine	678
cyclosporine	540
cyclosporine	328
cyclosporine	909
cyclosporine	697
cyclosporine	433
cyclosporine	1117
cyclosporine	1224
cyclosporine	1047
cyclosporine	453
cyclosporine	324
cyclosporine	436
cyclosporine	471
cyclosporine	1163
cyclosporine	250
cyclosporine	552
cyclosporine	345
cyclosporine	333
cyclosporine	823
cyclosporine	586
cyclosporine	1209
cyclosporine	86
cyclosporine	649
cyclosporine	893
cyclosporine	200
cyclosporine	534
cyclosporine	1179
cyclosporine	1130
cyclosporine	1225
cyclosporine	760
cyclosporine	882
cyclosporine	666
cyclosporine	668
cyclosporine	1160
cyclosporine	1171
cyclosporine	569
cyclosporine	144
cyclosporine	733
cyclosporine	1184
cyclosporine	589
cyclosporine	165
cyclosporine	645
cyclosporine	247
cyclosporine	581
cyclosporine	947
cyclosporine	132
cyclosporine	1181
cyclosporine	283
cyclosporine	821
cyclosporine	234
cyclosporine	560
cyclosporine	316
cyclosporine	98
cyclosporine	219
cyclosporine	438
cyclosporine	673
cyclosporine	175
cyclosporine	1223
cyclosporine	558
cyclosporine	643
cyclosporine	1152
cyclosporine	616
cyclosporine	220
cyclosporine	544
cyclosporine	6
cyclosporine	17
cyclosporine	995
cyclosporine	111
cyclosporine	180
cyclosporine	620
cyclosporine	795
cyclosporine	696
cyclosporine	638
cyclosporine	343
cyclosporine	72
cyclosporine	809
cyclosporine	1054
cyclosporine	1024
cyclosporine	974
cyclosporine	1019
cyclosporine	229
cyclosporine	1144
cyclosporine	594
cyclosporine	959
cyclosporine	1106
cyclosporine	509
cyclosporine	623
cyclosporine	67
cyclosporine	699
cyclosporine	781
cyclosporine	170
cyclosporine	496
cyclosporine	289
cyclosporine	359
cyclosporine	640
cyclosporine	432
cyclosporine	864
cyclosporine	21
cyclosporine	1083
cyclosporine	255
cyclosporine	559
cyclosporine	108
cyclosporine	1084
cyclosporine	479
cyclosporine	1187
cyclosporine	1211
cyclosporine	1020
cyclosporine	687
cyclosporine	490
cyclosporine	183
cyclosporine	22
cyclosporine	4
cyclosporine	977
cyclosporine	55
cyclosporine	641
cyclosporine	1081
cyclosporine	417
cyclosporine	366
cyclosporine	384
cyclosporine	79
cyclosporine	1219
cyclosporine	236
cyclosporine	802
cyclosporine	3
cyclosporine	480
cyclosporine	162
cyclosporine	730
cyclosporine	1182
cyclosporine	454
cyclosporine	644
cyclosporine	497
cyclosporine	353
cyclosporine	542
cyclosporine	624
cyclosporine	383
cyclosporine	916
cyclosporine	782
cyclosporine	1085
cyclosporine	357
cyclosporine	329
cyclosporine	577
cyclosporine	303
cyclosporine	93
cyclosporine	1176
cyclosporine	238
cyclosporine	993
cyclosporine	154
cyclosporine	315
cyclosporine	515
cyclosporine	1063
cyclosporine	91
cyclosporine	808
cyclosporine	1146
cyclosporine	767
cyclosporine	763
cyclosporine	394
cyclosporine	724
cyclosporine	1035
cyclosporine	259
cyclosporine	698
cyclosporine	456
cyclosporine	692
cyclosporine	457
norfloxacin	198
norfloxacin	622
norfloxacin	1165
norfloxacin	980
norfloxacin	247
norfloxacin	1069
norfloxacin	639
norfloxacin	464
norfloxacin	1181
norfloxacin	634
norfloxacin	116
norfloxacin	626
norfloxacin	494
norfloxacin	1214
norfloxacin	98
norfloxacin	271
norfloxacin	326
norfloxacin	629
norfloxacin	641
norfloxacin	424
norfloxacin	79
norfloxacin	1219
norfloxacin	236
norfloxacin	1139
norfloxacin	950
norfloxacin	1065
norfloxacin	270
norfloxacin	265
norfloxacin	1101
norfloxacin	202
norfloxacin	328
norfloxacin	6
norfloxacin	223
norfloxacin	2
norfloxacin	954
norfloxacin	475
norfloxacin	478
norfloxacin	8
norfloxacin	790
norfloxacin	624
norfloxacin	770
norfloxacin	636
norfloxacin	984
norfloxacin	1157
norfloxacin	345
norfloxacin	501
norfloxacin	72
norfloxacin	303
norfloxacin	649
norfloxacin	130
norfloxacin	561
norfloxacin	315
norfloxacin	170
norfloxacin	496
norfloxacin	289
norfloxacin	1032
norfloxacin	668
norfloxacin	640
norfloxacin	798
norfloxacin	144
norfloxacin	871
norfloxacin	432
norfloxacin	864
norfloxacin	994
norfloxacin	793
sirolimus	488
sirolimus	785
sirolimus	1165
sirolimus	159
sirolimus	1100
sirolimus	1069
sirolimus	516
sirolimus	481
sirolimus	244
sirolimus	759
sirolimus	231
sirolimus	541
sirolimus	245
sirolimus	1110
sirolimus	500
sirolimus	428
sirolimus	182
sirolimus	260
sirolimus	998
sirolimus	580
sirolimus	715
sirolimus	1007
sirolimus	381
sirolimus	1178
sirolimus	595
sirolimus	248
sirolimus	1141
sirolimus	396
sirolimus	584
sirolimus	978
sirolimus	475
sirolimus	1172
sirolimus	212
sirolimus	770
sirolimus	564
sirolimus	850
sirolimus	1157
sirolimus	725
sirolimus	70
sirolimus	1104
sirolimus	562
sirolimus	1133
sirolimus	54
sirolimus	161
sirolimus	982
sirolimus	905
sirolimus	1161
sirolimus	339
sirolimus	336
sirolimus	798
sirolimus	871
sirolimus	969
sirolimus	545
sirolimus	806
sirolimus	25
sirolimus	29
sirolimus	557
sirolimus	1203
sirolimus	198
sirolimus	872
sirolimus	1198
sirolimus	582
sirolimus	980
sirolimus	814
sirolimus	925
sirolimus	287
sirolimus	932
sirolimus	1051
sirolimus	556
sirolimus	30
sirolimus	602
sirolimus	1135
sirolimus	694
sirolimus	804
sirolimus	919
sirolimus	116
sirolimus	348
sirolimus	1229
sirolimus	629
sirolimus	873
sirolimus	424
sirolimus	717
sirolimus	675
sirolimus	575
sirolimus	971
sirolimus	540
sirolimus	857
sirolimus	328
sirolimus	909
sirolimus	433
sirolimus	1224
sirolimus	1047
sirolimus	719
sirolimus	527
sirolimus	453
sirolimus	471
sirolimus	918
sirolimus	250
sirolimus	1056
sirolimus	889
sirolimus	838
sirolimus	1123
sirolimus	345
sirolimus	333
sirolimus	823
sirolimus	1131
sirolimus	649
sirolimus	1179
sirolimus	554
sirolimus	1130
sirolimus	848
sirolimus	1225
sirolimus	612
sirolimus	882
sirolimus	668
sirolimus	1160
sirolimus	569
sirolimus	425
sirolimus	733
sirolimus	589
sirolimus	105
sirolimus	899
sirolimus	131
sirolimus	1
sirolimus	645
sirolimus	816
sirolimus	247
sirolimus	132
sirolimus	1181
sirolimus	637
sirolimus	283
sirolimus	234
sirolimus	560
sirolimus	1204
sirolimus	98
sirolimus	49
sirolimus	567
sirolimus	175
sirolimus	720
sirolimus	1152
sirolimus	276
sirolimus	99
sirolimus	6
sirolimus	36
sirolimus	968
sirolimus	748
sirolimus	620
sirolimus	696
sirolimus	539
sirolimus	970
sirolimus	636
sirolimus	608
sirolimus	407
sirolimus	585
sirolimus	860
sirolimus	72
sirolimus	974
sirolimus	445
sirolimus	525
sirolimus	229
sirolimus	594
sirolimus	509
sirolimus	67
sirolimus	496
sirolimus	289
sirolimus	605
sirolimus	160
sirolimus	432
sirolimus	635
sirolimus	864
sirolimus	462
sirolimus	596
sirolimus	928
sirolimus	739
sirolimus	274
sirolimus	622
sirolimus	1029
sirolimus	275
sirolimus	1020
sirolimus	687
sirolimus	856
sirolimus	66
sirolimus	183
sirolimus	22
sirolimus	977
sirolimus	904
sirolimus	938
sirolimus	102
sirolimus	641
sirolimus	708
sirolimus	366
sirolimus	1134
sirolimus	79
sirolimus	1219
sirolimus	858
sirolimus	236
sirolimus	802
sirolimus	1120
sirolimus	162
sirolimus	202
sirolimus	341
sirolimus	730
sirolimus	94
sirolimus	951
sirolimus	1200
sirolimus	454
sirolimus	651
sirolimus	1058
sirolimus	542
sirolimus	624
sirolimus	383
sirolimus	1085
sirolimus	782
sirolimus	357
sirolimus	1199
sirolimus	329
sirolimus	303
sirolimus	577
sirolimus	93
sirolimus	1176
sirolimus	592
sirolimus	1063
sirolimus	354
sirolimus	31
sirolimus	91
sirolimus	619
sirolimus	767
sirolimus	394
sirolimus	434
sirolimus	1034
sirolimus	724
sirolimus	1136
sirolimus	1180
sirolimus	259
imipenem	816
imipenem	361
imipenem	980
imipenem	146
imipenem	519
imipenem	294
imipenem	224
imipenem	1069
imipenem	932
imipenem	473
imipenem	602
imipenem	1127
imipenem	373
imipenem	1128
imipenem	626
imipenem	98
imipenem	1147
imipenem	583
imipenem	271
imipenem	1110
imipenem	78
imipenem	308
imipenem	629
imipenem	873
imipenem	424
imipenem	366
imipenem	721
imipenem	1223
imipenem	1219
imipenem	953
imipenem	1025
imipenem	270
imipenem	385
imipenem	631
imipenem	6
imipenem	595
imipenem	1141
imipenem	995
imipenem	1075
imipenem	266
imipenem	454
imipenem	443
imipenem	324
imipenem	940
imipenem	74
imipenem	497
imipenem	254
imipenem	436
imipenem	696
imipenem	624
imipenem	636
imipenem	386
imipenem	705
imipenem	1157
imipenem	955
imipenem	838
imipenem	345
imipenem	501
imipenem	333
imipenem	70
imipenem	1209
imipenem	865
imipenem	303
imipenem	1151
imipenem	35
imipenem	561
imipenem	633
imipenem	936
imipenem	1062
imipenem	493
imipenem	669
imipenem	927
imipenem	515
imipenem	229
imipenem	1130
imipenem	47
imipenem	197
imipenem	767
imipenem	67
imipenem	882
imipenem	496
imipenem	289
imipenem	1032
imipenem	529
imipenem	668
imipenem	798
imipenem	866
imipenem	871
imipenem	956
imipenem	864
imipenem	1184
imipenem	293
imipenem	793
simvastatin	901
simvastatin	745
simvastatin	247
simvastatin	757
simvastatin	244
simvastatin	284
simvastatin	779
simvastatin	373
simvastatin	807
simvastatin	626
simvastatin	98
simvastatin	352
simvastatin	182
simvastatin	690
simvastatin	410
simvastatin	1007
simvastatin	574
simvastatin	385
simvastatin	6
simvastatin	777
simvastatin	248
simvastatin	1172
simvastatin	696
simvastatin	1000
simvastatin	386
simvastatin	930
simvastatin	705
simvastatin	343
simvastatin	1157
simvastatin	961
simvastatin	413
simvastatin	72
simvastatin	70
simvastatin	54
simvastatin	974
simvastatin	691
simvastatin	669
simvastatin	525
simvastatin	67
simvastatin	878
simvastatin	781
simvastatin	496
simvastatin	289
simvastatin	798
simvastatin	295
simvastatin	205
simvastatin	1212
simvastatin	432
simvastatin	864
simvastatin	842
simvastatin	557
simvastatin	929
simvastatin	872
simvastatin	92
simvastatin	543
simvastatin	980
simvastatin	814
simvastatin	902
simvastatin	490
simvastatin	1008
simvastatin	116
simvastatin	211
simvastatin	55
simvastatin	1018
simvastatin	641
simvastatin	424
simvastatin	706
simvastatin	417
simvastatin	79
simvastatin	1219
simvastatin	744
simvastatin	647
simvastatin	236
simvastatin	802
simvastatin	202
simvastatin	328
simvastatin	730
simvastatin	402
simvastatin	909
simvastatin	235
simvastatin	433
simvastatin	1047
simvastatin	152
simvastatin	527
simvastatin	935
simvastatin	324
simvastatin	436
simvastatin	206
simvastatin	65
simvastatin	782
simvastatin	881
simvastatin	1049
simvastatin	1199
simvastatin	333
simvastatin	1209
simvastatin	535
simvastatin	303
simvastatin	1151
simvastatin	216
simvastatin	649
simvastatin	515
simvastatin	1130
simvastatin	826
simvastatin	208
simvastatin	713
simvastatin	91
simvastatin	619
simvastatin	808
simvastatin	882
simvastatin	533
simvastatin	529
simvastatin	668
simvastatin	867
simvastatin	1184
simvastatin	913
simvastatin	716
simvastatin	1052
methotrexate	261
methotrexate	816
methotrexate	361
methotrexate	768
methotrexate	1165
methotrexate	505
methotrexate	251
methotrexate	896
methotrexate	132
methotrexate	5
methotrexate	57
methotrexate	283
methotrexate	373
methotrexate	234
methotrexate	1059
methotrexate	1204
methotrexate	626
methotrexate	428
methotrexate	260
methotrexate	715
methotrexate	726
methotrexate	1068
methotrexate	304
methotrexate	546
methotrexate	385
methotrexate	588
methotrexate	396
methotrexate	995
methotrexate	1213
methotrexate	320
methotrexate	696
methotrexate	300
methotrexate	386
methotrexate	833
methotrexate	705
methotrexate	749
methotrexate	822
methotrexate	895
methotrexate	725
methotrexate	72
methotrexate	257
methotrexate	258
methotrexate	1019
methotrexate	1164
methotrexate	959
methotrexate	509
methotrexate	81
methotrexate	218
methotrexate	67
methotrexate	496
methotrexate	289
methotrexate	336
methotrexate	798
methotrexate	511
methotrexate	969
methotrexate	33
methotrexate	274
methotrexate	145
methotrexate	872
methotrexate	92
methotrexate	980
methotrexate	925
methotrexate	221
methotrexate	287
methotrexate	837
methotrexate	856
methotrexate	30
methotrexate	490
methotrexate	66
methotrexate	356
methotrexate	83
methotrexate	602
methotrexate	1135
methotrexate	653
methotrexate	804
methotrexate	348
methotrexate	55
methotrexate	873
methotrexate	641
methotrexate	424
methotrexate	417
methotrexate	717
methotrexate	1134
methotrexate	1219
methotrexate	802
methotrexate	202
methotrexate	540
methotrexate	857
methotrexate	341
methotrexate	402
methotrexate	730
methotrexate	1154
methotrexate	909
methotrexate	844
methotrexate	951
methotrexate	446
methotrexate	1036
methotrexate	630
methotrexate	471
methotrexate	542
methotrexate	1163
methotrexate	203
methotrexate	1085
methotrexate	782
methotrexate	881
methotrexate	1132
methotrexate	367
methotrexate	1199
methotrexate	88
methotrexate	742
methotrexate	303
methotrexate	1151
methotrexate	1167
methotrexate	216
methotrexate	238
methotrexate	1130
methotrexate	1014
methotrexate	115
methotrexate	47
methotrexate	713
methotrexate	91
methotrexate	619
methotrexate	1114
methotrexate	533
methotrexate	646
methotrexate	529
methotrexate	668
methotrexate	1191
methotrexate	960
methotrexate	1034
methotrexate	1091
methotrexate	189
methotrexate	144
methotrexate	724
methotrexate	922
methotrexate	1184
methotrexate	913
methotrexate	1162
methotrexate	695
methotrexate	917
rifabutin	198
rifabutin	816
rifabutin	980
rifabutin	799
rifabutin	424
rifabutin	496
rifabutin	383
rifabutin	289
rifabutin	1219
rifabutin	782
rifabutin	798
rifabutin	328
rifabutin	432
rifabutin	864
rifabutin	72
rifabutin	6
rifabutin	98
rifabutin	649
terbinafine	283
terbinafine	1053
terbinafine	568
terbinafine	1138
terbinafine	237
terbinafine	1054
terbinafine	668
terbinafine	1026
terbinafine	1137
voriconazole	488
voriconazole	191
voriconazole	361
voriconazole	1165
voriconazole	505
voriconazole	146
voriconazole	24
voriconazole	106
voriconazole	1100
voriconazole	1069
voriconazole	244
voriconazole	188
voriconazole	1149
voriconazole	125
voriconazole	473
voriconazole	759
voriconazole	604
voriconazole	231
voriconazole	541
voriconazole	48
voriconazole	245
voriconazole	1110
voriconazole	500
voriconazole	350
voriconazole	1053
voriconazole	484
voriconazole	260
voriconazole	998
voriconazole	580
voriconazole	1007
voriconazole	1215
voriconazole	385
voriconazole	381
voriconazole	127
voriconazole	1012
voriconazole	777
voriconazole	595
voriconazole	248
voriconazole	1141
voriconazole	396
voriconazole	483
voriconazole	112
voriconazole	584
voriconazole	1213
voriconazole	475
voriconazole	254
voriconazole	790
voriconazole	770
voriconazole	360
voriconazole	386
voriconazole	705
voriconazole	1157
voriconazole	404
voriconazole	520
voriconazole	70
voriconazole	1104
voriconazole	656
voriconazole	562
voriconazole	762
voriconazole	362
voriconazole	54
voriconazole	1113
voriconazole	669
voriconazole	565
voriconazole	267
voriconazole	982
voriconazole	905
voriconazole	983
voriconazole	1161
voriconazole	786
voriconazole	339
voriconazole	854
voriconazole	336
voriconazole	798
voriconazole	431
voriconazole	866
voriconazole	1142
voriconazole	298
voriconazole	871
voriconazole	969
voriconazole	642
voriconazole	557
voriconazole	198
voriconazole	872
voriconazole	60
voriconazole	92
voriconazole	582
voriconazole	980
voriconazole	814
voriconazole	925
voriconazole	224
voriconazole	287
voriconazole	487
voriconazole	1028
voriconazole	405
voriconazole	556
voriconazole	176
voriconazole	1008
voriconazole	602
voriconazole	704
voriconazole	450
voriconazole	859
voriconazole	919
voriconazole	116
voriconazole	1214
voriconazole	348
voriconazole	1188
voriconazole	314
voriconazole	671
voriconazole	78
voriconazole	326
voriconazole	104
voriconazole	873
voriconazole	845
voriconazole	424
voriconazole	717
voriconazole	675
voriconazole	291
voriconazole	540
voriconazole	857
voriconazole	328
voriconazole	909
voriconazole	148
voriconazole	433
voriconazole	1047
voriconazole	446
voriconazole	134
voriconazole	288
voriconazole	400
voriconazole	324
voriconazole	630
voriconazole	471
voriconazole	918
voriconazole	77
voriconazole	250
voriconazole	830
voriconazole	889
voriconazole	838
voriconazole	345
voriconazole	333
voriconazole	62
voriconazole	1131
voriconazole	395
voriconazole	1209
voriconazole	133
voriconazole	86
voriconazole	1090
voriconazole	1151
voriconazole	96
voriconazole	649
voriconazole	1179
voriconazole	554
voriconazole	482
voriconazole	1098
voriconazole	1130
voriconazole	389
voriconazole	1175
voriconazole	882
voriconazole	242
voriconazole	529
voriconazole	666
voriconazole	668
voriconazole	1160
voriconazole	1016
voriconazole	401
voriconazole	569
voriconazole	425
voriconazole	144
voriconazole	733
voriconazole	1184
voriconazole	579
voriconazole	589
voriconazole	210
voriconazole	105
voriconazole	899
voriconazole	249
voriconazole	1
voriconazole	835
voriconazole	46
voriconazole	247
voriconazole	910
voriconazole	847
voriconazole	1125
voriconazole	277
voriconazole	132
voriconazole	1181
voriconazole	637
voriconazole	912
voriconazole	524
voriconazole	474
voriconazole	283
voriconazole	373
voriconazole	738
voriconazole	234
voriconazole	560
voriconazole	626
voriconazole	316
voriconazole	824
voriconazole	98
voriconazole	101
voriconazole	963
voriconazole	307
voriconazole	225
voriconazole	1218
voriconazole	810
voriconazole	49
voriconazole	805
voriconazole	946
voriconazole	1076
voriconazole	718
voriconazole	290
voriconazole	643
voriconazole	648
voriconazole	1015
voriconazole	6
voriconazole	186
voriconazole	968
voriconazole	995
voriconazole	620
voriconazole	317
voriconazole	696
voriconazole	300
voriconazole	636
voriconazole	177
voriconazole	819
voriconazole	343
voriconazole	608
voriconazole	407
voriconazole	585
voriconazole	72
voriconazole	257
voriconazole	429
voriconazole	1054
voriconazole	1099
voriconazole	35
voriconazole	974
voriconazole	536
voriconazole	525
voriconazole	229
voriconazole	594
voriconazole	959
voriconazole	509
voriconazole	949
voriconazole	67
voriconazole	496
voriconazole	1109
voriconazole	289
voriconazole	672
voriconazole	566
voriconazole	281
voriconazole	1005
voriconazole	640
voriconazole	178
voriconazole	1192
voriconazole	518
voriconazole	205
voriconazole	956
voriconazole	319
voriconazole	432
voriconazole	864
voriconazole	237
voriconazole	596
voriconazole	1205
voriconazole	1084
voriconazole	1187
voriconazole	622
voriconazole	1029
voriconazole	1020
voriconazole	687
voriconazole	849
voriconazole	811
voriconazole	856
voriconazole	150
voriconazole	66
voriconazole	183
voriconazole	22
voriconazole	356
voriconazole	83
voriconazole	40
voriconazole	783
voriconazole	55
voriconazole	938
voriconazole	393
voriconazole	641
voriconazole	708
voriconazole	1004
voriconazole	135
voriconazole	366
voriconazole	384
voriconazole	1134
voriconazole	79
voriconazole	1219
voriconazole	858
voriconazole	236
voriconazole	802
voriconazole	773
voriconazole	202
voriconazole	884
voriconazole	341
voriconazole	728
voriconazole	94
voriconazole	507
voriconazole	172
voriconazole	1200
voriconazole	454
voriconazole	644
voriconazole	658
voriconazole	273
voriconazole	377
voriconazole	497
voriconazole	206
voriconazole	624
voriconazole	803
voriconazole	1085
voriconazole	782
voriconazole	196
voriconazole	1208
voriconazole	877
voriconazole	742
voriconazole	329
voriconazole	303
voriconazole	577
voriconazole	238
voriconazole	655
voriconazole	592
voriconazole	493
voriconazole	315
voriconazole	147
voriconazole	515
voriconazole	898
voriconazole	208
voriconazole	168
voriconazole	390
voriconazole	10
voriconazole	47
voriconazole	907
voriconazole	91
voriconazole	619
voriconazole	226
voriconazole	767
voriconazole	394
voriconazole	434
voriconazole	227
voriconazole	1093
voriconazole	774
voriconazole	1034
voriconazole	1207
voriconazole	914
voriconazole	740
voriconazole	1136
voriconazole	913
voriconazole	1180
voriconazole	1145
voriconazole	259
voriconazole	698
voriconazole	716
voriconazole	318
voriconazole	456
itraconazole	1077
itraconazole	816
itraconazole	1165
itraconazole	973
itraconazole	1100
itraconazole	1069
itraconazole	1181
itraconazole	244
itraconazole	637
itraconazole	157
itraconazole	230
itraconazole	256
itraconazole	560
itraconazole	231
itraconazole	98
itraconazole	41
itraconazole	1110
itraconazole	500
itraconazole	428
itraconazole	49
itraconazole	260
itraconazole	1007
itraconazole	1174
itraconazole	388
itraconazole	6
itraconazole	127
itraconazole	358
itraconazole	968
itraconazole	1141
itraconazole	180
itraconazole	1172
itraconazole	638
itraconazole	636
itraconazole	705
itraconazole	749
itraconazole	1157
itraconazole	732
itraconazole	585
itraconazole	961
itraconazole	70
itraconazole	72
itraconazole	257
itraconazole	1054
itraconazole	54
itraconazole	669
itraconazole	525
itraconazole	594
itraconazole	509
itraconazole	623
itraconazole	170
itraconazole	496
itraconazole	289
itraconazole	798
itraconazole	432
itraconazole	923
itraconazole	864
itraconazole	596
itraconazole	255
itraconazole	548
itraconazole	198
itraconazole	622
itraconazole	980
itraconazole	814
itraconazole	275
itraconazole	1020
itraconazole	925
itraconazole	902
itraconazole	490
itraconazole	851
itraconazole	1008
itraconazole	22
itraconazole	602
itraconazole	704
itraconazole	634
itraconazole	116
itraconazole	1022
itraconazole	55
itraconazole	938
itraconazole	629
itraconazole	641
itraconazole	424
itraconazole	417
itraconazole	675
itraconazole	1219
itraconazole	79
itraconazole	236
itraconazole	540
itraconazole	328
itraconazole	730
itraconazole	909
itraconazole	1224
itraconazole	85
itraconazole	1047
itraconazole	731
itraconazole	618
itraconazole	454
itraconazole	453
itraconazole	324
itraconazole	644
itraconazole	630
itraconazole	471
itraconazole	436
itraconazole	353
itraconazole	542
itraconazole	624
itraconazole	65
itraconazole	250
itraconazole	1085
itraconazole	782
itraconazole	552
itraconazole	1199
itraconazole	345
itraconazole	333
itraconazole	1209
itraconazole	329
itraconazole	303
itraconazole	577
itraconazole	1167
itraconazole	649
itraconazole	993
itraconazole	592
itraconazole	390
itraconazole	619
itraconazole	389
itraconazole	808
itraconazole	767
itraconazole	434
itraconazole	529
itraconazole	668
itraconazole	309
itraconazole	922
itraconazole	1184
itraconazole	841
itraconazole	913
itraconazole	1202
itraconazole	698
itraconazole	899
itraconazole	522
itraconazole	457
atazanavir	1165
atazanavir	46
atazanavir	502
atazanavir	530
atazanavir	106
atazanavir	1100
atazanavir	1069
atazanavir	244
atazanavir	1181
atazanavir	316
atazanavir	98
atazanavir	963
atazanavir	164
atazanavir	870
atazanavir	245
atazanavir	702
atazanavir	82
atazanavir	998
atazanavir	531
atazanavir	831
atazanavir	59
atazanavir	544
atazanavir	6
atazanavir	1178
atazanavir	777
atazanavir	680
atazanavir	498
atazanavir	1030
atazanavir	1141
atazanavir	995
atazanavir	584
atazanavir	776
atazanavir	770
atazanavir	749
atazanavir	343
atazanavir	28
atazanavir	608
atazanavir	72
atazanavir	70
atazanavir	809
atazanavir	1104
atazanavir	54
atazanavir	974
atazanavir	536
atazanavir	669
atazanavir	229
atazanavir	573
atazanavir	813
atazanavir	509
atazanavir	623
atazanavir	496
atazanavir	289
atazanavir	798
atazanavir	423
atazanavir	871
atazanavir	432
atazanavir	864
atazanavir	462
atazanavir	21
atazanavir	563
atazanavir	674
atazanavir	29
atazanavir	479
atazanavir	198
atazanavir	872
atazanavir	707
atazanavir	980
atazanavir	275
atazanavir	224
atazanavir	287
atazanavir	932
atazanavir	252
atazanavir	551
atazanavir	490
atazanavir	176
atazanavir	183
atazanavir	14
atazanavir	116
atazanavir	783
atazanavir	1094
atazanavir	55
atazanavir	169
atazanavir	332
atazanavir	703
atazanavir	393
atazanavir	641
atazanavir	424
atazanavir	417
atazanavir	706
atazanavir	79
atazanavir	1219
atazanavir	858
atazanavir	236
atazanavir	792
atazanavir	328
atazanavir	341
atazanavir	730
atazanavir	1224
atazanavir	951
atazanavir	1200
atazanavir	454
atazanavir	453
atazanavir	324
atazanavir	1210
atazanavir	1085
atazanavir	782
atazanavir	268
atazanavir	357
atazanavir	889
atazanavir	285
atazanavir	838
atazanavir	345
atazanavir	333
atazanavir	62
atazanavir	1090
atazanavir	303
atazanavir	577
atazanavir	649
atazanavir	534
atazanavir	893
atazanavir	238
atazanavir	1095
atazanavir	1064
atazanavir	538
atazanavir	493
atazanavir	147
atazanavir	1225
atazanavir	91
atazanavir	389
atazanavir	619
atazanavir	775
atazanavir	394
atazanavir	529
atazanavir	325
atazanavir	668
atazanavir	867
atazanavir	1184
atazanavir	913
atazanavir	698
atazanavir	899
atazanavir	1
atazanavir	457
ritonavir	766
ritonavir	13
ritonavir	517
ritonavir	361
ritonavir	1165
ritonavir	1100
ritonavir	1069
ritonavir	244
ritonavir	188
ritonavir	204
ritonavir	157
ritonavir	604
ritonavir	1080
ritonavir	693
ritonavir	883
ritonavir	245
ritonavir	1110
ritonavir	1053
ritonavir	414
ritonavir	736
ritonavir	998
ritonavir	715
ritonavir	580
ritonavir	831
ritonavir	1215
ritonavir	59
ritonavir	385
ritonavir	381
ritonavir	1178
ritonavir	680
ritonavir	123
ritonavir	1141
ritonavir	396
ritonavir	153
ritonavir	483
ritonavir	584
ritonavir	788
ritonavir	475
ritonavir	790
ritonavir	770
ritonavir	386
ritonavir	1157
ritonavir	892
ritonavir	1230
ritonavir	1104
ritonavir	555
ritonavir	54
ritonavir	1113
ritonavir	669
ritonavir	550
ritonavir	982
ritonavir	878
ritonavir	983
ritonavir	339
ritonavir	723
ritonavir	336
ritonavir	682
ritonavir	798
ritonavir	1126
ritonavir	1142
ritonavir	871
ritonavir	1212
ritonavir	114
ritonavir	674
ritonavir	29
ritonavir	557
ritonavir	198
ritonavir	872
ritonavir	60
ritonavir	441
ritonavir	1198
ritonavir	92
ritonavir	1197
ritonavir	707
ritonavir	980
ritonavir	814
ritonavir	519
ritonavir	925
ritonavir	224
ritonavir	287
ritonavir	932
ritonavir	405
ritonavir	902
ritonavir	30
ritonavir	602
ritonavir	1135
ritonavir	113
ritonavir	653
ritonavir	116
ritonavir	621
ritonavir	42
ritonavir	800
ritonavir	1188
ritonavir	1177
ritonavir	591
ritonavir	997
ritonavir	424
ritonavir	717
ritonavir	675
ritonavir	328
ritonavir	909
ritonavir	148
ritonavir	433
ritonavir	1224
ritonavir	1047
ritonavir	446
ritonavir	134
ritonavir	453
ritonavir	400
ritonavir	324
ritonavir	471
ritonavir	1163
ritonavir	1056
ritonavir	1124
ritonavir	889
ritonavir	367
ritonavir	369
ritonavir	345
ritonavir	333
ritonavir	823
ritonavir	62
ritonavir	395
ritonavir	1209
ritonavir	1050
ritonavir	1090
ritonavir	190
ritonavir	794
ritonavir	368
ritonavir	649
ritonavir	534
ritonavir	1130
ritonavir	1225
ritonavir	461
ritonavir	389
ritonavir	612
ritonavir	882
ritonavir	1021
ritonavir	529
ritonavir	666
ritonavir	668
ritonavir	309
ritonavir	144
ritonavir	425
ritonavir	606
ritonavir	1184
ritonavir	841
ritonavir	899
ritonavir	105
ritonavir	1
ritonavir	816
ritonavir	46
ritonavir	247
ritonavir	910
ritonavir	418
ritonavir	132
ritonavir	1181
ritonavir	735
ritonavir	912
ritonavir	524
ritonavir	474
ritonavir	283
ritonavir	234
ritonavir	1204
ritonavir	316
ritonavir	398
ritonavir	98
ritonavir	101
ritonavir	438
ritonavir	810
ritonavir	49
ritonavir	590
ritonavir	1223
ritonavir	290
ritonavir	643
ritonavir	415
ritonavir	99
ritonavir	903
ritonavir	544
ritonavir	1217
ritonavir	1201
ritonavir	6
ritonavir	1030
ritonavir	748
ritonavir	968
ritonavir	995
ritonavir	80
ritonavir	58
ritonavir	180
ritonavir	620
ritonavir	795
ritonavir	776
ritonavir	696
ritonavir	409
ritonavir	787
ritonavir	311
ritonavir	636
ritonavir	906
ritonavir	343
ritonavir	407
ritonavir	860
ritonavir	72
ritonavir	257
ritonavir	809
ritonavir	1054
ritonavir	35
ritonavir	536
ritonavir	445
ritonavir	229
ritonavir	959
ritonavir	509
ritonavir	81
ritonavir	50
ritonavir	623
ritonavir	67
ritonavir	496
ritonavir	289
ritonavir	281
ritonavir	640
ritonavir	956
ritonavir	205
ritonavir	1074
ritonavir	432
ritonavir	864
ritonavir	237
ritonavir	563
ritonavir	21
ritonavir	255
ritonavir	559
ritonavir	739
ritonavir	274
ritonavir	479
ritonavir	145
ritonavir	1211
ritonavir	275
ritonavir	1020
ritonavir	687
ritonavir	1118
ritonavir	61
ritonavir	811
ritonavir	856
ritonavir	490
ritonavir	22
ritonavir	12
ritonavir	14
ritonavir	40
ritonavir	1166
ritonavir	783
ritonavir	662
ritonavir	904
ritonavir	55
ritonavir	938
ritonavir	393
ritonavir	641
ritonavir	508
ritonavir	366
ritonavir	706
ritonavir	1134
ritonavir	79
ritonavir	1219
ritonavir	858
ritonavir	236
ritonavir	802
ritonavir	162
ritonavir	202
ritonavir	143
ritonavir	341
ritonavir	402
ritonavir	730
ritonavir	728
ritonavir	1102
ritonavir	16
ritonavir	1200
ritonavir	454
ritonavir	187
ritonavir	1058
ritonavir	778
ritonavir	273
ritonavir	497
ritonavir	1210
ritonavir	624
ritonavir	383
ritonavir	603
ritonavir	1193
ritonavir	803
ritonavir	1085
ritonavir	782
ritonavir	196
ritonavir	357
ritonavir	1199
ritonavir	742
ritonavir	20
ritonavir	329
ritonavir	303
ritonavir	577
ritonavir	93
ritonavir	1167
ritonavir	238
ritonavir	976
ritonavir	1115
ritonavir	1064
ritonavir	538
ritonavir	493
ritonavir	315
ritonavir	147
ritonavir	171
ritonavir	898
ritonavir	208
ritonavir	1045
ritonavir	1063
ritonavir	10
ritonavir	91
ritonavir	619
ritonavir	763
ritonavir	394
ritonavir	1032
ritonavir	227
ritonavir	1061
ritonavir	1087
ritonavir	408
ritonavir	801
ritonavir	914
ritonavir	913
ritonavir	1180
ritonavir	1145
ritonavir	710
ritonavir	698
ritonavir	456
ritonavir	457
ritonavir	1088
ibuprofen	191
ibuprofen	816
ibuprofen	1165
ibuprofen	505
ibuprofen	46
ibuprofen	247
ibuprofen	1100
ibuprofen	1066
ibuprofen	1069
ibuprofen	132
ibuprofen	95
ibuprofen	244
ibuprofen	5
ibuprofen	967
ibuprofen	473
ibuprofen	283
ibuprofen	373
ibuprofen	137
ibuprofen	234
ibuprofen	560
ibuprofen	626
ibuprofen	1080
ibuprofen	98
ibuprofen	231
ibuprofen	894
ibuprofen	1042
ibuprofen	263
ibuprofen	245
ibuprofen	1110
ibuprofen	500
ibuprofen	810
ibuprofen	580
ibuprofen	442
ibuprofen	304
ibuprofen	1215
ibuprofen	549
ibuprofen	119
ibuprofen	385
ibuprofen	99
ibuprofen	544
ibuprofen	6
ibuprofen	1178
ibuprofen	2
ibuprofen	217
ibuprofen	1141
ibuprofen	396
ibuprofen	995
ibuprofen	58
ibuprofen	620
ibuprofen	475
ibuprofen	317
ibuprofen	790
ibuprofen	696
ibuprofen	300
ibuprofen	770
ibuprofen	386
ibuprofen	705
ibuprofen	1157
ibuprofen	72
ibuprofen	257
ibuprofen	70
ibuprofen	809
ibuprofen	1104
ibuprofen	35
ibuprofen	54
ibuprofen	1019
ibuprofen	84
ibuprofen	974
ibuprofen	669
ibuprofen	525
ibuprofen	229
ibuprofen	509
ibuprofen	799
ibuprofen	67
ibuprofen	983
ibuprofen	1161
ibuprofen	496
ibuprofen	289
ibuprofen	640
ibuprofen	336
ibuprofen	798
ibuprofen	1126
ibuprofen	871
ibuprofen	432
ibuprofen	864
ibuprofen	872
ibuprofen	92
ibuprofen	980
ibuprofen	1020
ibuprofen	925
ibuprofen	932
ibuprofen	379
ibuprofen	1003
ibuprofen	66
ibuprofen	22
ibuprofen	83
ibuprofen	602
ibuprofen	996
ibuprofen	746
ibuprofen	314
ibuprofen	55
ibuprofen	873
ibuprofen	708
ibuprofen	641
ibuprofen	424
ibuprofen	717
ibuprofen	384
ibuprofen	675
ibuprofen	1219
ibuprofen	79
ibuprofen	236
ibuprofen	652
ibuprofen	802
ibuprofen	1073
ibuprofen	537
ibuprofen	162
ibuprofen	328
ibuprofen	341
ibuprofen	730
ibuprofen	909
ibuprofen	433
ibuprofen	1224
ibuprofen	1047
ibuprofen	951
ibuprofen	1200
ibuprofen	527
ibuprofen	454
ibuprofen	453
ibuprofen	630
ibuprofen	497
ibuprofen	1163
ibuprofen	383
ibuprofen	65
ibuprofen	803
ibuprofen	782
ibuprofen	1085
ibuprofen	357
ibuprofen	838
ibuprofen	435
ibuprofen	1199
ibuprofen	501
ibuprofen	345
ibuprofen	333
ibuprofen	742
ibuprofen	395
ibuprofen	1209
ibuprofen	133
ibuprofen	329
ibuprofen	86
ibuprofen	391
ibuprofen	303
ibuprofen	1151
ibuprofen	577
ibuprofen	649
ibuprofen	374
ibuprofen	238
ibuprofen	1179
ibuprofen	493
ibuprofen	315
ibuprofen	515
ibuprofen	1130
ibuprofen	10
ibuprofen	115
ibuprofen	91
ibuprofen	389
ibuprofen	619
ibuprofen	226
ibuprofen	882
ibuprofen	394
ibuprofen	227
ibuprofen	529
ibuprofen	999
ibuprofen	668
ibuprofen	1160
ibuprofen	1034
ibuprofen	472
ibuprofen	144
ibuprofen	1184
ibuprofen	913
ibuprofen	1180
ibuprofen	698
ibuprofen	456
carbamazepine	198
carbamazepine	282
carbamazepine	1020
carbamazepine	1069
carbamazepine	399
carbamazepine	1181
carbamazepine	735
carbamazepine	1169
carbamazepine	128
carbamazepine	62
carbamazepine	809
carbamazepine	116
carbamazepine	98
carbamazepine	101
carbamazepine	649
carbamazepine	1095
carbamazepine	1094
carbamazepine	129
carbamazepine	736
carbamazepine	641
carbamazepine	743
carbamazepine	79
carbamazepine	1093
carbamazepine	339
carbamazepine	668
carbamazepine	281
carbamazepine	162
carbamazepine	328
carbamazepine	1074
carbamazepine	909
carbamazepine	440
carbamazepine	899
carbamazepine	1047
carbamazepine	58
posaconazole	816
posaconazole	1100
posaconazole	1069
posaconazole	516
posaconazole	132
posaconazole	244
posaconazole	637
posaconazole	1149
posaconazole	310
posaconazole	1156
posaconazole	117
posaconazole	560
posaconazole	98
posaconazole	41
posaconazole	541
posaconazole	219
posaconazole	1110
posaconazole	818
posaconazole	1007
posaconazole	1223
posaconazole	1048
posaconazole	220
posaconazole	6
posaconazole	381
posaconazole	127
posaconazole	995
posaconazole	180
posaconazole	817
posaconazole	1172
posaconazole	638
posaconazole	636
posaconazole	1157
posaconazole	585
posaconazole	961
posaconazole	72
posaconazole	547
posaconazole	688
posaconazole	35
posaconazole	54
posaconazole	974
posaconazole	772
posaconazole	536
posaconazole	669
posaconazole	525
posaconazole	594
posaconazole	218
posaconazole	67
posaconazole	781
posaconazole	496
posaconazole	289
posaconazole	798
posaconazole	1192
posaconazole	871
posaconazole	969
posaconazole	432
posaconazole	864
posaconazole	622
posaconazole	980
posaconazole	275
posaconazole	925
posaconazole	851
posaconazole	1008
posaconazole	356
posaconazole	602
posaconazole	116
posaconazole	1022
posaconazole	641
posaconazole	708
posaconazole	424
posaconazole	417
posaconazole	79
posaconazole	1219
posaconazole	647
posaconazole	236
posaconazole	979
posaconazole	540
posaconazole	328
posaconazole	909
posaconazole	433
posaconazole	1224
posaconazole	627
posaconazole	324
posaconazole	630
posaconazole	250
posaconazole	782
posaconazole	1049
posaconazole	140
posaconazole	345
posaconazole	333
posaconazole	780
posaconazole	1131
posaconazole	303
posaconazole	577
posaconazole	649
posaconazole	534
posaconazole	1176
posaconazole	993
posaconazole	592
posaconazole	147
posaconazole	315
posaconazole	1130
posaconazole	907
posaconazole	91
posaconazole	808
posaconazole	767
posaconazole	529
posaconazole	668
posaconazole	144
posaconazole	1136
pravastatin	198
pravastatin	872
pravastatin	92
pravastatin	901
pravastatin	980
pravastatin	814
pravastatin	1020
pravastatin	244
pravastatin	902
pravastatin	490
pravastatin	284
pravastatin	373
pravastatin	807
pravastatin	228
pravastatin	626
pravastatin	98
pravastatin	352
pravastatin	211
pravastatin	55
pravastatin	182
pravastatin	1018
pravastatin	690
pravastatin	410
pravastatin	424
pravastatin	417
pravastatin	706
pravastatin	79
pravastatin	1219
pravastatin	744
pravastatin	236
pravastatin	802
pravastatin	574
pravastatin	202
pravastatin	385
pravastatin	730
pravastatin	6
pravastatin	777
pravastatin	433
pravastatin	527
pravastatin	935
pravastatin	324
pravastatin	712
pravastatin	436
pravastatin	696
pravastatin	65
pravastatin	782
pravastatin	386
pravastatin	930
pravastatin	881
pravastatin	1157
pravastatin	1199
pravastatin	501
pravastatin	333
pravastatin	72
pravastatin	70
pravastatin	1209
pravastatin	535
pravastatin	303
pravastatin	1151
pravastatin	216
pravastatin	649
pravastatin	54
pravastatin	974
pravastatin	691
pravastatin	669
pravastatin	515
pravastatin	1130
pravastatin	826
pravastatin	208
pravastatin	713
pravastatin	91
pravastatin	619
pravastatin	67
pravastatin	878
pravastatin	882
pravastatin	496
pravastatin	289
pravastatin	529
pravastatin	668
pravastatin	798
pravastatin	295
pravastatin	432
pravastatin	864
pravastatin	1184
pravastatin	913
pravastatin	842
pravastatin	716
pravastatin	1052
pravastatin	199
pravastatin	467
pravastatin	929
azithromycin	816
azithromycin	349
azithromycin	46
azithromycin	1143
azithromycin	1069
azithromycin	244
azithromycin	637
azithromycin	1149
azithromycin	44
azithromycin	283
azithromycin	373
azithromycin	163
azithromycin	626
azithromycin	1080
azithromycin	98
azithromycin	883
azithromycin	118
azithromycin	1110
azithromycin	245
azithromycin	260
azithromycin	715
azithromycin	648
azithromycin	270
azithromycin	385
azithromycin	99
azithromycin	6
azithromycin	722
azithromycin	1141
azithromycin	995
azithromycin	45
azithromycin	478
azithromycin	696
azithromycin	241
azithromycin	386
azithromycin	636
azithromycin	833
azithromycin	705
azithromycin	860
azithromycin	72
azithromycin	70
azithromycin	809
azithromycin	1104
azithromycin	35
azithromycin	772
azithromycin	888
azithromycin	669
azithromycin	445
azithromycin	525
azithromycin	496
azithromycin	289
azithromycin	336
azithromycin	798
azithromycin	866
azithromycin	477
azithromycin	871
azithromycin	956
azithromycin	432
azithromycin	864
azithromycin	563
azithromycin	198
azithromycin	872
azithromycin	622
azithromycin	980
azithromycin	275
azithromycin	1020
azithromycin	925
azithromycin	224
azithromycin	551
azithromycin	22
azithromycin	602
azithromycin	351
azithromycin	1037
azithromycin	939
azithromycin	1177
azithromycin	629
azithromycin	664
azithromycin	641
azithromycin	417
azithromycin	424
azithromycin	194
azithromycin	79
azithromycin	1219
azithromycin	858
azithromycin	236
azithromycin	652
azithromycin	802
azithromycin	162
azithromycin	202
azithromycin	328
azithromycin	730
azithromycin	728
azithromycin	909
azithromycin	433
azithromycin	1047
azithromycin	85
azithromycin	527
azithromycin	453
azithromycin	324
azithromycin	497
azithromycin	727
azithromycin	65
azithromycin	1193
azithromycin	803
azithromycin	1085
azithromycin	1208
azithromycin	345
azithromycin	333
azithromycin	20
azithromycin	742
azithromycin	1209
azithromycin	86
azithromycin	865
azithromycin	303
azithromycin	1151
azithromycin	649
azithromycin	238
azithromycin	1130
azithromycin	848
azithromycin	208
azithromycin	91
azithromycin	767
azithromycin	1146
azithromycin	882
azithromycin	529
azithromycin	668
azithromycin	309
azithromycin	1184
azithromycin	913
azithromycin	259
azithromycin	34
azithromycin	457
nabumetone	1165
nabumetone	958
nabumetone	46
nabumetone	1100
nabumetone	1069
nabumetone	132
nabumetone	244
nabumetone	473
nabumetone	821
nabumetone	373
nabumetone	560
nabumetone	296
nabumetone	98
nabumetone	49
nabumetone	385
nabumetone	99
nabumetone	6
nabumetone	1141
nabumetone	995
nabumetone	317
nabumetone	790
nabumetone	696
nabumetone	638
nabumetone	386
nabumetone	705
nabumetone	1157
nabumetone	72
nabumetone	70
nabumetone	809
nabumetone	1104
nabumetone	371
nabumetone	54
nabumetone	669
nabumetone	525
nabumetone	229
nabumetone	509
nabumetone	623
nabumetone	67
nabumetone	983
nabumetone	496
nabumetone	289
nabumetone	1189
nabumetone	640
nabumetone	336
nabumetone	798
nabumetone	871
nabumetone	319
nabumetone	432
nabumetone	864
nabumetone	806
nabumetone	674
nabumetone	1084
nabumetone	872
nabumetone	582
nabumetone	980
nabumetone	925
nabumetone	69
nabumetone	30
nabumetone	66
nabumetone	22
nabumetone	419
nabumetone	653
nabumetone	55
nabumetone	424
nabumetone	417
nabumetone	384
nabumetone	1134
nabumetone	79
nabumetone	1219
nabumetone	236
nabumetone	652
nabumetone	202
nabumetone	328
nabumetone	730
nabumetone	1224
nabumetone	454
nabumetone	52
nabumetone	453
nabumetone	471
nabumetone	206
nabumetone	383
nabumetone	65
nabumetone	803
nabumetone	1085
nabumetone	1199
nabumetone	345
nabumetone	333
nabumetone	742
nabumetone	1209
nabumetone	329
nabumetone	86
nabumetone	303
nabumetone	577
nabumetone	1151
nabumetone	649
nabumetone	592
nabumetone	315
nabumetone	1130
nabumetone	1225
nabumetone	115
nabumetone	47
nabumetone	619
nabumetone	882
nabumetone	668
nabumetone	1184
nabumetone	913
nabumetone	165
nabumetone	456
troglitazone	676
troglitazone	637
troglitazone	345
troglitazone	72
troglitazone	560
troglitazone	1104
troglitazone	231
troglitazone	610
troglitazone	1229
troglitazone	669
troglitazone	500
troglitazone	525
troglitazone	1225
troglitazone	708
troglitazone	424
troglitazone	67
troglitazone	417
troglitazone	1219
troglitazone	529
troglitazone	798
troglitazone	730
troglitazone	864
troglitazone	6
troglitazone	248
troglitazone	632
modafinil	1165
modafinil	46
modafinil	247
modafinil	1100
modafinil	1069
modafinil	244
modafinil	1181
modafinil	735
modafinil	796
modafinil	234
modafinil	560
modafinil	228
modafinil	626
modafinil	316
modafinil	98
modafinil	963
modafinil	101
modafinil	541
modafinil	245
modafinil	1110
modafinil	49
modafinil	580
modafinil	715
modafinil	304
modafinil	99
modafinil	6
modafinil	381
modafinil	576
modafinil	58
modafinil	978
modafinil	770
modafinil	636
modafinil	1157
modafinil	72
modafinil	1148
modafinil	257
modafinil	809
modafinil	1104
modafinil	1054
modafinil	181
modafinil	54
modafinil	525
modafinil	229
modafinil	959
modafinil	509
modafinil	623
modafinil	67
modafinil	496
modafinil	289
modafinil	339
modafinil	798
modafinil	1126
modafinil	871
modafinil	1212
modafinil	432
modafinil	864
modafinil	21
modafinil	563
modafinil	25
modafinil	852
modafinil	198
modafinil	92
modafinil	980
modafinil	1020
modafinil	687
modafinil	925
modafinil	405
modafinil	176
modafinil	22
modafinil	12
modafinil	602
modafinil	694
modafinil	116
modafinil	800
modafinil	326
modafinil	11
modafinil	641
modafinil	424
modafinil	337
modafinil	79
modafinil	1219
modafinil	236
modafinil	162
modafinil	202
modafinil	540
modafinil	328
modafinil	341
modafinil	909
modafinil	148
modafinil	433
modafinil	897
modafinil	1224
modafinil	1047
modafinil	16
modafinil	1200
modafinil	454
modafinil	324
modafinil	630
modafinil	471
modafinil	603
modafinil	782
modafinil	357
modafinil	345
modafinil	333
modafinil	62
modafinil	1209
modafinil	86
modafinil	303
modafinil	577
modafinil	1220
modafinil	93
modafinil	649
modafinil	1064
modafinil	315
modafinil	493
modafinil	942
modafinil	1225
modafinil	47
modafinil	91
modafinil	763
modafinil	882
modafinil	1021
modafinil	668
modafinil	801
modafinil	401
modafinil	1180
modafinil	698
modafinil	899
repaglinide	198
repaglinide	872
repaglinide	1020
repaglinide	69
repaglinide	287
repaglinide	1181
repaglinide	828
repaglinide	66
repaglinide	765
repaglinide	230
repaglinide	791
repaglinide	560
repaglinide	116
repaglinide	231
repaglinide	55
repaglinide	500
repaglinide	11
repaglinide	641
repaglinide	1219
repaglinide	236
repaglinide	162
repaglinide	328
repaglinide	1047
repaglinide	630
repaglinide	1172
repaglinide	790
repaglinide	696
repaglinide	460
repaglinide	345
repaglinide	1148
repaglinide	86
repaglinide	577
repaglinide	54
repaglinide	121
repaglinide	679
repaglinide	669
repaglinide	515
repaglinide	525
repaglinide	1130
repaglinide	91
repaglinide	67
repaglinide	882
repaglinide	496
repaglinide	289
repaglinide	666
repaglinide	529
repaglinide	309
repaglinide	1160
repaglinide	468
repaglinide	640
repaglinide	798
repaglinide	90
repaglinide	243
repaglinide	871
repaglinide	864
repaglinide	589
repaglinide	899
repaglinide	469
clarithromycin	191
clarithromycin	785
clarithromycin	1165
clarithromycin	505
clarithromycin	416
clarithromycin	1143
clarithromycin	1100
clarithromycin	1069
clarithromycin	244
clarithromycin	1149
clarithromycin	157
clarithromycin	473
clarithromycin	604
clarithromycin	1147
clarithromycin	207
clarithromycin	883
clarithromycin	245
clarithromycin	1110
clarithromycin	1107
clarithromycin	998
clarithromycin	580
clarithromycin	1011
clarithromycin	392
clarithromycin	1215
clarithromycin	158
clarithromycin	476
clarithromycin	385
clarithromycin	381
clarithromycin	127
clarithromycin	1178
clarithromycin	264
clarithromycin	1086
clarithromycin	1141
clarithromycin	396
clarithromycin	153
clarithromycin	1222
clarithromycin	584
clarithromycin	475
clarithromycin	790
clarithromycin	770
clarithromycin	386
clarithromycin	705
clarithromycin	564
clarithromycin	749
clarithromycin	1157
clarithromycin	892
clarithromycin	1104
clarithromycin	19
clarithromycin	54
clarithromycin	1113
clarithromycin	669
clarithromycin	982
clarithromycin	799
clarithromycin	983
clarithromycin	512
clarithromycin	336
clarithromycin	798
clarithromycin	1126
clarithromycin	871
clarithromycin	674
clarithromycin	198
clarithromycin	872
clarithromycin	92
clarithromycin	980
clarithromycin	294
clarithromycin	925
clarithromycin	224
clarithromycin	69
clarithromycin	287
clarithromycin	487
clarithromycin	932
clarithromycin	1051
clarithromycin	405
clarithromycin	30
clarithromycin	1008
clarithromycin	602
clarithromycin	116
clarithromycin	800
clarithromycin	314
clarithromycin	271
clarithromycin	514
clarithromycin	629
clarithromycin	326
clarithromycin	873
clarithromycin	424
clarithromycin	717
clarithromycin	337
clarithromycin	868
clarithromycin	652
clarithromycin	328
clarithromycin	909
clarithromycin	148
clarithromycin	124
clarithromycin	697
clarithromycin	433
clarithromycin	1047
clarithromycin	954
clarithromycin	453
clarithromycin	324
clarithromycin	630
clarithromycin	918
clarithromycin	1163
clarithromycin	65
clarithromycin	250
clarithromycin	815
clarithromycin	889
clarithromycin	452
clarithromycin	367
clarithromycin	345
clarithromycin	333
clarithromycin	780
clarithromycin	62
clarithromycin	1131
clarithromycin	1209
clarithromycin	613
clarithromycin	86
clarithromycin	1151
clarithromycin	794
clarithromycin	649
clarithromycin	1043
clarithromycin	1039
clarithromycin	633
clarithromycin	1130
clarithromycin	848
clarithromycin	1225
clarithromycin	389
clarithromycin	931
clarithromycin	882
clarithromycin	1021
clarithromycin	529
clarithromycin	668
clarithromycin	492
clarithromycin	144
clarithromycin	1184
clarithromycin	589
clarithromycin	899
clarithromycin	1
clarithromycin	816
clarithromycin	46
clarithromycin	247
clarithromycin	132
clarithromycin	735
clarithromycin	1181
clarithromycin	637
clarithromycin	912
clarithromycin	283
clarithromycin	821
clarithromycin	373
clarithromycin	560
clarithromycin	234
clarithromycin	626
clarithromycin	316
clarithromycin	98
clarithromycin	963
clarithromycin	18
clarithromycin	49
clarithromycin	175
clarithromycin	683
clarithromycin	290
clarithromycin	1025
clarithromycin	648
clarithromycin	99
clarithromycin	544
clarithromycin	6
clarithromycin	748
clarithromycin	80
clarithromycin	1190
clarithromycin	795
clarithromycin	74
clarithromycin	696
clarithromycin	179
clarithromycin	636
clarithromycin	860
clarithromycin	72
clarithromycin	809
clarithromycin	1054
clarithromycin	974
clarithromycin	525
clarithromycin	229
clarithromycin	1144
clarithromycin	509
clarithromycin	949
clarithromycin	623
clarithromycin	67
clarithromycin	496
clarithromycin	297
clarithromycin	289
clarithromycin	444
clarithromycin	281
clarithromycin	495
clarithromycin	640
clarithromycin	518
clarithromycin	956
clarithromycin	432
clarithromycin	1074
clarithromycin	864
clarithromycin	237
clarithromycin	21
clarithromycin	563
clarithromycin	479
clarithromycin	145
clarithromycin	622
clarithromycin	430
clarithromycin	275
clarithromycin	1020
clarithromycin	687
clarithromycin	1118
clarithromycin	551
clarithromycin	490
clarithromycin	66
clarithromycin	83
clarithromycin	22
clarithromycin	634
clarithromycin	1166
clarithromycin	783
clarithromycin	55
clarithromycin	1183
clarithromycin	393
clarithromycin	641
clarithromycin	708
clarithromycin	366
clarithromycin	384
clarithromycin	79
clarithromycin	1219
clarithromycin	953
clarithromycin	858
clarithromycin	236
clarithromycin	491
clarithromycin	1120
clarithromycin	162
clarithromycin	202
clarithromycin	730
clarithromycin	728
clarithromycin	1200
clarithromycin	1182
clarithromycin	454
clarithromycin	187
clarithromycin	497
clarithromycin	206
clarithromycin	624
clarithromycin	383
clarithromycin	1193
clarithromycin	803
clarithromycin	1085
clarithromycin	782
clarithromycin	1208
clarithromycin	357
clarithromycin	455
clarithromycin	742
clarithromycin	20
clarithromycin	329
clarithromycin	303
clarithromycin	577
clarithromycin	93
clarithromycin	1167
clarithromycin	238
clarithromycin	1115
clarithromycin	1064
clarithromycin	493
clarithromycin	315
clarithromycin	515
clarithromycin	826
clarithromycin	10
clarithromycin	47
clarithromycin	91
clarithromycin	619
clarithromycin	767
clarithromycin	763
clarithromycin	394
clarithromycin	801
clarithromycin	1136
clarithromycin	292
clarithromycin	259
clarithromycin	1180
clarithromycin	698
clarithromycin	456
clarithromycin	457
ethotoin	198
ethotoin	489
ethotoin	980
ethotoin	300
ethotoin	830
ethotoin	991
ethotoin	989
ethotoin	303
ethotoin	101
ethotoin	649
ethotoin	1229
ethotoin	424
ethotoin	417
ethotoin	717
ethotoin	366
ethotoin	496
ethotoin	1109
ethotoin	290
ethotoin	289
ethotoin	1219
ethotoin	798
ethotoin	1228
ethotoin	724
ethotoin	864
ethotoin	716
ethotoin	829
metoclopramide	816
metoclopramide	46
metoclopramide	980
metoclopramide	422
metoclopramide	490
metoclopramide	769
metoclopramide	602
metoclopramide	382
metoclopramide	163
metoclopramide	110
metoclopramide	1214
metoclopramide	231
metoclopramide	734
metoclopramide	48
metoclopramide	1110
metoclopramide	500
metoclopramide	485
metoclopramide	843
metoclopramide	578
metoclopramide	1122
metoclopramide	417
metoclopramide	304
metoclopramide	59
metoclopramide	99
metoclopramide	447
metoclopramide	148
metoclopramide	1178
metoclopramide	1086
metoclopramide	335
metoclopramide	16
metoclopramide	112
metoclopramide	620
metoclopramide	149
metoclopramide	659
metoclopramide	696
metoclopramide	933
metoclopramide	1157
metoclopramide	435
metoclopramide	345
metoclopramide	333
metoclopramide	70
metoclopramide	240
metoclopramide	303
metoclopramide	577
metoclopramide	1150
metoclopramide	649
metoclopramide	1099
metoclopramide	1158
metoclopramide	54
metoclopramide	1096
metoclopramide	685
metoclopramide	669
metoclopramide	229
metoclopramide	222
metoclopramide	47
metoclopramide	619
metoclopramide	1112
metoclopramide	496
metoclopramide	1021
metoclopramide	289
metoclopramide	1032
metoclopramide	1093
metoclopramide	686
metoclopramide	571
metoclopramide	682
metoclopramide	798
metoclopramide	812
metoclopramide	1184
metoclopramide	758
metoclopramide	660
metoclopramide	835
\.


--
-- Data for Name: institution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institution (institution_name, address, country) FROM stdin;
University of Rochester	University of Arkansas	United States
Oswaldo Cruz Foundation	Universidade Federal do Espirito Santo	Brazil
Kurume University	Kurume University Hospital	Japan
The Ohio State University	The Ohio State University	United States
University of Kentucky	University of Kentucky Dept of Cardiology	United States
University of New Mexico	UNMHSC	United States
Manhattan Eye, Ear & Throat Hospital	Manhattan Eye, Ear & Throat Hospital	United States
University of Iowa	University of Iowa hospitals and Clinics	United States
University of California, Los Angeles	Ahmanson-UCLA Cardiomyopathy Center	United States
NorthShore University HealthSystem Research Institute	University of Chicago Comer Childrens Hospital	United States
Wuerzburg University Hospital	University of Wuerzburg Medical Centre, Department of Internal Medicine II	Germany
Johns Hopkins University	Behavioral Pharmacology Research Unit	United States
University of California, San Diego	Rebecca and John Moores UCSD Cancer Center	United States
Sheba Medical Center	Sheba Medical Center	Israel
Case Comprehensive Cancer Center	Columbia Presbyterian	United States
USDA Beltsville Human Nutrition Research Center	USDA's Beltsville Human Nutrition Research Center	United States
VA Palo Alto Health Care System	VA Palo Alto Health Care System	United States
T.C. ORDU ÜNİVERSİTESİ	Anesthesiology and Reanimation Dept. Ordu University Training and Research Hospital	Turkey
University of Sao Paulo	Institue of Psychiatry - Hospital of Clinics - University of São Paulo	Brazil
Hospital Central Dr. Luis Ortega	Servicio de Aestesiologia.Hospital 'Dr Luis Ortega'	Venezuela
Turku University Hospital	Turku University Hospital	Finland
Ludwig-Maximilians - University of Munich	TASK Applied Science	South Africa
Centre for Addiction and Mental Health	Centre for Addiction and Mental Health	Canada
University Hospital, Antwerp	Antwerp University Hospital	Belgium
Stanford University	Stanford University School of Medicine	United States
University of Schleswig-Holstein	Krankenhaus Dornbirn	Austria
California Pacific Medical Center Research Institute	CPMC - St. Luke's Hospital ~ 7th Floor/ Addiction Pharmacology Research Lab	United States
Montefiore Medical Center	Montefiore Medical Center	United States
University of Pennsylvania	University of Pennsylvania	United States
Medical University of Vienna	Division of Angiology, Department of Internal Medicine II, Medical University of Vienna	Austria
University of Cologne	University Hospital Gasthuisberg	Belgium
Tuen Mun Hospital	Tuen Mun Hospital	China
Wenzhou Medical University	Second Hispital of Wenzhou Medical University	China
National Institutes of Health Clinical Center (CC)	National Institutes of Health Clinical Center, 9000 Rockville Pike	United States
Yale University	Yale University School of Medicine	United States
Medical College of Wisconsin	Medical College of Wisconsin /Froedtert Hospital	United States
Akron Children's Hospital	Sports Medicine Department at Akron Children's Hospital	United States
Cambridge University Hospitals NHS Foundation Trust	Dept of Neurological Surgery, University of Florida	United States
Chelsea and Westminster NHS Foundation Trust	Chelsea and Westminster Hospital	United Kingdom
Gachon University Gil Medical Center	Gil Medical Center	Korea, Republic of
Shahid Sadoughi University of Medical Sciences and Health Services	Behnam Baghianimoghadam	Iran, Islamic Republic of
University Hospital Orebro	Örebro University Hospital	Sweden
Herlev Hospital	Department of Neurology, Herlev Hospital,	Denmark
Seattle Children's Hospital	Stanford University Medical Center	United States
National Cancer Center, Korea	National Cancer Center, Korea	Korea, Republic of
University of Nebraska Medical Center	The Nebraska Medical Center	United States
Duke University Medical Center	University of Alabama at Birmingham	United States
Faculdade de Ciências Médicas da Santa Casa de São Paulo	Otolaryngology Department of Santa Casa School of Medicine and Hospitals of São Paulo Brazil	Brazil
University of Connecticut Health Center	University of Connecticut Health Center	United States
Mahidol University	Kittipong Maneechotesuwan	Thailand
Mayo Clinic	Mayo Clinic in Arizona	United States
East Carolina University	Brody School of Medicine at East Carolina University	United States
University of Oxford	Clinical Trial Service Unit, University of Oxford	United Kingdom
Nationwide Children's Hospital	Children's Memorial Hospital	United States
University of Nebraska	University of Nebraska Medical Center	United States
Massachusetts General Hospital	Massachusetts General Hospital	United States
University Teaching Hospital Hall in Tirol	Hospital Mostviertel Waidhofen/Ybbs	Austria
University of Versailles	Raymond Poincaré hospital	France
University Hospital Tuebingen	Dr. Margarete Fischer-Bosch-Institute of Clinical Pharmacology	Germany
Spaulding Rehabilitation Hospital	Spaulding Rehabilitation Hospital	United States
Centre Hospitalier Universitaire de Besancon	University Hospital of Vienna	Austria
University of Maryland	Baltimore VA Medical Center	United States
Vanderbilt University	Vanderbilt University Medical Center	United States
Shenyang Northern Hospital	General Hospital Of The Second Artillery Force of the PLA	China
Second University of Naples	Department of Clinical and Experimental Medicine, Second University of Naples	Italy
Isala Klinieken	Isala Klinieken	Netherlands
Women and Infants Hospital of Rhode Island	Women and Infants Hospital of Rhode Island	United States
Brigham and Women's Hospital	Brigham and Women's Hospital	United States
University of California, Davis	University of California Davis School of Medicine	United States
University Hospital Freiburg	Institut für Stoffwechselforschung	Germany
The University of Texas Health Science Center, Houston	University of Texas Health Science Center	United States
Università degli Studi dell'Insubria	University of Bologna	Italy
Children's Hospital Boston	Children's Hospital Boston	United States
McMaster University	Thrombosis Service, HHS-General Hospital	Canada
Mercy Facial Plastic Surgery Center	Mercy Facial Plastic Surgery Center	United States
Dana-Farber Cancer Institute	Dana-Farber Cancer Institute	United States
University of Cincinnati	University of Cincinnati	United States
Gundersen Lutheran Health System	Gundersen Lutheran Center for Cancer and Blood	United States
Asan Medical Center	Asan Medical Center, University of Ulsan College of Medicine	Korea, Republic of
Northwestern University	Quest Clinical Research	United States
Hamamatsu University	Hamamatsu University School of Medicine	Japan
Indiana University	Indiana University	United States
Barbara Ann Karmanos Cancer Institute	Karmanos Cancer Institute	United States
Aristotle University Of Thessaloniki	General Hospital of Thessaloniki 'Hippokratio'	Greece
Maine Medical Center	Maine Medical Center	United States
Sun Yat-sen University	The 1st Affiliated Hospital, Sun Yet-sen University	China
Jinling Hospital, China	Department of Neurology, Jinling Hospital, Nanjing University School of Medicine	China
Nanjing Medical University	First Affiliated Hospital of Nanjing Medical University, Division of Geriatrics	China
Bader, Ted, M.D.	Veterans Administration Medical Center	United States
Milton S. Hershey Medical Center	University of California, San Diego	United States
Columbia University	Southern Arizona Veterans Affairs Medical Center	United States
Dr. Margarete Fischer-Bosch-Institut für Klinische Pharmakologie (IKP) am Robert-Bosch-Krankenhaus (RBK)	Dr. Margarete Fischer-Bosch-Institute of Clinical Pharmacology	Germany
University of Minnesota - Clinical and Translational Science Institute	GF Jooste Hospital	South Africa
International Medical Center of Japan	International Medical Center of Japan	Japan
Oxford University Hospitals NHS Trust	Oxford Radcliffe NHS Trust	United Kingdom
State University of New York - Downstate Medical Center	Kings County Hospital Center	United States
Fundació Clínic per la Recerca Biomèdica	Hospital Clinic of Barcelona- Maternity	Spain
Emory University	National Institute of Health, Ministry of Health	Mozambique
Kuopio University Hospital	Kuopio University Hospital	Finland
Wilford Hall Medical Center	Wilford Hall Ambulatory Surgical Center	United States
Argentine Tennis Association	Argentine Tennis Association	Argentina
University of California, San Francisco	San Francisco General Hospital	United States
Ege University	Ege University School of Medicine, Division of Nephrology	Turkey
Washington University School of Medicine	Washington University School fo Medicine	United States
Community Research Initiative of New England	CARE-ID	United States
Woman's Health University Hospital, Egypt	Women Health Hospital	Egypt
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_name, company_name) FROM stdin;
Low Dose Miniprin	Time-Cap Labs, Inc
SOLU-CORTEF	Cardinal Health
rexall hydrocortisone	Dolgencorp, LLC
GILDESS FE 1.5/30	Qualitest Pharmaceuticals
Diclofenac sodium and Misoprostol	Greenstone LLC
Glyburide and Metformin	REMEDYREPACK INC.
Health Mart Regular Strength Enteric Coated Aspirin	McKesson
Cortizone 10 Poison Ivy Relief Pads	Chattem, Inc.
Medique Pain Off	Unifirst First Aid Corporation
K-Mart SmartSense First Aid Contains 303 Pieces	Kmart Corporation
Rx Act Aspirin	H E B
equaline all day pain relief	Supervalu Inc
Butalbital, Acetaminophen and Caffeine with Codeine Phosphate	West-Ward Pharmaceutical Corp
Westcort	Ranbaxy Laboratories Inc.
Western Family	Western Family Foods Inc
Zegerid OTC	MSD Consumer Care, Inc.
Childrens Chewable Aspirin	Cardinal Health
Warfarin Sodium	Cardinal Health
leader ibuprofen cold and sinus	Cardinal Health
Appbutamone-D	Physician Therapeutics LLC
hydrocodone bitartrate and acetaminophen	bryant ranch prepack
Good Sense Omeprazole	L. Perrigo Company
Regular Strength Aspirin	ARMY AND AIR FORCE EXCHANGE SERVICE
Ciprofloxacin hydrochloride	State of Florida DOH Central Pharmacy
Good Sense Ibuprofen	L. Perrigo Company
ERY-TAB	Arbor Pharmaceuticals, Inc.
Clindamycin Hydrochloride	Preferred Pharmaceuticals, Inc
Coachs First Aid Contains 102 Pieces	Cramer Sports
Equaline Ibuprofen	Supervalu Inc
CycloSPORINE	Watson Laboratories, Inc.
Ibuprofen and Pseudoephedrine hydrochloride	Ohm Laboratories Inc.
Proprinal	NorMed
LAMISIL	Novartis Consumer Health, Inc.
headache relief	Publix Super Markets Inc
Piyanping antiitch	Guangdong Zhanjiang Jimin Pharmaceutical Company, Ltd.
FLUOXETINE	Heritage Pharmaceuticals Inc.
POISON OAK	DeMartini Spring Hill Pharmacy, Inc.
Equaline headache formula	Supervalu Inc
Dolgic Plus	Shionogi Inc
members mark omeprazole	Sam's West Inc
nifedipine	Rebel Distributors Corp
ShopRite Omeprazole	Wakefern Food Corporation
Aspiring	Safeway
Kroger	Kroger Company
Equate Naproxen Sodium	Wal-Mart Stores Inc
good sense aspirin	L. Perrigo Company
Caziant	Watson Pharma, Inc.
Diclofenac Sodium Extended-Release	Rebel Distributors Corp.
smart sense ibuprofen pm	Kmart Corporation
ibuprofen cold relief	CVS Pharmacy
Amethia Lo	Watson Pharma, Inc.
Health Mart Aspirin	McKesson
Prandin	Lake Erie Medical DBA Quality Care Products LLC
Pain Aid ESF	Zee Medical Inc
Rapid Comfort Ibuprofen	Lab Safety Supply, Inc.
Trileptal	PD-Rx Pharmaceuticals, Inc.
BUTALBITAL AND ACETAMINOPHEN	STAT Rx USA LLC
Lidocaine HCl and Hydrocortisone Acetate	E. Fougera & Co. A division of Nycomed US Inc.
Goodys	GlaxoSmithKline Consumer Healthcare LP
ARC FIRST AID Emergency Preparedness Contains 167 PIECES	American Red Cross
Indomethacin	REMEDYREPACK INC.
ERYTHROMYCIN Base Filmtab	Rebel Distributors Corp
Cortaid	Johnson & Johnson Consumer Products Company, Division of Johnson & Johnson consumer Companies, Inc.
BUDEPRION XL	NCS HealthCare of KY, Inc dba Vangard Labs
Topcare Stomach Relief	Topco Associates LLC
ShopRite Hydrocortisone	Wakefern Food Corporation
Tiazac Extended Release	Cardinal Health
Phenobarbital	Qualitest Pharmaceuticals
Nizoral	Janssen Pharmaceuticals, Inc.
Ortho Evra	Janssen Pharmaceutical, Inc.
Pylera	Physicians Total Care, Inc.
METHYLPHENIDATE	STAT RX USA LLC
cold and sinus pain relief	Safeway
APPLE	Allergy Laboratories, Inc.
leader ibuprofen cold	Cardinal Health
Health Sense Infants Ibuprofen	Dolgencorp Inc
Berkley and Jensen Aspirin	BJWC
Zithromax	REMEDYREPACK INC.
Colestid	Pharmacia and Upjohn Company
Smart Sense Naproxen Sodium	Kmart Corporation
Preferred Plus Ibuprofen 200	Kinray
Nicardipine HCl	Cantrell Drug Company
Tri-Lo-Sprintec	Teva Pharmaceuticals USA Inc
Pain Relief Ibuprofen	Rite Aid
Naproxen Sodium	bryant ranch prepack
GLIPIZIDE and METFORMIN HYDROCHLORIDE	St Marys Medical Park Pharmacy
Up and Up Sinus and Cold D	Target Corporation
Cortizone 10 Hydratensive Soothing Anti Itch	Chattem, Inc.
Ketodan	Medimetriks Pharmaceuticals, Inc.
AMIODARONE HYDROCHLORIDE	Wockhardt USA LLC.
Diflucan	Lake Erie Medical & Surgical Supply DBA Quality Care Products LLC
Sunmark Sinus and Cold D	McKesson
Cardene I.V.	EKR Therapeutics, Inc.
TopCare All Day Pain Relief	Topco Associates LLC
Good Sense headache formula	L Perrigo Company
LAMISIL AT	Novartis Consumer Health, Inc.
Erythromycin-Benzoyl Peroxide	Physicians Total Care, Inc.
Imipenem and Cilastatin	Hospira, Inc.
Colcrys	Physicians Total Care, Inc.
CVS	CVS Pharmacy
APROFEN	A P J Laboratories Limited
LARIN Fe 1/20	Northstar Rx LLC
Hydrocortisone Regular Strength	Walgreen Company
clindamycin hydrochloride	Stat Rx USA
Genuine Hydrocortisone	Genuine First Aid, LLC
AVANDARYL	GlaxoSmithKline LLC
BUPROBAN	TEVA Pharmaceuticals USA Inc
CALAN SR	G.D. Searle LLC Division of Pfizer Inc
Enteric Aspirin	COSTCO WHOLESALE CORPORATION
clindamycin palmitate hydrochloride	Greenstone LLC
Sunmark Naproxen Sodium	McKesson
Hydrocortisone and Acetic Acid	Taro Pharmaceuticals U.S.A., Inc.
METOZOLV	Salix Pharmaceuticals, Inc.
Oxycodone and Aspirin	Physicians Total Care, Inc.
FLUOXETINE HYDROCHLORIDE	REMEDYREPACK INC.
Natureplex Hydrocortisone	Natureplex, LLC
up and up ibuprofen	Target Corporation
Griseofulvin	TevaPharmaceuticals USA Inc
equate migraine relief	Wal-Mart Stores Inc
Leader Ibuprofen	Cardinal Health
Diltiazem Hydrochloride Extended Release	Watson Laboratories Inc.
Soothe	Rodan & Fields, LLC.
ZEOSA	Teva Pharmaceuticals USA Inc
Low-Dose Aspirin	Target Corporation
good sense ibuprofen pm	L Perrigo Company
Alacort	Crown Laboratories
Fluoxetine Hydrochloride	Sandoz Inc
U-Cort	Taro Pharmaceuticals U.S.A., Inc.
ARC FIRST AID Contains 404 PIECES	American Red Cross
Protection	Genuine First Aid LLC
leader aspirin	Cardinal Health
Film Coated Ibuprofen	Family Dollar
Metoclopramide Hydrochloride	Bryant Ranch Prepack
Sandostatin	Novartis Pharmaceuticals Corporation
GLYBURIDE AND METFORMIN HYDROCHLORIDE	Dr. Reddy's Laboratories Limited
Theraproxen-90	Physician Therapeutics LLC
Solu-Cortef	Cardinal Health
Pramosone	Ferndale Laboratories, Inc.
Glimepiride	Lake Erie Medical DBA Quality Care Products LLC
Flanax Aspirin Pain Reliever	Belmora LLC
Benzaclin	Valeant Pharmaceuticals North America LLC
Lidocaine HCl - Hydrocortisone Acetate	PureTek Corporation
Good Neighbor Pharmacy ibuprofen	Amerisource Bergen
CORTISPORIN	Pfizer Laboratories Div Pfizer Inc
VFEND	Roerig
Arthriten	Alva-Amco Pharmacal Companies, Inc.
DG Health Hydrocortisone Cream	Dolgencorp Inc
Zegerid	Santarus, Inc.
Pioglitazone hydrochloride and glimepiride	Sandoz Inc
Junior Strength Ibuprofen	Shopko Stores Operating Co., LLC
Clindamycin in 5 Percent Dextrose	Sandoz Inc
JINTELI	Physicians Total Care, Inc.
Ache and Pain Relief to Go	Breakthrough Products Inc.
MonoNessa	Watson Pharmaceuticals
Omeprazole Magnesium	Dr. Reddy's Laboratories Limited
Regular Strength Aspirin EC	NCS HealthCare of KY, Inc dba Vangard Labs
ERYGEL	Prestium Pharma, Inc.
BUTALBITAL, ASPIRIN, AND CAFFEINE	STAT RX USA LLC
JUVISYNC	Merck Sharp & Dohme Corp.
Low Dose Pain Relief Aspirin	Rite Aid
Allopurinol sodium	Bedford Laboratories
Hydrocortisone Butyrate	Glenmark Generics Inc.,USA
Bayer Aleve	Unifirst First Aid Corporation
K-Mart SmartSense First Aid Contains 101 Pieces	K Mart
Health Mart Stomach relief	McKesson
ALYACEN 7/7/7	Glenmark Generics Inc., USA
Dasetta 7/7/7	Northstar Rx LLC
Medique Medi Seltzer	Unifirst First Aid Corporation
amiodarone hydrochloride	Sagent Pharmaceuticals
family wellness childrens ibuprofen	Family Dollar Services Inc
LARIN Fe 1.5/30	Northstar Rx LLC
being well ibuprofen	Save-A-Lot Food Stores Ltd
Verapamil	Apotex Corp.
Repaglinide	Mylan Pharmaceuticals Inc.
berkley and jensen ibuprofen pm	BJWC
Aleve	Bayer HealthCare LLC, Consumer Care
proctofoam HC	Schwarz Pharma
Kaopectate Regular Strength Peppermint Flavor Anti Diarrheal	Chattem, Inc.
ALL DAY RELIEF	Meijer Distribution Inc
Diltiazem Hydrochloride	REMEDYREPACK INC.
BUTALBITAL, ACETAMINOPHEN, CAFFEINE, AND CODEINE PHOSPHATE	Physicians Total Care, Inc.
QUARTETTE	Teva Women's Health, Inc.
Midol Extended Relief	Bayer HealthCare LLC, Consumer Care
Healthy Accents Naproxen Sodium	DZA Brands LLC
Butalbital and Acetaminophen	Nexgen Pharma, Inc.
profen ib	Publix Super Markets Inc
Equagesic	Mikart, Inc.
Butalbital, Acetaminophen and Caffeine	Rebel Distributors Corp
OMEPRAZOLE	STAT Rx USA LLC
Erythromycin and Benzoyl Peroxide	Sandoz
healthy accents omeprazole	DZA Brands LLC
Simvastatin	Teva Pharmaceuticals USA Inc
Cortenema	ANIP Acquisition Company
E.E.S	A-S Medication Solutions LLC
CortiSil MDX	BioZone Laboratories,Inc.
Immediate Comfort	Bioelements, Inc.
OKT3	Centocor Ortho Biotech Products, L.P.
METHOTREXATE	Dispensing Solutions, Inc.
Piroxicam	PACK Pharmaceuticals, LLC
FormuCare Aspirin	Access Business Group International LLC
PROBUFEN	SAMSUNG PHARM IND. CO., LTD.
Refuge HC	CoValence Inc.
CIPROFLOXACIN	Bryant Ranch Prepack
butalbital, aspirin, caffeine and codeine phosphate	bryant ranch prepack
healthy accents cortisone	DZA Brands LLC
Tarka	Physicians Total Care, Inc.
Anusol HC	Salix Pharmaceuticals, Inc
Low-Ogestrel	Watson Pharma, Inc.
Diltiazem HCl CD	Oceanside Pharmaceuticals
Cedaprin	North Safety Products LLC
care one hydrocortisone	American Sales Company
Carisoprodol and Aspirin	Mirror Pharmaceuticals LLC
Scalpicin Maximum Strength	Reckitt Benckiser LLC
Goodys Extra Strength	Medtech Products Inc.
Rifadin	Sanofi-Aventis U.S. LLC
ORBIVAN	Atley Pharmaceuticals, Inc.
METOCLOPRAMIDE	STAT RX USA LLC
Kaopectate Regular Strength Vanilla Flavor Anti Diarrheal	Physicians Total Care, Inc.
Zenchent FE	Amneal Pharmaceuticals of New York, LLC
Mysoline	Valeant Pharmaceuticals North America
METHOTREXATE SODIUM	GenPak Solutions LLC
Flector	H.J. Harkins Company, Inc.
Red Delicious Apple	Nelco Laboratories, Inc.
good sense all day pain relief	L Perrigo Company
glipizide	Caraco Pharmaceutical Laboratories, Ltd.
Mountain Series Weekender Medical	Tender Corporation dba Adventure Medical Kits
Lescol	Novartis Pharmaceuticals Corporation
TERBINAFINE HYDROCHLORIDE	Wockhardt Limited
Ponstel	Shionogi Inc.
SIMVASTATIN	Lake Erie Medical DBA Quality Care Products LLC
formucare naproxen sodium	Access Business Group International LLC
bupropion hydrochloride	Jubilant Cadista Pharmaceuticals Inc.
Methotrexate	Mylan Institutional LLC
Regular Strength Enteric Aspirin	L.N.K. International, Inc.
CIPRO	Alcon Laboratories, Inc.
Kroger Value Aspirin	Kroger Company
ERYTHROMYCIN ETHYLSUCCINATE AND SULFISOXAZOLE ACETYL	Physicians Total Care, Inc.
Ketek	sanofi-aventis U.S. LLC
MEVACOR	Merck Sharp & Dohme Corp.
Azulfidine	Pharmacia and Upjohn Company
Moore Medical Ibuprofen	Moore Medical LLC
Verapamil HCl	AMERICAN REGENT, INC.
SARAFEM	Warner Chilcott (US), LLC
Cortomycin	Major Pharmaceuticals
PIRMELLA 7/7/7	Lupin Pharmaceuticals, Inc.
Modern Pain Medicine	Athlete's Needs Inc
IBUPROFEN AND DIPHENHYDRAMINE HCL	Strides Arcolab Limited
athletes foot	Supervalu Inc
DICLOFENAC POTASSIUM	APOTHECA, INC
Handy Solutions GENUINE ASPIRIN BAYER	Navajo Manufacturing Company Inc.
ShopRite Infants Ibuprofen	Wakefern Food Corporation
Fosphenytoin	Fresenius Kabi USA, LLC
Flurbiprofen	Teva Pharmaceuticals USA Inc
Analpram E	Ferndale Laboratories, Inc.
Reglan	General Injectables & Vaccines, Inc
Healthy Accents headache relief	DZA Brands LLC
dg health naproxen sodium	Dolgencorp, LLC
equate ibuprofen cold and sinus	Wal-Mart Stores Inc
Mefenamic Acid	LUPIN PHARMACEUTICALS INC
Pepto-Bismol	Procter & Gamble Manufacturing Company
IBU	Unit Dose Services
Maximum-H	New GPC, Inc.
Analpram HC	Ferndale Laboratories, Inc.
Diclofenac Sodium Delayed-release	ALPHAPHARM PTY LTD
Cordarone	Wyeth Pharmaceuticals Inc., a subsidiary of Pfizer Inc.
Care One Aspirin	American Sales Company
GERI-PECTATE PEPPERMINT FLAVOR	Geri-Care Pharmaceuticals, Corp
Previfem	Qualitest Pharmaceuticals
Sprintec	Rebel Distributors Corp
Feldene	Pfizer Laboratories Div Pfizer Inc
TopCare Omeprazole	Topco Associates LLC
Nefazodone Hydrochloride	AvKARE, Inc.
FIRST AID Contains 303 PIECES	Genuine First Aid LLC
MIDODRINE HYDROCHLORIDE	AvPAK
ENDODAN	STAT RX USA LLC
Fluvastatin Sodium	Mylan Pharmaceuticals Inc.
Enteric coated aspirin	Mckesson (Sunmark)
Cortisone Maximum Strength	CVS Pharmacy
exchange select naproxen sodium	Army & Air Force Exchange Service
Ibuprofen	NCS HealthCare of KY, Inc dba Vangard Labs
Pain Stoppers Extra	North Safety Products LLC
METHYLPHENIDATE HYDROCHLORIDE	Lake Erie Medical DBA Quality Care Products LLC
ZONISAMIDE	Aidarex Pharmaceuticals LLC
FAMILY CARE HYDROCORTISONE	UNITED EXCHANGE CORP.
OCELLA	BARR LABORATORIES, INC.
Lessina	Barr Laboratories Inc.
Covera-HS	G.D. Searle LLC Division of Pfizer Inc
NU-DERM Tolereen	OMP, Inc.
Midol	Bayer HealthCare LLC - Consumer Care
Enteric Coated Asprin 81 mg	CHAIN DRUG MARKETING ASSOCIATION INC
Necon	Rebel Distributors Corp
butalbital, acetominophen and caffeine	Rising Pharmaceuticals, Inc.
Lamisil	Novartis Pharmaceuticals Corporation
migraine formula	HyVee Inc
Tri Previfem	Qualitest Pharmaceuticals
BLUE ACME SLEEVE  FIRST AID Contains 1000 PIECES	Acme United Corp.
CVS Pharmacy Anti-itch	CVS
CLARITHROMYCIN	KAISER FOUNDATION HOSPITALS
Leader Aspirin	Cardinal Health
FEMCON Fe	Physicians Total Care, Inc.
PCE	Arbor Pharmaceuticals, Inc.
Estarylla	Sandoz Inc
ALLOPURINOL	REMEDYREPACK INC.
Proctocream	Alaven Pharmaceutical LLC
ALLI	GlaxoSmithKline Consumer Healthcare LP
Lidocaine Hydrochloride and Hydrocortisone Acetate	Seton Pharmaceuticals
Sunmark Ibuprofen IB	McKesson
Adult Low Dose Enteric Coated Aspirin	Geri-Care Pharmaceutical Corp
Griseofulviin (microsize)	Rebel Distributors Corp
Sandimmune	Novartis Pharmaceuticals Corporation
Enpresse	Barr Laboratories Inc.
hydrocortisone 1	CVS Pharmacy
ADVENTURE MEDICAL KITS 1-4 PERSON FIRST AID	Tender Corp dba Adventure Medical Kits
Apri	Barr Laboratories Inc.
Cortisporin	Physicians Total Care, Inc.
Diclofenac Sodium Delayed Release	REMEDYREPACK INC.
SULFATRIM	STI Pharma LLC
AVIANE	Physicians Total Care, Inc.
HydroSkin	Rugby Laboratories
50 Person ANSI	Genuine First Aid LLC
Diclofenac	Akorn, Inc.
All Day Relief	Publix Super Markets Inc
RE-PB HYOS ELIXIR	Rebel Distributors Corp
Butalbital, Aspirin, Caffeine and Codeine Phosphate	Jerome Stevens Pharmaceuticals
berkley and jensen migraine relief	BJWC
Mestinon	Valeant Pharmaceuticals North America LLC
Family Wellness Maximum Strength Hydrocortisone	Family Dollar
Up and Up Ibuprofen	Target Corporation
SULFASALAZINE	Physicians Total Care, Inc.
Good Sense Naproxen Sodium	L. Perrigo Company
Foscarnet Sodium	Hospira, Inc.
ClindaMax	PharmaDerm, A division of Nycomed US Inc.
BAMBOO SALT  Eunganggo Jook Yeom	LG Household and Healthcare, Inc.
Benzamycin Pak	Dermik Laboratories
Regular Strength Tri-Buffered Aspirin	WALGREEN CO.
ADVIL ALLERGY SINUS	Pfizer Consumer Healthcare
PREVPAC	Takeda Pharmaceuticals America, Inc.
Terra-Cortril	Roerig
Ortho Tri Cyclen	Janssen Pharmaceuticals, Inc.
CAMBIA	Nautilus Neurosciences, Inc.
Omeprazole and Sodium Bicarbonate	Par Pharmaceutical Inc.
GLIPIZIDE	STAT Rx USA LLC
Up and Up Migraine Relief	Target Corporation
GLUCOVANCE	Physicians Total Care, Inc.
SUSTIVA	Physicians Total Care, Inc.
Oxaprozin	Lake Erie Medical DBA Quality Care Products LLC
Aveeno Hydrocortisone Anti Itch	Johnson & Johnson  Consumer Products Company, Division of Johnson & Johnson Consumer Companies, Inc.
hydrocortisone Iodoquinol	Perrigo New York Inc
good sense ibuprofen	L Perrigo Company
Hypertenevide-12.5	Physician Therapeutics LLC
FLECTOR	Lake Erie Medical & Surgical Supply DBA Quality Care Products LLC
CAMRESE	TEVA Pharmaceuticals USA Inc
Cryselle	Barr Laboratories Inc.
All Day Pain Relief	H E B
Etoposide	APP Pharmaceuticals, LLC
Ortho Cept	Janssen Pharmaceuticals, Inc.
Daypro	G.D. Searle LLC Division of Pfizer Inc
Genuine First Aid - Auto First Aid	Genuine First Aid, LLC
DILANTIN	KAISER FOUNDATION HOSPITALS
Dermarest	Insight Pharmaceuticals
Carbamazepine (Chewable)	American Health Packaging
FLUVASTATIN SODIUM	Sandoz Inc
Genuine First Aid Industrial  First Aid	Genuine First Aid, LLC
AUBRA	Afaxys Inc.
Easy Care First Aid Kit - Outdoor and Travel	Tender Corp dba Adventure Medical Kits
Berkley and Jensen Naproxen Sodium	BJWC
good neighbor pharmacy pain relief	Amerisource Bergen
Amiodarone Hydrochloride	McKesson Packaging Services a business unit of McKesson Corporation
Proquin	Depomed, Inc.
Ery-Ped	Arbor Pharmaceuticals, Inc.
NICARdipine Hydrochloride	Sun Pharma Global Inc.
PrandiMet	Novo Nordisk
Nifediac CC	Teva Pharmaceuticals USA Inc
Toposar	Teva Parenteral Medicines, Inc.
Nortrel	Barr Laboratories Inc.
Prozac	Stat Rx USA
Mefenamic acid	Paddock Laboratories, Inc.
migraine relief	Rite Aid Corporation
Combunox	Forest Pharmaceuticals, Inc.
TRI-LINYAH	Northstar Rx LLC
Zovia 1/35E-28	Watson Pharma, Inc.
Care One hydrocortisone	American Sales Company
ClindaMax Lotion	PharmaDerm, A division of Nycomed US Inc.
ENPRESSE	Physicians Total Care, Inc.
Theraprofen-60	Physician Therapeutics LLC
BC Arthritis	Medtech Products Inc.
Propafenone	Rebel Distributors Corp
clindamycin phosphate	Greenstone LLC
DG Health migraine relief	Dolgencorp, LLC
TRI-LO-MARZIA	Lupin Pharmaceuticals, Inc.
Epitol	Teva Pharmaceuticals USA Inc
BuPROPion Hydrochloride	NCS HealthCare of KY, Inc dba Vangard Labs
KAO-TIN PEPPERMINT FLAVOR	MAJOR Pharmaceuticals Inc.
Cyclosporine	IVAX Pharmaceuticals, Inc.
Leader ibuprofen pm	Cardinal Health
healthy accents ibuprofen	DZA Brands LLC
Enlon	Mylan Institutional LLC
Ketoprofen Extended-release	Andrx Pharmaceuticals, Inc.
Renagel	State of Florida DOH Central Pharmacy
Solia	Prasco Laboratories
Advil	Pfizer Consumer Healthcare
Clindamycin - Benzoyl Peroxide	Prasco Laboratories
10 Person ANSI	Genuine First Aid LLC
Excedrin	Novartis Consumer Health, Inc
Hydrocortisone with Aloe	Actavis Mid Atlantic LLC
care one aspirin	American Sales Company
Phenytoin Infatabs	Greenstone LLC
TriNessa	Rebel Distributors Corp
Clindagel	Onset Dermatologics LLC
GERI-PECTATE VANILLA FLAVOR	Geri-Care Pharmaceuticals, Corp
Leader Sinus and Cold-D	Cardinal Health
good neighbor pharmacy Ibuprofen	Amerisource Bergen
TOLMETIN SODIUM	Mutual Pharmaceutical Company, Inc.
Childrens Motrin	McNeil Consumer Healthcare Div. McNeil-PPC, Inc
ARC FIRST AID Contains 1000 PIECES	American Red Cross
ProAmatine	Shire US Manufacturing Inc.
Atripla	Bristol Myers Squibb & Gilead Sciences, LLC
Amiodarone HCl	Cantrell Drug Company
Vytone	Artesa Labs, LLC
topcare headache formula	Topco Associates LLC
SULFAMETHOXAZOLE AND TRIMETHOPRIM	New Horizon Rx Group, LLC
Kelnor 1/35	Barr Laboratories Inc.
ALKERAN	Apo-Pharma USA, Inc
SULINDAC	Lake Erie Medical DBA Quality Care Products LLC
CVS HYDROCORTISONE WITH ALOE	CVS PHARMACY
Bismuth Subsalicylate	A&Z Pharmaceutical, Inc.
Enteric Coated Low Dose Aspirin	WALGREEN CO.
Primidone	Qualitest Pharmaceuticals
Cleocin T	Pharmacia and Upjohn Company
Donnatal Extentabs	PBM Pharmaceuticals, Inc
Sunmark migraine relief	McKesson
BUDEPRION	TEVA Pharmaceuticals USA Inc
Smart Sense migraine relief	Kmart Corporation
kirkland signature ibuprofen ib	Costco Wholesale Company
CARISOPRODOL and ASPIRIN	Rising Pharmaceuticals, Inc.
Mefenamic-Acid	SCIELE PHARMA INC
Coreg	Physicians Total Care, Inc.
Topcare Migraine Formula	Topco Associates LLC
Glyburide and Metformin Hydrochloride	Actavis Elizabeth LLC
Neomycin and Polymyxin B Sulfates and Bacitracin Zinc with Hydrocortisone Acetate	Physicians Total Care, Inc.
OMESEC	Corporacion Infarmasa
care one ibuprofen cold and sinus	American Sales Company
Procardia	Pfizer Laboratories Div Pfizer Inc
Equate Ibuprofen	Wal-Mart Stores Inc
Chloroquine Phosphate	Ranbaxy Pharmaceuticals Inc.
health mart migraine formula	McKesson
PACERONE	Physicians Total Care, Inc.
Added Strength Pain Reliever	Safeway
Leader Childrens Ibuprofen	Cardinal Health
Reclipsen	Watson Pharma, Inc.
hydrocortisone acetate pramoxine HCl	Perrigo New York Inc
MARLISSA	Glenmark Generics Inc.,USA
Proactiv Solution Anti-Itch Scalp	Guthy-Renker LLC.
ibuprofen pm	Kroger Company
Butisol Sodium	Meda Pharmaceuticals Inc.
ORTHO TRI CYCLEN Lo	Janssen Pharmaceuticals, Inc.
GENUINE FIRST AID Emergency Preparedness Contains 167 PIECES HARDCASE	Genuine First Aid LLC
Gengraf	AbbVie Inc.
Tilia Fe	Watson Pharma, Inc.
LOCOID LIPOCREAM	Ferndale Laboratories
Glipizide and Metformin Hydrochloride	AvKARE, Inc.
Daysee	Lupin Pharmaceuticals, Inc.
Dermaquest Skin Therapy Post-Skin Resurfacing Balm	Allure Labs, Inc.
QUESTRAN	Par Pharmaceutical Inc.
Cartia	Watson Pharma, Inc.
Naprelan	ALMATICA PHARMA INC.
equate ibuprofen pm	Wal-Mart Stores Inc
Pramoxine-HC	Ascend Laboratories, LLC
PREPARATION H HYDROCORTISONE	Pfizer Consumer Healthcare
Tolmetin Sodium	Mylan Pharmaceuticals Inc.
rexall aspirin	Dolgencorp, LLC
Rx Act all day pain relief	H E B
Ecotrin	Medtech Products Inc.
Sunmark ibuprofen	McKesson
Vagisil Satin	Combe Incorporated
Rheumatrex	DAVA Pharmaceuticals, Inc.
Good Neighbor Pharmacy Ibuprofen PM	Amerisource Bergen
LOESTRIN 1/20	Teva Women's Health, Inc
dg health omeprazole	Dolgencorp, LLC
Azithromycin Dihydrate	REMEDYREPACK INC.
ARTHROTEC	Rebel Distributors Corp.
LEADER HYDROCORTISONE	CARDINAL HEALTH
IsonaRif	VersaPharm Incorporated
URSO	Cardinal Health
Cleocin Hydrochloride	Pharmacia and Upjohn Company
Berkley and Jensen ibuprofen	BJWC
BC	Medtech Products Inc.
CARBAMAZEPINE	REMEDYREPACK INC.
CYCLOPHOSPHAMIDE	Baxter Healthcare Corporation
CYCLESSA	Organon Pharmaceuticals USA
Lidocaine HCl  - Hydrocortisone Acetate	PureTek Corporation
health mart omeprazole	McKesson
Omeclamox-Pak	Pernix Therapeutics, LLC
Bloxiverz	Éclat Pharmaceuticals, LLC
FACE VALUES HYDROCORTISONE WITH ALOE	HARMON STORES INC.
Butalbital, Acetaminophen, Caffeine	REMEDYREPACK INC.
Olanzapine and Fluoxetine	Sandoz Inc
RYTHMOL	GlaxoSmithKline LLC
Neosporin Essentials Trial Pack	Johnson & Johnson Consumer Products company, Division of Johnson & Johnson Consumer Companies, Inc.
VERELAN	UCB, Inc.
Aspir Low	Cardinal Health
CAREALL Hydrocortisone	New World Imports, Inc
Aggrenox	Boehringer Ingelheim Pharmaceuticals, Inc.
Preferred Plus Ibuprofen	Kinray, Inc.
Omeprazole Delayed-Release	Ranbaxy Laboratories Inc.
WARFARIN SODIUM	St Marys Medical Park Pharmacy
Extra Strength Back and Body	WOONSOCKET PRESCRIPTION CENTER,INCORPORATED
Necon 0.5/35	Rebel Distributors Corp
Equate omeprazole delayed release	Wal-Mart Stores Inc
sunmark headache relief	McKesson
ASPIRIN	HART Health
CRYSELLE	Physicians Total Care, Inc.
DONNATAL	KAISER FOUNDATION HOSPITALS
fluoxetine	NCS HealthCare of KY, Inc dba Vangard Labs
Sulfatrim	Actavis Mid Atlantic LLC
Colocort	Paddock Laboratories, Inc.
Gleevec	Novartis Pharmaceuticals Corporation
glyburide	Greenstone Ltd.
ESTROSTEP Fe	Warner Chilcott (US), LLC
healthy accents stomach relief	DZA Brands LLC
Diltiazem HCl	Cantrell Drug Company
Health Mart Childrens Ibuprofen	McKesson
Perrigo Ibuprofen	Perrigo Pharmaceuticals Company
Enlon Plus	Mylan Institutional LLC
North Aspirin	North Safety Products
LEXIVA	State of Florida DOH Central Pharmacy
LoSeasonique	Teva Women's Health, Inc.
Phenytoin	Atlantic Biologicals Corps
ATOPALM Moisturizing Hydrocortisone	NeoPharm Co., Ltd.
Naproxen Kit	Pharmaceutica North America, Inc
Healthy Accents Aspirin	DZA Brands LLC
Topcare Infants Ibuprofen	Topco Associates LLC
FixMySkin Healing Balm Unflavored	Lovely Skin, Inc.
INFANTS ADVIL	Pfizer Consumer Healthcare
Desogestrel and Ethinyl Estradiol	Northstar Rx LLC
Adult Chewable Low Dose Aspirin	ARMY AND AIR FORCE EXCHANGE SERVICE
Leader Cardinal Health Aspirin	Cardinal Health
ShopRite Childrens Ibuprofen	Wakefern Food Corporation
Jolessa	Physicians Total Care, Inc.
oxycodone hydrochloride and ibuprofen	Watson Laboratories, Inc.
Good Neighbor Pharmacy Aspirin	Amerisource Bergen
methylphenidate hydrochloride	Watson Laboratories, Inc.
SILVADENE	A-S Medication Solutions LLC
Pyridostigmine bromide	Valeant Canada Limited
good sense anti itch	L. Perrigo Company
ETOPOPHOS	E.R. Squibb & Sons, L.L.C.
Equate Aspirin	Wal-Mart Stores Inc
Nembutal Sodium	Oak Pharmaceuticals, Inc. (Subsidiary of Akorn, Inc.)
Neomycin and Polymyxin B Sulfates and Hydrocortisone	A-S Medication Solutions LLC
Ery-Tab	REMEDYREPACK INC.
NAPRELAN	PD-Rx Pharmaceuticals, Inc.
Carvedilol	REMEDYREPACK INC.
Actigall	Watson Pharma, Inc.
Blowfish	Rally Labs LLC
Sulfasalazine	Major Pharmaceuticals
Neomycin and Polymyxin B Sulfates, Bacitracin Zinc and Hydrocortisone	Bausch & Lomb Incorporated
ADVIL COLD AND SINUS	Pfizer Consumer Healthcare
ALTAVERA	Sandoz Inc
Indomethacin extended-release	Keltman Pharmaceuticals Inc.
Levora	Physicians Total Care, Inc.
Carbamazepine	State of Florida DOH Central Pharmacy
Tri-Buffered Aspirin	Major Pharmaceuticals
Up and Up Naproxen sodium	Target Corporation
Rifampin	REMEDYREPACK INC.
ZYBAN	GlaxoSmithKline LLC
Maximum Strength Cortizone 10 Quick Shot 360 Continuous	Chattem, Inc.
Naproxen Tablets	Dr. Reddy's Laboratories Limited
Cyclophosphamide	Physicians Total Care, Inc.
ketoconazole	REMEDYREPACK INC.
Pain Reliever Plus	Major Pharmaceuticals
Ciprodex	Physicians Total Care, Inc.
Headache Relief	Good Sense (Geiss, Destin & Dunn, Inc.)
Diclofenac Sodium	Dispensing Solutions, Inc.
Sentraflox AM-10	Physician Therapeutics LLC
NAPROXEN	Pharmaceutica North America, Inc.
IBUPROFEN	STAT Rx USA LLC
Digoxin	Golden State Medical Supply, Inc.
Ery	Perrigo New York Inc
Procto-Kit	Ranbaxy Laboratories Inc
EVOCLIN	Stiefel Laboratories Inc
Infants Motrin	McNeil Consumer Healthcare    Div McNeil-PPC, Inc
diltiazem hydrochloride	Forest Laboratories, Inc.
Fenoprofen Calcium	Mylan Pharmaceuticals Inc.
QUADRAPAX	Acella Pharmaceuticals, LLC
Dilantin-125	Parke-Davis Div of Pfizer Inc
WERA	Northstar Rx LLC
Foscavir	Clinigen Healthcare Ltd.
Beyaz	Bayer HealthCare Pharmaceuticals Inc.
PRAMCORT	Rochester Pharmaceuticals
Mesantoin	Novartis Pharmaceuticals Corporation
Good Sense Anti Itch	L Perrigo Company
Good Sense ibuprofen	L Perrigo Company
omeprazole	REMEDYREPACK INC.
Erythromycin	Bausch & Lomb Incorporated
Health Mart Naproxen Sodium	McKesson
Neomycin and Polymyxin B Sulfates, Bacitracin Zinc, and Hydrocortisone	Akorn, Inc.
kirkland signature omeprazole	Costco Wholesale Company
Dilantin	Cardinal Health
good neighbor pharmacy childrens ibuprofen	Amerisource Bergen
MedPride	Shield Line LLC
cortisone	CVS Pharmacy
Bayer	Bayer HealthCare LLC, Consumer Care
Family Wellness	Zhejiang Jingwei Pharmaceutical Co., Ltd.
aspirin	Medicine Shoppe International Inc
FIRST AID  Contains 101 PIECES HARDCASE	Genuine First Aid LLC
Our Family	Nash-Finch Company
Methylin	Golden State Medical Supply
Buffered Aspirin	Rite Aid
LEVONORGESTREL AND ETHINYL ESTRADIOL	Mylan Pharmaceuticals Inc.
Zee Pain Aid	Zee Medical Inc
Metadate ER	UCB Manufacturing, Inc.
ACANYA	Dow Pharmaceuticals Sciences
Maxitril	Fusion Pharmaceuticals LLC
Cortisone Maximum Strength with Aloe	CVS Pharmacy
Smart Sense Hydrocortisone	Kmart Corporation
Motrin IB	Lil' Drug Store Products, Inc.
GOOD SENSE IBUPROFEN	L Perrigo Company
Desempacho	Pharmalab Enterprises Inc.
Butalbital, Aspirin and Caffeine	Rebel Distributors Corp
up and up aspirin	Target Corporation
CEREBYX	Pfizer Laboratories
Clindamycin Phosphate	Perrigo New York Inc
INDOCIN	Iroko Pharmaceuticals, LLC
equaline ibuprofen	Supervalu Inc
Comfort Pac with Ibuprofen	PD-Rx Pharmaceuticals, Inc.
ShopRite Ibuprofen	Wakefern Food Corporation
Analpram Advanced	Ferndale Laboratories, Inc.
KELO-COTE HC Anti-Itch Scar Treatment	Advanced Bio-Technologies, Inc
Medi First Pain Relief	Unifirst First Aid Corporation
Bupropion Hydrochloride	American Health Packaging
Cortisone	CVS Pharmacy
Gildess 1/20	Qualitest Pharmaceuticals
Nafcillin	AuroMedics Pharma LLC
Fasprin	Nobel Laboratories, LLC
Theraprofen-800	Physician Therapeutics LLC
Clindacin ETZ	Medimetriks Pharmaceuticals, Inc.
Bayer Migraine Formula	Bayer HealthCare LLC, Consumer Care
Velivet	Barr Laboratories Inc.
Oto End 10	Larken Laboratories, Inc.
Topcare All Day Pain Relief	Topco Associates LLC
ciprofloxacin hydrochloride	Testpak Holding Company
Dye Free Ibuprofen	WALGREEN CO.
clindamycin phosphate and benzoyl peroxide	Perrigo New York Inc
ATORVASTATIN CALCIUM	St Marys Medical Park Pharmacy
Asprin	Avema Pharma Solutions
JUNIOR STRENGTH ADVIL	Pfizer Consumer Healthcare
Medique Diotame	Unique First Aid Corporation
Sudafed	McNeil Consumer Healthcare Div. McNeil-PPC, Inc
Jinteli	Teva Pharmaceuticals USA Inc
topcare ibuprofen	Topco Associates LLC
welby health ibuprofen	Aldi, Inc
Pain Relief Anti inflammatory	Select Corporation
Major Childrens Ibuprofen	Major Pharmaceuticals
Aviane	Barr Laboratories Inc.
Cicatricure	Genoma Lab USA Inc
healthy accents naproxen sodium	DZA Brands LLC
care one omeprazole	American Sales Company
PROCORT	Womens Choice Pharmaceuticals LLC
Afeditab	Bryant Ranch Prepack
Tri-Estarylla	Sandoz Inc
Hytone	Dermik Laboratories
ADVIL CONGESTION RELIEF	Pfizer Consumer Healthcare
Aspirin, Caffeine, and Dihydrocodeine Bitartrate	Caraco Pharmaceutical Laboratories, Ltd
METHYLIN	SHIONOGI INC.
Onmel	Merz Pharmaceuticals, LLC
Kaopectate Regular Strength Cherry Flavor	Chattem, Inc.
Bactrim DS	Caraco Pharma, Inc.
VIRACEPT	REMEDYREPACK INC.
Ibutab	Zee Medical Inc
PRAVACHOL	E.R. Squibb & Sons, L.L.C.
up and up junior strength ibuprofen	Target Corporation
Ciloxan	Alcon Laboratories, Inc.
ZyPram	Vertical Pharmaceuticals, Inc
RIFAMPIN	Major Pharmaceuticals
Biaxin	REMEDYREPACK INC.
VERAPAMIL HYDROCHLORIDE	REMEDYREPACK INC.
Glynase	Pharmacia and Upjohn Company
Propafenone HCl	ETHEX
ABELCET	Sigma-Tau Pharmaceuticals, Inc.
equate ibuprofen	Wal-Mart Stores Inc
Enteric Coated Aspirin	Family Dollar
Vytorin	Lake Erie Medical DBA Quality Care Products LLC
Butapap	Mikart, Inc.
Sulfamethoxazole and Trimethoprim DS	Apotheca Inc.
E.E.S.	PD-Rx Pharmaceuticals, Inc.
FixMySkin Healing Balm Fragrance-Free	Lovely Skin, Inc.
ShopRite Ibuprophen	Wakefern Food Corporation
GlipizideER	REMEDYREPACK INC.
Erythra-Derm	Paddock Laboratories, Inc.
ShopRite Naproxen Sodium	Wakefern Food Corporation
FixMySkin Healing Balm Vanilla Fragrance	Lovely Skin, Inc
Zebutal	Shionogi Inc.
Equaline ibuprofen	Supervalu Inc
Kurvelo	Lupin Pharmaceuticals, Inc.
Direct Safety Ibuprofen	Conney Safety Products, LLC
Sandostatin LAR Depot	Novartis Pharmaceuticals Corporation
Medi-First	Medique Products
Cortef	Pharmacia and Upjohn Company
ZITHROMAX	Pfizer Laboratories Div Pfizer Inc
good sense ibuprofen cold and sinus	L Perrigo Company
Leader Naproxen Sodium	Cardinal Health
Fluoxetine hydrochloride	Dr.Reddy's Laboratories Limited
FALMINA	Northstar Rx LLC
REGLAN	STAT RX USA LLC
Chloroquine phosphate	Ranbaxy Pharmaceuticals Inc.
EXTRA PAIN RELIEF	TIME CAP LABS
ibu profen cold and sinus	HyVee Inc
Nordette	Teva Women's Health, Inc.
Meclofenamate Sodium	Mylan Pharmaceuticals Inc.
Regular Strength Enteric coated aspirin	Geri-Care Pharmaceutical Corp
Tri-Sprintec	Barr Laboratories Inc.
Chateal	Afaxys Inc.
Modafinil	Hikma Pharmaceutical
original formula	Publix Super Markets Inc
WYMZYA FE	Lupin Pharmaceuticals, Inc.
CANCIDAS	Merck Sharp & Dohme Corp.
WELLBUTRIN XL	Rebel Distributors Corp
Bupropion hydrochloride	Sun Pharma Global FZE
KETOCONAZOLE	STAT RX USA LLC
INDOMETHACIN	REMEDYREPACK INC.
erythromycin	Midlothian Laboratories
Norgestimate and Ethinyl Estradiol	Glenmark Generics Inc., USA
Clindamycin phosphate	VersaPharm Incorporated
Dilantin Infatabs	Cardinal Health
Kola-Pectin	Seyer Pharmatec, Inc.
AmBisome	Astellas Pharma US, Inc.
Pacerone	Upsher-Smith Laboratories, Inc.
Cortifoam	Schwarz Pharma
SOMA COMPOUND with CODEINE	MedPointe Pharmaceuticals
all day relief	Major Pharmaceuticals
Locoid Lipocream	Triax Pharmaceuticals, LLC
ADVIL MIGRAINE	Pfizer Consumer Healthcare
Salsalate	A-S Medication Solutions LLC
Microgestin Fe	Physicians Total Care, Inc.
pain relief	Safeway
Formu Care Anti Itch	Access Business Group LLC
THRULIFE EXTRA STRENGTH HEADACHE RELIEF	Polygen Pharmaceuticals LLC
Lomedia 24 Fe	Amneal Pharmaceuticals of New York, LLC
Zonegran	Eisai Inc.
Oxycodone Hydrochloride and Ibuprofen	Barr Laboratories Inc.
Metoclopramide hydrochloride	Cardinal Health
TopCare Aspirin	Topco Associates LLC
meijer	Meijer Distribution Inc
pain relief ibuprofen	Rite Aid
Caldolor	Cumberland Pharmaceuticals Inc.
members mark naproxen sodium	Sam's West Inc
Pain Relief Maximum Strength	Select Corporation
Healthy Accents migraine formula	DZA Brands LLC
Cortisporin-TC	JHP Pharmaceuticals LLC
CLINDAMYCIN PALMITATE HYDROCHLORIDE	Rising Pharmaceuticals, Inc.
Equaline aspirin	Supervalu Inc
Alka Seltzer	Salimex, S.A.
Rapid Comfort Aspirin	Lab Safety Supply, Inc.
ERYTHROMYCIN ETHYLSUCCINATE	A-S Medication Solutions LLC
GFA First Aid Kit Essentials - 33 Pieces	Genuine First Aid, LLC
Anti-itch	Medline Industries, Inc.
Capacet	Magna Pharmaceuticals
healthy accents all day pain relief	DZA Brands LLC
Moore Medical Bismuth	Moore Medical LLC
Donnatal	KAISER FOUNDATION HOSPITALS
Ala Scalp	Crown Laboratories
PHENYTOIN SODIUM	SUN PHARMACEUTICAL INDUSTRIES LIMITED
Theraprofen-90	Physician Therapeutics LLC
GOOD NEIGHBOR PHARMACY FIRST AID Contains 202 PIECES	AmerisourceBergen
Good Neighbor Pharmacy Ibuprofen Cold and Sinus	Dispensing Solutions, Inc.
HYDROCODONE BITARTRATE AND IBUPROFEN	PD-Rx Pharmaceuticals, Inc.
Probenecid and Colchicine	Watson Laboratories, Inc.
LIPITOR	PHARMAKON, LLC
Voltaren	Unit Dose Services
smart sense aspirin	Kmart Corporation
Equaline Naproxen Sodium	Supervalu Inc
GRx HiCort	GERITREX CORP
smart sense omeprazole	Kmart Corporation
kirkland signature naproxen sodium	Costco Wholesale Company
ZIANA	Medicis Pharmaceutical Corp
Desogen	Organon Pharmaceuticals USA
Cyclafem 7/7/7	Qualitest Pharmaceuticals
Aloprim	Mylan Institutional LLC
ASPIRIN LOW DOSE	Contract Pharmacy Services-PA
rx act ibuprofen pm	H E B
babies r us ibuprofen	Toys'R'Us, Inc.
Glyburide	Citron Pharma LLC
Trioxin	Vertical Pharmaceuticals, Inc
Hydrocortisone Maximum Strength Plus 12 Moisturizers	The Kroger Company
Erythrocin Stearate	AbbVie Inc.
Nafcillin Sodium	Sandoz Inc
Enteric Safety Coated Aspirin	Rite Aid
Good Neighbor Pharmacy	AmerisourceBergen
MEDIQUE Aspirin	Unifirst First Aid Corporation
Quasense	Watson Pharma, Inc.
safety coated aspirin	Care One (American Sales Company)
Esgic-Plus	Forest Laboratories, Inc.
Peptic Relief Cherry	Family Dollar
Norgesic	3M Pharmaceuticals
Alcortin	Primus Pharmaceuticals
good neighbor pharmacy anti itch	Amerisource Bergen
stomach relief	Western Family Foods Inc
Brevicon	Watson Pharma, Inc.
Diltia XT	Watson Pharma, Inc.
Midodrine HCl	Rebel Distributors Corp
Tegretol	Novartis Pharmaceuticals Corporation
good sense childrens ibuprofen oral suspension	L Perrigo Company
Proctofoam	Alaven Pharmaceutical LLC
Safety Coated Aspirin	Valu Merchandisers Company (Best Choice)
Adult Low Strength Aspirin	ARMY AND AIR FORCE EXCHANGE SERVICE
EXTENDED PHENYTOIN SODIUM	Wockhardt USA LLC.
Viracept	State of Florida DOH Central Pharmacy
Coly-Mycin S	JHP Pharmaceuticals LLC
Berkley and Jensen Ibuprofen	BJWC
Topcare Aspirin	Topco Associates LLC
AcetaZOLAMIDE	Cardinal Health
Uricalm	Alva-Amco Pharmacal Companies, Inc.
naproxen sodium	CVS Pharmacy
Glucotrol	Roerig
Zegerid with Magnesium Hydroxide	Santarus, Inc.
Advil PM	Lil' Drug Store Products, Inc.
Gildess 1.5/30	Qualitest Pharmaceuticals
KETOPROFEN	STAT RX USA LLC
simvastatin	REMEDYREPACK INC.
CRESTOR	Bryant Ranch Prepack
DiaBeta	Sanofi-Aventis U.S. LLC
ARC FIRST AID Contains 303 PIECES HARDCASE	American Red Cross
Low Dose Asprin	DOLGENCORP, LLC
Ortho-Novum	A-S Medication Solutions LLC
topcare Ibuprofen Cold and Sinus	Topco Associates LLC
sunmark omeprazole	McKesson
Phenytoin Sodium	AvPAK
Leena	Watson Pharma, Inc.
Cholestyramine	Eon Labs, Inc.
Lovastatin	American Health Packaging
Balziva	Barr Laboratories Inc.
Metoclopramide	Preferred Pharmaceuticals, Inc
NOROXIN	Merck Sharp & Dohme Corp.
TREXIMET	Rebel Distributors Corp
leader ibuprofen pm	Cardinal Health
Acetasol HC	Actavis Mid Atlantic LLC
good neighbor pharmacy headache relief	Amerisource Bergen
sunmark	McKesson
Neostigmine Methylsuflate	General Injectables & Vaccines, Inc
equate	Wal-Mart Stores Inc
PHILITH	Northstar Rx LLC
Altoprev	Shionogi Inc.
NAFCILLIN	Baxter Healthcare Corporation
Pravastatin	NCS HealthCare of KY, Inc dba Vangard Labs
NEO-POLYCIN HC	Fera Pharmaceuticals
Butalbital, Acetaminophen, and Caffeine	Mirror Pharmaceuticals LLC
Glipizide XL	State of Florida DOH Central Pharmacy
Dermazene	Stratus Pharamceuticals, Inc
Ibuprofen PM	Wakefern Food Corporation
SPORANOX	Janssen Pharmaceuticals, Inc.
ANUCORT-HC	Preferred Pharmaceuticals, Inc
oxaprozin	Apotex Corp.
Green Guard Ibupro Relief	Unifirst First Aid Corporation
AZITHROMYCIN	REMEDYREPACK INC.
hydrocortisone acetate pramoxine hcl	Acella Pharmaceuticals, LLC
ACME FIRST AID Contains 404 PIECES	Acme United Corp.
Kanamycin	APP Pharmaceuticals, LLC
Pink Bismuth	Preferred Pharmaceuticals, Inc
Ciprofloxacin Hydrochloride	REMEDYREPACK INC.
Lo Minastrin Fe	Warner Chilcott (US), LLC
VIMOVO	STAT RX USA LLC
Myzilra	Qualitest Pharmaceuticals
carvedilol	Actavis Elizabeth LLC
Extended Phenytoin Sodium	American Health Packaging
Erythromycin Ethylsuccinate	Physicians Total Care, Inc.
ibuprofen ib	HyVee Inc
Health Mart Sinus and Cold D	McKesson
ARC FIRST AID Contains 303 PIECES	American Red Cross
Therafeldamine	Physician Therapeutics LLC
Equaline migraine formula	Supervalu Inc
PRILOSEC	STAT RX USA LLC
IBUPROFEN COLD AND SINUS	A P J Laboratories Limited
equate hydrocortisone	Wal-Mart Stores Inc
Clindesse	Ther-Rx Corporation
DG Health Hydrocortisone	Dolgencorp, LLC
Nicardipine Hydrochloride	American Regent, Inc.
diclofenac sodium	Rebel Distributors Corp
Zetia	Cardinal Health
Kariva	Barr Laboratories Inc.
BROMO SELTZER	Tower Laboratories Ltd
Phrenilin	Valeant Pharmaceuticals North America
MyOxin	GM  Pharamceuticals, Inc
Dilacor	Watson Pharma, Inc.
Aspirin 81 mg	DOLGENCORP, LLC
NeoProfen	RECORDATI RARE DISEASES, INC.
COUMADIN	Aphena Pharma Solutions - Tennessee, Inc.
Amethyst	Watson Pharma, Inc.
Bupropion Hydrochloride SR	Aidarex Pharmaceuticals LLC
Equate Hydrocortisone	Wal-Mart Stores Inc
Childrens Ibuprofen	Cardinal Health
Rx Act headache formula	H E B
Migraine Relief	Shopko Stores Operating Co., LLC
rx act naproxen sodium	H E B
TAZTIA	Watson Pharma, Inc.
Dermasorb HC Complete Kit	Crown Laboratories
DIGOX	Unit Dose Services
Being Well all day pain relief	Save-A-Lot Food Stores Ltd
good neighbor pharmacy ibuprofen	Amerisource Bergen
COLCHICINE	REMEDYREPACK INC.
ERYTHROMYCIN	KAISER FOUNDATION HOSPITALS
Phenobarbital Sodium	West-ward Pharmaceutical Corp.
Up and Up aspirin	Target Corporation
Portia	Barr Laboratories Inc.
BENZACLIN	Physicians Total Care, Inc.
Up and Up Aspirin	Target Corporation
health mart aspirin	McKesson
Levonorgestrel and Ethinyl Estradoil	Avion Pharmaceuticals, LLC
H-Releve Anti-Itch	Pure Source Inc.
Isoptin SR	Ranbaxy Laboratories Inc.
Trexall	Teva Women's Health, Inc.
Seasonique	Physicians Total Care, Inc.
femhrt	Physicians Total Care, Inc.
ZMAX	Pfizer Laboratories Div Pfizer Inc
healthy accents aspirin	DZA Brands LLC
Duane Reade	Duane Reade
Good Sense All Day Pain Relief	L. Perrigo Company
Carmol HC	PharmaDerm, A division of Fougera Pharmaceuticals Inc.
Cardizem LA	Valeant Pharmaceuticals North America LLC
Erythromycin Base	REMEDYREPACK INC.
MODAFINIL	STAT Rx USA LLC
sirolimus	Cadila Healthcare Limited
up and up dye free infants concentrated ibuprofen	Target Corporation
Ultramicrosize Griseofulvin	RiconPharma LLC.
Foscavir UK	Clinigen Healthcare Ltd.
Sunmark Stomach relief	McKesson
Concerta	Physicians Total Care, Inc.
Butalbital Acetaminophen and Caffeine	Lake Erie Medical DBA Quality Care Products LLC
Ibuprofen and Pseudoephedrine Hydrochloride	HEB
Clarithromycin	Aidarex Pharmaceuticals LLC
equaline anti itch	Supervalu Inc
Seconal Sodium	Marathon Pharmaceuticals, LLC
Oticin HC	Teral, Inc.
being well omeprazole	Save-A-Lot Food Stores Ltd
Low Strength Chewable Aspirin	Geri-Care Pharmaceutical Corp
Hydrocortisone	Preferred Pharmaceuticals, Inc
Nabumetone	Aidarex Pharmaceuticals LLC
Effervescent Pain Relief	Deseret Laboratories, Inc.
Mircette	Teva Women's Health, Inc.
ADVENTURE MEDICAL KITS 1-2 PERSON FIRST AID	Tender Corp dba Adventure Medical Kits
Health Mart Ibuprofen	McKesson
SE-DONNA PB HYOS	Seton Pharmaceuticals
Hydrocortisone Butyrate Cream (lipid) 0.1%	Metacon Labs
Antifungal Foot	American Sales Company
CARDENE SR	PDL BioPharma, Inc.
Goodys Migraine Relief	Medtech Products Inc.
Live Better	The Great Atlantic & Pacific Tea Company
Cipro HC	Stat Rx USA
Good Neighbor Pharmacy Naproxen Sodium	Amerisource Bergen
BUTALBITAL, ACETAMINOPHEN AND CAFFEINE	STAT RX USA LLC
Auto 157	Genuine First Aid LLC
VOLTAREN	Novartis Pharmaceutical Corporation
Up and Up childrens ibuprofen	Target Corporation
OXAPROZIN	STAT RX USA LLC
Rexall Ibuprofen	Dolgencorp, LLC
Genuine First Aid - Home First Aid	Genuine First Aid, LLC
CIPRODEX	Clinical Solutions Wholesale
Fosphenytoin Sodium	West-ward Pharmaceutical Corp
Effervescent Pain Relief Fast Relief	Major Pharmaceuticals
LOVASTATIN	International Labs, Inc.
St. Joseph Safety Coated Aspirin	Ilex Consumer Products Group, LLC
Octreotide Acetate	SUN PHARMACEUTICAL INDUSTRIES LIMITED
Danazol	American Health Packaging
Sun Mark Stomach Relief	McKesson
Conney Aspirin	Conney Safety Products, LLC
Phenytek	Mylan Pharmaceuticals Inc.
Butalbital, Aspirin and Caffeine Tablets	Qualitest
Jantoven	REMEDYREPACK INC.
equate aspirin	Wal-Mart Stores Inc
Propafenone Hydrochloride	Par Pharmaceutical, Inc.
Extra Strength Pain Reliever	COSTCO WHOLESALE CORPORATION
Methylphenidate	Physicians Total Care, Inc.
Healthy Accents All Day Pain Relief	DZA Brands LLC
Theraproxen-500	Physician Therapeutics LLC
FLURBIPROFEN SODIUM	Pacific Pharma, Inc.
Butalbital, Acetaminophen, Caffeine and Codeine Phosphate	Dispensing Solutions, Inc.
LANOXIN	Covis Pharmaceuticals, Inc.
Leader Stomach Relief	Cardinal Health
equate naproxen sodium	Wal-Mart Stores Inc
NEO-POLY-BAC HYDRO	Butler Animal Health Supply
Prilosec OTC	Procter & Gamble Manufacturing Company
cold and sinus relief	CVS Pharmacy
ARC FIRST AID Contains 101 PIECES	American Red Cross
Dasetta 1/35	Northstar Rx LLC
Methotrexate Sodium	Physicians Total Care, Inc.
Silka	Genomma Lab USA, Inc.
STANBACK	GlaxoSmithKline Consumer Healthcare LP
Epifoam	Alaven Pharmaceutical LLC
up and up omeprazole	Target Corporation
Daytrana	Noven Therapeutics, LLC
Terbinafine	Exelan Pharmaceuticals Inc.
Flanax Pain Reliever	Belmora LLC
Clindamycin	Bedford Laboratories
Benzamycin	Valeant Pharmaceuticals North America LLC
ShopRite Ibuprofen IB	Wakefern Food Corporation
amlodipine besylate and atorvastatin calcium	Physicians Total Care, Inc.
health mart childrens ibuprofen	McKesson
Value PharmaPain Reliever	Ajes Pharmaceuticals,LLC
CONCERTA	Janssen Pharmaceuticals, Inc.
Peptic Relief	Leader
Carisoprodol, Aspirin and Codeine Phosphate	Mirror Pharmaceuticals LLC
PIRMELLA 1/35	Lupin Pharmaceuticals, Inc.
COREGCR	Physicians Total Care, Inc.
Theraproxen	Physician Therapeutics LLC
A-HYDROCORT	Hospira, Inc.
Regonol	Sandoz Inc
Octreotide acetate	Wockhardt Limited
Acetazolamide	X-GEN Pharmaceuticals, Inc.
Hydrocodone Bitartrate and Ibuprofen	PD-Rx Pharmaceuticals, Inc.
Oxycodone hydrochloride and Ibuprofen	Actavis Elizabeth LLC
Bupropion Hydrocloride	REMEDYREPACK INC.
NEOMYCIN AND POLYMYXIN B SULFATES AND HYDROCORTISONE	STAT RX USA LLC
PRIMIDONE	STAT Rx USA LLC
Cortisone Cream	Tai Guk Pharmaceutical Company, Limited
Microgestin	Watson Pharma, Inc.
Cipro	Physicians Total Care, Inc.
Walgreens	Walgreen Company
FixMySkin Healing Balm Vanilla Flavor	Lovely Skin, Inc.
Syeda	Sandoz Inc
NABUMETONE	STAT RX USA LLC
SHOPKO HYDROCORTISONE WITH ALOE	UNITED EXCHANGE CORP
health mart naproxen sodium	McKesson
ADVIL	Pfizer Consumer Healthcare
Gildagia	Qualitest Pharmaceuticals
Bupropion HydrochlorideXL	REMEDYREPACK INC.
Norethindrone and Ethinyl Estradiol and Ferrous Fumarate	Lupin Pharmaceuticals, Inc.
DILT-CD	Apotex Corp.
Acella Hydrocortisone Acetate - Pramoxine Singles	Acella Pharmaceuticals, LLC
Triple Antibiotic HC	Phoenix Pharmaceutical, Inc.
BUPROPION HYDROCHLORIDE	STAT RX USA LLC
Lamisil AT	Novartis Consumer Health, Inc.
Fluoxetine HCl	Edgemont Pharmaceuticals, LLC
modafinil	Dispensing Solutions, Inc.
Healthy Accents Ibuprofen	DZA Brands LLC
Leader migraine formula	Cardinal Health
Clindamycin hydrochloride	American Health Packaging
up and up childrens ibuprofen	Target Corporation
Neoral	Novartis Pharmaceuticals Corporation
simply right naproxen sodium	Sam's West Inc
Sunmark aspirin	McKesson
Tacrolimus	Sandoz Inc
wal profen cold and sinus	Walgreen Company
Health Mart Pharmacy Hydrocortisone	Health Mart
good neighbor pharmacy omeprazole	Amerisource Bergen
dg health aspirin	Dolgencorp, LLC
1 hydrocortisone	American Sales Company
Quillivant	NextWave Pharmaceuticals, Inc.
St. Joseph Chewable Aspirin	Ilex Consumer Products Group, LLC
Cleocin Phosphate	Pharmacia and Upjohn Company
care one ibuprofen	American Sales Company
CLINDAMYCIN HYDROCHLORIDE	STAT Rx USA LLC
Esgic	Forest Laboratories, Inc.
PediaCare Infants	Medtech Products Inc.
CAREALL Naproxen	New World Imports, Inc.
MiCort-HC	Ferndale Laboratories, Inc.
Cortizone 10 Intensive Healing for Eczema	Chattem, Inc.
Headache Relief Extra Strength	Wal-Mart Stores Inc
Ibuprofen and Diphenhydramine Citrate	Dr. Reddy's Laboratories Limited
Hydrocortisone Plus	Walgreens
Moore Medical LLC Ibuprofen	Moore Medical LLC
Solaraze	PharmaDerm, A division of Fougera Pharmaceuticals Inc.
CHILDRENS ADVIL	Pfizer Consumer Healthcare
Good Sense Aspirin	L Perrigo Company
Cortizone 10 Cooling Relief	Chattem, Inc.
Safyral	Bayer HealthCare Pharmaceuticals Inc.
Glyburide (micronized) and Metformin Hydrochloride	Actavis Inc.
Sunmark ibuprofen cold and sinus	McKesson
Cortizone 10 Hydratensive Healing Anti Itch	Chattem, Inc.
MINIPRIN	TIME CAP LABORATORIES, INC
Poli-A	Sato Pharmaceutical Co., Ltd.
Micro-Coated Aspirin	Rugby Laboratories, Inc
dg health all day pain relief	Dolgencorp Inc
Premier Value	Chain Drug Consortium
ERYC	Warner Chilcott (US), LLC
FIRST Dukes Mouthwash Compounding	CutisPharma, Inc.
LEVONEST	Northstar Rx LLC
kirkland signature hydrocortisone plus	Costco Wholesale Company
Ursodiol	Watson Laboratories, Inc.
GENUINE FIRST AID Emergency Preparedness  Contains 167 Pieces	Genuine First Aid LLC
GIANVI	Physicians Total Care, Inc.
ZOCOR	Lake Erie Medical Surgical & Supply DBA Quality Care Products LLC
Clindacin P	Medimetriks Pharmaceuticals, Inc.
Xerese	Valeant Pharmaceuticals North America LLC
Low Dose Chewable Aspirin	NASH-FINCH COMPANY
DROSPIRENONE AND ETHINYL ESTRADIOL	Lupin Pharmaceuticals, Inc.
Amphotericin B	X-GEN Pharmaceuticals, Inc.
rexall anti itch	Dolgencorp, LLC
Yasmin	Physicians Total Care, Inc.
NOXAFIL	Merck Sharp & Dohme Corp.
Topcare Ibuprofen	Topco Associates LLC
Trandolapril and Verapamil Hydrochloride	Glenmark Generics Inc., USA
Dr. Sheffield Hydrocortisone Anti itch	Faria  LLC dba Sheffield Pharmaceuticals
omeprazole/sodium bicarbonate	Prasco, Laboratories
rx act all day pain relief	H E B
Pandel	PharmaDerm, A division of Nycomed US Inc.
Junel 1.5/30	Physicians Total Care, Inc.
Alcortin A	Primus Pharmaceuticals
Zorvolex	Iroko Pharmaceuticals LLC
SAFEWAY	Safeway Inc.
RIFATER	REMEDYREPACK INC.
berkley and jensen ibuprofen	BJWC
PediaCare Childrens	Medtech Products Inc.
Hydrocortisone anti-itch plus	Wal-Mart Stores, Inc.
DICLOFENAC SODIUM	E. Fougera & Co. a division of Fougera Pharmaceuticals Inc.
OXCARBAZEPINE	Golden State Medical Supply
ConRx pain Reliever	Eagle Distributors,Inc.
leader omeprazole	REMEDYREPACK INC.
good neighbor pharmacy aspirin	Amerisource Bergen
OCUFEN	Physicians Total Care, Inc.
sunmark ibuprofen ib	McKesson
Renvela	Genzyme Corporation
NECON 1/35	Physicians Total Care, Inc.
Adult Low strength Aspirin	SUPERVALU INC.
Neosporin Eczema Essentials	Johnson & Johnson  Consumer Products Company, Division of Johnson & Johnson Consumer Companies, Inc.
Trivora	Watson Pharma, Inc.
SohMed Pain Reliever	SOHM Inc.
Nefazodone hydrochloride	Ranbaxy Pharmaceuticals Inc.
Quadrydern	Productos Zapotol Corp
Diltiazem HydrochlorideExtended Release	REMEDYREPACK INC.
IBUDONE	Poly Pharmaceuticals
smart sense naproxen sodium	Kmart Corporation
Orsythia	Qualitest Pharmaceuticals
Ibuprofen (NSAID) Pain Reliever/Fever Reducer	A&Z Pharmaceutical, Inc.
FLUCONAZOLE	STAT Rx USA LLC
Naproxen	Clinical Solutions Wholesale
Clindamycin Palmitate Hydrochloride	Paddock Laboratories, Inc.
Hecoria	Novartis Pharmaceuticals Corporation
Prograf	Astellas Pharma US, Inc.
Chloroquine	PD-Rx Pharmaceuticals, Inc.
Sunmark Aspirin	McKesson
good neighbor pharmacy migraine relief	Amerisource Bergen
Mycobutin	Physicians Total Care, Inc.
Easy Care First Aid - All Purpose	Tender Corp dba Adventure Medical Kits
Peganone	Lundbeck Inc.
Hydrocortisone Valerate	Rebel Distributors Corp
Norgestrel/Ethinyl Estradiol	Akrimax Pharmaceuticals, LLC
Antibiotic Ear (Neo/Polym/HC)	Physicians Total Care, Inc.
APRI	Physicians Total Care, Inc.
Verapamil Hydrochloride	Physicians Total Care, Inc.
Caldecort	Insight Pharmaceuticals
Health Mart Ibuprofen IB	McKesson
Stanback	Medtech Products Inc.
BUFFERIN	Novartis Consumer Health, Inc.
INDOMETHACIN ER	Apotheca, Inc.
Scalpicin	Reckitt Benckiser LLC
PHENYTOIN	STAT RX USA LLC
Alagesic	Poly Pharmaceuticals, Inc.
FOSCAVIR	AstraZeneca LP
GENGRAF	Cardinal Health
procure	TWIN MED, LLC
Terbinex	Innocutis
up and up ibuprofen pm	Target Corporation
Chloromycetin	PARKE-DAVIS
Headache Relief to Go	Breakthrough Products Inc.
smart health aspirin	L Perrigo Company
Effervescent Antacid and Pain Relief	Cardinal Health Inc.
Oxcarbazepine	Golden State Medical Supply, Inc.
Ketoconazole	Physicians Total Care, Inc.
Pepbis	KC Pharmaceuticals, Inc.
DG Health Ibuprofen	Dolgencorp, LLC
Indocin	Lundbeck Inc.
Regular Strength Buffered Aspirin	WOONSOCKET PRESCRIPTION CENTER,INCORPORATED
Nifedipine	AvPAK
Ogestrel 0.5/50	Watson Pharma, Inc.
Forfivo	Edgemont Pharmaceuticals, LLC
Lutera	Physicians Total Care, Inc.
Itraconazole	Mylan Pharmaceuticals Inc.
Care One migraine relief	American Sales Company
Necon 777	Dispensing Solutions, Inc.
Good Neighbor Pharmacy Sinus and Cold D	Amerisource Bergen
Xenical	Genentech, Inc.
Anusol	Salix Pharmaceuticals, Inc
Sentroxatine	Physician Therapeutics LLC
Naproxen Sodium (NSAID)	Amneal Pharmaceuticals
Hydrocortisone Acetate	Paddock Laboratories, LLC
MEDIQUE I-PRIN	Unifirst First Aid Corporation
rx act ibuprofen	H E B
CIPROFLOXACIN HYDROCHLORIDE	REMEDYREPACK INC.
Thera	Zhejiang Jingwei Pharmaceutical Co., Ltd.
Cardizem CD	BTA Pharmaceuticals Inc.
BRIELLYN	Glenmark Generics Inc., USA
Fioricet with Codeine	Watson Pharma, Inc.
glimepiride	PRASCO LABORATORIES
Berkley and Jensen Omeprazole	BJWC
REPREXAIN	Gemini Laboratories, LLC
Pyrazinamide	VersaPharm Incorporated
Critical Care Aspirin to Go	Breakthrough Products Inc.
OVCON 35	Warner Chilcott (US), LLC
care one ibuprofen ib	American Sales Company
Genuine Aspirin	WOONSOCKET PRESCRIPTION CENTER,INCORPORATED
Pravastatin sodium	Dr.Reddy's Laboratories Limited
Conney Ibuprofen	Conney Safety Products, LLC
Quality Choice	Chain Drug Marketing Association
BAYER	Lil' Drug Store Products, Inc.
Pain Stoppers Regular	North Safety Products LLC
PIROXICAM	STAT RX USA LLC
GFA First Aid	Genuine First Aid, LLC
Amiodarone hydrochloride	Cadila Healthcare Limited
Rexall All Day Pain Relief	Dolgencorp, LLC
Butalbital, Aspirin, and Caffeine	Actavis Elizabeth LLC
HYDROCORTISONE ACETATE	Galentic Pharma (India) Private Limited
All Day Sinus and Cold D	HyVee Inc
Nalfon	Xspire Pharma
OXTELLAR XR	Supernus
Clindamycin Phosphate and Benzoyl Peroxide	Mylan Pharmaceuticals Inc.
dg health Ibuprofen pm	Dolgencorp Inc
Kaletra	AbbVie Inc.
itraconazole	Eon Labs, Inc.
leader ibuprofen	Cardinal Health
ENSKYCE	Lupin Pharmaceuticals, Inc.
Zenchent	Watson Pharma, Inc.
Methylphenidate Hydrochloride	Mallinckrodt, Inc.
Good Sense aspirin	L Perrigo Company
Goodys Back and Body Pain	Medtech Products Inc.
COLESTIPOL HYDROCHLORIDE	Global Pharmaceuticals, Division of Impax Laboratories Inc.
members mark hydrocortisone	Sam's West Inc
healthy accents ibuprofen pm	DZA Brands LLC
methylphenidate hcl	Watson Laboratories, Inc.
kirkland signature ibuprofen	Costco Wholesale Company
topcare childrens ibuprofen	Topco Associates LLC
SHOPKO HYDROCORTISONE	UNITED EXCHANGE CORP.
dg health ibuprofen	Dolgencorp, LLC
Glipizide and Metformin HCl	REMEDYREPACK INC.
Colestipol Hydrochloride	Physicians Total Care, Inc.
Rifater	sanofi-aventis U.S. LLC
Grifulvin V	Ortho-McNeil Pharmaceuticals
equaline ibuprofen pm	Supervalu Inc
Sinus and Cold D	Meijer Distribution Inc
Xolegel	Aqua Pharmaceuticals, LLC.
Pain Stopper Extra	North Safety Products LLC
Cleocin Pediatric	Pharmacia and Upjohn Company
Glyburide-Metformin Hydrochloride	Heritage Pharmaceuticals Inc.
junior strength ibuprofen	H E B
Premier Value Infants Ibuprofen	Premier Value
SSD	Par Pharmaceutical Inc.
Athletes Foot	Safeway Inc.
Topcare Sinus and Cold D	Topco Associates LLC
Comfort Pac with Naproxen	PD-Rx Pharmaceuticals, Inc.
Regular Strength Pain Relief	Rite Aid
Publix	Publix Super Markets Inc
Hydrocortisone Maximum Strength	Walgreen Company
Hydrocortisone Acetate Pramoxine Hcl	Perrigo New York Inc
Good Neighbor Pharmacy naproxen sodium	Amerisource Bergen
Good Neighbor Pharmacy Ibuprofen	Amerisource Bergen
Topcare Ibuprofen PM	Topco Associates LLC
Budeprion	Bryant Ranch Prepack
Ready America First Aid Pocket - 33 Pieces	Genuine First Aid, LLC
Adalat CC	Bayer HealthCare Pharmaceuticals Inc.
Healthy Accents ibuprofen	DZA Brands LLC
Extra Strength Headache Formula	ARMY AND AIR FORCE EXCHANGE SERVICE
Levonorgestrel and Ethinyl Estradiol	Lupin Pharmaceuticals, Inc.
methylphenidate hydrochloride CD	Kremers Urban Pharmaceuticals Inc.
NIFEDIPINE	STAT RX USA LLC
Loestrin 24 Fe	Physicians Total Care, Inc.
CLINDAMYCIN	General Injectables & Vaccines, Inc
GENERESS Fe	Watson Pharma, Inc.
Duetact	Takeda Pharmaceuticals America, Inc.
Zarah	Watson Pharma, Inc.
Good Neighbor Pharmacy Childrens Ibuprofen Cold	Amerisource Bergen
Lansoprazole Amoxicillin Clarithromycin	Teva Pharmaceuticals USA Inc
careone ibuprofen pm	American Sales Company
EXAPRIN	HART Health
fosphenytoin sodium	American Regent, Inc.
DIGOXIN	Par Pharmaceutical, Inc
Micronase	Pharmacia and Upjohn Company
Rapamune	Cardinal Health
Bioelements	Bioelements, Inc.
CARVEDILOL	St Marys Medical Park Pharmacy
REPAGLINIDE	Caraco Pharmaceutical Laboratories, Ltd.
Melphalan Hydrochloride	Mylan Institutional LLC
Fiorinal with Codeine	Watson Pharma, Inc.
DUEXIS	Horizon Pharma Inc.
Ascomp with Codeine	Nexgen Pharma, Inc.
Sulfamethoxazole and Trimethoprim	Teva Pharmaceuticals USA Inc
Maximum Strength Hydrocortisone	DLC Laboratories, Inc
EXCEDRIN	Novartis Consumer Health, Inc.
hydrocortisone	H E B
rifampin	Lupin Pharmaceuticals, Inc.
Topcare ibuprofen	Topco Associates LLC
PRAVASTATIN SODIUM	REMEDYREPACK INC.
Ciprofloxacin Otic	Xspire Pharma
Goodys PM Pain Reliever	Medtech Products Inc.
Motrin	McNeil Consumer Healthcare    Div McNeil-PPC, Inc
ARC Emergency Preparedness FIRST AID Contains 202 PIECES	American Red Cross
Medique Mediproxen	Unifirst First Aid Corporation
Thermazene	The Pharma Network LLC
Ecotrin Regular Strength	Medtech Products Inc.
Terbinafine Hydrochloride	Golden State Medical Supply, Inc.
Cardene	EKR Therapeutics
Caduet	Physicians Total Care, Inc.
Good Neighbor Pharmacy Childrens Ibuprofen	Amerisource Bergen
Econochlor	Alcon Laboratories, Inc.
Up and Up anti itch	Target Corporation
ibuprofen	Publix Super Markets Inc
Zee Aspirin	Zee Medical Inc
health mart ibuprofen	McKesson
Chewable Adult Low Dose Aspirin	SUPERVALU INC.
equaline childrens ibuprofen oral suspension	Supervalu Inc
Low Dose Aspirin	COSTCO WHOLESALE CORPORATION
clarithromycin	Watson Pharma, Inc.
Texacort	Mission Pharmacal Company
careone naproxen sodium	American Sales Company
SULFAMETHOXAZOLE and TRIMETHOPRIM	Apotheca, Inc.
RESTASIS	Allergan, Inc.
Alka-Seltzer Plus	Bayer HealthCare LLC, Consumer Care
Safety Coated Enteric Aspirin	WALGREEN CO.
rexall ibuprofen	Dolgencorp Inc
lovastatin	Mutual Pharmaceutical Company, Inc.
Easy Care First Aid Kit - Sports and Travel	Tender Corp dba Adventure Medical Kits
SALSALATE	Libertas Pharma, Inc.
NifedicalXL	Aidarex Pharmaceuticals LLC
CILOXAN	Alcon Laboratories, Inc.
BC Cherry	Medtech Products Inc.
Care One headache relief	American Sales Company
Advil Allergy and Congestion Relief	Pfizer Consumer Healthcare
ADVIL PM	Pfizer Consumer Healthcare
KAISER PERMANENTE	Kaiser Foundation Hospitals
leader headache formula	Cardinal Health
equaline omeprazole	Supervalu Inc
Atopalm Maximum Strength Anti-Itch	NeoPharm Co., Ltd.
DOLEX	Pharmadel LLC
up and up childrens ibuprofen oral suspension	Target Corporation
URSODIOL	STAT RX USA LLC
Good Neighbor Pharmacy Emergency Preparedness and First Aid Contains 167 Pieces	AmerisourceBergen
Sulindac	Bryant Ranch Prepack
Oxycodone Hydrochloride and Aspirin	Mylan Pharmaceuticals Inc.
Concentrated Ibuprofen	Tris Phrama Inc
Cortizone 10 Easy Relief	Chattem, Inc.
LESCOL XL	Physicians Total Care, Inc.
Smart Sense ibuprofen	Kmart Corporation
Crestor	Rebel Distributors Corp
Pamprin Max Menstrual Pain Relief	Chattem, Inc.
Metadate CD	Physicians Total Care, Inc.
Adult Low Dose Aspirin	Aidarex Pharmaceuticals LLC
rexall all day pain relief	Dolgencorp Inc
Emoquette	Qualitest Pharmaceuticals
rexall hydrocortisone 1	Dolgencorp, LLC
Amlodipine besylate/atorvastatin calcium	Mylan Pharmaceuticals Inc.
AzaSite	Inspire Pharmaceuticals, Inc.
Dermasorb AF Complete Kit	Crown Laboratories
piroxicam	GENPHARM INC.
TopCare	Topco Associates LLC
Butalbital, Acetaminophen, Caffeine, and Codeine Phosphate	Qualitest Pharmaceuticals
Leader All Day Pain Relief	Cardinal Health
PENNSAID	Mallinckrodt, Inc
Ibuprofen softgels	AmerisourceBergen Drug Corporation (Good Neighbor Pharmacy)
Hydrocodone bitartrate and ibuprofen	Caraco Pharmaceutical Laboratories, Ltd.
sunmark aspirin	McKesson
Voriconazole	Mylan Pharmaceuticals Inc.
TopCare Ibuprofen	Topco Associates LLC
Nortrel 7/7/7	Physicians Total Care, Inc.
Vimovo	Horizon Pharma Inc.
NEOMYCIN and POLYMYXIN B SULFATES and HYDROCORTISONE	STAT Rx USA LLC
Green Pea	Antigen Laboratories, Inc.
Chewable Low Dose Aspirin	Family Dollar
infants ibuprofen	CVS Pharmacy
Ciprofloxacin and Dextrose	Hospira, Inc.
butalbital, acetaminophen and caffeine	Unit Dose Services
BUPAP	ECR Pharmaceuticals
BioElectro Day	A&Z Pharmaceutical, Inc.
Octreotide	Fresenius Kabi USA, LLC
Care One ibuprofen	American Sales Company
Family Wellness Naproxen Sodium	Family Dollar Services Inc
Amethia	Watson Pharma, Inc.
Rx Act Ibuprofen	H E B
up and up anti itch	Target Corporation
Prostigmin	Valeant Pharmaceuticals North America LLC
Henry Schein Aspirin	Henry Schein, Inc.
Henry Schein Ibuprofen	Henry Schein Inc.
Margesic	Marnel Pharmaceuticals, Inc.
Scarguard MD Physicians Formula	Scarguard Labs, LLC
Pramosone E	Ferndale Laboratories, Inc.
GLIMEPIRIDE	STAT Rx USA LLC
DILTIAZEM HYDROCHLORIDE	Apotex Corp.
TABCIN	Salimex, S.A.
ECOTRIN	GlaxoSmithKline Consumer Healthcare LP
Glipizide	Aphena Pharma Solutions - Tennessee, LLC
PRIMAXIN	Cardinal Health
Berkley and Jensen Hydrocortisone	BJWC
Yaz	Physicians Total Care, Inc.
equaline ibuprofen cold and sinus	Supervalu Inc
warfarin sodium	New Horizon Rx Group, LLC
Advanced Hydrocortisone	Ultra Seal Corporation
Ibuprofen 200	WALGREEN CO.
smart sense anti itch	Kmart Corporation
Reprexain	Stat Rx USA
PhysiciansCare Ibuprofen	Acme United Corporation
Antifungal	Meijer Distribution Inc
Symbyax	Eli Lilly and Company
Gaboxetine	Physician Therapeutics LLC
CALAN	G.D. Searle LLC Division of Pfizer Inc
NEFAZODONE HYDROCHLORIDE	STAT RX USA LLC
CORTEF	Pharmacia and Upjohn Company
PYRIDOSTIGMINE BROMIDE	REMEDYREPACK INC.
BAMBOO SALT  Eunganggo Jook Yeom Toothpaste	LG Household and Healthcare, Inc.
Ticlopidine hydrochloride	Apotex Corp.
Up and Up Anti Itch	Target Corporation
BackAid	Alva-Amco Pharmacal Companies, Inc.
CRIXIVAN	State of Florida DOH Central Pharmacy
Ibuprofen (NSAID)	Rebel Distributors Corp
Bufferin	Ducere Pharma LLC
Diamox Sequels	REMEDYREPACK INC.
VIORELE	Glenmark Generics Inc., USA
Childrens Aspirin	Cardinal Helath
EC-81Aspirin	TriMarc Labs
Ibuprofen IB	Family Dollar
AMPHOTEC	InterMune, Inc.
Aspirin	Bedrock Brands, LLC (ST. JOSEPH)
Synalgos	Caraco Pharma Inc.
Terbinafine Hydochloride	Physicians Total Care, Inc.
Tri-Norinyl	Watson Pharma, Inc.
profen IB	Publix Super Markets Inc
good sense migraine formula	L Perrigo Company
KARIVA	Physicians Total Care, Inc.
Anti itch	Rite Aid Corporation
micronized glyburide	Greenstone Ltd.
Aspirin Chewable	NCS HealthCare of KY, Inc dba Vangard Labs
Formu Care pain reliever	Access Business Group LLC
PIMTREA	Northstar Rx LLC
Cardizem	Valeant Pharmaceuticals North America LLC
chewable	Publix Super Markets Inc
ELINEST	Northstar Rx LLC
25 Person ANSI	Genuine First Aid LLC
Family Wellness Migraine Relief	Family Dollar Services Inc
Effervescent Cold Relief	Tower Laboratories Ltd
FLURBIPROFEN	STAT RX USA LLC
Fluvastatin	Teva Pharmaceuticals USA Inc
Fiorinal	Watson Pharma, Inc.
Tri-Legest Fe	Barr Laboratories Inc.
Neostigmine Methylsulfate	Fresenius Kabi USA, LLC
Clear Choice Ibuprofen	Athlete's Needs Inc
Glucotrol XL	Physicians Total Care, Inc.
headache formula	Hannaford Brothers Company
KERA HC Hydrocortisone	Clinical Therapeutic Solutions
Diclofenac Potassium	Bryant Ranch Prepack
Verelan	Physicians Total Care, Inc.
Simcor	AbbVie Inc.
exchange select omeprazole	Army & Air Force Exchange Service
Sulfadiazine	Eon Labs, Inc.
Pyridostigmine Bromide	REMEDYREPACK INC.
GILDESS FE 1/20	Qualitest Pharmaceuticals
Flurbiprofen Sodium	Rebel Distributors Corp
CYCLOSPORINE	American Health Packaging
CVS Pharmacy Ibuprofen	CVS Pharmacy
Proctocort	Salix Pharmaceuticals, Inc
pravastatin sodium	American Health Packaging
Sirolimus	Greenstone LLC
Ticlopidine Hydrochloride	Teva Pharmaceuticals USA Inc
Nifedical	Bryant Ranch Prepack
ACETAMINOPHEN, BUTALBITAL AND CAFFEINE	STAT RX USA LLC
Family Wellness Hydrocortisone	Family Dollar Services Inc
Fioricet	Watson Pharma, Inc.
PERCODAN	Endo Pharmaceuticals Inc
VANOXIDE	Summers Laboratories Inc
Healerz for Itches	Wellco Brands LLC
Etodolac	REMEDYREPACK INC.
Brevital Sodium	A-S Medication Solutions LLC
Aplenzin	sanofi-aventis U.S. LLC
PANDEL	PharmaDerm a division of Fougera Pharmaceuticals Inc.
sunmark ibuprofen pm	McKesson
Good Sense Stomach Relief	L Perrigo Company
Bupropion Hydrochloride (SR)	NorthStar RX LLC
Atorvastatin Calcium	PD-Rx Pharmaceuticals, Inc.
Urso 250	Aptalis Pharma US, Inc.
FIRST AID Contains 404 PIECES	Genuine First Aid LLC
CounterAct	Melaleuca, Inc
Alyacen 1/35	Glenmark Generics Inc.,USA
Help I Have an Aching Body	Help Remedies, Inc.
Neomycin, Polymyxin B Sulfates and Hydrocortisone	Physicians Total Care, Inc.
Fluconazole	REMEDYREPACK INC.
Dg Health Ibuprofen	Dolgencorp, LLC
Uncoated Aspirin	WOONSOCKET PRESCRIPTION CENTER,INCORPORATED
Diclofenac Sodium and Misoprostol	AvKARE, Inc.
Pravastatin Sodium	State of Florida DOH Central Pharmacy
anti itch	Rite Aid Corporation
sunmark all day relief	McKesson
Azurette	Watson Pharma, Inc.
Hydrocortisone Maximum Strength with Aloe	Stephen L. LaFrance Pharmacy, Inc.
Invirase	Genentech, Inc.
Gianvi	Teva Pharmaceuticals USA Inc
formu care ibuprofen	Access Business Group LLC
VELTIN	Stiefel Laboratories Inc
Advicor	Physicians Total Care, Inc.
verapamil hydrochloride	Unit Dose Services
babies r us infants ibuprofen	Toys'R'Us, Inc.
Bayer Genuine Aspirin	Unifirst First Aid Corporation
CHOLESTYRAMINE	Golden State Medical Supply, Inc.
Anacin	Insight Pharmaceuticals LLC
Silver Sulfadiazine	Ascend Laboratories, LLC
Protopic	Astellas Pharma US Inc.
good neighbor pharmacy ibuprofen pm	Amerisource Bergen
Prevalite	Upsher-Smith Laboratories Inc.
sunmark ibuprofen	McKesson
CHILDRENS ADVIL COLD	Pfizer Consumer Healthcare
MERIDIA	Abbott Laboratories
Norvir	AbbVie Inc.
formu care omeprazole	Access Business Group LLC
Low Dose Adult Aspirin	Sam's West Inc
Headache relief	Amerisource Bergen
COREG	GlaxoSmithKline LLC
Leader ibuprofen	Cardinal Health
Topcare Childrens Ibuprofen	Topco Associates LLC
ZYLOPRIM	Prometheus Laboratories Inc.
childrens ibuprofen oral suspension	Meijer Distribution Inc
Lipitor	A-S Medication Solutions LLC
Zonisamide	Glenmark Generics Inc., USA
childrens ibuprofen	H E B
cholestyramine light	Eon Labs, Inc.
Picot Plus	Bristol-Myers Squibb de Mexico, S. de R.L. de C.V.
Azithromycin	Fresenius Kabi USA, LLC
Medi-Cortisone	Medicine Shoppe International Inc
TIAZAC	Forest Laboratories, Inc.
Aranelle	Barr Laboratories Inc.
simply right ibuprofen	Sam's West Inc
NuvaRing	Physicians Total Care, Inc.
all day pain relief	Rebel Distributors Corp
Procto-Pak	Rising Pharmaceuticals, Inc.
Value Pharma	Ajes Pharmaceuticals,LLC
WELLBUTRIN	STAT Rx USA LLC
Naproxen Pain Relief	Rebel Distributors Corp
Extra Strength Headache Relief	CARDINAL HEALTH
PROPAFENONE HYDROCHLORIDE	Cardinal Health
Up and Up anti itch ointment	Target Corporation
Cyclafem 1/35	Qualitest Pharmaceuticals
Clinda-Derm	Paddock Laboratoratories, LLC
ShopRite Migraine Formula	Wakefern Food Corporation
Ascriptin	Novartis Consumer Health, Inc.
Ready America First Aid Outdoor- 107 Pieces	Genuine First Aid, LLC
Vyfemla	Lupin Pharmaceuticals, Inc.
Akne-mycin	CORIA LABORATORIES
SSD Cream	REMEDYREPACK INC.
HYDROCORTISONE	Lineage Therapeutics Inc
Extra Strength Pain Relief	Stephen L. LaFrance Pharmacy, Inc.
Chloramphenicol Sodium Succinate	General Injectables and Vaccines, Inc
equate stomach relief	Wal-Mart Stores Inc
Fulton Street Market Anti itch	Access Business Group LLC
VERELAN PM	UCB, Inc.
Gris-PEG	PEDINOL PHARMACAL INC.
Smart Sense Aspirin	Kmart Corporation
ILOTYCIN	Fera Pharmaceuticals, LLC
Gadaderm Hydrocortisone	Gadal Laboratories Inc
ETODOLAC	STAT Rx USA LLC
aspirin regular strength	Major Pharmaceuticals
Lo Loestrin Fe	Warner Chilcott (US), LLC
Clarithromycin Extended Release	Ranbaxy Pharmaceuticals Inc.
Vestura	Watson Pharma, Inc.
Otrexup	Antares Pharma, Inc.
LIPTRUZET	Merck Sharp & Dohme Corp.
bioCorneum HC Advanced Scar Supervision Anti-Itch	Enaltus Inc
Levonorgestrel and Ethinyl Estradiol and Ethinyl Estradiol	Lupin Pharmaceuticals, Inc.
Good Neighbor Pharmacy aspirin	Amerisource Bergen
DUAC	Stiefel Laboratories Inc
sunmark stomach relief	McKesson
LEADER HYDROCORTISONE WITH ALOE	CARDINAL HEALTH
Scarguard MD	Scarguard Labs, LLC
Matzim LA	Watson Pharma, Inc.
Hydrocortisone Acetate and Pramoxine Hydrochloride	Acella Pharmaceuticals, LLC
Green Guard Pain and Ache Relief	Unifirst First Aid Corporation
Ibuprofen and Diphenhydramine HCl	Premier Value  (Chain Drug Consortium, LLC)
Equetro	Validus Pharmaceuticals LLC
Chewable Aspirin	Genuine First Aid LLC
GlyBURIDE	DAVA Pharmaceuticals, Inc.
Butalbital, aspirin, and caffeine	Lannett Company, Inc.
Belladonna Alkaloids with Phenobartbital	Liberty Pharmaceuticals, Inc.
ADVENTURE MEDICAL KITS 1-2 PERSON NATIONAL SKI PATROL FIRST AID	Tender Corp dba Adventure Medical Kits
PROVIGIL	Cephalon, Inc.
Apres Peel Soothing Balm	CoValence, Inc.
Alka-Seltzer XTRA STRENGTH	Bayer Bitterfeld GmbH
Aspirin EC	Goldline Laboratories, Inc.
Ketoprofen	PD-Rx Pharmaceuticals, Inc.
Vicoprofen	Physicians Total Care, Inc.
Midodrine Hydrochloride	Mylan Pharmaceuticals Inc.
Proctozone	Physicians Total Care, Inc.
azithromycin	Preferred Pharmaceuticals, Inc
care one all day pain relief	American Sales Company
Fulton Street Market Naproxen Sodium	Access Business Group LLC
Minastrin 24 Fe	Warner Chilcott (US), LLC
Direct Safety Aspirin	Conney Safety Products, LLC
Migralex	Migralex Inc.
Scalpicin Scalp Itch Medication Maximum Strength	Combe Incorporated
terbinafine hydrochloride	Northstar Rx LLC
Locoid	Onset Dermatologics LLC
Allopurinol	PD-Rx Pharmaceuticals, Inc.
DermaCort	Melaleuca, Inc.
Junel 1/20	Barr Laboratories Inc.
Pediaderm HC	Arbor Pharmaceuticals, Inc.
Naproxen Delayed-release	ALPHAPHARM PTY. LTD.
Synercid	Pfizer Laboratories Div Pfizer Inc
Zipsor	Depomed, Inc.
Anti Itch	Rite Aid Corporation
Simply Right Omeprazole	Sam's West Inc
ibuprofen cold and sinus	Kroger Company
Omeprazole	PD-Rx Pharmaceuticals, Inc.
MooreBrand Ibuprofen	Moore Medical LLC
DILTZAC	Apotex Corp.
Care One Ibuprofen PM	American Sales Company
ARC FIRST AID Contains 101 PIECES Hardcase	American Red Cross
ciprofloxacin	Unit Dose Services
CLEOCIN PHOSPHATE	General Injectables & Vaccines, Inc
ibuprofen cold	Meijer Distribution Inc
Cleocin	Physicians Total Care, Inc.
Clindamax	PHARMADERM. A division of Nycomed US Inc.
Cataflam	Novartis Pharmaceuticals Corporation
PINK BISMUTH	Rugby Laboratories, Inc.
Loryna	Sandoz Inc
Equaline Aspirin	Supervalu Inc
Rite Aid	Rite Aid Corporation
Ciprofloxacin	Watson Pharma, Inc.
rx act stomach relief	H E B
VYTORIN	Merck Sharp & Dohme Corp.
buPROPion Hydrochloride	McKesson Packaging Services Business Unit of McKesson Corporation
ASTAGRAF XL	Astellas Pharma US, Inc.
Carbatrol	Shire US Manufacturing Inc.
Introvale	Sandoz Inc
up and up cold and sinus	Target Corporation
FIRST Marys Mouthwash Compounding	CutisPharma, Inc.
Junel Fe 1.5/30	Rebel Distributors Corp
Fluoxetine	Rebel Distributors Corp
Glytone soothe calming	Genesis Pharmaceuticals
Childrens MOTRIN	McNeil Consumer Healthcare    Div. McNeil-PPC, Inc
NAPROXEN SODIUM	J.P. BUSINESS ENTERPRISE
Topcare Naproxen Sodium	Topco Associates LLC
Sunmark ibuprofen ib	McKesson
smart sense ibuprofen	Kmart Corporation
Fulton Street Market Omeprazole	Access Business Group LLC
voriconazole	Sandoz Inc
Nexterone	Baxter Healthcare Corporation
Rodan and Fields	Cosmetic Enterprises Ltd.
Appbutamone	Physician Therapeutics LLC
Bupropion	Physicians Total Care, Inc.
CVS Pharmacy	CVS Pharmacy
Lo/Ovral-28	A-S Medication Solutions LLC
Up and Up Naproxen Sodium	Target Corporation
APLENZIN	STAT RX USA LLC
REYATAZ	Physicians Total Care, Inc.
Pain Relief Aspirin	Rite Aid
Infants Ibuprofen	Actavis Inc.
Stomach Relief	Hannaford Brothers Company
Orphenadrine Citrate, Aspirin and Caffeine	Rebel Distributors Corp
Hydro Skin	Rugby Laboratories
ASPIRIN LOW DOSE CHEWABLE	Contract Pharmacy Services-PA
NuCort	Gentex Pharma
dg health headache relief	Dolgencorp, LLC
Clindamycin Palmitate Hydrochloride (Pediatric)	Aurobindo Pharma Limited
Trepoxen-250	Physician Therapeutics LLC
Fulton Street Market Ibuprofen	Access Business Group LLC
Erythrocin Lactobionate	Hospira, Inc.
Rifamate	sanofi-aventis U.S. LLC
Silver Sulfadiazene	REMEDYREPACK INC.
CamreseLo	Teva Pharmaceuticals USA Inc
Smart Sense naproxen sodium	Kmart Corporation
FIRST AID Contains 303 PIECES HARDCASE	Genuine First Aid LLC
Excedrin Extra Strength	Lil' Drug Store Products, Inc.
MONO-LINYAH	Northstar Rx LLC
Family Wellness Omeprazole	Family Dollar Services Inc
Lodine	bryant ranch prepack
butalbital and acetaminophen	Qualitest Pharmaceuticals
BudPak Anti-Itch	Budpak Inc.
EXTINA	Prestium Pharma, Inc.
LESCOL	Physicians Total Care, Inc.
LARIN 1/20	Northstar Rx LLC
AMARYL	Sanofi-Aventis U.S. LLC
CETRAXAL	WraSer Pharmaceuticals
CLINDAMYCIN PHOSPHATE	Physicians Total Care, Inc.
Pain Reliever Added Strength	Target Corporation
HydroCortisone	Western Family Foods Inc
Tencon	International Ethical Labs, Inc.
Naprosyn	Genentech, Inc.
Pain Relief	P and L Development of New York Corporation
CVS Aspirin	WOONSOCKET PRESCRIPTION CENTER, INCORPORATED
Ritalin	Novartis Pharmaceuticals Corporation
up and up naproxen sodium	Target Corporation
FIRST AID  Contains 101 PIECES	Genuine First Aid LLC
BIO-CORNEUM HC Advanced Scar Supervision Anti-Itch	Advanced Bio-Technologies, Inc
\.


--
-- Data for Name: product_drug_relation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_drug_relation (product_name, drug_name) FROM stdin;
Low Dose Miniprin	aspirin
SOLU-CORTEF	hydrocortisone
rexall hydrocortisone	hydrocortisone
GILDESS FE 1.5/30	ethinyl estradiol
Diclofenac sodium and Misoprostol	diclofenac
Glyburide and Metformin	glibenclamide
Health Mart Regular Strength Enteric Coated Aspirin	aspirin
Cortizone 10 Poison Ivy Relief Pads	hydrocortisone
Medique Pain Off	aspirin
K-Mart SmartSense First Aid Contains 303 Pieces	aspirin
Rx Act Aspirin	aspirin
equaline all day pain relief	naproxen
Butalbital, Acetaminophen and Caffeine with Codeine Phosphate	butalbital
Westcort	hydrocortisone
Western Family	hydrocortisone
Zegerid OTC	omeprazole
Childrens Chewable Aspirin	aspirin
Warfarin Sodium	warfarin
leader ibuprofen cold and sinus	ibuprofen
Appbutamone-D	bupropion
hydrocodone bitartrate and acetaminophen	ibuprofen
Good Sense Omeprazole	omeprazole
Regular Strength Aspirin	aspirin
Ciprofloxacin hydrochloride	ciprofloxacin
Good Sense Ibuprofen	ibuprofen
ERY-TAB	erythromycin
Clindamycin Hydrochloride	clindamycin
Coachs First Aid Contains 102 Pieces	aspirin
Equaline Ibuprofen	ibuprofen
CycloSPORINE	cyclosporine
Ibuprofen and Pseudoephedrine hydrochloride	ibuprofen
Proprinal	ibuprofen
LAMISIL	terbinafine
headache relief	aspirin
Piyanping antiitch	hydrocortisone
FLUOXETINE	fluoxetine
POISON OAK	hydrocortisone
Equaline headache formula	aspirin
Dolgic Plus	butalbital
members mark omeprazole	omeprazole
nifedipine	nifedipine
ShopRite Omeprazole	omeprazole
Aspiring	aspirin
Kroger	terbinafine
Equate Naproxen Sodium	naproxen
good sense aspirin	aspirin
Caziant	ethinyl estradiol
Diclofenac Sodium Extended-Release	diclofenac
smart sense ibuprofen pm	ibuprofen
ibuprofen cold relief	ibuprofen
Amethia Lo	ethinyl estradiol
Health Mart Aspirin	aspirin
Prandin	repaglinide
Pain Aid ESF	aspirin
Rapid Comfort Ibuprofen	ibuprofen
Trileptal	oxcarbazepine
BUTALBITAL AND ACETAMINOPHEN	butalbital
Lidocaine HCl and Hydrocortisone Acetate	hydrocortisone
Goodys	aspirin
ARC FIRST AID Emergency Preparedness Contains 167 PIECES	aspirin
Indomethacin	indomethacin
ERYTHROMYCIN Base Filmtab	erythromycin
Cortaid	hydrocortisone
BUDEPRION XL	bupropion
Topcare Stomach Relief	bismuth subsalicylate
ShopRite Hydrocortisone	hydrocortisone
Tiazac Extended Release	diltiazem
Phenobarbital	phenobarbital
Nizoral	ketoconazole
Ortho Evra	ethinyl estradiol
Pylera	bismuth subsalicylate
METHYLPHENIDATE	methylphenidate
cold and sinus pain relief	ibuprofen
APPLE	troleandomycin
leader ibuprofen cold	ibuprofen
Health Sense Infants Ibuprofen	ibuprofen
Berkley and Jensen Aspirin	aspirin
Zithromax	azithromycin
Colestid	colestipol
Smart Sense Naproxen Sodium	naproxen
Preferred Plus Ibuprofen 200	ibuprofen
Nicardipine HCl	nicardipine
Tri-Lo-Sprintec	ethinyl estradiol
Pain Relief Ibuprofen	ibuprofen
Naproxen Sodium	naproxen
GLIPIZIDE and METFORMIN HYDROCHLORIDE	glipizide
Up and Up Sinus and Cold D	naproxen
Cortizone 10 Hydratensive Soothing Anti Itch	hydrocortisone
Ketodan	ketoconazole
AMIODARONE HYDROCHLORIDE	amiodarone
Diflucan	fluconazole
Sunmark Sinus and Cold D	naproxen
Cardene I.V.	nicardipine
TopCare All Day Pain Relief	naproxen
Good Sense headache formula	aspirin
LAMISIL AT	terbinafine
Erythromycin-Benzoyl Peroxide	erythromycin
Imipenem and Cilastatin	imipenem
Imipenem and Cilastatin	cilastatin
Colcrys	colchicine
CVS	hydrocortisone
APROFEN	ibuprofen
LARIN Fe 1/20	ethinyl estradiol
Hydrocortisone Regular Strength	hydrocortisone
clindamycin hydrochloride	clindamycin
Genuine Hydrocortisone	hydrocortisone
AVANDARYL	glimepiride
BUPROBAN	bupropion
CALAN SR	verapamil
Enteric Aspirin	aspirin
clindamycin palmitate hydrochloride	clindamycin
Sunmark Naproxen Sodium	naproxen
Hydrocortisone and Acetic Acid	hydrocortisone
METOZOLV	metoclopramide
Oxycodone and Aspirin	aspirin
FLUOXETINE HYDROCHLORIDE	fluoxetine
Natureplex Hydrocortisone	hydrocortisone
up and up ibuprofen	ibuprofen
Griseofulvin	griseofulvin
equate migraine relief	aspirin
Leader Ibuprofen	ibuprofen
Diltiazem Hydrochloride Extended Release	diltiazem
Soothe	hydrocortisone
ZEOSA	ethinyl estradiol
Low-Dose Aspirin	aspirin
good sense ibuprofen pm	ibuprofen
Alacort	hydrocortisone
Fluoxetine Hydrochloride	fluoxetine
U-Cort	hydrocortisone
ARC FIRST AID Contains 404 PIECES	aspirin
Protection	aspirin
leader aspirin	aspirin
Film Coated Ibuprofen	ibuprofen
Metoclopramide Hydrochloride	metoclopramide
Sandostatin	octreotide
GLYBURIDE AND METFORMIN HYDROCHLORIDE	glibenclamide
Theraproxen-90	naproxen
Solu-Cortef	hydrocortisone
Pramosone	hydrocortisone
Glimepiride	glimepiride
Flanax Aspirin Pain Reliever	aspirin
Benzaclin	clindamycin
Lidocaine HCl - Hydrocortisone Acetate	hydrocortisone
Good Neighbor Pharmacy ibuprofen	ibuprofen
CORTISPORIN	hydrocortisone
VFEND	voriconazole
Arthriten	aspirin
DG Health Hydrocortisone Cream	hydrocortisone
Zegerid	omeprazole
Pioglitazone hydrochloride and glimepiride	glimepiride
Junior Strength Ibuprofen	ibuprofen
Clindamycin in 5 Percent Dextrose	clindamycin
JINTELI	ethinyl estradiol
Ache and Pain Relief to Go	aspirin
MonoNessa	ethinyl estradiol
Omeprazole Magnesium	omeprazole
Regular Strength Aspirin EC	aspirin
ERYGEL	erythromycin
BUTALBITAL, ASPIRIN, AND CAFFEINE	butalbital
BUTALBITAL, ASPIRIN, AND CAFFEINE	aspirin
JUVISYNC	simvastatin
Low Dose Pain Relief Aspirin	aspirin
Allopurinol sodium	allopurinol
Hydrocortisone Butyrate	hydrocortisone
Bayer Aleve	naproxen
K-Mart SmartSense First Aid Contains 101 Pieces	aspirin
Health Mart Stomach relief	bismuth subsalicylate
ALYACEN 7/7/7	ethinyl estradiol
Dasetta 7/7/7	ethinyl estradiol
Medique Medi Seltzer	aspirin
amiodarone hydrochloride	amiodarone
family wellness childrens ibuprofen	ibuprofen
LARIN Fe 1.5/30	ethinyl estradiol
being well ibuprofen	ibuprofen
Verapamil	verapamil
Repaglinide	repaglinide
berkley and jensen ibuprofen pm	ibuprofen
Aleve	naproxen
proctofoam HC	hydrocortisone
Kaopectate Regular Strength Peppermint Flavor Anti Diarrheal	bismuth subsalicylate
ALL DAY RELIEF	naproxen
Diltiazem Hydrochloride	diltiazem
BUTALBITAL, ACETAMINOPHEN, CAFFEINE, AND CODEINE PHOSPHATE	butalbital
QUARTETTE	ethinyl estradiol
Midol Extended Relief	naproxen
Healthy Accents Naproxen Sodium	naproxen
Butalbital and Acetaminophen	butalbital
profen ib	ibuprofen
Equagesic	aspirin
Butalbital, Acetaminophen and Caffeine	butalbital
OMEPRAZOLE	omeprazole
Erythromycin and Benzoyl Peroxide	erythromycin
healthy accents omeprazole	omeprazole
Simvastatin	simvastatin
Cortenema	hydrocortisone
E.E.S	erythromycin
CortiSil MDX	hydrocortisone
Immediate Comfort	hydrocortisone
OKT3	muromonab
METHOTREXATE	methotrexate
Piroxicam	piroxicam
FormuCare Aspirin	aspirin
PROBUFEN	ibuprofen
Refuge HC	hydrocortisone
CIPROFLOXACIN	ciprofloxacin
butalbital, aspirin, caffeine and codeine phosphate	butalbital
butalbital, aspirin, caffeine and codeine phosphate	aspirin
healthy accents cortisone	hydrocortisone
Tarka	verapamil
Anusol HC	hydrocortisone
Low-Ogestrel	ethinyl estradiol
Diltiazem HCl CD	diltiazem
Cedaprin	ibuprofen
care one hydrocortisone	hydrocortisone
Carisoprodol and Aspirin	aspirin
Scalpicin Maximum Strength	hydrocortisone
Goodys Extra Strength	aspirin
Rifadin	rifampin
ORBIVAN	butalbital
METOCLOPRAMIDE	metoclopramide
Kaopectate Regular Strength Vanilla Flavor Anti Diarrheal	bismuth subsalicylate
Zenchent FE	ethinyl estradiol
Mysoline	primidone
METHOTREXATE SODIUM	methotrexate
Flector	diclofenac
Red Delicious Apple	troleandomycin
good sense all day pain relief	naproxen
glipizide	glipizide
Mountain Series Weekender Medical	aspirin
Mountain Series Weekender Medical	ibuprofen
Lescol	fluvastatin
TERBINAFINE HYDROCHLORIDE	terbinafine
Ponstel	mefenamic acid
SIMVASTATIN	simvastatin
formucare naproxen sodium	naproxen
bupropion hydrochloride	bupropion
Methotrexate	methotrexate
Regular Strength Enteric Aspirin	aspirin
CIPRO	ciprofloxacin
CIPRO	hydrocortisone
Kroger Value Aspirin	aspirin
ERYTHROMYCIN ETHYLSUCCINATE AND SULFISOXAZOLE ACETYL	erythromycin
Ketek	telithromycin
MEVACOR	lovastatin
Azulfidine	sulfasalazine
Moore Medical Ibuprofen	ibuprofen
Verapamil HCl	verapamil
SARAFEM	fluoxetine
Cortomycin	hydrocortisone
PIRMELLA 7/7/7	ethinyl estradiol
Modern Pain Medicine	naproxen
IBUPROFEN AND DIPHENHYDRAMINE HCL	ibuprofen
athletes foot	terbinafine
DICLOFENAC POTASSIUM	diclofenac
Handy Solutions GENUINE ASPIRIN BAYER	aspirin
ShopRite Infants Ibuprofen	ibuprofen
Fosphenytoin	phenytoin
Flurbiprofen	flurbiprofen
Analpram E	hydrocortisone
Reglan	metoclopramide
Healthy Accents headache relief	aspirin
dg health naproxen sodium	naproxen
equate ibuprofen cold and sinus	ibuprofen
Mefenamic Acid	mefenamic acid
Pepto-Bismol	bismuth subsalicylate
IBU	ibuprofen
Maximum-H	hydrocortisone
Analpram HC	hydrocortisone
Diclofenac Sodium Delayed-release	diclofenac
Cordarone	amiodarone
Care One Aspirin	aspirin
GERI-PECTATE PEPPERMINT FLAVOR	bismuth subsalicylate
Previfem	ethinyl estradiol
Sprintec	ethinyl estradiol
Feldene	piroxicam
TopCare Omeprazole	omeprazole
Nefazodone Hydrochloride	nefazodone
FIRST AID Contains 303 PIECES	aspirin
MIDODRINE HYDROCHLORIDE	midodrine
ENDODAN	aspirin
Fluvastatin Sodium	fluvastatin
Enteric coated aspirin	aspirin
Cortisone Maximum Strength	hydrocortisone
exchange select naproxen sodium	naproxen
Ibuprofen	ibuprofen
Pain Stoppers Extra	aspirin
METHYLPHENIDATE HYDROCHLORIDE	methylphenidate
ZONISAMIDE	diltiazem
FAMILY CARE HYDROCORTISONE	hydrocortisone
OCELLA	ethinyl estradiol
Lessina	ethinyl estradiol
Covera-HS	verapamil
NU-DERM Tolereen	hydrocortisone
Midol	ibuprofen
Enteric Coated Asprin 81 mg	aspirin
Necon	mestranol
Necon	ethinyl estradiol
butalbital, acetominophen and caffeine	butalbital
Lamisil	terbinafine
migraine formula	aspirin
Tri Previfem	ethinyl estradiol
BLUE ACME SLEEVE  FIRST AID Contains 1000 PIECES	aspirin
CVS Pharmacy Anti-itch	hydrocortisone
CLARITHROMYCIN	clarithromycin
Leader Aspirin	aspirin
FEMCON Fe	ethinyl estradiol
PCE	erythromycin
Estarylla	ethinyl estradiol
ALLOPURINOL	allopurinol
Proctocream	hydrocortisone
ALLI	orlistat
Lidocaine Hydrochloride and Hydrocortisone Acetate	hydrocortisone
Sunmark Ibuprofen IB	ibuprofen
Adult Low Dose Enteric Coated Aspirin	aspirin
Griseofulviin (microsize)	griseofulvin
Sandimmune	cyclosporine
Enpresse	ethinyl estradiol
hydrocortisone 1	hydrocortisone
ADVENTURE MEDICAL KITS 1-4 PERSON FIRST AID	aspirin
ADVENTURE MEDICAL KITS 1-4 PERSON FIRST AID	ibuprofen
Apri	ethinyl estradiol
Cortisporin	hydrocortisone
Diclofenac Sodium Delayed Release	diclofenac
SULFATRIM	sulfamethoxazole
AVIANE	ethinyl estradiol
HydroSkin	hydrocortisone
50 Person ANSI	aspirin
50 Person ANSI	ibuprofen
Diclofenac	diclofenac
All Day Relief	naproxen
RE-PB HYOS ELIXIR	phenobarbital
Butalbital, Aspirin, Caffeine and Codeine Phosphate	butalbital
Butalbital, Aspirin, Caffeine and Codeine Phosphate	aspirin
berkley and jensen migraine relief	aspirin
Mestinon	pyridostigmine
Family Wellness Maximum Strength Hydrocortisone	hydrocortisone
Up and Up Ibuprofen	ibuprofen
SULFASALAZINE	sulfasalazine
Good Sense Naproxen Sodium	naproxen
Foscarnet Sodium	foscarnet
ClindaMax	clindamycin
BAMBOO SALT  Eunganggo Jook Yeom	ursodeoxycholic acid
Benzamycin Pak	erythromycin
Regular Strength Tri-Buffered Aspirin	aspirin
ADVIL ALLERGY SINUS	ibuprofen
PREVPAC	clarithromycin
Terra-Cortril	hydrocortisone
Ortho Tri Cyclen	ethinyl estradiol
CAMBIA	diclofenac
Omeprazole and Sodium Bicarbonate	omeprazole
GLIPIZIDE	glipizide
Up and Up Migraine Relief	aspirin
GLUCOVANCE	glibenclamide
SUSTIVA	efavirenz
Oxaprozin	oxaprozin
Aveeno Hydrocortisone Anti Itch	hydrocortisone
hydrocortisone Iodoquinol	hydrocortisone
good sense ibuprofen	ibuprofen
Hypertenevide-12.5	carvedilol
FLECTOR	diclofenac
CAMRESE	ethinyl estradiol
Cryselle	ethinyl estradiol
All Day Pain Relief	naproxen
Etoposide	etoposide
Ortho Cept	ethinyl estradiol
Daypro	oxaprozin
Genuine First Aid - Auto First Aid	ibuprofen
DILANTIN	phenytoin
Dermarest	hydrocortisone
Carbamazepine (Chewable)	carbamazepine
FLUVASTATIN SODIUM	fluvastatin
Genuine First Aid Industrial  First Aid	aspirin
Genuine First Aid Industrial  First Aid	ibuprofen
AUBRA	ethinyl estradiol
Easy Care First Aid Kit - Outdoor and Travel	ibuprofen
Berkley and Jensen Naproxen Sodium	naproxen
good neighbor pharmacy pain relief	naproxen
Amiodarone Hydrochloride	amiodarone
Proquin	ciprofloxacin
Ery-Ped	erythromycin
NICARdipine Hydrochloride	nicardipine
PrandiMet	repaglinide
Nifediac CC	nifedipine
Toposar	etoposide
Nortrel	ethinyl estradiol
Prozac	fluoxetine
Mefenamic acid	mefenamic acid
migraine relief	aspirin
Combunox	ibuprofen
TRI-LINYAH	ethinyl estradiol
Zovia 1/35E-28	ethinyl estradiol
Care One hydrocortisone	hydrocortisone
ClindaMax Lotion	clindamycin
ENPRESSE	ethinyl estradiol
Theraprofen-60	ibuprofen
BC Arthritis	aspirin
Propafenone	propafenone
clindamycin phosphate	clindamycin
DG Health migraine relief	aspirin
TRI-LO-MARZIA	ethinyl estradiol
Epitol	carbamazepine
BuPROPion Hydrochloride	bupropion
KAO-TIN PEPPERMINT FLAVOR	bismuth subsalicylate
Cyclosporine	cyclosporine
Leader ibuprofen pm	ibuprofen
healthy accents ibuprofen	ibuprofen
Enlon	edrophonium
Ketoprofen Extended-release	ketoprofen
Renagel	sevelamer
Solia	ethinyl estradiol
Advil	ibuprofen
Clindamycin - Benzoyl Peroxide	clindamycin
10 Person ANSI	aspirin
10 Person ANSI	ibuprofen
Excedrin	aspirin
Hydrocortisone with Aloe	hydrocortisone
care one aspirin	aspirin
Phenytoin Infatabs	phenytoin
TriNessa	ethinyl estradiol
Clindagel	clindamycin
GERI-PECTATE VANILLA FLAVOR	bismuth subsalicylate
Leader Sinus and Cold-D	naproxen
good neighbor pharmacy Ibuprofen	ibuprofen
TOLMETIN SODIUM	tolmetin
Childrens Motrin	ibuprofen
ARC FIRST AID Contains 1000 PIECES	aspirin
ProAmatine	midodrine
Atripla	efavirenz
Amiodarone HCl	amiodarone
Vytone	hydrocortisone
topcare headache formula	aspirin
SULFAMETHOXAZOLE AND TRIMETHOPRIM	sulfamethoxazole
Kelnor 1/35	ethinyl estradiol
ALKERAN	melphalan
SULINDAC	sulindac
CVS HYDROCORTISONE WITH ALOE	hydrocortisone
Bismuth Subsalicylate	bismuth subsalicylate
Enteric Coated Low Dose Aspirin	aspirin
Primidone	primidone
Cleocin T	clindamycin
Donnatal Extentabs	phenobarbital
Sunmark migraine relief	aspirin
BUDEPRION	bupropion
Smart Sense migraine relief	aspirin
kirkland signature ibuprofen ib	ibuprofen
CARISOPRODOL and ASPIRIN	aspirin
Mefenamic-Acid	mefenamic acid
Coreg	carvedilol
Topcare Migraine Formula	aspirin
Glyburide and Metformin Hydrochloride	glibenclamide
Neomycin and Polymyxin B Sulfates and Bacitracin Zinc with Hydrocortisone Acetate	hydrocortisone
OMESEC	omeprazole
care one ibuprofen cold and sinus	ibuprofen
Procardia	nifedipine
Equate Ibuprofen	ibuprofen
Chloroquine Phosphate	chloroquine
health mart migraine formula	aspirin
PACERONE	amiodarone
Added Strength Pain Reliever	aspirin
Leader Childrens Ibuprofen	ibuprofen
Reclipsen	ethinyl estradiol
hydrocortisone acetate pramoxine HCl	hydrocortisone
MARLISSA	ethinyl estradiol
Proactiv Solution Anti-Itch Scalp	hydrocortisone
ibuprofen pm	ibuprofen
Butisol Sodium	butabarbital
ORTHO TRI CYCLEN Lo	ethinyl estradiol
GENUINE FIRST AID Emergency Preparedness Contains 167 PIECES HARDCASE	aspirin
Gengraf	cyclosporine
Tilia Fe	ethinyl estradiol
LOCOID LIPOCREAM	hydrocortisone
Glipizide and Metformin Hydrochloride	glipizide
Daysee	ethinyl estradiol
Dermaquest Skin Therapy Post-Skin Resurfacing Balm	hydrocortisone
QUESTRAN	cholestyramine
Cartia	diltiazem
Naprelan	naproxen
equate ibuprofen pm	ibuprofen
Pramoxine-HC	hydrocortisone
PREPARATION H HYDROCORTISONE	hydrocortisone
Tolmetin Sodium	tolmetin
rexall aspirin	aspirin
Rx Act all day pain relief	naproxen
Ecotrin	aspirin
Sunmark ibuprofen	ibuprofen
Vagisil Satin	hydrocortisone
Rheumatrex	methotrexate
Good Neighbor Pharmacy Ibuprofen PM	ibuprofen
LOESTRIN 1/20	ethinyl estradiol
dg health omeprazole	omeprazole
Azithromycin Dihydrate	azithromycin
ARTHROTEC	diclofenac
LEADER HYDROCORTISONE	hydrocortisone
IsonaRif	rifampin
URSO	ursodeoxycholic acid
Cleocin Hydrochloride	clindamycin
Berkley and Jensen ibuprofen	ibuprofen
BC	aspirin
CARBAMAZEPINE	carbamazepine
CYCLOPHOSPHAMIDE	allopurinol
CYCLESSA	ethinyl estradiol
Lidocaine HCl  - Hydrocortisone Acetate	hydrocortisone
health mart omeprazole	omeprazole
Omeclamox-Pak	clarithromycin
Omeclamox-Pak	omeprazole
Bloxiverz	neostigmine
FACE VALUES HYDROCORTISONE WITH ALOE	hydrocortisone
Butalbital, Acetaminophen, Caffeine	butalbital
Olanzapine and Fluoxetine	fluoxetine
RYTHMOL	propafenone
Neosporin Essentials Trial Pack	hydrocortisone
VERELAN	verapamil
Aspir Low	aspirin
CAREALL Hydrocortisone	hydrocortisone
Aggrenox	aspirin
Preferred Plus Ibuprofen	ibuprofen
Omeprazole Delayed-Release	omeprazole
WARFARIN SODIUM	warfarin
Extra Strength Back and Body	aspirin
Necon 0.5/35	ethinyl estradiol
Equate omeprazole delayed release	omeprazole
sunmark headache relief	aspirin
ASPIRIN	aspirin
CRYSELLE	ethinyl estradiol
DONNATAL	phenobarbital
fluoxetine	fluoxetine
Sulfatrim	sulfamethoxazole
Colocort	hydrocortisone
Gleevec	imatinib
glyburide	glibenclamide
ESTROSTEP Fe	ethinyl estradiol
healthy accents stomach relief	bismuth subsalicylate
Diltiazem HCl	diltiazem
Health Mart Childrens Ibuprofen	ibuprofen
Perrigo Ibuprofen	ibuprofen
Enlon Plus	edrophonium
North Aspirin	aspirin
LEXIVA	amprenavir
LoSeasonique	ethinyl estradiol
Phenytoin	phenytoin
ATOPALM Moisturizing Hydrocortisone	hydrocortisone
Naproxen Kit	naproxen
Healthy Accents Aspirin	aspirin
Topcare Infants Ibuprofen	ibuprofen
FixMySkin Healing Balm Unflavored	hydrocortisone
INFANTS ADVIL	ibuprofen
Desogestrel and Ethinyl Estradiol	ethinyl estradiol
Adult Chewable Low Dose Aspirin	aspirin
Leader Cardinal Health Aspirin	aspirin
ShopRite Childrens Ibuprofen	ibuprofen
Jolessa	ethinyl estradiol
oxycodone hydrochloride and ibuprofen	ibuprofen
Good Neighbor Pharmacy Aspirin	aspirin
methylphenidate hydrochloride	methylphenidate
SILVADENE	sulfadiazine
Pyridostigmine bromide	pyridostigmine
good sense anti itch	hydrocortisone
ETOPOPHOS	etoposide
Equate Aspirin	aspirin
Nembutal Sodium	pentobarbital
Neomycin and Polymyxin B Sulfates and Hydrocortisone	hydrocortisone
Ery-Tab	erythromycin
NAPRELAN	naproxen
Carvedilol	carvedilol
Actigall	ursodeoxycholic acid
Blowfish	aspirin
Sulfasalazine	sulfasalazine
Neomycin and Polymyxin B Sulfates, Bacitracin Zinc and Hydrocortisone	hydrocortisone
ADVIL COLD AND SINUS	ibuprofen
ALTAVERA	ethinyl estradiol
Indomethacin extended-release	indomethacin
Levora	ethinyl estradiol
Carbamazepine	carbamazepine
Tri-Buffered Aspirin	aspirin
Up and Up Naproxen sodium	naproxen
Rifampin	rifampin
ZYBAN	bupropion
Maximum Strength Cortizone 10 Quick Shot 360 Continuous	hydrocortisone
Naproxen Tablets	naproxen
Cyclophosphamide	allopurinol
ketoconazole	ketoconazole
Pain Reliever Plus	aspirin
Ciprodex	ciprofloxacin
Headache Relief	aspirin
Diclofenac Sodium	diclofenac
Sentraflox AM-10	fluoxetine
NAPROXEN	naproxen
IBUPROFEN	ibuprofen
Digoxin	digoxin
Ery	erythromycin
Procto-Kit	hydrocortisone
EVOCLIN	clindamycin
Infants Motrin	ibuprofen
diltiazem hydrochloride	diltiazem
Fenoprofen Calcium	fenoprofen
QUADRAPAX	phenobarbital
Dilantin-125	phenytoin
WERA	ethinyl estradiol
Foscavir	foscarnet
Beyaz	ethinyl estradiol
PRAMCORT	hydrocortisone
Mesantoin	mephenytoin
Good Sense Anti Itch	hydrocortisone
Good Sense ibuprofen	ibuprofen
omeprazole	omeprazole
Erythromycin	erythromycin
Health Mart Naproxen Sodium	naproxen
Neomycin and Polymyxin B Sulfates, Bacitracin Zinc, and Hydrocortisone	hydrocortisone
kirkland signature omeprazole	omeprazole
Dilantin	phenytoin
good neighbor pharmacy childrens ibuprofen	ibuprofen
MedPride	hydrocortisone
cortisone	hydrocortisone
Bayer	aspirin
Family Wellness	hydrocortisone
aspirin	aspirin
FIRST AID  Contains 101 PIECES HARDCASE	aspirin
Our Family	hydrocortisone
Methylin	methylphenidate
Buffered Aspirin	aspirin
LEVONORGESTREL AND ETHINYL ESTRADIOL	ethinyl estradiol
Zee Pain Aid	aspirin
Metadate ER	methylphenidate
ACANYA	clindamycin
Maxitril	erythromycin
Cortisone Maximum Strength with Aloe	hydrocortisone
Smart Sense Hydrocortisone	hydrocortisone
Motrin IB	ibuprofen
GOOD SENSE IBUPROFEN	ibuprofen
Desempacho	bismuth subsalicylate
Butalbital, Aspirin and Caffeine	butalbital
Butalbital, Aspirin and Caffeine	aspirin
up and up aspirin	aspirin
CEREBYX	phenytoin
Clindamycin Phosphate	clindamycin
INDOCIN	indomethacin
equaline ibuprofen	ibuprofen
Comfort Pac with Ibuprofen	ibuprofen
ShopRite Ibuprofen	ibuprofen
Analpram Advanced	hydrocortisone
KELO-COTE HC Anti-Itch Scar Treatment	hydrocortisone
Medi First Pain Relief	aspirin
Bupropion Hydrochloride	bupropion
Cortisone	hydrocortisone
Gildess 1/20	ethinyl estradiol
Nafcillin	nafcillin
Fasprin	aspirin
Theraprofen-800	ibuprofen
Clindacin ETZ	clindamycin
Bayer Migraine Formula	aspirin
Velivet	ethinyl estradiol
Oto End 10	hydrocortisone
Topcare All Day Pain Relief	naproxen
ciprofloxacin hydrochloride	ciprofloxacin
Dye Free Ibuprofen	ibuprofen
clindamycin phosphate and benzoyl peroxide	clindamycin
ATORVASTATIN CALCIUM	atorvastatin
Asprin	aspirin
JUNIOR STRENGTH ADVIL	ibuprofen
Medique Diotame	bismuth subsalicylate
Sudafed	naproxen
Jinteli	ethinyl estradiol
topcare ibuprofen	ibuprofen
welby health ibuprofen	ibuprofen
Pain Relief Anti inflammatory	ibuprofen
Major Childrens Ibuprofen	ibuprofen
Aviane	ethinyl estradiol
Cicatricure	hydrocortisone
healthy accents naproxen sodium	naproxen
care one omeprazole	omeprazole
PROCORT	hydrocortisone
Afeditab	nifedipine
Tri-Estarylla	ethinyl estradiol
Hytone	hydrocortisone
ADVIL CONGESTION RELIEF	ibuprofen
Aspirin, Caffeine, and Dihydrocodeine Bitartrate	aspirin
METHYLIN	methylphenidate
Onmel	itraconazole
Kaopectate Regular Strength Cherry Flavor	bismuth subsalicylate
Bactrim DS	sulfamethoxazole
VIRACEPT	nelfinavir
Ibutab	ibuprofen
PRAVACHOL	pravastatin
up and up junior strength ibuprofen	ibuprofen
Ciloxan	ciprofloxacin
ZyPram	hydrocortisone
RIFAMPIN	rifampin
Biaxin	clarithromycin
VERAPAMIL HYDROCHLORIDE	verapamil
Glynase	glibenclamide
Propafenone HCl	propafenone
ABELCET	amphotericin b
equate ibuprofen	ibuprofen
Enteric Coated Aspirin	aspirin
Vytorin	simvastatin
Vytorin	ezetimibe
Butapap	butalbital
Sulfamethoxazole and Trimethoprim DS	sulfamethoxazole
E.E.S.	erythromycin
FixMySkin Healing Balm Fragrance-Free	hydrocortisone
ShopRite Ibuprophen	ibuprofen
GlipizideER	glipizide
Erythra-Derm	erythromycin
ShopRite Naproxen Sodium	naproxen
FixMySkin Healing Balm Vanilla Fragrance	hydrocortisone
Zebutal	butalbital
Equaline ibuprofen	ibuprofen
Kurvelo	ethinyl estradiol
Direct Safety Ibuprofen	ibuprofen
Sandostatin LAR Depot	octreotide
Medi-First	hydrocortisone
Cortef	hydrocortisone
ZITHROMAX	azithromycin
good sense ibuprofen cold and sinus	ibuprofen
Leader Naproxen Sodium	naproxen
Fluoxetine hydrochloride	fluoxetine
FALMINA	ethinyl estradiol
REGLAN	metoclopramide
Chloroquine phosphate	chloroquine
EXTRA PAIN RELIEF	aspirin
ibu profen cold and sinus	ibuprofen
Nordette	ethinyl estradiol
Meclofenamate Sodium	meclofenamic acid
Regular Strength Enteric coated aspirin	aspirin
Tri-Sprintec	ethinyl estradiol
Chateal	ethinyl estradiol
Modafinil	modafinil
original formula	bismuth subsalicylate
WYMZYA FE	ethinyl estradiol
CANCIDAS	caspofungin
WELLBUTRIN XL	bupropion
Bupropion hydrochloride	bupropion
KETOCONAZOLE	ketoconazole
INDOMETHACIN	indomethacin
erythromycin	erythromycin
Norgestimate and Ethinyl Estradiol	ethinyl estradiol
Clindamycin phosphate	clindamycin
Dilantin Infatabs	phenytoin
Kola-Pectin	bismuth subsalicylate
AmBisome	amphotericin b
Pacerone	amiodarone
Cortifoam	hydrocortisone
SOMA COMPOUND with CODEINE	aspirin
all day relief	naproxen
Locoid Lipocream	hydrocortisone
ADVIL MIGRAINE	ibuprofen
Salsalate	salsalate
Microgestin Fe	ethinyl estradiol
pain relief	naproxen
Formu Care Anti Itch	hydrocortisone
THRULIFE EXTRA STRENGTH HEADACHE RELIEF	aspirin
Lomedia 24 Fe	ethinyl estradiol
Zonegran	diltiazem
Oxycodone Hydrochloride and Ibuprofen	ibuprofen
Metoclopramide hydrochloride	metoclopramide
TopCare Aspirin	aspirin
meijer	hydrocortisone
pain relief ibuprofen	ibuprofen
Caldolor	ibuprofen
members mark naproxen sodium	naproxen
Pain Relief Maximum Strength	aspirin
Healthy Accents migraine formula	aspirin
Cortisporin-TC	hydrocortisone
CLINDAMYCIN PALMITATE HYDROCHLORIDE	clindamycin
Equaline aspirin	aspirin
Alka Seltzer	aspirin
Rapid Comfort Aspirin	aspirin
ERYTHROMYCIN ETHYLSUCCINATE	erythromycin
GFA First Aid Kit Essentials - 33 Pieces	aspirin
GFA First Aid Kit Essentials - 33 Pieces	ibuprofen
Anti-itch	hydrocortisone
Capacet	butalbital
healthy accents all day pain relief	naproxen
Moore Medical Bismuth	bismuth subsalicylate
Donnatal	phenobarbital
Ala Scalp	hydrocortisone
PHENYTOIN SODIUM	phenytoin
Theraprofen-90	ibuprofen
GOOD NEIGHBOR PHARMACY FIRST AID Contains 202 PIECES	aspirin
Good Neighbor Pharmacy Ibuprofen Cold and Sinus	ibuprofen
HYDROCODONE BITARTRATE AND IBUPROFEN	ibuprofen
Probenecid and Colchicine	colchicine
LIPITOR	atorvastatin
Voltaren	diclofenac
smart sense aspirin	aspirin
Equaline Naproxen Sodium	naproxen
GRx HiCort	hydrocortisone
smart sense omeprazole	omeprazole
kirkland signature naproxen sodium	naproxen
ZIANA	clindamycin
Desogen	ethinyl estradiol
Cyclafem 7/7/7	ethinyl estradiol
Aloprim	allopurinol
ASPIRIN LOW DOSE	aspirin
rx act ibuprofen pm	ibuprofen
babies r us ibuprofen	ibuprofen
Glyburide	glibenclamide
Trioxin	hydrocortisone
Hydrocortisone Maximum Strength Plus 12 Moisturizers	hydrocortisone
Erythrocin Stearate	erythromycin
Nafcillin Sodium	nafcillin
Enteric Safety Coated Aspirin	aspirin
Good Neighbor Pharmacy	hydrocortisone
Good Neighbor Pharmacy	terbinafine
MEDIQUE Aspirin	aspirin
Quasense	ethinyl estradiol
safety coated aspirin	aspirin
Esgic-Plus	butalbital
Peptic Relief Cherry	bismuth subsalicylate
Norgesic	aspirin
Alcortin	hydrocortisone
good neighbor pharmacy anti itch	hydrocortisone
stomach relief	bismuth subsalicylate
Brevicon	mestranol
Brevicon	ethinyl estradiol
Diltia XT	diltiazem
Midodrine HCl	midodrine
Tegretol	carbamazepine
good sense childrens ibuprofen oral suspension	ibuprofen
Proctofoam	hydrocortisone
Safety Coated Aspirin	aspirin
Adult Low Strength Aspirin	aspirin
EXTENDED PHENYTOIN SODIUM	phenytoin
Viracept	nelfinavir
Coly-Mycin S	hydrocortisone
Berkley and Jensen Ibuprofen	ibuprofen
Topcare Aspirin	aspirin
AcetaZOLAMIDE	acetazolamide
Uricalm	aspirin
naproxen sodium	naproxen
Glucotrol	glipizide
Zegerid with Magnesium Hydroxide	omeprazole
Advil PM	ibuprofen
Gildess 1.5/30	ethinyl estradiol
KETOPROFEN	ketoprofen
simvastatin	simvastatin
CRESTOR	rosuvastatin
DiaBeta	glibenclamide
ARC FIRST AID Contains 303 PIECES HARDCASE	aspirin
Low Dose Asprin	aspirin
Ortho-Novum	ethinyl estradiol
topcare Ibuprofen Cold and Sinus	ibuprofen
sunmark omeprazole	omeprazole
Phenytoin Sodium	phenytoin
Leena	ethinyl estradiol
Cholestyramine	cholestyramine
Lovastatin	lovastatin
Balziva	ethinyl estradiol
Metoclopramide	metoclopramide
NOROXIN	norfloxacin
TREXIMET	naproxen
leader ibuprofen pm	ibuprofen
Acetasol HC	hydrocortisone
good neighbor pharmacy headache relief	aspirin
sunmark	hydrocortisone
Neostigmine Methylsuflate	neostigmine
equate	terbinafine
PHILITH	ethinyl estradiol
Altoprev	lovastatin
NAFCILLIN	nafcillin
Pravastatin	pravastatin
NEO-POLYCIN HC	hydrocortisone
Butalbital, Acetaminophen, and Caffeine	butalbital
Glipizide XL	glipizide
Dermazene	hydrocortisone
Ibuprofen PM	ibuprofen
SPORANOX	itraconazole
ANUCORT-HC	hydrocortisone
oxaprozin	oxaprozin
Green Guard Ibupro Relief	ibuprofen
AZITHROMYCIN	azithromycin
hydrocortisone acetate pramoxine hcl	hydrocortisone
ACME FIRST AID Contains 404 PIECES	aspirin
Kanamycin	tacrolimus
Pink Bismuth	bismuth subsalicylate
Ciprofloxacin Hydrochloride	ciprofloxacin
Lo Minastrin Fe	ethinyl estradiol
VIMOVO	naproxen
Myzilra	ethinyl estradiol
carvedilol	carvedilol
Extended Phenytoin Sodium	phenytoin
Erythromycin Ethylsuccinate	erythromycin
ibuprofen ib	ibuprofen
Health Mart Sinus and Cold D	naproxen
ARC FIRST AID Contains 303 PIECES	aspirin
Therafeldamine	piroxicam
Equaline migraine formula	aspirin
PRILOSEC	omeprazole
IBUPROFEN COLD AND SINUS	ibuprofen
equate hydrocortisone	hydrocortisone
Clindesse	clindamycin
DG Health Hydrocortisone	hydrocortisone
Nicardipine Hydrochloride	nicardipine
diclofenac sodium	diclofenac
Zetia	ezetimibe
Kariva	ethinyl estradiol
BROMO SELTZER	aspirin
Phrenilin	butalbital
MyOxin	hydrocortisone
Dilacor	diltiazem
Aspirin 81 mg	aspirin
NeoProfen	ibuprofen
COUMADIN	warfarin
Amethyst	ethinyl estradiol
Bupropion Hydrochloride SR	bupropion
Equate Hydrocortisone	hydrocortisone
Childrens Ibuprofen	ibuprofen
Rx Act headache formula	aspirin
Migraine Relief	aspirin
rx act naproxen sodium	naproxen
TAZTIA	diltiazem
Dermasorb HC Complete Kit	hydrocortisone
DIGOX	digoxin
Being Well all day pain relief	naproxen
good neighbor pharmacy ibuprofen	ibuprofen
COLCHICINE	colchicine
ERYTHROMYCIN	erythromycin
Phenobarbital Sodium	phenobarbital
Up and Up aspirin	aspirin
Portia	ethinyl estradiol
BENZACLIN	clindamycin
Up and Up Aspirin	aspirin
health mart aspirin	aspirin
Levonorgestrel and Ethinyl Estradoil	ethinyl estradiol
H-Releve Anti-Itch	hydrocortisone
Isoptin SR	verapamil
Trexall	methotrexate
Seasonique	ethinyl estradiol
femhrt	ethinyl estradiol
ZMAX	azithromycin
healthy accents aspirin	aspirin
Duane Reade	hydrocortisone
Good Sense All Day Pain Relief	naproxen
Carmol HC	hydrocortisone
Cardizem LA	diltiazem
Erythromycin Base	erythromycin
MODAFINIL	modafinil
sirolimus	sirolimus
up and up dye free infants concentrated ibuprofen	ibuprofen
Ultramicrosize Griseofulvin	griseofulvin
Foscavir UK	foscarnet
Sunmark Stomach relief	bismuth subsalicylate
Concerta	methylphenidate
Butalbital Acetaminophen and Caffeine	butalbital
Ibuprofen and Pseudoephedrine Hydrochloride	ibuprofen
Clarithromycin	clarithromycin
equaline anti itch	hydrocortisone
Seconal Sodium	secobarbital
Oticin HC	hydrocortisone
being well omeprazole	omeprazole
Low Strength Chewable Aspirin	aspirin
Hydrocortisone	hydrocortisone
Nabumetone	nabumetone
Effervescent Pain Relief	aspirin
Mircette	ethinyl estradiol
ADVENTURE MEDICAL KITS 1-2 PERSON FIRST AID	aspirin
ADVENTURE MEDICAL KITS 1-2 PERSON FIRST AID	ibuprofen
Health Mart Ibuprofen	ibuprofen
SE-DONNA PB HYOS	phenobarbital
Hydrocortisone Butyrate Cream (lipid) 0.1%	hydrocortisone
Antifungal Foot	terbinafine
CARDENE SR	nicardipine
Goodys Migraine Relief	aspirin
Live Better	hydrocortisone
Live Better	terbinafine
Cipro HC	ciprofloxacin
Cipro HC	hydrocortisone
Good Neighbor Pharmacy Naproxen Sodium	naproxen
BUTALBITAL, ACETAMINOPHEN AND CAFFEINE	butalbital
Auto 157	aspirin
Auto 157	ibuprofen
VOLTAREN	diclofenac
Up and Up childrens ibuprofen	ibuprofen
OXAPROZIN	oxaprozin
Rexall Ibuprofen	ibuprofen
Genuine First Aid - Home First Aid	ibuprofen
CIPRODEX	ciprofloxacin
Fosphenytoin Sodium	fosphenytoin
Fosphenytoin Sodium	phenytoin
Effervescent Pain Relief Fast Relief	aspirin
LOVASTATIN	lovastatin
St. Joseph Safety Coated Aspirin	aspirin
Octreotide Acetate	octreotide
Danazol	danazol
Sun Mark Stomach Relief	bismuth subsalicylate
Conney Aspirin	aspirin
Phenytek	phenytoin
Butalbital, Aspirin and Caffeine Tablets	butalbital
Butalbital, Aspirin and Caffeine Tablets	aspirin
Jantoven	warfarin
equate aspirin	aspirin
Propafenone Hydrochloride	propafenone
Extra Strength Pain Reliever	aspirin
Methylphenidate	methylphenidate
Healthy Accents All Day Pain Relief	naproxen
Theraproxen-500	naproxen
FLURBIPROFEN SODIUM	flurbiprofen
Butalbital, Acetaminophen, Caffeine and Codeine Phosphate	butalbital
LANOXIN	digoxin
Leader Stomach Relief	bismuth subsalicylate
equate naproxen sodium	naproxen
NEO-POLY-BAC HYDRO	hydrocortisone
Prilosec OTC	omeprazole
cold and sinus relief	ibuprofen
ARC FIRST AID Contains 101 PIECES	aspirin
Dasetta 1/35	ethinyl estradiol
Methotrexate Sodium	methotrexate
Silka	terbinafine
STANBACK	aspirin
Epifoam	hydrocortisone
up and up omeprazole	omeprazole
Daytrana	methylphenidate
Terbinafine	terbinafine
Flanax Pain Reliever	naproxen
Clindamycin	clindamycin
Benzamycin	erythromycin
ShopRite Ibuprofen IB	ibuprofen
amlodipine besylate and atorvastatin calcium	atorvastatin
health mart childrens ibuprofen	ibuprofen
Value PharmaPain Reliever	aspirin
CONCERTA	methylphenidate
Peptic Relief	bismuth subsalicylate
Carisoprodol, Aspirin and Codeine Phosphate	aspirin
PIRMELLA 1/35	ethinyl estradiol
COREGCR	carvedilol
Theraproxen	naproxen
A-HYDROCORT	hydrocortisone
Regonol	pyridostigmine
Octreotide acetate	octreotide
Acetazolamide	acetazolamide
Hydrocodone Bitartrate and Ibuprofen	ibuprofen
Oxycodone hydrochloride and Ibuprofen	ibuprofen
Bupropion Hydrocloride	bupropion
NEOMYCIN AND POLYMYXIN B SULFATES AND HYDROCORTISONE	hydrocortisone
PRIMIDONE	primidone
Cortisone Cream	hydrocortisone
Microgestin	ethinyl estradiol
Cipro	ciprofloxacin
Cipro	hydrocortisone
Walgreens	hydrocortisone
FixMySkin Healing Balm Vanilla Flavor	hydrocortisone
Syeda	ethinyl estradiol
NABUMETONE	nabumetone
SHOPKO HYDROCORTISONE WITH ALOE	hydrocortisone
health mart naproxen sodium	naproxen
ADVIL	ibuprofen
Gildagia	ethinyl estradiol
Bupropion HydrochlorideXL	bupropion
Norethindrone and Ethinyl Estradiol and Ferrous Fumarate	ethinyl estradiol
DILT-CD	diltiazem
Acella Hydrocortisone Acetate - Pramoxine Singles	hydrocortisone
Triple Antibiotic HC	hydrocortisone
BUPROPION HYDROCHLORIDE	bupropion
Lamisil AT	terbinafine
Fluoxetine HCl	fluoxetine
modafinil	modafinil
Healthy Accents Ibuprofen	ibuprofen
Leader migraine formula	aspirin
Clindamycin hydrochloride	clindamycin
up and up childrens ibuprofen	ibuprofen
Neoral	cyclosporine
simply right naproxen sodium	naproxen
Sunmark aspirin	aspirin
Tacrolimus	tacrolimus
wal profen cold and sinus	ibuprofen
Health Mart Pharmacy Hydrocortisone	hydrocortisone
good neighbor pharmacy omeprazole	omeprazole
dg health aspirin	aspirin
1 hydrocortisone	hydrocortisone
Quillivant	methylphenidate
St. Joseph Chewable Aspirin	aspirin
Cleocin Phosphate	clindamycin
care one ibuprofen	ibuprofen
CLINDAMYCIN HYDROCHLORIDE	clindamycin
Esgic	butalbital
PediaCare Infants	ibuprofen
CAREALL Naproxen	naproxen
MiCort-HC	hydrocortisone
Cortizone 10 Intensive Healing for Eczema	hydrocortisone
Headache Relief Extra Strength	aspirin
Ibuprofen and Diphenhydramine Citrate	ibuprofen
Hydrocortisone Plus	hydrocortisone
Moore Medical LLC Ibuprofen	ibuprofen
Solaraze	diclofenac
CHILDRENS ADVIL	ibuprofen
Good Sense Aspirin	aspirin
Cortizone 10 Cooling Relief	hydrocortisone
Safyral	ethinyl estradiol
Glyburide (micronized) and Metformin Hydrochloride	glibenclamide
Sunmark ibuprofen cold and sinus	ibuprofen
Cortizone 10 Hydratensive Healing Anti Itch	hydrocortisone
MINIPRIN	aspirin
Poli-A	hydrocortisone
Micro-Coated Aspirin	aspirin
dg health all day pain relief	naproxen
Premier Value	hydrocortisone
ERYC	erythromycin
FIRST Dukes Mouthwash Compounding	hydrocortisone
LEVONEST	ethinyl estradiol
kirkland signature hydrocortisone plus	hydrocortisone
Ursodiol	ursodeoxycholic acid
GENUINE FIRST AID Emergency Preparedness  Contains 167 Pieces	aspirin
GIANVI	ethinyl estradiol
ZOCOR	simvastatin
Clindacin P	clindamycin
Xerese	hydrocortisone
Low Dose Chewable Aspirin	aspirin
DROSPIRENONE AND ETHINYL ESTRADIOL	ethinyl estradiol
Amphotericin B	amphotericin b
rexall anti itch	hydrocortisone
Yasmin	ethinyl estradiol
NOXAFIL	posaconazole
Topcare Ibuprofen	ibuprofen
Trandolapril and Verapamil Hydrochloride	verapamil
Dr. Sheffield Hydrocortisone Anti itch	hydrocortisone
omeprazole/sodium bicarbonate	omeprazole
rx act all day pain relief	naproxen
Pandel	hydrocortisone
Junel 1.5/30	ethinyl estradiol
Alcortin A	hydrocortisone
Zorvolex	diclofenac
SAFEWAY	hydrocortisone
RIFATER	rifampin
RIFATER	pyrazinamide
berkley and jensen ibuprofen	ibuprofen
PediaCare Childrens	ibuprofen
Hydrocortisone anti-itch plus	hydrocortisone
DICLOFENAC SODIUM	diclofenac
OXCARBAZEPINE	oxcarbazepine
ConRx pain Reliever	aspirin
leader omeprazole	omeprazole
good neighbor pharmacy aspirin	aspirin
OCUFEN	flurbiprofen
sunmark ibuprofen ib	ibuprofen
Renvela	sevelamer
NECON 1/35	ethinyl estradiol
Adult Low strength Aspirin	aspirin
Neosporin Eczema Essentials	hydrocortisone
Trivora	ethinyl estradiol
SohMed Pain Reliever	aspirin
Nefazodone hydrochloride	nefazodone
Quadrydern	hydrocortisone
Diltiazem HydrochlorideExtended Release	diltiazem
IBUDONE	ibuprofen
smart sense naproxen sodium	naproxen
Orsythia	ethinyl estradiol
Ibuprofen (NSAID) Pain Reliever/Fever Reducer	ibuprofen
FLUCONAZOLE	fluconazole
Naproxen	naproxen
Clindamycin Palmitate Hydrochloride	clindamycin
Hecoria	tacrolimus
Prograf	tacrolimus
Chloroquine	chloroquine
Sunmark Aspirin	aspirin
good neighbor pharmacy migraine relief	aspirin
Mycobutin	rifabutin
Easy Care First Aid - All Purpose	ibuprofen
Peganone	ethotoin
Hydrocortisone Valerate	hydrocortisone
Norgestrel/Ethinyl Estradiol	ethinyl estradiol
Antibiotic Ear (Neo/Polym/HC)	hydrocortisone
APRI	ethinyl estradiol
Verapamil Hydrochloride	verapamil
Caldecort	hydrocortisone
Health Mart Ibuprofen IB	ibuprofen
Stanback	aspirin
BUFFERIN	aspirin
INDOMETHACIN ER	indomethacin
Scalpicin	hydrocortisone
PHENYTOIN	phenytoin
Alagesic	butalbital
FOSCAVIR	foscarnet
GENGRAF	cyclosporine
procure	hydrocortisone
Terbinex	terbinafine
up and up ibuprofen pm	ibuprofen
Chloromycetin	chloramphenicol
Headache Relief to Go	aspirin
smart health aspirin	aspirin
Effervescent Antacid and Pain Relief	aspirin
Oxcarbazepine	oxcarbazepine
Ketoconazole	ketoconazole
Pepbis	bismuth subsalicylate
DG Health Ibuprofen	ibuprofen
Indocin	indomethacin
Regular Strength Buffered Aspirin	aspirin
Nifedipine	nifedipine
Ogestrel 0.5/50	ethinyl estradiol
Forfivo	bupropion
Lutera	ethinyl estradiol
Itraconazole	itraconazole
Care One migraine relief	aspirin
Necon 777	ethinyl estradiol
Good Neighbor Pharmacy Sinus and Cold D	naproxen
Xenical	orlistat
Anusol	hydrocortisone
Sentroxatine	fluoxetine
Naproxen Sodium (NSAID)	naproxen
Hydrocortisone Acetate	hydrocortisone
MEDIQUE I-PRIN	ibuprofen
rx act ibuprofen	ibuprofen
CIPROFLOXACIN HYDROCHLORIDE	ciprofloxacin
Thera	hydrocortisone
Cardizem CD	diltiazem
BRIELLYN	ethinyl estradiol
Fioricet with Codeine	butalbital
glimepiride	glimepiride
Berkley and Jensen Omeprazole	omeprazole
REPREXAIN	ibuprofen
Pyrazinamide	pyrazinamide
Critical Care Aspirin to Go	aspirin
OVCON 35	ethinyl estradiol
care one ibuprofen ib	ibuprofen
Genuine Aspirin	aspirin
Pravastatin sodium	pravastatin
Conney Ibuprofen	ibuprofen
Quality Choice	hydrocortisone
BAYER	aspirin
Pain Stoppers Regular	aspirin
PIROXICAM	piroxicam
GFA First Aid	aspirin
GFA First Aid	ibuprofen
Amiodarone hydrochloride	amiodarone
Rexall All Day Pain Relief	naproxen
Butalbital, Aspirin, and Caffeine	butalbital
Butalbital, Aspirin, and Caffeine	aspirin
HYDROCORTISONE ACETATE	hydrocortisone
All Day Sinus and Cold D	naproxen
Nalfon	fenoprofen
OXTELLAR XR	oxcarbazepine
Clindamycin Phosphate and Benzoyl Peroxide	clindamycin
dg health Ibuprofen pm	ibuprofen
Kaletra	ritonavir
itraconazole	itraconazole
leader ibuprofen	ibuprofen
ENSKYCE	ethinyl estradiol
Zenchent	ethinyl estradiol
Methylphenidate Hydrochloride	methylphenidate
Good Sense aspirin	aspirin
Goodys Back and Body Pain	aspirin
COLESTIPOL HYDROCHLORIDE	colestipol
members mark hydrocortisone	hydrocortisone
healthy accents ibuprofen pm	ibuprofen
methylphenidate hcl	methylphenidate
kirkland signature ibuprofen	ibuprofen
topcare childrens ibuprofen	ibuprofen
SHOPKO HYDROCORTISONE	hydrocortisone
dg health ibuprofen	ibuprofen
Glipizide and Metformin HCl	glipizide
Colestipol Hydrochloride	colestipol
Rifater	rifampin
Rifater	pyrazinamide
Grifulvin V	griseofulvin
equaline ibuprofen pm	ibuprofen
Sinus and Cold D	naproxen
Xolegel	ketoconazole
Pain Stopper Extra	aspirin
Cleocin Pediatric	clindamycin
Glyburide-Metformin Hydrochloride	glibenclamide
junior strength ibuprofen	ibuprofen
Premier Value Infants Ibuprofen	ibuprofen
SSD	sulfadiazine
Athletes Foot	terbinafine
Topcare Sinus and Cold D	naproxen
Comfort Pac with Naproxen	naproxen
Regular Strength Pain Relief	aspirin
Publix	hydrocortisone
Hydrocortisone Maximum Strength	hydrocortisone
Hydrocortisone Acetate Pramoxine Hcl	hydrocortisone
Good Neighbor Pharmacy naproxen sodium	naproxen
Good Neighbor Pharmacy Ibuprofen	ibuprofen
Topcare Ibuprofen PM	ibuprofen
Budeprion	bupropion
Ready America First Aid Pocket - 33 Pieces	aspirin
Ready America First Aid Pocket - 33 Pieces	ibuprofen
Adalat CC	nifedipine
Healthy Accents ibuprofen	ibuprofen
Extra Strength Headache Formula	aspirin
Levonorgestrel and Ethinyl Estradiol	ethinyl estradiol
methylphenidate hydrochloride CD	methylphenidate
NIFEDIPINE	nifedipine
Loestrin 24 Fe	ethinyl estradiol
CLINDAMYCIN	clindamycin
GENERESS Fe	ethinyl estradiol
Duetact	glimepiride
Zarah	ethinyl estradiol
Good Neighbor Pharmacy Childrens Ibuprofen Cold	ibuprofen
Lansoprazole Amoxicillin Clarithromycin	clarithromycin
careone ibuprofen pm	ibuprofen
EXAPRIN	aspirin
fosphenytoin sodium	phenytoin
DIGOXIN	digoxin
Micronase	glibenclamide
Rapamune	sirolimus
Bioelements	hydrocortisone
CARVEDILOL	carvedilol
REPAGLINIDE	repaglinide
Melphalan Hydrochloride	melphalan
Fiorinal with Codeine	butalbital
Fiorinal with Codeine	aspirin
DUEXIS	ibuprofen
Ascomp with Codeine	butalbital
Ascomp with Codeine	aspirin
Sulfamethoxazole and Trimethoprim	sulfamethoxazole
Maximum Strength Hydrocortisone	hydrocortisone
EXCEDRIN	aspirin
hydrocortisone	hydrocortisone
rifampin	rifampin
Topcare ibuprofen	ibuprofen
PRAVASTATIN SODIUM	pravastatin
Ciprofloxacin Otic	ciprofloxacin
Goodys PM Pain Reliever	aspirin
Motrin	ibuprofen
ARC Emergency Preparedness FIRST AID Contains 202 PIECES	aspirin
Medique Mediproxen	naproxen
Thermazene	sulfadiazine
Ecotrin Regular Strength	aspirin
Terbinafine Hydrochloride	terbinafine
Cardene	nicardipine
Caduet	atorvastatin
Good Neighbor Pharmacy Childrens Ibuprofen	ibuprofen
Econochlor	chloramphenicol
Up and Up anti itch	hydrocortisone
ibuprofen	ibuprofen
Zee Aspirin	aspirin
health mart ibuprofen	ibuprofen
Chewable Adult Low Dose Aspirin	aspirin
equaline childrens ibuprofen oral suspension	ibuprofen
Low Dose Aspirin	aspirin
clarithromycin	clarithromycin
Texacort	hydrocortisone
careone naproxen sodium	naproxen
SULFAMETHOXAZOLE and TRIMETHOPRIM	sulfamethoxazole
RESTASIS	cyclosporine
Alka-Seltzer Plus	aspirin
Safety Coated Enteric Aspirin	aspirin
rexall ibuprofen	ibuprofen
lovastatin	lovastatin
Easy Care First Aid Kit - Sports and Travel	ibuprofen
SALSALATE	salsalate
NifedicalXL	nifedipine
CILOXAN	ciprofloxacin
BC Cherry	aspirin
Care One headache relief	aspirin
Advil Allergy and Congestion Relief	ibuprofen
ADVIL PM	ibuprofen
KAISER PERMANENTE	hydrocortisone
KAISER PERMANENTE	terbinafine
leader headache formula	aspirin
equaline omeprazole	omeprazole
Atopalm Maximum Strength Anti-Itch	hydrocortisone
DOLEX	ibuprofen
up and up childrens ibuprofen oral suspension	ibuprofen
URSODIOL	ursodeoxycholic acid
Good Neighbor Pharmacy Emergency Preparedness and First Aid Contains 167 Pieces	aspirin
Sulindac	sulindac
Oxycodone Hydrochloride and Aspirin	aspirin
Concentrated Ibuprofen	ibuprofen
Cortizone 10 Easy Relief	hydrocortisone
LESCOL XL	fluvastatin
Smart Sense ibuprofen	ibuprofen
Crestor	rosuvastatin
Pamprin Max Menstrual Pain Relief	aspirin
Metadate CD	methylphenidate
Adult Low Dose Aspirin	aspirin
rexall all day pain relief	naproxen
Emoquette	ethinyl estradiol
rexall hydrocortisone 1	hydrocortisone
Amlodipine besylate/atorvastatin calcium	atorvastatin
AzaSite	azithromycin
Dermasorb AF Complete Kit	hydrocortisone
piroxicam	piroxicam
TopCare	hydrocortisone
Butalbital, Acetaminophen, Caffeine, and Codeine Phosphate	butalbital
Leader All Day Pain Relief	naproxen
PENNSAID	diclofenac
Ibuprofen softgels	ibuprofen
Hydrocodone bitartrate and ibuprofen	ibuprofen
sunmark aspirin	aspirin
Voriconazole	voriconazole
TopCare Ibuprofen	ibuprofen
Nortrel 7/7/7	ethinyl estradiol
Vimovo	naproxen
NEOMYCIN and POLYMYXIN B SULFATES and HYDROCORTISONE	hydrocortisone
Green Pea	troleandomycin
Chewable Low Dose Aspirin	aspirin
infants ibuprofen	ibuprofen
Ciprofloxacin and Dextrose	ciprofloxacin
butalbital, acetaminophen and caffeine	butalbital
BUPAP	butalbital
BioElectro Day	aspirin
Octreotide	octreotide
Care One ibuprofen	ibuprofen
Family Wellness Naproxen Sodium	naproxen
Amethia	ethinyl estradiol
Rx Act Ibuprofen	ibuprofen
up and up anti itch	hydrocortisone
Prostigmin	neostigmine
Henry Schein Aspirin	aspirin
Henry Schein Ibuprofen	ibuprofen
Margesic	butalbital
Scarguard MD Physicians Formula	hydrocortisone
Pramosone E	hydrocortisone
GLIMEPIRIDE	glimepiride
DILTIAZEM HYDROCHLORIDE	diltiazem
TABCIN	aspirin
ECOTRIN	aspirin
Glipizide	glipizide
PRIMAXIN	imipenem
PRIMAXIN	cilastatin
Berkley and Jensen Hydrocortisone	hydrocortisone
Yaz	ethinyl estradiol
equaline ibuprofen cold and sinus	ibuprofen
warfarin sodium	warfarin
Advanced Hydrocortisone	hydrocortisone
Ibuprofen 200	ibuprofen
smart sense anti itch	hydrocortisone
Reprexain	ibuprofen
PhysiciansCare Ibuprofen	ibuprofen
Antifungal	terbinafine
Symbyax	fluoxetine
Gaboxetine	fluoxetine
CALAN	verapamil
NEFAZODONE HYDROCHLORIDE	nefazodone
CORTEF	hydrocortisone
PYRIDOSTIGMINE BROMIDE	pyridostigmine
BAMBOO SALT  Eunganggo Jook Yeom Toothpaste	ursodeoxycholic acid
Ticlopidine hydrochloride	ticlopidine
Up and Up Anti Itch	hydrocortisone
BackAid	aspirin
CRIXIVAN	indinavir
Ibuprofen (NSAID)	ibuprofen
Bufferin	aspirin
Diamox Sequels	acetazolamide
VIORELE	ethinyl estradiol
Childrens Aspirin	aspirin
EC-81Aspirin	aspirin
Ibuprofen IB	ibuprofen
AMPHOTEC	amphotericin b
Aspirin	aspirin
Synalgos	aspirin
Terbinafine Hydochloride	terbinafine
Tri-Norinyl	ethinyl estradiol
profen IB	ibuprofen
good sense migraine formula	aspirin
KARIVA	ethinyl estradiol
Anti itch	hydrocortisone
micronized glyburide	glibenclamide
Aspirin Chewable	aspirin
Formu Care pain reliever	aspirin
PIMTREA	ethinyl estradiol
Cardizem	diltiazem
chewable	bismuth subsalicylate
ELINEST	ethinyl estradiol
25 Person ANSI	aspirin
25 Person ANSI	ibuprofen
Family Wellness Migraine Relief	aspirin
Effervescent Cold Relief	aspirin
FLURBIPROFEN	flurbiprofen
Fluvastatin	fluvastatin
Fiorinal	butalbital
Fiorinal	aspirin
Tri-Legest Fe	ethinyl estradiol
Neostigmine Methylsulfate	neostigmine
Clear Choice Ibuprofen	ibuprofen
Glucotrol XL	glipizide
headache formula	aspirin
KERA HC Hydrocortisone	hydrocortisone
Diclofenac Potassium	diclofenac
Verelan	verapamil
Simcor	simvastatin
exchange select omeprazole	omeprazole
Sulfadiazine	sulfadiazine
Pyridostigmine Bromide	pyridostigmine
GILDESS FE 1/20	ethinyl estradiol
Flurbiprofen Sodium	flurbiprofen
CYCLOSPORINE	cyclosporine
CVS Pharmacy Ibuprofen	ibuprofen
Proctocort	hydrocortisone
pravastatin sodium	pravastatin
Sirolimus	sirolimus
Ticlopidine Hydrochloride	ticlopidine
Nifedical	nifedipine
ACETAMINOPHEN, BUTALBITAL AND CAFFEINE	butalbital
Family Wellness Hydrocortisone	hydrocortisone
Fioricet	butalbital
PERCODAN	aspirin
VANOXIDE	hydrocortisone
Healerz for Itches	hydrocortisone
Etodolac	etodolac
Brevital Sodium	methohexital
Aplenzin	bupropion
PANDEL	hydrocortisone
sunmark ibuprofen pm	ibuprofen
Good Sense Stomach Relief	bismuth subsalicylate
Bupropion Hydrochloride (SR)	bupropion
Atorvastatin Calcium	atorvastatin
Urso 250	ursodeoxycholic acid
FIRST AID Contains 404 PIECES	aspirin
CounterAct	ibuprofen
Alyacen 1/35	ethinyl estradiol
Help I Have an Aching Body	ibuprofen
Neomycin, Polymyxin B Sulfates and Hydrocortisone	hydrocortisone
Fluconazole	fluconazole
Dg Health Ibuprofen	ibuprofen
Uncoated Aspirin	aspirin
Diclofenac Sodium and Misoprostol	diclofenac
Pravastatin Sodium	pravastatin
anti itch	hydrocortisone
sunmark all day relief	naproxen
Azurette	ethinyl estradiol
Hydrocortisone Maximum Strength with Aloe	hydrocortisone
Invirase	saquinavir
Gianvi	ethinyl estradiol
formu care ibuprofen	ibuprofen
VELTIN	clindamycin
Advicor	lovastatin
verapamil hydrochloride	verapamil
babies r us infants ibuprofen	ibuprofen
Bayer Genuine Aspirin	aspirin
CHOLESTYRAMINE	cholestyramine
Anacin	aspirin
Silver Sulfadiazine	sulfadiazine
Protopic	tacrolimus
good neighbor pharmacy ibuprofen pm	ibuprofen
Prevalite	cholestyramine
sunmark ibuprofen	ibuprofen
CHILDRENS ADVIL COLD	ibuprofen
MERIDIA	sibutramine
Norvir	ritonavir
formu care omeprazole	omeprazole
Low Dose Adult Aspirin	aspirin
Headache relief	aspirin
COREG	carvedilol
Leader ibuprofen	ibuprofen
Topcare Childrens Ibuprofen	ibuprofen
ZYLOPRIM	allopurinol
childrens ibuprofen oral suspension	ibuprofen
Lipitor	atorvastatin
Zonisamide	diltiazem
childrens ibuprofen	ibuprofen
cholestyramine light	cholestyramine
Picot Plus	aspirin
Azithromycin	azithromycin
Medi-Cortisone	hydrocortisone
TIAZAC	diltiazem
Aranelle	ethinyl estradiol
simply right ibuprofen	ibuprofen
NuvaRing	ethinyl estradiol
all day pain relief	naproxen
Procto-Pak	hydrocortisone
Value Pharma	aspirin
WELLBUTRIN	bupropion
Naproxen Pain Relief	naproxen
Extra Strength Headache Relief	aspirin
PROPAFENONE HYDROCHLORIDE	propafenone
Up and Up anti itch ointment	hydrocortisone
Cyclafem 1/35	ethinyl estradiol
Clinda-Derm	clindamycin
ShopRite Migraine Formula	aspirin
Ascriptin	aspirin
Ready America First Aid Outdoor- 107 Pieces	aspirin
Ready America First Aid Outdoor- 107 Pieces	ibuprofen
Vyfemla	ethinyl estradiol
Akne-mycin	erythromycin
SSD Cream	sulfadiazine
HYDROCORTISONE	hydrocortisone
Extra Strength Pain Relief	aspirin
Chloramphenicol Sodium Succinate	chloramphenicol
equate stomach relief	bismuth subsalicylate
Fulton Street Market Anti itch	hydrocortisone
VERELAN PM	verapamil
Gris-PEG	griseofulvin
Smart Sense Aspirin	aspirin
ILOTYCIN	erythromycin
Gadaderm Hydrocortisone	hydrocortisone
ETODOLAC	etodolac
aspirin regular strength	aspirin
Lo Loestrin Fe	ethinyl estradiol
Clarithromycin Extended Release	clarithromycin
Vestura	ethinyl estradiol
Otrexup	methotrexate
LIPTRUZET	atorvastatin
LIPTRUZET	ezetimibe
bioCorneum HC Advanced Scar Supervision Anti-Itch	hydrocortisone
Levonorgestrel and Ethinyl Estradiol and Ethinyl Estradiol	ethinyl estradiol
Good Neighbor Pharmacy aspirin	aspirin
DUAC	clindamycin
sunmark stomach relief	bismuth subsalicylate
LEADER HYDROCORTISONE WITH ALOE	hydrocortisone
Scarguard MD	hydrocortisone
Matzim LA	diltiazem
Hydrocortisone Acetate and Pramoxine Hydrochloride	hydrocortisone
Green Guard Pain and Ache Relief	aspirin
Ibuprofen and Diphenhydramine HCl	ibuprofen
Equetro	carbamazepine
Chewable Aspirin	aspirin
GlyBURIDE	glibenclamide
Butalbital, aspirin, and caffeine	butalbital
Butalbital, aspirin, and caffeine	aspirin
Belladonna Alkaloids with Phenobartbital	phenobarbital
ADVENTURE MEDICAL KITS 1-2 PERSON NATIONAL SKI PATROL FIRST AID	aspirin
ADVENTURE MEDICAL KITS 1-2 PERSON NATIONAL SKI PATROL FIRST AID	ibuprofen
PROVIGIL	modafinil
Apres Peel Soothing Balm	hydrocortisone
Alka-Seltzer XTRA STRENGTH	aspirin
Aspirin EC	aspirin
Ketoprofen	ketoprofen
Vicoprofen	ibuprofen
Midodrine Hydrochloride	midodrine
Proctozone	hydrocortisone
azithromycin	azithromycin
care one all day pain relief	naproxen
Fulton Street Market Naproxen Sodium	naproxen
Minastrin 24 Fe	ethinyl estradiol
Direct Safety Aspirin	aspirin
Migralex	aspirin
Scalpicin Scalp Itch Medication Maximum Strength	hydrocortisone
terbinafine hydrochloride	terbinafine
Locoid	hydrocortisone
Allopurinol	allopurinol
DermaCort	hydrocortisone
Junel 1/20	ethinyl estradiol
Pediaderm HC	hydrocortisone
Naproxen Delayed-release	naproxen
Synercid	quinupristin
Zipsor	diclofenac
Anti Itch	hydrocortisone
Simply Right Omeprazole	omeprazole
ibuprofen cold and sinus	ibuprofen
Omeprazole	omeprazole
MooreBrand Ibuprofen	ibuprofen
DILTZAC	diltiazem
Care One Ibuprofen PM	ibuprofen
ARC FIRST AID Contains 101 PIECES Hardcase	aspirin
ciprofloxacin	ciprofloxacin
CLEOCIN PHOSPHATE	clindamycin
ibuprofen cold	ibuprofen
Cleocin	clindamycin
Clindamax	clindamycin
Cataflam	diclofenac
PINK BISMUTH	bismuth subsalicylate
Loryna	ethinyl estradiol
Equaline Aspirin	aspirin
Rite Aid	hydrocortisone
Ciprofloxacin	ciprofloxacin
rx act stomach relief	bismuth subsalicylate
VYTORIN	simvastatin
VYTORIN	ezetimibe
buPROPion Hydrochloride	bupropion
ASTAGRAF XL	tacrolimus
Carbatrol	carbamazepine
Introvale	ethinyl estradiol
up and up cold and sinus	ibuprofen
FIRST Marys Mouthwash Compounding	hydrocortisone
Junel Fe 1.5/30	ethinyl estradiol
Fluoxetine	fluoxetine
Glytone soothe calming	hydrocortisone
Childrens MOTRIN	ibuprofen
NAPROXEN SODIUM	naproxen
Topcare Naproxen Sodium	naproxen
Sunmark ibuprofen ib	ibuprofen
smart sense ibuprofen	ibuprofen
Fulton Street Market Omeprazole	omeprazole
voriconazole	voriconazole
Nexterone	amiodarone
Rodan and Fields	hydrocortisone
Appbutamone	bupropion
Bupropion	bupropion
CVS Pharmacy	terbinafine
Lo/Ovral-28	ethinyl estradiol
Up and Up Naproxen Sodium	naproxen
APLENZIN	bupropion
REYATAZ	atazanavir
Pain Relief Aspirin	aspirin
Infants Ibuprofen	ibuprofen
Stomach Relief	bismuth subsalicylate
Orphenadrine Citrate, Aspirin and Caffeine	aspirin
Hydro Skin	hydrocortisone
ASPIRIN LOW DOSE CHEWABLE	aspirin
NuCort	hydrocortisone
dg health headache relief	aspirin
Clindamycin Palmitate Hydrochloride (Pediatric)	clindamycin
Trepoxen-250	naproxen
Fulton Street Market Ibuprofen	ibuprofen
Erythrocin Lactobionate	erythromycin
Rifamate	rifampin
Silver Sulfadiazene	sulfadiazine
CamreseLo	ethinyl estradiol
Smart Sense naproxen sodium	naproxen
FIRST AID Contains 303 PIECES HARDCASE	aspirin
Excedrin Extra Strength	aspirin
MONO-LINYAH	ethinyl estradiol
Family Wellness Omeprazole	omeprazole
Lodine	etodolac
butalbital and acetaminophen	butalbital
BudPak Anti-Itch	hydrocortisone
EXTINA	ketoconazole
LESCOL	fluvastatin
LARIN 1/20	ethinyl estradiol
AMARYL	glimepiride
CETRAXAL	ciprofloxacin
CLINDAMYCIN PHOSPHATE	clindamycin
Pain Reliever Added Strength	aspirin
HydroCortisone	hydrocortisone
Tencon	butalbital
Naprosyn	naproxen
Pain Relief	naproxen
Pain Relief	ibuprofen
CVS Aspirin	aspirin
Ritalin	methylphenidate
up and up naproxen sodium	naproxen
FIRST AID  Contains 101 PIECES	aspirin
BIO-CORNEUM HC Advanced Scar Supervision Anti-Itch	hydrocortisone
\.


--
-- Data for Name: related_condition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.related_condition (trial_id, condition_id) FROM stdin;
34	1
30	2
73	3
41	4
103	5
122	6
103	7
69	8
94	9
41	10
58	11
116	12
20	12
15	12
35	13
111	13
94	13
62	13
16	13
118	14
89	14
90	14
89	15
33	16
4	17
61	18
8	19
41	20
81	21
7	22
17	23
54	24
111	25
123	25
38	26
49	27
119	28
2	29
57	30
97	31
101	32
108	33
119	34
121	35
23	36
45	37
4	38
123	39
119	40
107	41
34	42
103	43
29	44
97	45
123	45
44	46
74	47
93	48
99	49
16	50
120	51
5	52
36	53
60	54
50	55
99	56
30	57
84	58
115	59
75	60
75	60
101	61
77	62
77	62
40	63
129	64
115	64
108	64
5	65
111	66
27	67
53	68
111	68
64	68
34	68
92	68
83	68
64	69
107	70
67	71
42	72
121	72
46	73
131	74
110	75
100	76
41	77
112	78
44	78
128	78
43	78
100	79
103	80
1	81
12	82
12	82
111	83
16	83
63	84
48	85
69	86
102	87
18	88
127	89
61	90
21	91
130	92
131	93
90	94
125	95
125	96
125	97
80	98
126	99
49	99
108	99
24	99
8	99
19	100
106	101
109	102
59	102
22	102
91	102
28	103
98	104
126	105
49	105
108	105
71	105
71	105
25	105
95	105
95	105
108	106
83	107
38	108
104	108
3	109
66	110
65	111
65	112
12	112
12	112
126	113
108	113
93	114
93	115
86	116
86	116
126	117
108	117
108	118
131	119
90	119
10	120
88	121
49	122
6	122
33	123
37	124
132	125
117	126
117	127
79	128
47	129
86	129
86	129
56	130
56	131
5	132
123	133
68	134
63	135
124	136
103	137
18	138
126	139
47	140
127	140
61	141
52	142
19	143
85	144
114	145
9	146
49	147
113	147
70	148
70	149
102	149
126	150
11	151
69	152
39	153
39	154
32	155
30	156
30	157
111	158
129	159
117	160
117	161
38	162
124	162
55	162
131	162
105	163
82	164
14	165
39	166
26	166
98	167
92	168
51	169
43	170
38	171
43	172
31	173
86	174
86	174
49	175
16	176
112	177
90	177
61	178
\.


--
-- Data for Name: researcher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.researcher (researcher_id, researcher_name, institution_name) FROM stdin;
1	Aaron Chen	Johns Hopkins University
2	Afshin Dowlati, MD	Case Comprehensive Cancer Center
3	Anindya Niyogi	Chelsea and Westminster NHS Foundation Trust
4	Arun Rajan, M.D.	National Institutes of Health Clinical Center (CC)
5	Babafemi Taiwo	Northwestern University
6	Beatriz Arismendi Gómez	Hospital Central Dr. Luis Ortega
7	Behnam Baghianimoghadam	Shahid Sadoughi University of Medical Sciences and Health Services
8	Benjamin Friedman	Montefiore Medical Center
9	Brandy Frost	NorthShore University HealthSystem Research Institute
10	CLAUDIA ALESSANDRA ECKLEY	Faculdade de Ciências Médicas da Santa Casa de São Paulo
11	Cal Cohen	Community Research Initiative of New England
12	Carol Wallace	Seattle Children's Hospital
13	Chi Chiu Mok	Tuen Mun Hospital
14	Christoph W. Kopp	Medical University of Vienna
15	Colin Sieff	Children's Hospital Boston
16	Daniel Benjamin	Duke University Medical Center
17	David Boulware	University of Minnesota - Clinical and Translational Science Institute
18	David Hasan	University of Iowa
19	Djillali Annane	University of Versailles
20	Dr. Peter Selby	Centre for Addiction and Mental Health
21	E. Steve Woodle	University of Cincinnati
22	Edward Ball	University of California, San Diego
23	Elliot Israel, MD	Brigham and Women's Hospital
24	Eloise Lemon	Akron Children's Hospital
25	Ercan OK	Ege University
26	Eric Strain, MD	Johns Hopkins University
27	Fran Aweeka	University of California, San Francisco
28	Franck Carbonnel	Centre Hospitalier Universitaire de Besancon
29	Frederic T Billings IV	Vanderbilt University
30	Gagan Joshi, MD	Massachusetts General Hospital
31	Gantt Galloway, PharmD	California Pacific Medical Center Research Institute
32	Gary Morrow	University of Rochester
32	Gary Morrow	University of Rochester
34	Gerald M Reaven	Stanford University
35	Ghada Bourjeily	Women and Infants Hospital of Rhode Island
36	Han Yaling, MD	Shenyang Northern Hospital
37	Hisashi Kai	Kurume University
38	Huub Gelderblom MD, PhD, MPH	Emory University
39	Jamie M. Zeitzer, Ph.D.	VA Palo Alto Health Care System
40	Jan W.K. van den Berg	Isala Klinieken
41	Jane Armitage	University of Oxford
42	Janet Novotny	USDA Beltsville Human Nutrition Research Center
43	Javier Maquirriain	Argentine Tennis Association
44	Jay B. Higgs, MD	Wilford Hall Medical Center
45	Jeffrey Zonder	Barbara Ann Karmanos Cancer Institute
46	Ji-youn Han	National Cancer Center, Korea
47	JiFei Tang	Wenzhou Medical University
48	Jim McAuley	The Ohio State University
49	Joan	Manhattan Eye, Ear & Throat Hospital
50	Johanna Savilampi	University Hospital Orebro
51	John K. DiBaise	Mayo Clinic
52	Joshua A. Beckman, MD	Brigham and Women's Hospital
53	Joy Schmitz	The University of Texas Health Science Center, Houston
54	Julie M Vose, MD	University of Nebraska
54	Julie M Vose, MD	University of Nebraska
56	Karl Winkler	University Hospital Freiburg
57	Karsten Overgaard	Herlev Hospital
58	Kathleen Colleran	University of New Mexico
59	Kittipong Maneechotesuwan	Mahidol University
60	Kristin A. Jones	Mercy Facial Plastic Surgery Center
61	Kristin Baird, M.D.	National Institutes of Health Clinical Center (CC)
62	Kwang Kon Koh	Gachon University Gil Medical Center
63	Laura R. Ment	Yale University
64	Lawrence Lum	Barbara Ann Karmanos Cancer Institute
65	Lewis B. Silverman, M.D.	Dana-Farber Cancer Institute
66	Linda Ward	Oxford University Hospitals NHS Trust
67	Mark Metersky	University of Connecticut Health Center
68	Mark W. Kieran, MD, PhD	Dana-Farber Cancer Institute
69	Marney A. White	Yale University
70	Martin Schrappe	University of Schleswig-Holstein
71	Matthias Schwab	University Hospital Tuebingen
71	Matthias Schwab	Dr. Margarete Fischer-Bosch-Institut für Klinische Pharmakologie (IKP) am Robert-Bosch-Krankenhaus (RBK)
73	Mehmet Sofuoglu	Yale University
74	Michael Hoelscher	Ludwig-Maximilians - University of Munich
75	Michael Miller	University of Maryland
76	Michael Minzenberg, MD	University of California, Davis
77	Mr PJ Kirkpatrick	Cambridge University Hospitals NHS Foundation Trust
78	Muneer Abidi	Barbara Ann Karmanos Cancer Institute
79	Naoki Inui	Hamamatsu University
80	Nikolaos Kadoglou	Aristotle University Of Thessaloniki
81	Oliver Cornely, MD	University of Cologne
82	Paul Bolin	East Carolina University
83	Peter C. Donovan	Maine Medical Center
84	Peter Gariti	University of Pennsylvania
85	Phillip Brian Smith	Duke University Medical Center
86	Prof.  Daniel Seidman	Sheba Medical Center
87	R. Brian Stevens, MD	University of Nebraska Medical Center
88	Randie Black-Schaffer MD	Spaulding Rehabilitation Hospital
89	Rita Alloway	University of Cincinnati
90	Robert Lowsky	Stanford University
91	Robert W. Buchanan, M.D.	University of Maryland
92	Ronald Go	Gundersen Lutheran Health System
93	Ronnie Guillet	University of Rochester
94	Roseli Shavitt	University of Sao Paulo
95	Sam Schulman	McMaster University
96	Sandeep Soni, M.D.	Nationwide Children's Hospital
97	Sara Varea	Fundació Clínic per la Recerca Biomèdica
98	Sasso Ferdinando Carlo	Second University of Naples
99	Shahriar Zehtabchi	State University of New York - Downstate Medical Center
100	Shinichi Oka, M.D.	International Medical Center of Japan
101	Shunichi Homma	Columbia University
102	Srividya Kidambi, MD	Medical College of Wisconsin
103	Stepani Bendel	Kuopio University Hospital
104	Steven K. Grinspoon, MD	Massachusetts General Hospital
105	Sung-Han Kim	Asan Medical Center
106	Susan Smyth	University of Kentucky
107	Tamara Horwich	University of California, Los Angeles
108	Ted Bader, MD	Bader, Ted, M.D.
109	Tessa Madden, MD	Washington University School of Medicine
110	Titta Joutsiniemi	Turku University Hospital
111	Tom Schepens, MD	University Hospital, Antwerp
112	V. Ram Peddi	California Pacific Medical Center Research Institute
113	Valeria Cavalcanti Rolla	Oswaldo Cruz Foundation
114	Vernon M. Chinchilli, PhD	Milton S. Hershey Medical Center
115	Vincent T. Ho, MD	Dana-Farber Cancer Institute
116	Voravit Ratanatharathorn	Barbara Ann Karmanos Cancer Institute
117	Walter Ageno	Università degli Studi dell'Insubria
118	Werner J. Heinz	Wuerzburg University Hospital
119	Wilhelm Grander, M.D.	University Teaching Hospital Hall in Tirol
120	Wu Jun	Nanjing Medical University
121	Xinfeng Liu	Jinling Hospital, China
122	Xue Qing Yu	Sun Yat-sen University
123	Zaid Al-Kadhimi	Barbara Ann Karmanos Cancer Institute
124	Zeruesenay Desta	Indiana University
125	alaa eldeen mahmoud ismail	Woman's Health University Hospital, Egypt
126	özgür yağan	T.C. ORDU ÜNİVERSİTESİ
\.


--
-- Data for Name: side_effect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.side_effect (side_effect_id, side_effect_name) FROM stdin;
1	abdomen enlarged
2	abdominal cramping
3	abdominal discomfort
4	abdominal distension
5	abdominal distress
6	abdominal pain
7	abdominal pain upper
8	abdominal swelling
9	abnormal bleeding
10	abnormal dreams
11	abnormal ecg
12	abnormal ejaculation
13	abnormal electroretinogram
14	abnormal gait
15	abnormal heart sounds
16	abnormal movements
17	abnormal pigmentation
18	abnormal platelets
19	abnormal rbc
20	abnormal stools
21	abnormal urine
22	abnormal vision
23	abnormal withdrawal bleeding
24	abnormality of accommodation
25	abscess
26	abuse
27	ache
28	acholia
29	acidosis
30	acne
31	acute allograft rejection
32	acute anaphylaxis
33	acute hepatitis
34	acute otitis media
35	acute renal failure
36	acute renal rejection
37	acute tubular necrosis
38	adenomas
39	adjuvant treatment
40	adrenal cortex insufficiency
41	adrenal insufficiency
42	adrenal suppression
43	adult respiratory distress syndrome
44	aggressive
45	aggressive reaction
46	agitation
47	agranulocytosis
48	akathisia
49	albuminuria
50	alcohol intolerance
51	alkalosis
52	allergic alveolitis
53	allergic myocarditis
54	allergy
55	alopecia
56	als
57	alveolitis
58	amblyopia
59	amenorrhea
60	amentia
61	aml
62	amnesia
63	amylase increased
64	anaemia nos aggravated
65	anaphylactic reaction
66	anaphylactoid reactions
67	anemia
68	anencephaly
69	angina
70	angioedema
71	anophthalmia
72	anorexia
73	anterior ischemic optic neuropathy
74	antibiotic treatment
75	antibody positive
76	anticoagulant treatment
77	antifungal therapy
78	anuria
79	anxiety
80	apathy
81	aphasia
82	aphthous stomatitis
83	aplastic anemia
84	apnea
85	application site reaction
86	arrhythmia
87	arterial occlusion
88	arterial thrombosis
89	arteriosclerotic heart disease
90	artery disorder
91	arthralgia
92	arthritis
93	arthropathy
94	ascites
95	aseptic meningitis
96	aspergillosis
97	aspiration
98	asthenia
99	asthma
100	asthma exacerbation
101	ataxia
102	atelectasis
103	atherosclerosis
104	atrial arrhythmia
105	atrial fibrillation
106	atrophy
107	atrophy of the tongue
108	attacks of gout
109	aura
110	autonomic dysfunction
111	autonomic nervous system disorders
112	av block
113	aversion
114	avitaminosis
115	azotemia
116	back pain
117	bacteremia
118	bacterial sinusitis
119	bad taste
120	basal cell carcinoma
121	bending
122	benign liver tumors
123	benign neoplasm
124	bezoar
125	bigeminy
126	biliary pain
127	bilirubinemia
128	bipolar disorder
129	bipolar i disorder
130	bitter taste
131	bladder pain
132	bleeding
133	bleeding time increased
134	blepharitis
135	blighted ovum
136	blister
137	bloating
138	blood and lymphatic system disorders
139	blood clot
140	blood creatinine increased
141	blood in stool
142	blood pressure increased
143	bloody diarrhea
144	blurred vision
145	bone disorders
146	bone marrow depression
147	bone pain
148	bradycardia
149	bradykinesia
150	brain edema
151	breast discharge
152	breast disorders
153	breast enlargement
154	breast fibroadenosis
155	breast malignant neoplasm
156	breast neoplasm
157	breast pain
158	breast tenderness
159	bronchiolitis
160	bronchiolitis obliterans
161	bronchiolitis obliterans organizing pneumonia
162	bronchitis
163	bronchospasm
164	buffalo hump
165	bullous eruptions
166	bullous impetigo
167	bullous rash
168	bundle branch block
169	burning sensation
170	bursitis
171	cachexia
172	candidemia
173	carcinogenicity
174	carcinoids
175	carcinoma
176	cardiac arrest
177	cardiomegaly
178	cardiomyopathy
179	cardiospasm
180	cardiovascular disorders
181	cataplexy
182	cataract
183	cellulitis
184	central obesity
185	cerebral edema
186	cerebral hemorrhage
187	cerebral infarct
188	cerebral ischemia
189	cerebral thrombosis
190	cerebral venous thrombosis
191	cerebrovascular accident
192	cervical ectropion
193	cervical erosion
194	cervicitis
195	changes in blood pressure
196	cheilitis
197	chest discomfort
198	chest pain
199	chest pain cardiac
200	chest sound abnormalities
201	chiari syndrome
202	chills
203	chills and fever
204	cholangitis
205	cholecystitis
206	cholelithiasis
207	cholestatic hepatitis
208	cholestatic jaundice
209	chorea
210	chromatopsia
211	chronic active hepatitis
212	chronic allograft nephropathy
213	chronic heart failure
214	chronic urticaria
215	circulatory depression
216	cirrhosis
217	clenching teeth
218	cmv infection
219	coagulation
220	coagulation disorder
221	cognitive dysfunction
222	cogwheel rigidity
223	colic
224	colitis
225	color blindness
226	color vision change
227	coma
228	common cold
229	confusion
230	congenital anomalies
231	congestive heart failure
232	conjunctival hemorrhage
233	conjunctival hyperemia
234	conjunctivitis
235	connective tissue disorders
236	constipation
237	contact dermatitis
238	convulsion
239	convulsions aggravated
240	convulsive seizures
241	copd
242	corneal opacity
243	coronary artery disorder
244	cough
245	cough increased
246	cpi
247	cramping
248	creatine phosphokinase increased
249	creatinine clearance decreased
250	creatinine increased
251	cryptococcosis
252	crystalluria
253	cutaneous vasculitis
254	cyanosis
255	cyst
256	cystic fibrosis
257	cystitis
258	cytomegaloviral pneumonia
259	deafness
260	death
261	death fetal
262	decreased consciousness
263	decreased creatinine
264	decreased electrolytes
265	decreased hematocrit
266	decreased hemoglobin
267	decreased kidney function
268	decreased male fertility
269	decreased plasma iron
270	decreased platelet
271	decreased wbc
272	decubitus ulcer
273	deep thrombophlebitis
274	deep venous thrombosis
275	dehydration
276	delayed healing
277	delirium
278	delusions
279	dental caries
280	dental pain
281	depersonalization
282	depressive reaction
283	dermatitis
284	dermatomyositis
285	dermatophytosis
286	device expulsion
287	diabetes
288	diabetes insipidus
289	diarrhea
290	diplopia
291	discoid lupus
292	discolored feces
293	discolored urine
294	discomfort
295	disease progression
296	disorders taste
297	disorientation
298	disseminated intravascular coagulation
299	distention
300	distress
301	diuresis
302	diverticulum
303	dizziness
304	drowsiness
305	drug abuse
306	drug dependence
307	drug eruption
308	drug fever
309	drug interaction
310	drug level altered
311	drug level increased
312	drunk
313	dry eye syndrome
314	dry eyes
315	dry mouth
316	dry skin
317	duodenal ulcer
318	duodenal ulcer perforation
319	duodenitis
320	dysarthria
321	dysautonomia
322	dysentery
323	dysesthesia
324	dysgeusia
325	dyslipidemia
326	dysmenorrhea
327	dysmetria
328	dyspepsia
329	dysphagia
330	dysphonia
331	dysphoria
332	dysplasia
333	dyspnea
334	dystonia
335	dystonic reactions
336	dysuria
337	ear disorder
338	ear infection
339	ear pain
340	ebv infection
341	ecchymosis
342	ectropion
343	eczema
344	eczema herpeticum
345	edema
346	edema gastrointestinal
347	eeg abnormal
348	effusion
349	elevated bilirubin
350	elevated liver function tests
351	elevated serum creatine phosphokinase
352	elevated transaminases
353	elevated triglycerides
354	embolism
355	embolism cerebral
356	embolus
357	emotional lability
358	empiric therapy
359	enanthema
360	encephalitis
361	encephalopathy
362	endocarditis
363	endometrial cancer
364	endometrial hyperplasia
365	endometriosis
366	enlargement
367	enteritis
368	enterocolitis
369	enzymatic abnormality
370	enzyme induction
371	eosinophilic pneumonia
372	eosinophilic pneumonitis
373	epidermal necrolysis
374	epidermal necrosis
375	epidermolysis
376	epidermolysis bullosa
377	epididymitis
378	epigastric distress
379	epigastric pain
380	epilepsy
381	epistaxis
382	eps
383	eructation
384	eruptions
385	erythema
386	erythema multiforme
387	erythema nodosum
388	erythematous rash
389	esophageal
390	esophageal candidiasis
391	esophageal spasm
392	esophageal stricture
393	esophageal ulceration
394	esophagitis
395	euphoric
396	exfoliative dermatitis
397	exophthalmos
398	extraocular palsy
399	extrapyramidal symptoms
400	extrapyramidal syndrome
401	extrasystoles
402	eye disorders
403	eye edema
404	eye hemorrhage
405	eye pain
406	eye swelling
407	facial edema
408	facial pain
409	facial paralysis
410	facial paresis
411	facial rash
412	falling down
413	familial hypercholesterolemia
414	fasting
415	fat redistribution
416	fatal outcome
417	fatigue
418	fecal incontinence
419	fecal occult blood positive
420	feeling abnormal
421	feeling drunk
422	feeling jittery
423	fertility
424	fever
425	fibrillation
426	fibrocystic breast
427	fibroids
428	fibrosis
429	fixed drug eruption
430	fixed eruption
431	flank pain
432	flatulence
433	flu
434	fluid overload
435	fluid retention
436	flushing
437	focal nodular hyperplasia
438	folliculitis
439	foreign body sensation
440	forgetfulness
441	ftc
442	fullness of gi
443	fulminant hepatitis
444	fundic gland polyps
445	fungal dermatitis
446	furunculosis
447	galactorrhea
448	gallbladder disease
449	gas
450	gastric disorder
451	gastric hypomotility
452	gastrin increased
453	gastritis
454	gastroenteritis
455	gastrointestinal anomaly
456	gastrointestinal bleeding
457	gastrointestinal disorders
458	gastrointestinal disturbance
459	gastrointestinal perforation
460	gastrointestinal reactions
461	gastrointestinal symptoms
462	generalized edema
463	generalized numbness
464	generalized seizures
465	generalized spasm
466	genital pruritus
467	geriatric
468	gestation
469	gestational diabetes
470	gi irritation
471	gingivitis
472	glomerulitis
473	glossitis
474	glucose tolerance decreased
475	glycosuria
476	goiter
477	gonococcal urethritis
478	gonorrhea
479	gout
480	graft failure
481	graft loss
482	graft versus host reaction
483	grand mal
484	granuloma
485	grimacing
486	gum disorder
487	gum hemorrhage
488	gum hyperplasia
489	gum hypertrophy
490	gynecomastia
491	hair disorder
492	halitosis
493	hallucination
494	hand swelling
495	hay fever
496	headache
497	hearing loss
498	heart block
499	heart disorder
500	heart failure
501	heartburn
502	heat intolerance
503	heat rash
504	hemangioma
505	hematemesis
506	hematologic disorders
507	hematological malignancy
508	hematoma
509	hematuria
510	hemianopia
511	hemiparesis
512	hemiplegia
513	hemoglobinuria
514	hemolysis
515	hemolytic anemia
516	hemolytic uremic syndrome
517	hemophilia
518	hemoptysis
519	hemorrhagic colitis
520	hemorrhagic cystitis
521	hemorrhagic eruption
522	hemorrhoids
523	hepatic adenomas
524	hepatic coma
525	hepatic dysfunction
526	hepatic encephalopathy
527	hepatic necrosis
528	hepatic porphyria
529	hepatitis
530	hepatitis b
531	hepatitis c
532	hepatitis c antibody positive
533	hepatobiliary disorders
534	hepatocellular damage
535	hepatoma
536	hepatomegaly
537	hepatorenal syndrome
538	hepatosplenomegaly
539	hernia
540	herpes
541	herpes simplex
542	herpes zoster
543	heterozygous familial hypercholesterolemia
544	hiccups
545	hirsutism
546	histoplasmosis
547	hiv disease
548	hiv positive
549	hoarseness
550	hormone level altered
551	hostility
552	hot flushes
553	hunger
554	hydronephrosis
555	hyperamylasemia
556	hypercalcemia
557	hypercholesterolemia
558	hyperemia
559	hyperesthesia
560	hyperglycemia
561	hyperhidrosis
562	hyperkalemia
563	hyperkinesia
564	hyperlipemia
565	hypermagnesemia
566	hypernatremia
567	hyperphosphatemia
568	hyperpigmentation
569	hyperplasia
570	hyperpnea
571	hyperprolactinemia
572	hyperpyrexia
573	hyperreflexia
574	hypersensitivity syndrome
575	hypersensitivity vasculitis
576	hypersomnia
577	hypertension
578	hyperthermia
579	hyperthyroidism
580	hypertonia
581	hypertrichosis
582	hyperuricemia
583	hyperventilation
584	hypesthesia
585	hypocalcemia
586	hypocholesterolemia
587	hypochromic anemia
588	hypogammaglobulinemia
589	hypoglycemia
590	hypogonadism
591	hypogonadism male
592	hypokalemia
593	hypokinesia
594	hypomagnesemia
595	hyponatremia
596	hypophosphatemia
597	hypopigmentation
598	hypoplastic anemia
599	hypoproteinemia
600	hypoprothrombinemia
601	hyporeflexia
602	hypotension
603	hypothermia
604	hypothyroidism
605	hypotonia
606	hypoventilation
607	hypovolemia
608	hypoxia
609	hysteria
610	idiosyncratic drug reaction
611	ileitis
612	ileus
613	illness
614	immune reconstitution syndrome
615	immunosuppressive effect
616	impaired concentration
617	impetigo
618	implantation complication
619	impotence
620	incontinence
621	incoordination
622	increased alkaline phosphatase
623	increased appetite
624	increased bun
625	increased eosinophil count
626	increased eosinophils
627	increased ggt
628	increased inr
629	increased ldh
630	increased liver enzymes
631	increased monocytes
632	increased plasma volume
633	increased salivation
634	increased serum creatinine
635	increased serum triglycerides
636	increased sgot
637	increased sgpt
638	increased sweating
639	increased urine protein
640	infarction
641	infection
642	infection at the injection site
643	infection bacterial
644	infection fungal
645	infectious
646	infertility
647	infestations
648	inflammation
649	insomnia
650	interrupted treatment
651	interstitial lung disease
652	interstitial nephritis
653	interstitial pneumonitis
654	intestinal obstruction
655	intestinal perforation
656	intestinal ulcer
657	intracranial bleeding
658	intracranial hypertension
659	involuntary movement
660	involuntary movements of extremities
661	involuntary muscle contractions
662	iritis
663	iron decreased
664	irritability
665	irritable bowel
666	ischemia
667	ischemic optic neuropathy
668	itching
669	jaundice
670	juvenile rheumatoid arthritis
671	keratitis
672	keratoconjunctivitis
673	keratoses
674	kidney calculus
675	kidney function abnormal
676	lab test abnormality
677	lack of drug effect
678	lack of efficacy
679	lactation
680	lactic acidosis
681	lam
682	laryngeal edema
683	laryngeal neoplasia
684	laryngitis
685	laryngospasm
686	lassitude
687	leg cramps
688	leg edema
689	leg pain
690	lens
691	lens opacity
692	lethargy
693	leukemia
694	leukocytosis
695	leukoencephalopathy
696	leukopenia
697	leukorrhea
698	libido decreased
699	libido increased
700	lightheadedness
701	lip
702	lipodystrophy
703	lipohypertrophy
704	liver disease
705	liver failure
706	liver fatty
707	liver fatty deposit
708	liver function tests abnormal
709	liver impairment
710	liver tenderness
711	liver tumors
712	localized pain
713	loss of libido
714	lower respiratory tract infection
715	lung disorder
716	lupus
717	lymphadenopathy
718	lymphangitis
719	lymphedema
720	lymphocele
721	lymphocytes increased
722	lymphocytopenia
723	lymphocytosis
724	lymphoma
725	lymphoproliferative disease
726	lysis
727	mac
728	maculopapular rash
729	malabsorption
730	malaise
731	male breast
732	male breast pain
733	malignant neoplasm
734	malignant syndrome
735	mania
736	manic reaction
737	mediastinal disorders
738	megaloblastic
739	melanoma
740	melanosis
741	melasma
742	melena
743	memory impairment
744	memory loss
745	menarche
746	meningitis
747	menometrorrhagia
748	menorrhagia
749	menstrual disorder
750	menstruation irregular
751	mental depression
752	mental impairment
753	mesenteric arterial occlusion
754	mesenteric thrombosis
755	metabolic acidosis
756	metabolic alkalosis
757	metabolism and nutrition disorders
758	methemoglobinemia
759	metrorrhagia
760	microangiopathic hemolytic anemia
761	microangiopathy
762	microcytic
763	migraine
764	miosis
765	mod
766	molluscum contagiosum
767	moniliasis
768	mood disturbances
769	motor restlessness
770	mouth ulcer
771	mucosal atrophy
772	mucositis
773	mucous membrane
774	multisystem organ failure
775	muscle atrophy
776	muscle twitching
777	muscular disorder
778	muscular weakness
779	musculoskeletal and connective tissue disorders
780	musculoskeletal pain
781	musculoskeletal system disorders
782	myalgia
783	myasthenia
784	myasthenia gravis
785	mycobacterial infections
786	mydriasis
787	myeloblastic leukemia
788	myeloproliferative disorder
789	myocardial hypertrophy
790	myocardial infarction
791	myocardial ischemia
792	myocarditis
793	myoclonus
794	myositis
795	nail disorder
796	narcolepsy
797	nasopharyngitis
798	nausea
799	nausea and vomiting
800	neck pain
801	neck rigidity
802	necrosis
803	nephritis
804	nephropathy
805	nephrosis
806	nephrotic syndrome
807	nerve paralysis
808	nervous system disorders
809	nervousness
810	neuralgia
811	neuritis
812	neuroleptic malignant
813	neurologic symptoms
814	neuropathy
815	neurosis
816	neutropenia
817	neutropenia aggravated
818	neutropenic fever
819	night blindness
820	night sweats
821	nightmares
822	nocardiosis
823	nocturia
824	nodal arrhythmia
825	nodular regenerative hyperplasia
826	nodule
827	nosocomial pneumonia
828	nph
829	numbness
830	nystagmus
831	obesity
832	obstruction
833	obstructive pulmonary disease
834	ocular irritation
835	oculogyric crisis
836	oily
837	oligospermia
838	oliguria
839	oliguria and anuria
840	onycholysis
841	onychomycosis
842	ophthalmoplegia
843	opisthotonos
844	opportunistic infections
845	optic atrophy
846	optic nerve
847	optic neuritis
848	oral moniliasis
849	organ failure
850	organizing pneumonia
851	oropharyngeal candidiasis
852	osahs
853	osteoarthritis
854	osteomalacia
855	osteomyelitis
856	osteonecrosis
857	osteoporosis
858	otitis
859	otitis externa
860	otitis media
861	otosclerosis
862	ovarian cancer
863	ovary
864	pain
865	pain at the injection
866	pain at the injection site
867	pain in limb
868	pain in urethra
869	pain urinary tract
870	pallor
871	palpitation
872	pancreatitis
873	pancytopenia
874	panic
875	panic disorder
876	papanicolaou smear suspicious
877	papilledema
878	paralysis
879	paranoia
880	paraplegia
881	paresis
882	paresthesia
883	parosmia
884	parotid gland enlargement
885	patent ductus arteriosis
886	pedal edema
887	peeling
888	pelvic inflammatory disease
889	pelvic pain
890	pemphigoid
891	pemphigoid reaction
892	penis
893	peptic ulcer
894	periarteritis nodosa
895	pericardial effusion
896	pericarditis
897	periodontal abscess
898	periodontitis
899	peripheral edema
900	peripheral ischemia
901	peripheral nerve palsy
902	peripheral neuropathy
903	peripheral sensory neuropathy
904	peripheral vascular disorder
905	peritonitis
906	personality disorder
907	petechia
908	pharmacokinetic interaction
909	pharyngitis
910	phlebitis
911	photoallergic dermatitis
912	photophobia
913	photosensitivity
914	photosensitivity reaction
915	phototoxicity
916	pigmentation
917	plaque
918	pleural
919	pleural effusion
920	pleuritis
921	pmdd
922	pneumocystis
923	pneumocystis carinii infection
924	pneumocystis jiroveci pneumonia
925	pneumonia
926	pneumothorax
927	polyarthralgia
928	polycythemia
929	polymyalgia
930	polymyalgia rheumatica
931	polyps
932	polyuria
933	porphyria
934	porphyria cutanea tarda
935	positive ana
936	positive coombs test
937	postpartum hemorrhage
938	postural hypotension
939	potassium decreased
940	potassium increased
941	precordial chest pain
942	premature ventricular contraction
943	premenstrual syndrome
944	priapism
945	procedural complication
946	proctitis
947	progressive renal failure
948	prolonged pregnancy
949	prolonged qt
950	prostatitis
951	proteinuria
952	prothrombin decreased
953	prothrombin increased
954	pruritus ani
955	pruritus vulvae
956	pseudomembranous colitis
957	pseudomembranous enterocolitis
958	pseudoporphyria
959	psoriasis
960	psoriatic plaque
961	psychiatric disorders
962	psychiatric symptoms
963	psychosis
964	psychotic episodes
965	ptosis
966	pulmonary arterial hypertension
967	pulmonary congestion
968	pulmonary edema
969	pulmonary embolism
970	pulmonary fibrosis
971	pulmonary hemorrhage
972	pulmonary hypertension
973	pulmonary infiltrates
974	purpura
975	purpuric rash
976	pustular rash
977	pyelonephritis
978	pyuria
979	qtc
980	rash
981	reactions at the infusion site
982	rectal disorder
983	rectal hemorrhage
984	rectal pain
985	red blood cell disorders
986	red eye
987	reduced carbohydrate tolerance
988	regional ileitis
989	regression
990	regurgitation
991	remission
992	renal abscess
993	renal and urinary disorders
994	renal colic
995	renal failure
996	renal impairment
997	renal insufficiency
998	renal pain
999	renal papillary necrosis
1000	reproductive system and breast disorders
1001	respiratory alkalosis
1002	respiratory arrest
1003	respiratory depression
1004	respiratory distress
1005	respiratory distress syndrome
1006	respiratory failure
1007	respiratory infection
1008	respiratory system disorders
1009	retching
1010	reticulocytosis
1011	retinal degeneration
1012	retinal hemorrhage
1013	retinal vascular thrombosis
1014	retinal vein thrombosis
1015	retinitis
1016	retinopathy
1017	reye syndrome
1018	rhabdomyolysis
1019	rheumatoid arthritis
1020	rhinitis
1021	rigidity
1022	rigors
1023	rosacea
1024	salivary gland enlargement
1025	salivation
1026	scaling
1027	scleral injection
1028	scleritis
1029	scrotal edema
1030	seborrhea
1031	sedation
1032	seizures
1033	sensitization
1034	sepsis
1035	septicemia
1036	serum albumin decreased
1037	serum alkaline phosphatase increased
1038	serum iron decreased
1039	serum sickness
1040	serum transaminase increased
1041	shakiness
1042	shallow breathing
1043	shock
1044	shoulder pain
1045	sialadenitis
1046	sicca
1047	sinusitis
1048	skeletal system disorders
1049	skin and subcutaneous tissue disorders
1050	skin benign neoplasm
1051	skin carcinoma
1052	skin changes
1053	skin discoloration
1054	skin disorder
1055	skin fragility
1056	skin hypertrophy
1057	skin infections
1058	skin melanoma
1059	skin necrosis
1060	skin neoplasm
1061	skin striae
1062	skin texture changes
1063	skin ulcer
1064	sleep disorder
1065	sleep disturbances
1066	slurred
1067	smear cervix abnormal
1068	soft tissue necrosis
1069	somnolence
1070	sore mouth
1071	sore throat
1072	sore tongue
1073	spasm
1074	speech disorder
1075	spine pain
1076	splenomegaly
1077	sputum increased
1078	squamous cell carcinoma
1079	status epilepticus
1080	stevens johnson syndrome
1081	stiffness
1082	stillbirths
1083	stinging
1084	stomach ulcer
1085	stomatitis
1086	stridor
1087	stupor
1088	subdural hematoma
1089	substance abuse
1090	substernal chest pain
1091	sudden death
1092	suffered
1093	suicidal ideation
1094	suicide
1095	suicide attempt
1096	sulfhemoglobinemia
1097	superficial venous thrombosis
1098	supraventricular extrasystoles
1099	supraventricular tachycardia
1100	sweating
1101	swelling
1102	swelling of the vein
1103	symptoms of hepatitis
1104	syncope
1105	syndrome of inappropriate antidiuretic hormone
1106	synovial cyst
1107	synovitis
1108	systemic fungal infection
1109	systemic lupus erythematosus
1110	tachycardia
1111	tachypnea
1112	tardive dyskinesia
1113	taste loss
1114	telangiectasia
1115	tenderness
1116	tendinitis
1117	tendon disorder
1118	tenesmus
1119	teratogenicity
1120	testicular disorder
1121	testicular pain
1122	tetanus
1123	tetany
1124	thinking abnormal
1125	third degree heart block
1126	thirst
1127	thoracic
1128	thoracic spine pain
1129	thrombocythemia
1130	thrombocytopenia
1131	thrombocytopenic purpura
1132	thromboembolic events
1133	thromboembolism
1134	thrombophlebitis
1135	thrombosis
1136	thrombotic thrombocytopenic purpura
1137	tinea
1138	tinea cruris
1139	tingling
1140	tingling skin
1141	tinnitus
1142	tolerance decreased
1143	tongue discoloration
1144	tongue disorder
1145	tongue edema
1146	tonsillitis
1147	tooth discoloration
1148	tooth disorder
1149	torsades de pointes
1150	torticollis
1151	toxic epidermal necrolysis
1152	toxic nephropathy
1153	transient abnormalities in liver
1154	transient blindness
1155	transient ischemic attack
1156	transplant rejection
1157	tremor
1158	trismus
1159	tuberculosis
1160	tubular
1161	tubular necrosis
1162	tumor lysis syndrome
1163	tumors
1164	ulcer and gastrointestinal bleeding
1165	ulceration
1166	ulcerative colitis
1167	ulcerative stomatitis
1168	unintended pregnancy
1169	unsteadiness
1170	upper gastrointestinal symptoms
1171	upper gi bleeding
1172	upper respiratory tract infection
1173	upset
1174	urea increased
1175	uremia
1176	uremic syndrome
1177	urethritis
1178	urinary frequency
1179	urinary incontinence
1180	urinary retention
1181	urinary tract infection
1182	urinary urgency
1183	urination impaired
1184	urticaria
1185	uterine disorders
1186	uterine fibroids
1187	uterine hemorrhage
1188	uveitis
1189	vaginal bleeding
1190	vaginal candidiasis
1191	vaginal discharge
1192	vaginal hemorrhage
1193	vaginitis
1194	valvular heart disease
1195	varicella
1196	varicella zoster
1197	varicose veins
1198	vascular disorders
1199	vasculitis
1200	vasodilatation
1201	vasospasm
1202	vein disorder
1203	venous thromboembolism
1204	venous thrombosis
1205	ventricular arrhythmia
1206	ventricular dysfunction
1207	ventricular fibrillation
1208	ventricular tachycardia
1209	vertigo
1210	vesiculobullous rash
1211	vestibular disorder
1212	viral infection
1213	vision loss
1214	visual disturbances
1215	visual field defect
1216	vitiligo
1217	vitreous disorders
1218	voice alteration
1219	vomiting
1220	wakefulness
1221	watery eyes
1222	wbc abnormal
1223	weakness
1224	weight decreased
1225	weight gain
1226	wheezing
1227	withdrawal bleeding
1228	withdrawal of treatment
1229	withdrawn
1230	xanthomatosis
1231	xerophthalmia
1232	ze syndrome
\.


--
-- Data for Name: treats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treats (drug_name, disease_name) FROM stdin;
fosphenytoin	Ventricular fibrillation, idiopathic
fosphenytoin	Heart block, progressive, type I, 113900
fosphenytoin	Sick sinus syndrome, 608567
fosphenytoin	Heart block, nonprogressive, 113900
fosphenytoin	Heart block
fosphenytoin	Long QT syndrome-3, 603830
fosphenytoin	Brugada syndrome
fosphenytoin	Ventricular fibrillation, idiopathic, 603829
fosphenytoin	Sick sinus syndrome
fosphenytoin	Long QT syndrome
fosphenytoin	Brugada syndrome, 601144
atorvastatin	Dementia, vascular, susceptibility to
atorvastatin	Lipodystrophy
atorvastatin	Malaria
atorvastatin	Coronary artery spasm, susceptibility to
atorvastatin	Preeclampsia
atorvastatin	Sepsis
atorvastatin	Septic shock, susceptibility to
atorvastatin	Coronary artery disease, susceptibility to
atorvastatin	Lipodystrophy, familial partial, 151660
atorvastatin	Asthma
atorvastatin	Insulin resistance
atorvastatin	Hypertension, essential, susceptibility to, 145500
atorvastatin	Abetalipoproteinemia
atorvastatin	Hypolactasia, adult type
atorvastatin	Statins
atorvastatin	Diabetes mellitus
atorvastatin	Glioblastoma, susceptibility to, 137800
atorvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
atorvastatin	Renal tubular dysgenesis
atorvastatin	Migraine without aura, susceptibility to, 157300
atorvastatin	Preeclampsia, susceptibility to
atorvastatin	Asthma, susceptibility to, 600807
atorvastatin	Coronary artery disease
atorvastatin	Diabetes mellitus, insulin-resistant, with acanthosis nigricans and hypertension, 604367
atorvastatin	Migraine
atorvastatin	Obesity, severe, 601665
atorvastatin	Obesity
atorvastatin	Dementia
atorvastatin	Hypertension
atorvastatin	Hypercholesterolemia, due to ligand-defective apo B, 144010
atorvastatin	Insulin resistance, severe, digenic, 604367
atorvastatin	Malaria, cerebral, susceptibility to
atorvastatin	Hyperapobetalipoproteinemia, susceptibility to
atorvastatin	Glioblastoma
atorvastatin	Statins, attenuated cholesterol lowering by
atorvastatin	Immunodeficiency, X-linked, with hyper-IgM, 308230
atorvastatin	Hypobetalipoproteinemia
atorvastatin	Hyperapobetalipoproteinemia
atorvastatin	Renal tubular dysgenesis, 267430
atorvastatin	Immunodeficiency
atorvastatin	Hypolactasia, adult type, 223100
atorvastatin	Obesity, resistance to
atorvastatin	Hypercholesterolemia
atorvastatin	Tall stature, susceptibility to
atorvastatin	Tall stature
muromonab	IgG receptor I, phagocytic, familial deficiency of
muromonab	Viral infections, recurrent
muromonab	Lymphoma
muromonab	C1s deficiency, isolated
muromonab	Immunodeficiency due to defect in CD3-epsilon
muromonab	Lupus erythematosus
muromonab	Neutropenia, alloimmune neonatal
muromonab	Complementary component deficiency
muromonab	Neutropenia
muromonab	Lupus nephritis, susceptibility to
muromonab	Immunodeficiency
muromonab	Lymphoma, progression of
muromonab	C1q deficiency, type A
muromonab	Viral infection
muromonab	C1q deficiency, type B
ticlopidine	Platelet ADP receptor defect
ticlopidine	Platelet defect/deficiency
mephenytoin	Heart block, progressive, type I, 113900
mephenytoin	Sick sinus syndrome, 608567
mephenytoin	Heart block
mephenytoin	Dysalbuminemic hyperthyroxinemia
mephenytoin	Ventricular fibrillation, idiopathic, 603829
mephenytoin	Analbuminemia
mephenytoin	Long QT syndrome
mephenytoin	Ventricular fibrillation, idiopathic
mephenytoin	Heart block, nonprogressive, 113900
mephenytoin	Long QT syndrome-3, 603830
mephenytoin	Brugada syndrome
mephenytoin	Sick sinus syndrome
mephenytoin	Brugada syndrome, 601144
lovastatin	Statins, attenuated cholesterol lowering by
lovastatin	Statins
etodolac	Dysalbuminemic hyperthyroxinemia
etodolac	Analbuminemia
octreotide	Acromegaly
octreotide	Acromegaly, 102200
nicardipine	Colchicine resistance
nicardipine	Timothy syndrome
nicardipine	Timothy syndrome, 601005
bosentan	Cholestasis
bosentan	ABCD syndrome
bosentan	Cholestasis, progressive familial intrahepatic 2, 601847
bosentan	Hirschsprung disease
bosentan	ABCD syndrome, 600501
bosentan	Waardenburg-Shah syndrome
bosentan	Migraine, resistance to, 157300
bosentan	Waardenburg-Shah syndrome, 277580
bosentan	Hirschsprung disease-2, 600155
bosentan	Migraine
ketoprofen	Dysalbuminemic hyperthyroxinemia
ketoprofen	Analbuminemia
chloroquine	Thalassemias
chloroquine	Dementia
chloroquine	Dementia, vascular, susceptibility to
chloroquine	Malaria
chloroquine	Erythremias
chloroquine	Sepsis
chloroquine	Septic shock, susceptibility to
chloroquine	Heinz body anemia
chloroquine	Asthma
chloroquine	Erythremias, alpha-
chloroquine	Malaria, cerebral, susceptibility to
chloroquine	Heinz body anemias, alpha-
chloroquine	Methemoglobinemia
chloroquine	Methemoglobinemias, alpha-
chloroquine	Thalassemias, alpha-
chloroquine	Migraine without aura, susceptibility to, 157300
chloroquine	Asthma, susceptibility to, 600807
chloroquine	Migraine
cerivastatin	Statins, attenuated cholesterol lowering by
cerivastatin	Statins
acetazolamide	Renal tubular acidosis
acetazolamide	Renal tubular acidosis-osteopetrosis syndrome
acetazolamide	Blood group
acetazolamide	Aquaporin-1 deficiency
acetazolamide	Blood group, Colton, 110450
ethinyl estradiol	HDL cholesterol level QTL
ethinyl estradiol	Migraine, susceptibility to, 157300
ethinyl estradiol	HDL response to hormone replacement, augmented
ethinyl estradiol	Estrogen resistance
ethinyl estradiol	Migraine
ciprofloxacin	DNA topoisomerase
ciprofloxacin	DNA topoisomerase II, resistance to inhibition of, by amsacrine
ciprofloxacin	Dysalbuminemic hyperthyroxinemia
ciprofloxacin	Analbuminemia
diclofenac	Amyloid neuropathy, familial, several allelic types
diclofenac	Carpal tunnel syndrome, familial
diclofenac	Amyloidosis
diclofenac	Dystransthyretinemic hyperthyroxinemia(3)
diclofenac	Amyloid neuropathy
diclofenac	Amyloidosis, senile systemic
diclofenac	Dystransthyretinemic hyperthyroxinemia
methohexital	Epilepsy
methohexital	Epilepsy, juvenile myoclonic, 606904
sulindac	Bladder cancer
sulindac	Thyroid carcinoma
sulindac	Dysalbuminemic hyperthyroxinemia
sulindac	Costello syndrome
sulindac	Bladder cancer, somatic, 109800
sulindac	Osteolysis, idiopathic, Saudi type, 605156
sulindac	Osteolysis
sulindac	Analbuminemia
sulindac	Costello syndrome, 218040
sulindac	Thyroid carcinoma, follicular, somatic, 188470
methylphenobarbital	Epilepsy
methylphenobarbital	Epilepsy, juvenile myoclonic, 606904
dicumarol	Leukemia, post-chemotherapy, susceptibility to
dicumarol	Benzene toxicity
dicumarol	Vitamin K-dependent clotting factors, combined deficiency of, 2, 607473
dicumarol	Vitamin K-dependent coagulation defect
dicumarol	Leukemia
dicumarol	Warfarin resistance/sensitivity
dicumarol	Benzene toxicity, susceptibility to
dicumarol	Warfarin resistance, 122700
sibutramine	Orthostatic intolerance, 604715
sibutramine	Orthostatic intolerance
sibutramine	Obsessive-compulsive disorder
sibutramine	Obsessive-compulsive disorder 1, 164230
sibutramine	Anxiety-related personality traits
butabarbital	Epilepsy
butabarbital	Epilepsy, juvenile myoclonic, 606904
glipizide	Bartter syndrome
glipizide	Bartter syndrome, type 2, 241200
cyclosporine	Colchicine resistance
pentobarbital	Epilepsy
pentobarbital	Epilepsy, juvenile myoclonic, 606904
norfloxacin	DNA topoisomerase
norfloxacin	DNA topoisomerase II, resistance to inhibition of, by amsacrine
etoposide	DNA topoisomerase
etoposide	DNA topoisomerase II, resistance to inhibition of, by amsacrine
methotrexate	Dysalbuminemic hyperthyroxinemia
methotrexate	Analbuminemia
talbutal	Epilepsy
talbutal	Epilepsy, juvenile myoclonic, 606904
itraconazole	Colchicine resistance
phenobarbital	Epilepsy
phenobarbital	Epilepsy, juvenile myoclonic, 606904
neostigmine	Blood group, Yt system, 112100
neostigmine	Blood group
warfarin	Hypoprothrombinemia
warfarin	Vitamin K-dependent clotting factors, combined deficiency of, 2, 607473
warfarin	Vitamin K-dependent coagulation defect
warfarin	Warfarin resistance/sensitivity
warfarin	Hyperprothrombinemia
warfarin	Dysprothrombinemia
warfarin	Warfarin resistance, 122700
carbamazepine	Ventricular fibrillation, idiopathic
carbamazepine	Heart block, progressive, type I, 113900
carbamazepine	Sick sinus syndrome, 608567
carbamazepine	Heart block, nonprogressive, 113900
carbamazepine	Heart block
carbamazepine	Long QT syndrome-3, 603830
carbamazepine	Brugada syndrome
carbamazepine	Ventricular fibrillation, idiopathic, 603829
carbamazepine	Sick sinus syndrome
carbamazepine	Long QT syndrome
carbamazepine	Brugada syndrome, 601144
danazol	HDL cholesterol level QTL
danazol	Fertile eunuch syndrome
danazol	Migraine, susceptibility to, 157300
danazol	HDL response to hormone replacement, augmented
danazol	Estrogen resistance
danazol	Fertile eunuch syndrome, 228300
danazol	Migraine
danazol	Hypogonadotropic hypogonadism
colchicine	Familial Mediterranean fever, 249100
colchicine	Colchicine resistance
colchicine	Familial Mediterranean fever
pravastatin	Dubin-Johnson syndrome
pravastatin	Dubin-Johnson syndrome, 237500
pravastatin	Statins, attenuated cholesterol lowering by
pravastatin	Statins
nefazodone	Alcohol dependence
nefazodone	Seasonal affective disorder, susceptibility to, 608516
nefazodone	Orthostatic intolerance
nefazodone	Obsessive-compulsive disorder 1, 164230
nefazodone	Anorexia nervosa
nefazodone	Anxiety-related personality traits
nefazodone	Orthostatic intolerance, 604715
nefazodone	Schizophrenia, susceptibility to, 181500
nefazodone	Seasonal affective disorder
nefazodone	Obsessive-compulsive disorder
nefazodone	Obsessive-compulsive disorder, susceptibility to, 164230
nefazodone	Anorexia nervosa, susceptibility to, 606788
nefazodone	Schizophrenia
nefazodone	Alcohol dependence, susceptibility to, 103780
sulfinpyrazone	Dubin-Johnson syndrome
sulfinpyrazone	Dubin-Johnson syndrome, 237500
amiodarone	Acquired long QT syndrome
amiodarone	Congestive heart failure
amiodarone	Resting heart rate
amiodarone	Acquired long QT syndrome, susceptibility to
amiodarone	Congestive heart failure, susceptibility to
amiodarone	Long QT syndrome-2
amiodarone	Long QT syndrome
amiodarone	Resting heart rate, 607276
troglitazone	Obesity, severe, 601665
troglitazone	Obesity
troglitazone	Diabetes mellitus
troglitazone	Glioblastoma, susceptibility to, 137800
troglitazone	Lipodystrophy
troglitazone	Mental retardation
troglitazone	Lipodystrophy, familial partial, 151660
troglitazone	Obesity, resistance to
troglitazone	Insulin resistance
troglitazone	Insulin resistance, severe, digenic, 604367
troglitazone	Diabetes mellitus, insulin-resistant, with acanthosis nigricans and hypertension, 604367
troglitazone	Glioblastoma
rosuvastatin	Hypertension, pregnancy-induced, 189800
rosuvastatin	Alzheimer disease
rosuvastatin	Hypertension
rosuvastatin	Coronary spasms, susceptibility to
rosuvastatin	Coronary spasms
rosuvastatin	Hypertension, susceptibility to, 145500
rosuvastatin	Placental abruption
rosuvastatin	Alzheimer disease, late-onset, susceptibility to, 104300
rosuvastatin	Statins, attenuated cholesterol lowering by
rosuvastatin	Statins
ambenonium	Blood group, Yt system, 112100
ambenonium	Blood group
methylphenidate	Orthostatic intolerance, 604715
methylphenidate	Orthostatic intolerance
methylphenidate	Obsessive-compulsive disorder
methylphenidate	Obsessive-compulsive disorder 1, 164230
methylphenidate	Anxiety-related personality traits
sulfasalazine	Alpha-methylacetoacetic aciduria
sulfasalazine	Alpha-methylacetoacetic aciduria, 203750
metoclopramide	Dystonia
metoclopramide	Dystonia, myoclonic, 159900
meclofenamic acid	Atherosclerosis
meclofenamic acid	Asthma, dimished response to antileukotriene treatment in, 600807
meclofenamic acid	Atherosclerosis, susceptibility to
meclofenamic acid	Asthma
oxcarbazepine	Ventricular fibrillation, idiopathic
oxcarbazepine	Heart block, progressive, type I, 113900
oxcarbazepine	Sick sinus syndrome, 608567
oxcarbazepine	Heart block, nonprogressive, 113900
oxcarbazepine	Heart block
oxcarbazepine	Long QT syndrome-3, 603830
oxcarbazepine	Brugada syndrome
oxcarbazepine	Ventricular fibrillation, idiopathic, 603829
oxcarbazepine	Sick sinus syndrome
oxcarbazepine	Long QT syndrome
oxcarbazepine	Brugada syndrome, 601144
acenocoumarol	Vitamin K-dependent clotting factors, combined deficiency of, 2, 607473
acenocoumarol	Dysalbuminemic hyperthyroxinemia
acenocoumarol	Vitamin K-dependent coagulation defect
acenocoumarol	Analbuminemia
acenocoumarol	Warfarin resistance/sensitivity
acenocoumarol	Warfarin resistance, 122700
orlistat	Combined hyperlipemia, familial
orlistat	Combined hyperlipemia
orlistat	Lipoprotein lipase deficiency
orlistat	Chylomicronemia syndrome, familial
glibenclamide	Pancreatitis
glibenclamide	Cholestasis
glibenclamide	Tangier disease, 205400
glibenclamide	HDL deficiency, familial, 604091
glibenclamide	Persistent hyperinsulinemic hypoglycemia of infancy, 256450
glibenclamide	Cystic fibrosis, 219700
glibenclamide	Sweat chloride elevation without CF
glibenclamide	Diabetes mellitus
glibenclamide	Tangier disease
glibenclamide	Persistent hyperinsulinemic hypoglycemia of infancy
glibenclamide	Diabetes mellitus, 125853
glibenclamide	Cardiomyopathy, dilated, with ventricular tachycardia, 608569
glibenclamide	Coronary artery disease
glibenclamide	HDL cholesterol level QTL
glibenclamide	Hypoglycemia of infancy, leucine-sensitive, 240800
glibenclamide	Cholestasis, progressive familial intrahepatic 2, 601847
glibenclamide	Diabetes mellitus, permanent neonatal, with neurologic features, 606176
glibenclamide	Congenital bilateral absence of vas deferens
glibenclamide	Hypoglycemia of infancy, persistent hyperinsulinemic, 256450
glibenclamide	Cerebral amyloid angiopathy, 105150
glibenclamide	Cardiomyopathy
glibenclamide	Hypertrypsinemia
glibenclamide	Hypoglycemia
glibenclamide	Bartter syndrome
glibenclamide	Diabetes, permanent neonatal, 606176
glibenclamide	Bartter syndrome, type 2, 241200
glibenclamide	Congenital bilateral absence of vas deferens, 277180
glibenclamide	Cerebral amyloid angiopathy
glibenclamide	Pancreatitis, idiopathic
glibenclamide	Hypertrypsinemia, neonatal
glibenclamide	Cystic fibrosis
glibenclamide	Coronary artery disease in familial hypercholesterolemia, protection against, 143890
hydrocortisone	Obesity
hydrocortisone	Atherosclerosis
hydrocortisone	Malaria
hydrocortisone	Asthma, dimished response to antileukotriene treatment in, 600807
hydrocortisone	Atherosclerosis, susceptibility to
hydrocortisone	Obesity, adrenal insufficiency, and red hair
hydrocortisone	Cortisol resistance
hydrocortisone	Malaria, resistance to, 248310
hydrocortisone	Asthma
carvedilol	Acquired long QT syndrome
carvedilol	Obesity
carvedilol	Congestive heart failure
carvedilol	Oculodentodigital dysplasia
carvedilol	Resting heart rate
carvedilol	Hypoplastic left heart syndrome, 241550
carvedilol	Asthma, nocturnal, susceptibility to
carvedilol	Syndactyly
carvedilol	Asthma
carvedilol	Atrioventricular block
carvedilol	Acquired long QT syndrome, susceptibility to
carvedilol	Long QT syndrome-2
carvedilol	Long QT syndrome
carvedilol	Hypoplastic left heart syndrome
carvedilol	Syndactyly, type III, 186100
carvedilol	Diabetes mellitus
carvedilol	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
carvedilol	Oculodentodigital dysplasia, 164200
carvedilol	Obesity, susceptibility to, 601665
carvedilol	Colchicine resistance
carvedilol	Congestive heart failure, susceptibility to
carvedilol	Beta-2-adrenoreceptor agonist, reduced response to
carvedilol	Atrioventricular septal defect, 600309
carvedilol	Resting heart rate, 607276
rifampin	Colchicine resistance
phenytoin	Heart block, progressive, type I, 113900
phenytoin	Sick sinus syndrome, 608567
phenytoin	Epilepsy, severe myoclonic, of infancy, 607208
phenytoin	Heart block
phenytoin	Ventricular fibrillation, idiopathic, 603829
phenytoin	Long QT syndrome
phenytoin	Ventricular fibrillation, idiopathic
phenytoin	Heart block, nonprogressive, 113900
phenytoin	Epilepsy, generalized, with febrile seizures plus, type 2, 604233
phenytoin	Long QT syndrome-3, 603830
phenytoin	Epilepsy
phenytoin	Brugada syndrome
phenytoin	Sick sinus syndrome
phenytoin	Brugada syndrome, 601144
fluoxetine	Obsessive-compulsive disorder
fluoxetine	Obsessive-compulsive disorder 1, 164230
fluoxetine	Anxiety-related personality traits
saquinavir	Dementia
saquinavir	Dementia, vascular, susceptibility to
saquinavir	Malaria
saquinavir	Dysalbuminemic hyperthyroxinemia
saquinavir	Sepsis
saquinavir	Septic shock, susceptibility to
saquinavir	Analbuminemia
saquinavir	Asthma
saquinavir	Malaria, cerebral, susceptibility to
saquinavir	Dubin-Johnson syndrome, 237500
saquinavir	Migraine without aura, susceptibility to, 157300
saquinavir	Asthma, susceptibility to, 600807
saquinavir	Colchicine resistance
saquinavir	Dubin-Johnson syndrome
saquinavir	Migraine
fluvastatin	Statins, attenuated cholesterol lowering by
fluvastatin	Statins
butalbital	Epilepsy
butalbital	Epilepsy, juvenile myoclonic, 606904
imatinib	Leukemia, acute myeloid, 601626
imatinib	Central hypoventilation syndrome, congenital, 209880
imatinib	Myeloid malignancy, predisposition to
imatinib	Multiple endocrine neoplasia
imatinib	Leukemia, Philadelphia chromosome-positive, resistant to imatinib
imatinib	Leukemia
imatinib	Mast cell leukemia
imatinib	Central hypoventilation syndrome
imatinib	Hypereosinophilic syndrome
imatinib	Medullary thyroid carcinoma, 155240
imatinib	Medullary thyroid carcinoma, familial, 155240
imatinib	Mastocytosis with associated hematologic disorder
imatinib	Multiple endocrine neoplasia IIB, 162300
imatinib	Colchicine resistance
imatinib	Piebaldism
imatinib	Gastrointestinal stromal tumor, somatic, 606764
imatinib	Myelogenous leukemia
imatinib	Insensitivity to pain
imatinib	Hirschsprung disease
imatinib	Multiple endocrine neoplasia IIA, 171400
imatinib	Gastrointestinal stromal tumor
imatinib	Medullary thyroid carcinoma
imatinib	Insensitivity to pain, congenital, with anhidrosis, 256800
imatinib	Colonic aganglionosis, total, with small bowel involvement
imatinib	Germ cell tumor
imatinib	Germ cell tumors, 273300
imatinib	Hirschsprung disease, 142623
imatinib	Myeloproliferative disorder with eosinophilia, 131440
imatinib	Hypereosinophilic syndrome, idiopathic, resistant to imatinib, 607685
imatinib	Myelomonocytic leukemia, chronic
imatinib	Myeloproliferative disorder
roxithromycin	Colchicine resistance
ursodeoxycholic acid	Obesity
ursodeoxycholic acid	Obesity, hyperphagia, and developmental delay
allopurinol	Xanthinuria, type I
allopurinol	Xanthinuria, type I, 278300
ezetimibe	Ezetimibe, nonresponse to
anisindione	Vitamin K-dependent coagulation defect, 277450
anisindione	Vitamin K-dependent coagulation defect
primidone	Epilepsy
primidone	Epilepsy, juvenile myoclonic, 606904
bupropion	Orthostatic intolerance, 604715
bupropion	Orthostatic intolerance
butethal	Epilepsy
butethal	Epilepsy, juvenile myoclonic, 606904
glimepiride	Diabetes mellitus
glimepiride	Persistent hyperinsulinemic hypoglycemia of infancy
glimepiride	Bartter syndrome
glimepiride	Diabetes, permanent neonatal, 606176
glimepiride	Bartter syndrome, type 2, 241200
glimepiride	Diabetes mellitus, permanent neonatal, with neurologic features, 606176
glimepiride	Persistent hyperinsulinemic hypoglycemia of infancy, 256450
flurbiprofen	Dysalbuminemic hyperthyroxinemia
flurbiprofen	Analbuminemia
simvastatin	Dementia, vascular, susceptibility to
simvastatin	Malaria
simvastatin	Preeclampsia
simvastatin	Sepsis
simvastatin	Septic shock, susceptibility to
simvastatin	Asthma
simvastatin	Tuberculosis
simvastatin	Hypertension, essential, susceptibility to, 145500
simvastatin	TSC2 angiomyolipomas, renal, modifier of, 191100
simvastatin	Statins
simvastatin	Immunodeficiency with hyper-IgM, type 3, 606843
simvastatin	AIDS
simvastatin	Diabetes mellitus
simvastatin	Coronary heart disease, susceptibility to
simvastatin	Kaposi sarcoma
simvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
simvastatin	Leukocyte adhesion deficiency
simvastatin	Renal tubular dysgenesis
simvastatin	Migraine without aura, susceptibility to, 157300
simvastatin	Preeclampsia, susceptibility to
simvastatin	Asthma, susceptibility to, 600807
simvastatin	Coronary artery disease
simvastatin	Hyperprothrombinemia
simvastatin	Migraine
simvastatin	Aplastic anemia, 609135
simvastatin	Hypoprothrombinemia
simvastatin	Dementia
simvastatin	Hypertension
simvastatin	Tuberous sclerosis
simvastatin	AIDS, rapid progression to, 609423
simvastatin	Kaposi sarcoma, susceptibility to, 148000
simvastatin	Malaria, cerebral, susceptibility to
simvastatin	Hyperapobetalipoproteinemia, susceptibility to
simvastatin	Statins, attenuated cholesterol lowering by
simvastatin	Dysprothrombinemia
simvastatin	Tuberculosis, susceptibility to, 607948
simvastatin	Hyperapobetalipoproteinemia
simvastatin	Renal tubular dysgenesis, 267430
simvastatin	Immunodeficiency
simvastatin	Leukocyte adhesion deficiency, 116920
simvastatin	Aplastic anemia
propafenone	Heart block, progressive, type I, 113900
propafenone	Sick sinus syndrome, 608567
propafenone	Acquired long QT syndrome
propafenone	Heart block
propafenone	Ventricular fibrillation, idiopathic, 603829
propafenone	Acquired long QT syndrome, susceptibility to
propafenone	Long QT syndrome-2
propafenone	Long QT syndrome
propafenone	Ventricular fibrillation, idiopathic
propafenone	Heart block, nonprogressive, 113900
propafenone	Long QT syndrome-3, 603830
propafenone	Brugada syndrome
propafenone	Colchicine resistance
propafenone	Sick sinus syndrome
propafenone	Brugada syndrome, 601144
verapamil	Ataxia
verapamil	Thyrotoxic periodic paralysis
verapamil	Sick sinus syndrome, 608567
verapamil	Epilepsy, generalized idiopathic, 600669
verapamil	Heart block
verapamil	Persistent hyperinsulinemic hypoglycemia of infancy, 256450
verapamil	Long QT syndrome-2
verapamil	Thyrotoxic periodic paralysis, susceptibility to, 188580
verapamil	Hypokalemic periodic paralysis, 170400
verapamil	Diabetes mellitus
verapamil	Heart block, nonprogressive, 113900
verapamil	Long QT syndrome-3, 603830
verapamil	Epilepsy
verapamil	Persistent hyperinsulinemic hypoglycemia of infancy
verapamil	Brugada syndrome
verapamil	Night blindness, congenital stationary, X-linked, type 2, 300071
verapamil	Malignant hyperthermia susceptibility 5, 601887
verapamil	Hypokalemic periodic paralysis
verapamil	Ataxia, episodic
verapamil	Brugada syndrome, 601144
verapamil	Malignant hyperthermia susceptibility
verapamil	Heart block, progressive, type I, 113900
verapamil	Acquired long QT syndrome
verapamil	Diabetes mellitus, permanent neonatal, with neurologic features, 606176
verapamil	Ventricular fibrillation, idiopathic, 603829
verapamil	Acquired long QT syndrome, susceptibility to
verapamil	Timothy syndrome
verapamil	Long QT syndrome
verapamil	Epilepsy, juvenile myoclonic, 606904
verapamil	Ventricular fibrillation, idiopathic
verapamil	Night blindness
verapamil	Diabetes, permanent neonatal, 606176
verapamil	Sick sinus syndrome
verapamil	Timothy syndrome, 601005
atazanavir	Colchicine resistance
secobarbital	Epilepsy
secobarbital	Epilepsy, juvenile myoclonic, 606904
ibuprofen	Dysalbuminemic hyperthyroxinemia
ibuprofen	Analbuminemia
mestranol	HDL cholesterol level QTL
mestranol	Migraine, susceptibility to, 157300
mestranol	HDL response to hormone replacement, augmented
mestranol	Estrogen resistance
mestranol	Migraine
hexobarbital	Epilepsy
hexobarbital	Epilepsy, juvenile myoclonic, 606904
repaglinide	Hypoglycemia of infancy, leucine-sensitive, 240800
repaglinide	Diabetes mellitus
repaglinide	Persistent hyperinsulinemic hypoglycemia of infancy
repaglinide	Hypoglycemia
repaglinide	Diabetes mellitus, 125853
repaglinide	Bartter syndrome
repaglinide	Diabetes, permanent neonatal, 606176
repaglinide	Bartter syndrome, type 2, 241200
repaglinide	Diabetes mellitus, permanent neonatal, with neurologic features, 606176
repaglinide	Persistent hyperinsulinemic hypoglycemia of infancy, 256450
repaglinide	Hypoglycemia of infancy, persistent hyperinsulinemic, 256450
ethotoin	Ventricular fibrillation, idiopathic
ethotoin	Heart block, progressive, type I, 113900
ethotoin	Sick sinus syndrome, 608567
ethotoin	Heart block, nonprogressive, 113900
ethotoin	Heart block
ethotoin	Long QT syndrome-3, 603830
ethotoin	Brugada syndrome
ethotoin	Ventricular fibrillation, idiopathic, 603829
ethotoin	Sick sinus syndrome
ethotoin	Long QT syndrome
ethotoin	Brugada syndrome, 601144
pyridostigmine	Blood group, Yt system, 112100
pyridostigmine	Blood group
edrophonium	Blood group, Yt system, 112100
edrophonium	Blood group
\.


--
-- Data for Name: trial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trial (trial_id, title, start_date, completion_date, participants, status, institution_name, main_researcher_id) FROM stdin;
1	A Controlled Study of Uric Acid on the Progression of IgA Nephropathy	2007-07-01	2009-06-01	40	Completed	Sun Yat-sen University	122
2	A Pilot Study of the Treatment of Central Serous Chorioretinopathy With Ketoconazole	2005-05-01	2008-04-01	5	Completed	Manhattan Eye, Ear & Throat Hospital	49
3	A Pilot Trial of Modafinil for Treatment of Methamphetamine Dependence	2008-01-01	2011-06-01	20	Completed	California Pacific Medical Center Research Institute	31
4	A Randomized Controlled Trial of Oral Naproxen and Transdermal Estradiol for Bleeding in LNG-IUC	2008-11-01	2011-01-01	129	Completed	Washington University School of Medicine	109
5	Aizthromycin or Clarithromycin in H-pylori Eradication Regimen	2011-03-01	2012-03-01	78	Completed	Shahid Sadoughi University of Medical Sciences and Health Services	7
6	Allogeneic Hematopoietic Stem Cell Transplantation for Relapsed or Refractory High-Risk NBL.	2008-09-01	2012-06-01	2	Terminated	Nationwide Children's Hospital	96
7	Allogeneic Stem Cell Transplant After ATG, High-Dose Melphalan, and Fludarabine for Patients With Metastatic Breast Cancer	2003-07-01	2008-03-01	5	Terminated	University of California, San Diego	22
8	Allogeneic Transplantation Using TL1 & ATG for Older Patients With Hematologic Malignancies	2003-03-01	2015-01-01	299	Completed	Stanford University	90
9	Anesthetics in Rhytidoplasty - A Comparison Study	2013-09-01	2014-06-01	30	Completed	Mercy Facial Plastic Surgery Center	60
10	Anti-inflammatory Treatment at the Onset of Necrotizing Enterocolitis (NEC) in Preterm Infants	2009-09-01	2012-11-01	2	Terminated	NorthShore University HealthSystem Research Institute	9
11	Antibiotic Prophylaxis for Simple Hand Lacerations	2010-02-01	2012-02-01	73	Terminated	State University of New York - Downstate Medical Center	99
12	Antibiotic Therapy in Preventing Early Infection in Patients With Multiple Myeloma Who Are Receiving Chemotherapy	1997-03-01	2012-01-01	212	Completed	University of Rochester	32
12	Antibiotic Therapy in Preventing Early Infection in Patients With Multiple Myeloma Who Are Receiving Chemotherapy	1997-03-01	2012-01-01	212	Completed	University of Rochester	32
14	Aspirin Attenuates Inflammation in Human Cerebral Aneurysms	2011-08-01	2014-08-01	11	Completed	University of Iowa	18
15	Asthma Clinical Research Network (ACRN) Trial - Macrolides in Asthma (MIA)	2006-06-01	2009-04-01	92	Completed	Milton S. Hershey Medical Center	114
16	Atorvastatin Treatment to Attenuate the Progression of Cardiovascular Disease in Hemodialysis Patients	2006-11-01	2008-12-01	446	Completed	Ege University	25
17	Atorvastatin for Preventing Occlusion and Restenosis After Intracranial Artery Stenting	2011-01-01	2014-12-01	100	Active, not recruiting	Jinling Hospital, China	121
18	Beneficial Effect of Salicylates: Insulin Action, Secretion or Clearance?	2010-07-01	2013-11-01	41	Completed	Stanford University	34
19	Bortezomib, Melphalan, and Dexamethasone in Treating Patients With Primary Amyloidosis or Light Chain Deposition Disease	2007-09-01	2010-10-01	35	Completed	Barbara Ann Karmanos Cancer Institute	45
20	Bosentan for Poorly Controlled Asthma	2008-12-01	2010-09-01	11	Terminated	University of Connecticut Health Center	67
21	Caspofungin Maximum Tolerated Dose in Patients With Invasive Aspergillosis	2006-10-01	2009-10-01	46	Completed	University of Cologne	81
22	Cisplatin, Etoposide, and Cyclophosphamide in Treating Patients With Extensive-Stage Small Cell Lung Cancer	2003-06-01	2010-05-01	8	Completed	Gundersen Lutheran Health System	92
23	Cocaine Withdrawal and Pharmacotherapy Response	2007-09-01	2013-01-01	77	Completed	Yale University	73
24	Combination Chemotherapy Based on Risk of Relapse in Treating Young Patients With Acute Lymphoblastic Leukemia	2000-07-01	2012-01-01	4559	Completed	University of Schleswig-Holstein	70
25	Combination Chemotherapy Followed By Autologous Stem Cell Transplant, and White Blood Cell Infusions in Treating Patients With Non-Hodgkin's Lymphoma	2004-03-01	2013-03-01	15	Completed	Barbara Ann Karmanos Cancer Institute	64
26	Comparing Smoking Treatment Programs for Lighter Smokers - 1	2003-09-01	2009-06-01	260	Completed	University of Pennsylvania	84
27	Comparing the Effectiveness Between Ritonavir Boosted Atazanavir and Efavirenz for the First HIV Treatment	2005-09-01	2009-09-01	71	Completed	International Medical Center of Japan	100
28	Comparing the Efficacy of Tacrolimus and Mycophenolate Mofetil for the Initial Therapy of Active Lupus Nephritis	2005-09-01	2014-06-01	150	Completed	Tuen Mun Hospital	13
29	Comparison of Blood Pressure Medications on Metabolism	2004-01-01	2008-07-01	21	Completed	University of New Mexico	58
30	Comparison of Cephalexin Versus Clindamycin for Suspected CA-MRSA Skin Infections	2006-09-01	2009-08-01	200	Completed	Johns Hopkins University	1
31	Comparison of Methotrexate vs Placebo in Corticosteroid-dependent Ulcerative Colitis	2007-09-01	2014-06-01	110	Completed	Centre Hospitalier Universitaire de Besancon	28
32	Comparison of the Efficacy of Topical Ibuprofen to Oral Ibuprofen in Adolescent Athletes	2006-05-01	2009-04-01	60	Terminated	Akron Children's Hospital	24
33	Craving, Binge Eating and Obesity	2005-12-01	2011-03-01	61	Completed	Yale University	69
34	Cryptococcal Optimal ART Timing Trial	2010-11-01	2013-03-01	177	Completed	University of Minnesota - Clinical and Translational Science Institute	17
35	Detection of Plaque Inflammation by Positron Emission Tomography (PET)-Effects of Simvastatin on Plaque Inflammation	2004-09-01	2009-04-01	43	Completed	Kurume University	37
36	Determine the Effects of Gene Differences and Voriconazole on Enzyme CYP2B6 Activity in the Liver in Healthy Volunteers	2010-03-01	2013-04-01	61	Completed	Indiana University	124
37	Developing Adaptive Treatment Strategies for Children and Adolescents With Obsessive-compulsive Disorder.	2010-08-01	2013-12-01	144	Completed	University of Sao Paulo	94
38	Diagnosis and Therapy of Vulnerable Atherosclerotic Plaque	2005-09-01	2009-01-01	300	Completed	Aristotle University Of Thessaloniki	80
39	Distribution of Bupropion and Varenicline to Increase Smoking Cessation Attempts	2010-04-01	2011-12-01	923	Completed	Centre for Addiction and Mental Health	20
40	Does Allopurinol Prolong a Treated, Acute Gout Flare?	2007-12-01	2013-06-01	35	Completed	Wilford Hall Medical Center	44
41	Early Use of Rosuvastatin in Acute Coronary Syndromes: Targeting Platelet-Leukocyte Interactions	2011-06-01	2014-02-01	54	Completed	University of Kentucky	106
42	Effect of Daily Low Dose Aspirin on Exhaled Inflammatory Mediators in Normal Subjects	2009-05-01	2009-08-01	4	Completed	Brigham and Women's Hospital	23
43	Effect of Diabetes Mellitus on Cholesterol Metabolism	2008-08-01	2013-07-01	52	Completed	Medical College of Wisconsin	102
44	Effect of Ezetimibe or Simvastatin or Both on Low Densitiy Lipoprotein -Subfractions in Patients With Type 2 Diabetes	2007-11-01	2010-06-01	41	Completed	University Hospital Freiburg	56
45	Effectiveness of Modafinil and D-amphetamine in Treating Cocaine Dependent Individuals	2006-03-01	2012-01-01	73	Completed	The University of Texas Health Science Center, Houston	53
46	Effects of Statins on the Pharmacokinetics for Midazolam in Healthy Volunteers	2006-06-01	2008-08-01	11	Completed	Hamamatsu University	79
47	Efficacy Study of Prophylactic Ibuprofen Versus Placebo on Pain Relief and Success Rates of Medical Abortion	2009-10-01	2010-10-01	61	Completed	Sheba Medical Center	86
48	Efficacy of Intravenous Dexketoprofen and Tenoxicam on Propofol Associated Injection Pain	2014-11-01	2015-04-01	118	Completed	T.C. ORDU ÜNİVERSİTESİ	126
49	Etoposide, Cyclophosphamide, Thalidomide, Celecoxib, and Fenofibrate in Relapsed or Progressive Cancer	2005-01-01	2013-12-01	101	Completed	Dana-Farber Cancer Institute	68
50	Evaluating the Transporter Protein Inhibitor Probenecid In Patients With Epilepsy	2006-03-01	2011-06-01	8	Terminated	The Ohio State University	48
51	Evaluation of SQ109, High-dose Rifampicin, and Moxifloxacin in Adults With Smear-positive Pulmonary TB in a MAMS Design	2013-04-01	2014-12-01	365	Active, not recruiting	Ludwig-Maximilians - University of Munich	74
52	Evaluation of the Use of Indomethacin as Co-treatment in Women With Preterm Labor and High Risk of Intraamniotic Inflammation	2012-04-01	2014-09-01	16	Completed	Fundació Clínic per la Recerca Biomèdica	97
53	FOTO: Five Consecutive Days on Treatment With Efavirenz, Tenofovir, and Emtricitabine Followed by Two Days Off Treatment Versus Continuous Treatment	2006-08-01	2009-12-01	60	Completed	Community Research Initiative of New England	11
54	Fluconazole Prophylaxis for the Prevention of Candidiasis in Infants Less Than 750 Grams Birthweight	2008-11-01	2013-04-01	362	Completed	Duke University Medical Center	16
55	Fluoxetine for Motor, Aphasia, and Neglect Recovery After Ischemic Stroke	2013-04-01	2015-12-01	0	Withdrawn	Spaulding Rehabilitation Hospital	88
56	Fluoxetine for Obsessive-Compulsive Disorder in Children and Adolescents With Bipolar Disorder	2005-12-01	2010-09-01	13	Terminated	Massachusetts General Hospital	30
57	Fluvastatin, Rosuvastatin Added to Pegylated Interferon and Ribavirin	2007-06-01	2010-10-01	40	Completed	Bader, Ted, M.D.	108
58	Gastric pH and Anthocyanin Absorption	2010-05-01	2010-12-01	13	Completed	USDA Beltsville Human Nutrition Research Center	42
59	Gefitinib With or Without Simvastatin in Non-Small Cell Lung Cancer (NSCLC)	2006-05-01	2011-03-01	110	Completed	National Cancer Center, Korea	46
60	Improved Induction and Maintenance Immunosuppression in Kidney Transplantation	2004-04-01	2011-06-01	180	Completed	University of Nebraska Medical Center	87
61	Indomethacin Germinal Matrix Hemorrhage/Intraventricular Hemorrhage (GMH/IVH) Prevention Trial	1989-09-01	2012-03-01	630	Completed	Yale University	63
62	Inflammation and Vascular Function in Atherosclerosis	2005-08-01	2011-02-01	44	Completed	Brigham and Women's Hospital	52
63	Low Doses Corticosteroids as Adjuvant Therapy for the Treatment of Severe H1N1 Flu	2010-03-01	2011-12-01	40	Terminated	University of Versailles	19
64	Maraviroc Plus Darunavir/Ritonavir for Treatment-Naïve Patients Infected With R5-tropic HIV-1	2010-05-01	2013-04-01	25	Completed	Northwestern University	5
65	Melphalan and Palifermin in Treating Patients Undergoing An Autologous Peripheral Stem Cell Transplant for Stage II or III Multiple Myeloma	2007-06-01	2012-09-01	38	Completed	Barbara Ann Karmanos Cancer Institute	78
66	Metoclopramide for Migraine: A Dose Finding Study	2008-04-01	2010-03-01	349	Completed	Montefiore Medical Center	8
67	MgSO4 vs Metoclopramide for Headache in Pregnant Women	2008-08-01	2010-03-01	0	Withdrawn	Women and Infants Hospital of Rhode Island	35
68	Mild Versus Potent Corticosteroids as Treatment for Phimosis in Children	2009-08-01	2009-09-01	0	Withdrawn	Chelsea and Westminster NHS Foundation Trust	3
69	Modafinil Treatment for Sleep/Wake Disturbances in Older Adults	2008-02-01	2012-10-01	2	Terminated	VA Palo Alto Health Care System	39
70	Modafinil for Treatment of Cognitive Dysfunction in Schizophrenia	2005-09-01	2012-12-01	38	Completed	University of California, Davis	76
71	Monoclonal Antibody Therapy, Combination Chemotherapy, and Peripheral Stem Cell Transplant in Treating Patients With Relapsed or Refractory Non-Hodgkin's Lymphoma	2000-04-01	2014-12-01	50	Completed	University of Nebraska	54
71	Monoclonal Antibody Therapy, Combination Chemotherapy, and Peripheral Stem Cell Transplant in Treating Patients With Relapsed or Refractory Non-Hodgkin's Lymphoma	2000-04-01	2014-12-01	50	Completed	University of Nebraska	54
73	NSAIDs in Acute Achilles Tendinopathy: Effect on Pain Control, Leg Stiffness and Functional Recovery in Athletes	2009-08-01	2012-02-01	56	Completed	Argentine Tennis Association	43
74	Nephropathy In Type 2 Diabetes and Cardio-renal Events	2003-03-01	2012-09-01	850	Active, not recruiting	Second University of Naples	98
75	Omeprazole and Reflux Disease - Improvement of Clinical Outcome by Genotype-adjusted Dosing	2007-04-01	2010-12-01	68	Terminated	Dr. Margarete Fischer-Bosch-Institut für Klinische Pharmakologie (IKP) am Robert-Bosch-Krankenhaus (RBK)	71
75	Omeprazole and Reflux Disease - Improvement of Clinical Outcome by Genotype-adjusted Dosing	2007-04-01	2010-12-01	68	Terminated	Dr. Margarete Fischer-Bosch-Institut für Klinische Pharmakologie (IKP) am Robert-Bosch-Krankenhaus (RBK)	71
77	Open Label Study for the Functional Characterization of Drug Metabolism and Transport	2012-01-01	2015-05-01	144	Completed	University Hospital Tuebingen	71
77	Open Label Study for the Functional Characterization of Drug Metabolism and Transport	2012-01-01	2015-05-01	144	Completed	University Hospital Tuebingen	71
79	Opioid Effects on Swallowing and Esophageal Sphincter Pressure	2010-10-01	2010-11-01	14	Completed	University Hospital Orebro	50
80	Optima: Optimizing Prograf Therapy in Maintenance Allografts II	2003-08-01	2008-07-01	63	Completed	East Carolina University	82
81	Organ Donation and Hydrocortisone Treatment	2008-05-01	2011-12-01	38	Terminated	Kuopio University Hospital	103
82	Oxycodone Extended-release in the Treatment of Perioperative Pain in Patients Undergoing Orthopaedic Surgery	2012-03-01	2012-09-01	40	Completed	Hospital Central Dr. Luis Ortega	6
83	Pharmacokinetic Interactions Between Antiretroviral Agents and Antimalarial Drug Combinations	2005-07-01	2010-12-01	38	Completed	University of California, San Francisco	27
84	Pharmacokinetic, Safety and Efficacy of Intermittent Application of Caspofungin for Antifungal Prophylaxis	2011-04-01	2013-10-01	25	Completed	Wuerzburg University Hospital	118
85	Pilot Study for HLA Identical Living Donor Renal Transplant Recipients	2002-06-01	2007-12-01	20	Completed	University of Cincinnati	89
86	Prevention of Pegfilgrastim-Induced Bone Pain (PIBP)	2008-06-01	2012-03-01	510	Completed	University of Rochester	32
86	Prevention of Pegfilgrastim-Induced Bone Pain (PIBP)	2008-06-01	2012-03-01	510	Completed	University of Rochester	32
88	Prophylactic Phenobarbital After Neonatal Seizures	2010-09-01	2014-11-01	13	Terminated	University of Rochester	93
89	Prophylaxis to Reduce Postoperative Atrial Fibrillation in Cardiac Surgery	2009-08-01	2012-02-01	304	Completed	Maine Medical Center	83
90	Prothrombin Times Outside the Therapeutic Range in Otherwise Stable Patients	2006-07-01	2009-04-01	160	Completed	McMaster University	95
91	Radical Lung Radiotherapy Plus Nelfinavir	2012-02-01	2012-10-01	0	Withdrawn	Oxford University Hospitals NHS Trust	66
92	Randomized Clinical Trial to Assess the Efficacy and Safety of Concomitant Use of Rifampicin and Efavirenz 600 X 800mg	2007-01-01	2012-10-01	130	Terminated	Oswaldo Cruz Foundation	113
93	Recovery of Diaphragmatic Function After Neuromuscular Blockade and Sugammadex	2013-10-01	2014-12-01	75	Completed	University Hospital, Antwerp	111
94	Resistance to Antithrombotic Therapy	2008-05-01	2012-05-01	46	Completed	Medical University of Vienna	14
95	Rituximab and Combination Chemotherapy Followed by Bone Marrow or Peripheral Stem Cell Transplantation in Treating Patients With Relapsed or Refractory Non-Hodgkin's Lymphoma	2000-09-01	2011-01-01	44	Completed	University of Nebraska	54
95	Rituximab and Combination Chemotherapy Followed by Bone Marrow or Peripheral Stem Cell Transplantation in Treating Patients With Relapsed or Refractory Non-Hodgkin's Lymphoma	2000-09-01	2011-01-01	44	Completed	University of Nebraska	54
97	Rosuvastatin Prevent Contrast Induced Acute Kidney Injury in Patients With Diabetes	2008-12-01	2011-11-01	2998	Completed	Shenyang Northern Hospital	36
98	Safety Study of Combined Azithromycin, Ivermectin and Albendazole for Trachoma and Lymphatic Filariasis	2014-02-01	2014-07-01	0	Withdrawn	Emory University	38
99	Safety and Efficacy Trial of Danazol in Patients With Fanconi Anemia or Dyskeratosis Congenita	2009-11-01	2014-05-01	5	Terminated	Children's Hospital Boston	15
100	Safety and Efficacy of Bosentan in Patients With Diastolic Heart Failure and Secondary Pulmonary Hypertension	2009-01-01	2014-06-01	20	Completed	University Teaching Hospital Hall in Tirol	119
101	Salivary Epidermal Growth Factor (EGF) Concentration Before and After Treatment of Reflux Laryngitis	2009-01-01	2011-07-01	36	Completed	Faculdade de Ciências Médicas da Santa Casa de São Paulo	10
102	Salsalate for Insulin Resistance in Schizophrenia	2010-08-01	2011-12-01	13	Completed	University of Maryland	91
103	Short-term Atorvastatin's Effect on Acute Kidney Injury Following Cardiac Surgery	2009-07-01	2015-12-01	653	Active, not recruiting	Vanderbilt University	29
104	Simvastatin With or Without Ezetimibe and Atherothrombotic Biomarker Assessment	2009-01-01	2011-11-01	15	Completed	University of Maryland	75
105	Simvastatin in Aneurysmal Subarachnoid Haemorrhage (STASH) a Multicentre Randomised Controlled Clinical Trial	2007-01-01	2014-02-01	803	Completed	Cambridge University Hospitals NHS Foundation Trust	77
106	Single Center Pilot Study of Corticosteroid Discontinuation in Liver Transplant Recipients	2002-10-01	2008-01-01	40	Completed	University of Cincinnati	21
107	Sirolimus to Treat Cowden Syndrome and Other PTEN Hamartomatous Tumor Syndromes	2008-07-01	2012-10-01	18	Completed	National Institutes of Health Clinical Center (CC)	4
108	Sirolimus, Tacrolimus, Thymoglobulin and Rituximab as Graft-versus-Host-Disease Prophylaxis in Patients Undergoing Haploidentical and HLA Partially Matched Donor Hematopoietic Cell Transplantation	2010-08-01	2013-06-01	1	Terminated	Barbara Ann Karmanos Cancer Institute	123
109	Sorafenib, Cisplatin, and Etoposide in Treating Patients With Extensive-Stage Small Cell Lung Cancer	2008-07-01	2012-07-01	18	Terminated	Case Comprehensive Cancer Center	2
110	Statin Therapy in Heart Failure: Potential Mechanisms of Benefit	2005-08-01	2009-02-01	27	Completed	University of California, Los Angeles	107
111	Statin Therapy to Improve Atherosclerosis in HIV Patients	2009-09-01	2014-01-01	40	Completed	Massachusetts General Hospital	104
112	Statins to Reduce D-dimer Levels in Patients With Venous Thrombosis	2007-05-01	2011-05-01	10	Terminated	Università degli Studi dell'Insubria	117
113	Stem Cell Transplantation in Patients With High-Risk and Recurrent Pediatric Sarcomas	2002-08-01	2012-04-01	60	Completed	National Institutes of Health Clinical Center (CC)	61
114	Study Evaluating Conversion From Tacrolimus to Sirolimus in Stable Kidney Transplant Recipients Receiving Myfortic	2007-05-01	2010-11-01	13	Completed	California Pacific Medical Center Research Institute	112
115	Tacrolimus and Sirolimus as Prophylaxis After Allogenic Non-myeloablative Peripheral Blood Stem Cell Transplantation	2006-01-01	2009-07-01	31	Completed	Dana-Farber Cancer Institute	115
116	The Additive Anti-inflammatory Effect of Simvastatin in Combination With Inhaled Corticosteroids in Asthma	2008-12-01	2009-09-01	53	Completed	Mahidol University	59
117	The Discriminative Effects of Tramadol in Humans	2007-11-01	2011-08-01	12	Completed	Johns Hopkins University	26
118	The Effect and Safety of Different Intensity Anticoagulation Therapy in Elderly Patients With Non-valvular Atrial Fibrillation	2010-01-01	2012-04-01	260	Completed	Nanjing Medical University	120
119	The Effect of Azithromycin in Patients With Chronic Obstructive Pulmonary Disease (COPD) and Chronic Productive Cough	2009-09-01	2012-02-01	84	Completed	Isala Klinieken	40
120	The Effect of XueZhiKang on Fatigue：Comparing With Simvastatin	2012-08-01	2013-09-01	60	Completed	Wenzhou Medical University	47
121	The Impact of Proton Pump Inhibitors on the Fecal Microbiome	2013-03-01	2013-12-01	15	Completed	Mayo Clinic	51
122	Treatment of Acute Lymphoblastic Leukemia in Children	2000-09-01	2011-05-01	498	Completed	Dana-Farber Cancer Institute	65
123	Treatment of HDL to Reduce the Incidence of Vascular Events HPS2-THRIVE	2007-01-01	2012-10-01	25673	Completed	University of Oxford	41
124	Treatment of Post Stroke Fatigue With a Wakefulness Promoting Agent	2012-10-01	2015-03-01	41	Terminated	Herlev Hospital	57
125	Trial of Early Aggressive Drug Therapy in Juvenile Idiopathic Arthritis	2007-05-01	2010-10-01	85	Completed	Seattle Children's Hospital	12
126	Umbilical Cord Blood Stem Cell Transplant in Treating Patients With Hematologic Cancer or Other Disease	2007-01-01	2015-01-01	2	Completed	Barbara Ann Karmanos Cancer Institute	116
127	Ursodeoxycholic Acid in the Treatment of Intrahepatic Cholestasis of Pregnancy	1998-01-01	1998-12-01	20	Completed	Turku University Hospital	110
128	Vascular and Metabolic Effects of Vytorin vs Simvastatin	2011-11-01	2012-11-01	204	Completed	Gachon University Gil Medical Center	62
129	Voriconazole Pharmacokinetics in Children With Gastrointestinal Graft Versus Host Disease	2008-12-01	2012-07-01	5	Completed	Duke University Medical Center	85
130	Voriconazole Trough Plasma Levels : Genetic Polymorphism, Efficacy, Safety in Patients With Hematologic Malignancy	2010-08-01	2014-04-01	10	Terminated	Asan Medical Center	105
131	Warfarin Versus Aspirin in Reduced Cardiac Ejection Fraction (WARCEF) Trial	2002-10-01	2014-07-01	2305	Completed	Columbia University	101
132	Warfarine in Unexplained Oligohydramnios	2009-01-01	2011-07-01	200	Completed	Woman's Health University Hospital, Egypt	125
\.


--
-- Data for Name: trial_drug_disease; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trial_drug_disease (trial_id, drug_name, disease_name) FROM stdin;
1	allopurinol	Xanthinuria, type I, 278300
1	allopurinol	Xanthinuria, type I
6	cyclosporine	Colchicine resistance
7	methotrexate	Analbuminemia
7	methotrexate	Dysalbuminemic hyperthyroxinemia
7	cyclosporine	Colchicine resistance
8	cyclosporine	Colchicine resistance
9	metoclopramide	Dystonia, myoclonic, 159900
9	metoclopramide	Dystonia
10	hydrocortisone	Asthma
10	hydrocortisone	Malaria, resistance to, 248310
10	hydrocortisone	Cortisol resistance
10	hydrocortisone	Obesity, adrenal insufficiency, and red hair
10	hydrocortisone	Atherosclerosis, susceptibility to
10	hydrocortisone	Asthma, dimished response to antileukotriene treatment in, 600807
10	hydrocortisone	Malaria
10	hydrocortisone	Atherosclerosis
10	hydrocortisone	Obesity
12	ciprofloxacin	Analbuminemia
12	ciprofloxacin	Dysalbuminemic hyperthyroxinemia
12	ciprofloxacin	DNA topoisomerase II, resistance to inhibition of, by amsacrine
12	ciprofloxacin	DNA topoisomerase
12	ciprofloxacin	Analbuminemia
12	ciprofloxacin	Dysalbuminemic hyperthyroxinemia
12	ciprofloxacin	DNA topoisomerase II, resistance to inhibition of, by amsacrine
12	ciprofloxacin	DNA topoisomerase
16	atorvastatin	Tall stature
16	atorvastatin	Tall stature, susceptibility to
16	atorvastatin	Hypercholesterolemia
16	atorvastatin	Obesity, resistance to
16	atorvastatin	Hypolactasia, adult type, 223100
16	atorvastatin	Immunodeficiency
16	atorvastatin	Renal tubular dysgenesis, 267430
16	atorvastatin	Hyperapobetalipoproteinemia
16	atorvastatin	Hypobetalipoproteinemia
16	atorvastatin	Immunodeficiency, X-linked, with hyper-IgM, 308230
16	atorvastatin	Statins, attenuated cholesterol lowering by
16	atorvastatin	Glioblastoma
16	atorvastatin	Hyperapobetalipoproteinemia, susceptibility to
16	atorvastatin	Malaria, cerebral, susceptibility to
16	atorvastatin	Insulin resistance, severe, digenic, 604367
16	atorvastatin	Hypercholesterolemia, due to ligand-defective apo B, 144010
16	atorvastatin	Hypertension
16	atorvastatin	Dementia
16	atorvastatin	Obesity
16	atorvastatin	Obesity, severe, 601665
16	atorvastatin	Migraine
16	atorvastatin	Diabetes mellitus, insulin-resistant, with acanthosis nigricans and hypertension, 604367
16	atorvastatin	Coronary artery disease
16	atorvastatin	Asthma, susceptibility to, 600807
16	atorvastatin	Preeclampsia, susceptibility to
16	atorvastatin	Migraine without aura, susceptibility to, 157300
16	atorvastatin	Renal tubular dysgenesis
16	atorvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
16	atorvastatin	Glioblastoma, susceptibility to, 137800
16	atorvastatin	Diabetes mellitus
16	atorvastatin	Statins
16	atorvastatin	Hypolactasia, adult type
16	atorvastatin	Abetalipoproteinemia
16	atorvastatin	Hypertension, essential, susceptibility to, 145500
16	atorvastatin	Insulin resistance
16	atorvastatin	Asthma
16	atorvastatin	Lipodystrophy, familial partial, 151660
16	atorvastatin	Coronary artery disease, susceptibility to
16	atorvastatin	Septic shock, susceptibility to
16	atorvastatin	Sepsis
16	atorvastatin	Preeclampsia
16	atorvastatin	Coronary artery spasm, susceptibility to
16	atorvastatin	Malaria
16	atorvastatin	Lipodystrophy
16	atorvastatin	Dementia, vascular, susceptibility to
17	atorvastatin	Tall stature
17	atorvastatin	Tall stature, susceptibility to
17	atorvastatin	Hypercholesterolemia
17	atorvastatin	Obesity, resistance to
17	atorvastatin	Hypolactasia, adult type, 223100
17	atorvastatin	Immunodeficiency
17	atorvastatin	Renal tubular dysgenesis, 267430
17	atorvastatin	Hyperapobetalipoproteinemia
17	atorvastatin	Hypobetalipoproteinemia
17	atorvastatin	Immunodeficiency, X-linked, with hyper-IgM, 308230
17	atorvastatin	Statins, attenuated cholesterol lowering by
17	atorvastatin	Glioblastoma
17	atorvastatin	Hyperapobetalipoproteinemia, susceptibility to
17	atorvastatin	Malaria, cerebral, susceptibility to
17	atorvastatin	Insulin resistance, severe, digenic, 604367
17	atorvastatin	Hypercholesterolemia, due to ligand-defective apo B, 144010
17	atorvastatin	Hypertension
17	atorvastatin	Dementia
17	atorvastatin	Obesity
17	atorvastatin	Obesity, severe, 601665
17	atorvastatin	Migraine
17	atorvastatin	Diabetes mellitus, insulin-resistant, with acanthosis nigricans and hypertension, 604367
17	atorvastatin	Coronary artery disease
17	atorvastatin	Asthma, susceptibility to, 600807
17	atorvastatin	Preeclampsia, susceptibility to
17	atorvastatin	Migraine without aura, susceptibility to, 157300
17	atorvastatin	Renal tubular dysgenesis
17	atorvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
17	atorvastatin	Glioblastoma, susceptibility to, 137800
17	atorvastatin	Diabetes mellitus
17	atorvastatin	Statins
17	atorvastatin	Hypolactasia, adult type
17	atorvastatin	Abetalipoproteinemia
17	atorvastatin	Hypertension, essential, susceptibility to, 145500
17	atorvastatin	Insulin resistance
17	atorvastatin	Asthma
17	atorvastatin	Lipodystrophy, familial partial, 151660
17	atorvastatin	Coronary artery disease, susceptibility to
17	atorvastatin	Septic shock, susceptibility to
17	atorvastatin	Sepsis
17	atorvastatin	Preeclampsia
17	atorvastatin	Coronary artery spasm, susceptibility to
17	atorvastatin	Malaria
17	atorvastatin	Lipodystrophy
17	atorvastatin	Dementia, vascular, susceptibility to
20	bosentan	Migraine
20	bosentan	Hirschsprung disease-2, 600155
20	bosentan	Waardenburg-Shah syndrome, 277580
20	bosentan	Migraine, resistance to, 157300
20	bosentan	Waardenburg-Shah syndrome
20	bosentan	ABCD syndrome, 600501
20	bosentan	Hirschsprung disease
20	bosentan	Cholestasis, progressive familial intrahepatic 2, 601847
20	bosentan	ABCD syndrome
20	bosentan	Cholestasis
22	etoposide	DNA topoisomerase II, resistance to inhibition of, by amsacrine
22	etoposide	DNA topoisomerase
23	carvedilol	Resting heart rate, 607276
23	carvedilol	Atrioventricular septal defect, 600309
23	carvedilol	Beta-2-adrenoreceptor agonist, reduced response to
23	carvedilol	Congestive heart failure, susceptibility to
23	carvedilol	Colchicine resistance
23	carvedilol	Obesity, susceptibility to, 601665
23	carvedilol	Oculodentodigital dysplasia, 164200
23	carvedilol	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
23	carvedilol	Diabetes mellitus
23	carvedilol	Syndactyly, type III, 186100
23	carvedilol	Hypoplastic left heart syndrome
23	carvedilol	Long QT syndrome
23	carvedilol	Long QT syndrome-2
23	carvedilol	Acquired long QT syndrome, susceptibility to
23	carvedilol	Atrioventricular block
23	carvedilol	Asthma
23	carvedilol	Syndactyly
23	carvedilol	Asthma, nocturnal, susceptibility to
23	carvedilol	Hypoplastic left heart syndrome, 241550
23	carvedilol	Resting heart rate
23	carvedilol	Oculodentodigital dysplasia
23	carvedilol	Congestive heart failure
23	carvedilol	Obesity
23	carvedilol	Acquired long QT syndrome
24	methotrexate	Analbuminemia
24	methotrexate	Dysalbuminemic hyperthyroxinemia
24	etoposide	DNA topoisomerase II, resistance to inhibition of, by amsacrine
24	etoposide	DNA topoisomerase
25	etoposide	DNA topoisomerase II, resistance to inhibition of, by amsacrine
25	etoposide	DNA topoisomerase
26	bupropion	Orthostatic intolerance
26	bupropion	Orthostatic intolerance, 604715
29	carvedilol	Resting heart rate, 607276
29	carvedilol	Atrioventricular septal defect, 600309
29	carvedilol	Beta-2-adrenoreceptor agonist, reduced response to
29	carvedilol	Congestive heart failure, susceptibility to
29	carvedilol	Colchicine resistance
29	carvedilol	Obesity, susceptibility to, 601665
29	carvedilol	Oculodentodigital dysplasia, 164200
29	carvedilol	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
29	carvedilol	Diabetes mellitus
29	carvedilol	Syndactyly, type III, 186100
29	carvedilol	Hypoplastic left heart syndrome
29	carvedilol	Long QT syndrome
29	carvedilol	Long QT syndrome-2
29	carvedilol	Acquired long QT syndrome, susceptibility to
29	carvedilol	Atrioventricular block
29	carvedilol	Asthma
29	carvedilol	Syndactyly
29	carvedilol	Asthma, nocturnal, susceptibility to
29	carvedilol	Hypoplastic left heart syndrome, 241550
29	carvedilol	Resting heart rate
29	carvedilol	Oculodentodigital dysplasia
29	carvedilol	Congestive heart failure
29	carvedilol	Obesity
29	carvedilol	Acquired long QT syndrome
31	methotrexate	Analbuminemia
31	methotrexate	Dysalbuminemic hyperthyroxinemia
32	ibuprofen	Analbuminemia
32	ibuprofen	Dysalbuminemic hyperthyroxinemia
33	bupropion	Orthostatic intolerance
33	bupropion	Orthostatic intolerance, 604715
35	simvastatin	Aplastic anemia
35	simvastatin	Leukocyte adhesion deficiency, 116920
35	simvastatin	Immunodeficiency
35	simvastatin	Renal tubular dysgenesis, 267430
35	simvastatin	Hyperapobetalipoproteinemia
35	simvastatin	Tuberculosis, susceptibility to, 607948
35	simvastatin	Dysprothrombinemia
35	simvastatin	Statins, attenuated cholesterol lowering by
35	simvastatin	Hyperapobetalipoproteinemia, susceptibility to
35	simvastatin	Malaria, cerebral, susceptibility to
35	simvastatin	Kaposi sarcoma, susceptibility to, 148000
35	simvastatin	AIDS, rapid progression to, 609423
35	simvastatin	Tuberous sclerosis
35	simvastatin	Hypertension
35	simvastatin	Dementia
35	simvastatin	Hypoprothrombinemia
35	simvastatin	Aplastic anemia, 609135
35	simvastatin	Migraine
35	simvastatin	Hyperprothrombinemia
35	simvastatin	Coronary artery disease
35	simvastatin	Asthma, susceptibility to, 600807
35	simvastatin	Preeclampsia, susceptibility to
35	simvastatin	Migraine without aura, susceptibility to, 157300
35	simvastatin	Renal tubular dysgenesis
35	simvastatin	Leukocyte adhesion deficiency
35	simvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
35	simvastatin	Kaposi sarcoma
35	simvastatin	Coronary heart disease, susceptibility to
35	simvastatin	Diabetes mellitus
35	simvastatin	AIDS
35	simvastatin	Immunodeficiency with hyper-IgM, type 3, 606843
35	simvastatin	Statins
35	simvastatin	TSC2 angiomyolipomas, renal, modifier of, 191100
35	simvastatin	Hypertension, essential, susceptibility to, 145500
35	simvastatin	Tuberculosis
35	simvastatin	Asthma
35	simvastatin	Septic shock, susceptibility to
35	simvastatin	Sepsis
35	simvastatin	Preeclampsia
35	simvastatin	Malaria
35	simvastatin	Dementia, vascular, susceptibility to
37	fluoxetine	Anxiety-related personality traits
37	fluoxetine	Obsessive-compulsive disorder 1, 164230
37	fluoxetine	Obsessive-compulsive disorder
38	atorvastatin	Tall stature
38	atorvastatin	Tall stature, susceptibility to
38	atorvastatin	Hypercholesterolemia
38	atorvastatin	Obesity, resistance to
38	atorvastatin	Hypolactasia, adult type, 223100
38	atorvastatin	Immunodeficiency
38	atorvastatin	Renal tubular dysgenesis, 267430
38	atorvastatin	Hyperapobetalipoproteinemia
38	atorvastatin	Hypobetalipoproteinemia
38	atorvastatin	Immunodeficiency, X-linked, with hyper-IgM, 308230
38	atorvastatin	Statins, attenuated cholesterol lowering by
38	atorvastatin	Glioblastoma
38	atorvastatin	Hyperapobetalipoproteinemia, susceptibility to
38	atorvastatin	Malaria, cerebral, susceptibility to
38	atorvastatin	Insulin resistance, severe, digenic, 604367
38	atorvastatin	Hypercholesterolemia, due to ligand-defective apo B, 144010
38	atorvastatin	Hypertension
38	atorvastatin	Dementia
38	atorvastatin	Obesity
38	atorvastatin	Obesity, severe, 601665
38	atorvastatin	Migraine
38	atorvastatin	Diabetes mellitus, insulin-resistant, with acanthosis nigricans and hypertension, 604367
38	atorvastatin	Coronary artery disease
38	atorvastatin	Asthma, susceptibility to, 600807
38	atorvastatin	Preeclampsia, susceptibility to
38	atorvastatin	Migraine without aura, susceptibility to, 157300
38	atorvastatin	Renal tubular dysgenesis
38	atorvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
38	atorvastatin	Glioblastoma, susceptibility to, 137800
38	atorvastatin	Diabetes mellitus
38	atorvastatin	Statins
38	atorvastatin	Hypolactasia, adult type
38	atorvastatin	Abetalipoproteinemia
38	atorvastatin	Hypertension, essential, susceptibility to, 145500
38	atorvastatin	Insulin resistance
38	atorvastatin	Asthma
38	atorvastatin	Lipodystrophy, familial partial, 151660
38	atorvastatin	Coronary artery disease, susceptibility to
38	atorvastatin	Septic shock, susceptibility to
38	atorvastatin	Sepsis
38	atorvastatin	Preeclampsia
38	atorvastatin	Coronary artery spasm, susceptibility to
38	atorvastatin	Malaria
38	atorvastatin	Lipodystrophy
38	atorvastatin	Dementia, vascular, susceptibility to
39	bupropion	Orthostatic intolerance
39	bupropion	Orthostatic intolerance, 604715
40	allopurinol	Xanthinuria, type I, 278300
40	allopurinol	Xanthinuria, type I
41	rosuvastatin	Statins
41	rosuvastatin	Statins, attenuated cholesterol lowering by
41	rosuvastatin	Alzheimer disease, late-onset, susceptibility to, 104300
41	rosuvastatin	Placental abruption
41	rosuvastatin	Hypertension, susceptibility to, 145500
41	rosuvastatin	Coronary spasms
41	rosuvastatin	Coronary spasms, susceptibility to
41	rosuvastatin	Hypertension
41	rosuvastatin	Alzheimer disease
41	rosuvastatin	Hypertension, pregnancy-induced, 189800
43	simvastatin	Aplastic anemia
43	simvastatin	Leukocyte adhesion deficiency, 116920
43	simvastatin	Immunodeficiency
43	simvastatin	Renal tubular dysgenesis, 267430
43	simvastatin	Hyperapobetalipoproteinemia
43	simvastatin	Tuberculosis, susceptibility to, 607948
43	simvastatin	Dysprothrombinemia
43	simvastatin	Statins, attenuated cholesterol lowering by
43	simvastatin	Hyperapobetalipoproteinemia, susceptibility to
43	simvastatin	Malaria, cerebral, susceptibility to
43	simvastatin	Kaposi sarcoma, susceptibility to, 148000
43	simvastatin	AIDS, rapid progression to, 609423
43	simvastatin	Tuberous sclerosis
43	simvastatin	Hypertension
43	simvastatin	Dementia
43	simvastatin	Hypoprothrombinemia
43	simvastatin	Aplastic anemia, 609135
43	simvastatin	Migraine
43	simvastatin	Hyperprothrombinemia
43	simvastatin	Coronary artery disease
43	simvastatin	Asthma, susceptibility to, 600807
43	simvastatin	Preeclampsia, susceptibility to
43	simvastatin	Migraine without aura, susceptibility to, 157300
43	simvastatin	Renal tubular dysgenesis
43	simvastatin	Leukocyte adhesion deficiency
43	simvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
43	simvastatin	Kaposi sarcoma
43	simvastatin	Coronary heart disease, susceptibility to
43	simvastatin	Diabetes mellitus
43	simvastatin	AIDS
43	simvastatin	Immunodeficiency with hyper-IgM, type 3, 606843
43	simvastatin	Statins
43	simvastatin	TSC2 angiomyolipomas, renal, modifier of, 191100
43	simvastatin	Hypertension, essential, susceptibility to, 145500
43	simvastatin	Tuberculosis
43	simvastatin	Asthma
43	simvastatin	Septic shock, susceptibility to
43	simvastatin	Sepsis
43	simvastatin	Preeclampsia
43	simvastatin	Malaria
43	simvastatin	Dementia, vascular, susceptibility to
44	ezetimibe	Ezetimibe, nonresponse to
44	simvastatin	Aplastic anemia
44	simvastatin	Leukocyte adhesion deficiency, 116920
44	simvastatin	Immunodeficiency
44	simvastatin	Renal tubular dysgenesis, 267430
44	simvastatin	Hyperapobetalipoproteinemia
44	simvastatin	Tuberculosis, susceptibility to, 607948
44	simvastatin	Dysprothrombinemia
44	simvastatin	Statins, attenuated cholesterol lowering by
44	simvastatin	Hyperapobetalipoproteinemia, susceptibility to
44	simvastatin	Malaria, cerebral, susceptibility to
44	simvastatin	Kaposi sarcoma, susceptibility to, 148000
44	simvastatin	AIDS, rapid progression to, 609423
44	simvastatin	Tuberous sclerosis
44	simvastatin	Hypertension
44	simvastatin	Dementia
44	simvastatin	Hypoprothrombinemia
44	simvastatin	Aplastic anemia, 609135
44	simvastatin	Migraine
44	simvastatin	Hyperprothrombinemia
44	simvastatin	Coronary artery disease
44	simvastatin	Asthma, susceptibility to, 600807
44	simvastatin	Preeclampsia, susceptibility to
44	simvastatin	Migraine without aura, susceptibility to, 157300
44	simvastatin	Renal tubular dysgenesis
44	simvastatin	Leukocyte adhesion deficiency
44	simvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
44	simvastatin	Kaposi sarcoma
44	simvastatin	Coronary heart disease, susceptibility to
44	simvastatin	Diabetes mellitus
44	simvastatin	AIDS
44	simvastatin	Immunodeficiency with hyper-IgM, type 3, 606843
44	simvastatin	Statins
44	simvastatin	TSC2 angiomyolipomas, renal, modifier of, 191100
44	simvastatin	Hypertension, essential, susceptibility to, 145500
44	simvastatin	Tuberculosis
44	simvastatin	Asthma
44	simvastatin	Septic shock, susceptibility to
44	simvastatin	Sepsis
44	simvastatin	Preeclampsia
44	simvastatin	Malaria
44	simvastatin	Dementia, vascular, susceptibility to
46	simvastatin	Aplastic anemia
46	simvastatin	Leukocyte adhesion deficiency, 116920
46	simvastatin	Immunodeficiency
46	simvastatin	Renal tubular dysgenesis, 267430
46	simvastatin	Hyperapobetalipoproteinemia
46	simvastatin	Tuberculosis, susceptibility to, 607948
46	simvastatin	Dysprothrombinemia
46	simvastatin	Statins, attenuated cholesterol lowering by
46	simvastatin	Hyperapobetalipoproteinemia, susceptibility to
46	simvastatin	Malaria, cerebral, susceptibility to
46	simvastatin	Kaposi sarcoma, susceptibility to, 148000
46	simvastatin	AIDS, rapid progression to, 609423
46	simvastatin	Tuberous sclerosis
46	simvastatin	Hypertension
46	simvastatin	Dementia
46	simvastatin	Hypoprothrombinemia
46	simvastatin	Aplastic anemia, 609135
46	simvastatin	Migraine
46	simvastatin	Hyperprothrombinemia
46	simvastatin	Coronary artery disease
46	simvastatin	Asthma, susceptibility to, 600807
46	simvastatin	Preeclampsia, susceptibility to
46	simvastatin	Migraine without aura, susceptibility to, 157300
46	simvastatin	Renal tubular dysgenesis
46	simvastatin	Leukocyte adhesion deficiency
46	simvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
46	simvastatin	Kaposi sarcoma
46	simvastatin	Coronary heart disease, susceptibility to
46	simvastatin	Diabetes mellitus
46	simvastatin	AIDS
46	simvastatin	Immunodeficiency with hyper-IgM, type 3, 606843
46	simvastatin	Statins
46	simvastatin	TSC2 angiomyolipomas, renal, modifier of, 191100
46	simvastatin	Hypertension, essential, susceptibility to, 145500
46	simvastatin	Tuberculosis
46	simvastatin	Asthma
46	simvastatin	Septic shock, susceptibility to
46	simvastatin	Sepsis
46	simvastatin	Preeclampsia
46	simvastatin	Malaria
46	simvastatin	Dementia, vascular, susceptibility to
46	atorvastatin	Tall stature
46	atorvastatin	Tall stature, susceptibility to
46	atorvastatin	Hypercholesterolemia
46	atorvastatin	Obesity, resistance to
46	atorvastatin	Hypolactasia, adult type, 223100
46	atorvastatin	Immunodeficiency
46	atorvastatin	Renal tubular dysgenesis, 267430
46	atorvastatin	Hyperapobetalipoproteinemia
46	atorvastatin	Hypobetalipoproteinemia
46	atorvastatin	Immunodeficiency, X-linked, with hyper-IgM, 308230
46	atorvastatin	Statins, attenuated cholesterol lowering by
46	atorvastatin	Glioblastoma
46	atorvastatin	Hyperapobetalipoproteinemia, susceptibility to
46	atorvastatin	Malaria, cerebral, susceptibility to
46	atorvastatin	Insulin resistance, severe, digenic, 604367
46	atorvastatin	Hypercholesterolemia, due to ligand-defective apo B, 144010
46	atorvastatin	Hypertension
46	atorvastatin	Dementia
46	atorvastatin	Obesity
46	atorvastatin	Obesity, severe, 601665
46	atorvastatin	Migraine
46	atorvastatin	Diabetes mellitus, insulin-resistant, with acanthosis nigricans and hypertension, 604367
46	atorvastatin	Coronary artery disease
46	atorvastatin	Asthma, susceptibility to, 600807
46	atorvastatin	Preeclampsia, susceptibility to
46	atorvastatin	Migraine without aura, susceptibility to, 157300
46	atorvastatin	Renal tubular dysgenesis
46	atorvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
46	atorvastatin	Glioblastoma, susceptibility to, 137800
46	atorvastatin	Diabetes mellitus
46	atorvastatin	Statins
46	atorvastatin	Hypolactasia, adult type
46	atorvastatin	Abetalipoproteinemia
46	atorvastatin	Hypertension, essential, susceptibility to, 145500
46	atorvastatin	Insulin resistance
46	atorvastatin	Asthma
46	atorvastatin	Lipodystrophy, familial partial, 151660
46	atorvastatin	Coronary artery disease, susceptibility to
46	atorvastatin	Septic shock, susceptibility to
46	atorvastatin	Sepsis
46	atorvastatin	Preeclampsia
46	atorvastatin	Coronary artery spasm, susceptibility to
46	atorvastatin	Malaria
46	atorvastatin	Lipodystrophy
46	atorvastatin	Dementia, vascular, susceptibility to
47	ibuprofen	Analbuminemia
47	ibuprofen	Dysalbuminemic hyperthyroxinemia
49	etoposide	DNA topoisomerase II, resistance to inhibition of, by amsacrine
49	etoposide	DNA topoisomerase
50	phenytoin	Brugada syndrome, 601144
50	phenytoin	Sick sinus syndrome
50	phenytoin	Brugada syndrome
50	phenytoin	Epilepsy
50	phenytoin	Long QT syndrome-3, 603830
50	phenytoin	Epilepsy, generalized, with febrile seizures plus, type 2, 604233
50	phenytoin	Heart block, nonprogressive, 113900
50	phenytoin	Ventricular fibrillation, idiopathic
50	phenytoin	Long QT syndrome
50	phenytoin	Ventricular fibrillation, idiopathic, 603829
50	phenytoin	Heart block
50	phenytoin	Epilepsy, severe myoclonic, of infancy, 607208
50	phenytoin	Sick sinus syndrome, 608567
50	phenytoin	Heart block, progressive, type I, 113900
55	fluoxetine	Anxiety-related personality traits
55	fluoxetine	Obsessive-compulsive disorder 1, 164230
55	fluoxetine	Obsessive-compulsive disorder
56	fluoxetine	Anxiety-related personality traits
56	fluoxetine	Obsessive-compulsive disorder 1, 164230
56	fluoxetine	Obsessive-compulsive disorder
57	fluvastatin	Statins
57	fluvastatin	Statins, attenuated cholesterol lowering by
59	simvastatin	Aplastic anemia
59	simvastatin	Leukocyte adhesion deficiency, 116920
59	simvastatin	Immunodeficiency
59	simvastatin	Renal tubular dysgenesis, 267430
59	simvastatin	Hyperapobetalipoproteinemia
59	simvastatin	Tuberculosis, susceptibility to, 607948
59	simvastatin	Dysprothrombinemia
59	simvastatin	Statins, attenuated cholesterol lowering by
59	simvastatin	Hyperapobetalipoproteinemia, susceptibility to
59	simvastatin	Malaria, cerebral, susceptibility to
59	simvastatin	Kaposi sarcoma, susceptibility to, 148000
59	simvastatin	AIDS, rapid progression to, 609423
59	simvastatin	Tuberous sclerosis
59	simvastatin	Hypertension
59	simvastatin	Dementia
59	simvastatin	Hypoprothrombinemia
59	simvastatin	Aplastic anemia, 609135
59	simvastatin	Migraine
59	simvastatin	Hyperprothrombinemia
59	simvastatin	Coronary artery disease
59	simvastatin	Asthma, susceptibility to, 600807
59	simvastatin	Preeclampsia, susceptibility to
59	simvastatin	Migraine without aura, susceptibility to, 157300
59	simvastatin	Renal tubular dysgenesis
59	simvastatin	Leukocyte adhesion deficiency
59	simvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
59	simvastatin	Kaposi sarcoma
59	simvastatin	Coronary heart disease, susceptibility to
59	simvastatin	Diabetes mellitus
59	simvastatin	AIDS
59	simvastatin	Immunodeficiency with hyper-IgM, type 3, 606843
59	simvastatin	Statins
59	simvastatin	TSC2 angiomyolipomas, renal, modifier of, 191100
59	simvastatin	Hypertension, essential, susceptibility to, 145500
59	simvastatin	Tuberculosis
59	simvastatin	Asthma
59	simvastatin	Septic shock, susceptibility to
59	simvastatin	Sepsis
59	simvastatin	Preeclampsia
59	simvastatin	Malaria
59	simvastatin	Dementia, vascular, susceptibility to
63	hydrocortisone	Asthma
63	hydrocortisone	Malaria, resistance to, 248310
63	hydrocortisone	Cortisol resistance
63	hydrocortisone	Obesity, adrenal insufficiency, and red hair
63	hydrocortisone	Atherosclerosis, susceptibility to
63	hydrocortisone	Asthma, dimished response to antileukotriene treatment in, 600807
63	hydrocortisone	Malaria
63	hydrocortisone	Atherosclerosis
63	hydrocortisone	Obesity
66	metoclopramide	Dystonia, myoclonic, 159900
66	metoclopramide	Dystonia
67	metoclopramide	Dystonia, myoclonic, 159900
67	metoclopramide	Dystonia
68	hydrocortisone	Asthma
68	hydrocortisone	Malaria, resistance to, 248310
68	hydrocortisone	Cortisol resistance
68	hydrocortisone	Obesity, adrenal insufficiency, and red hair
68	hydrocortisone	Atherosclerosis, susceptibility to
68	hydrocortisone	Asthma, dimished response to antileukotriene treatment in, 600807
68	hydrocortisone	Malaria
68	hydrocortisone	Atherosclerosis
68	hydrocortisone	Obesity
71	etoposide	DNA topoisomerase II, resistance to inhibition of, by amsacrine
71	etoposide	DNA topoisomerase
71	etoposide	DNA topoisomerase II, resistance to inhibition of, by amsacrine
71	etoposide	DNA topoisomerase
73	diclofenac	Dystransthyretinemic hyperthyroxinemia
73	diclofenac	Amyloidosis, senile systemic
73	diclofenac	Amyloid neuropathy
73	diclofenac	Dystransthyretinemic hyperthyroxinemia(3)
73	diclofenac	Amyloidosis
73	diclofenac	Carpal tunnel syndrome, familial
73	diclofenac	Amyloid neuropathy, familial, several allelic types
74	simvastatin	Aplastic anemia
74	simvastatin	Leukocyte adhesion deficiency, 116920
74	simvastatin	Immunodeficiency
74	simvastatin	Renal tubular dysgenesis, 267430
74	simvastatin	Hyperapobetalipoproteinemia
74	simvastatin	Tuberculosis, susceptibility to, 607948
74	simvastatin	Dysprothrombinemia
74	simvastatin	Statins, attenuated cholesterol lowering by
74	simvastatin	Hyperapobetalipoproteinemia, susceptibility to
74	simvastatin	Malaria, cerebral, susceptibility to
74	simvastatin	Kaposi sarcoma, susceptibility to, 148000
74	simvastatin	AIDS, rapid progression to, 609423
74	simvastatin	Tuberous sclerosis
74	simvastatin	Hypertension
74	simvastatin	Dementia
74	simvastatin	Hypoprothrombinemia
74	simvastatin	Aplastic anemia, 609135
74	simvastatin	Migraine
74	simvastatin	Hyperprothrombinemia
74	simvastatin	Coronary artery disease
74	simvastatin	Asthma, susceptibility to, 600807
74	simvastatin	Preeclampsia, susceptibility to
74	simvastatin	Migraine without aura, susceptibility to, 157300
74	simvastatin	Renal tubular dysgenesis
74	simvastatin	Leukocyte adhesion deficiency
74	simvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
74	simvastatin	Kaposi sarcoma
74	simvastatin	Coronary heart disease, susceptibility to
74	simvastatin	Diabetes mellitus
74	simvastatin	AIDS
74	simvastatin	Immunodeficiency with hyper-IgM, type 3, 606843
74	simvastatin	Statins
74	simvastatin	TSC2 angiomyolipomas, renal, modifier of, 191100
74	simvastatin	Hypertension, essential, susceptibility to, 145500
74	simvastatin	Tuberculosis
74	simvastatin	Asthma
74	simvastatin	Septic shock, susceptibility to
74	simvastatin	Sepsis
74	simvastatin	Preeclampsia
74	simvastatin	Malaria
74	simvastatin	Dementia, vascular, susceptibility to
77	pravastatin	Statins
77	pravastatin	Statins, attenuated cholesterol lowering by
77	pravastatin	Dubin-Johnson syndrome, 237500
77	pravastatin	Dubin-Johnson syndrome
77	pravastatin	Statins
77	pravastatin	Statins, attenuated cholesterol lowering by
77	pravastatin	Dubin-Johnson syndrome, 237500
77	pravastatin	Dubin-Johnson syndrome
79	metoclopramide	Dystonia, myoclonic, 159900
79	metoclopramide	Dystonia
80	cyclosporine	Colchicine resistance
81	hydrocortisone	Asthma
81	hydrocortisone	Malaria, resistance to, 248310
81	hydrocortisone	Cortisol resistance
81	hydrocortisone	Obesity, adrenal insufficiency, and red hair
81	hydrocortisone	Atherosclerosis, susceptibility to
81	hydrocortisone	Asthma, dimished response to antileukotriene treatment in, 600807
81	hydrocortisone	Malaria
81	hydrocortisone	Atherosclerosis
81	hydrocortisone	Obesity
82	ketoprofen	Analbuminemia
82	ketoprofen	Dysalbuminemic hyperthyroxinemia
88	phenobarbital	Epilepsy, juvenile myoclonic, 606904
88	phenobarbital	Epilepsy
89	amiodarone	Resting heart rate, 607276
89	amiodarone	Long QT syndrome
89	amiodarone	Long QT syndrome-2
89	amiodarone	Congestive heart failure, susceptibility to
89	amiodarone	Acquired long QT syndrome, susceptibility to
89	amiodarone	Resting heart rate
89	amiodarone	Congestive heart failure
89	amiodarone	Acquired long QT syndrome
90	warfarin	Warfarin resistance, 122700
90	warfarin	Dysprothrombinemia
90	warfarin	Hyperprothrombinemia
90	warfarin	Warfarin resistance/sensitivity
90	warfarin	Vitamin K-dependent coagulation defect
90	warfarin	Vitamin K-dependent clotting factors, combined deficiency of, 2, 607473
90	warfarin	Hypoprothrombinemia
93	neostigmine	Blood group
93	neostigmine	Blood group, Yt system, 112100
95	etoposide	DNA topoisomerase II, resistance to inhibition of, by amsacrine
95	etoposide	DNA topoisomerase
95	etoposide	DNA topoisomerase II, resistance to inhibition of, by amsacrine
95	etoposide	DNA topoisomerase
97	rosuvastatin	Statins
97	rosuvastatin	Statins, attenuated cholesterol lowering by
97	rosuvastatin	Alzheimer disease, late-onset, susceptibility to, 104300
97	rosuvastatin	Placental abruption
97	rosuvastatin	Hypertension, susceptibility to, 145500
97	rosuvastatin	Coronary spasms
97	rosuvastatin	Coronary spasms, susceptibility to
97	rosuvastatin	Hypertension
97	rosuvastatin	Alzheimer disease
97	rosuvastatin	Hypertension, pregnancy-induced, 189800
99	danazol	Hypogonadotropic hypogonadism
99	danazol	Migraine
99	danazol	Fertile eunuch syndrome, 228300
99	danazol	Estrogen resistance
99	danazol	HDL response to hormone replacement, augmented
99	danazol	Migraine, susceptibility to, 157300
99	danazol	Fertile eunuch syndrome
99	danazol	HDL cholesterol level QTL
100	bosentan	Migraine
100	bosentan	Hirschsprung disease-2, 600155
100	bosentan	Waardenburg-Shah syndrome, 277580
100	bosentan	Migraine, resistance to, 157300
100	bosentan	Waardenburg-Shah syndrome
100	bosentan	ABCD syndrome, 600501
100	bosentan	Hirschsprung disease
100	bosentan	Cholestasis, progressive familial intrahepatic 2, 601847
100	bosentan	ABCD syndrome
100	bosentan	Cholestasis
103	atorvastatin	Tall stature
103	atorvastatin	Tall stature, susceptibility to
103	atorvastatin	Hypercholesterolemia
103	atorvastatin	Obesity, resistance to
103	atorvastatin	Hypolactasia, adult type, 223100
103	atorvastatin	Immunodeficiency
103	atorvastatin	Renal tubular dysgenesis, 267430
103	atorvastatin	Hyperapobetalipoproteinemia
103	atorvastatin	Hypobetalipoproteinemia
103	atorvastatin	Immunodeficiency, X-linked, with hyper-IgM, 308230
103	atorvastatin	Statins, attenuated cholesterol lowering by
103	atorvastatin	Glioblastoma
103	atorvastatin	Hyperapobetalipoproteinemia, susceptibility to
103	atorvastatin	Malaria, cerebral, susceptibility to
103	atorvastatin	Insulin resistance, severe, digenic, 604367
103	atorvastatin	Hypercholesterolemia, due to ligand-defective apo B, 144010
103	atorvastatin	Hypertension
103	atorvastatin	Dementia
103	atorvastatin	Obesity
103	atorvastatin	Obesity, severe, 601665
103	atorvastatin	Migraine
103	atorvastatin	Diabetes mellitus, insulin-resistant, with acanthosis nigricans and hypertension, 604367
103	atorvastatin	Coronary artery disease
103	atorvastatin	Asthma, susceptibility to, 600807
103	atorvastatin	Preeclampsia, susceptibility to
103	atorvastatin	Migraine without aura, susceptibility to, 157300
103	atorvastatin	Renal tubular dysgenesis
103	atorvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
103	atorvastatin	Glioblastoma, susceptibility to, 137800
103	atorvastatin	Diabetes mellitus
103	atorvastatin	Statins
103	atorvastatin	Hypolactasia, adult type
103	atorvastatin	Abetalipoproteinemia
103	atorvastatin	Hypertension, essential, susceptibility to, 145500
103	atorvastatin	Insulin resistance
103	atorvastatin	Asthma
103	atorvastatin	Lipodystrophy, familial partial, 151660
103	atorvastatin	Coronary artery disease, susceptibility to
103	atorvastatin	Septic shock, susceptibility to
103	atorvastatin	Sepsis
103	atorvastatin	Preeclampsia
103	atorvastatin	Coronary artery spasm, susceptibility to
103	atorvastatin	Malaria
103	atorvastatin	Lipodystrophy
103	atorvastatin	Dementia, vascular, susceptibility to
104	simvastatin	Aplastic anemia
104	simvastatin	Leukocyte adhesion deficiency, 116920
104	simvastatin	Immunodeficiency
104	simvastatin	Renal tubular dysgenesis, 267430
104	simvastatin	Hyperapobetalipoproteinemia
104	simvastatin	Tuberculosis, susceptibility to, 607948
104	simvastatin	Dysprothrombinemia
104	simvastatin	Statins, attenuated cholesterol lowering by
104	simvastatin	Hyperapobetalipoproteinemia, susceptibility to
104	simvastatin	Malaria, cerebral, susceptibility to
104	simvastatin	Kaposi sarcoma, susceptibility to, 148000
104	simvastatin	AIDS, rapid progression to, 609423
104	simvastatin	Tuberous sclerosis
104	simvastatin	Hypertension
104	simvastatin	Dementia
104	simvastatin	Hypoprothrombinemia
104	simvastatin	Aplastic anemia, 609135
104	simvastatin	Migraine
104	simvastatin	Hyperprothrombinemia
104	simvastatin	Coronary artery disease
104	simvastatin	Asthma, susceptibility to, 600807
104	simvastatin	Preeclampsia, susceptibility to
104	simvastatin	Migraine without aura, susceptibility to, 157300
104	simvastatin	Renal tubular dysgenesis
104	simvastatin	Leukocyte adhesion deficiency
104	simvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
104	simvastatin	Kaposi sarcoma
104	simvastatin	Coronary heart disease, susceptibility to
104	simvastatin	Diabetes mellitus
104	simvastatin	AIDS
104	simvastatin	Immunodeficiency with hyper-IgM, type 3, 606843
104	simvastatin	Statins
104	simvastatin	TSC2 angiomyolipomas, renal, modifier of, 191100
104	simvastatin	Hypertension, essential, susceptibility to, 145500
104	simvastatin	Tuberculosis
104	simvastatin	Asthma
104	simvastatin	Septic shock, susceptibility to
104	simvastatin	Sepsis
104	simvastatin	Preeclampsia
104	simvastatin	Malaria
104	simvastatin	Dementia, vascular, susceptibility to
105	simvastatin	Aplastic anemia
105	simvastatin	Leukocyte adhesion deficiency, 116920
105	simvastatin	Immunodeficiency
105	simvastatin	Renal tubular dysgenesis, 267430
105	simvastatin	Hyperapobetalipoproteinemia
105	simvastatin	Tuberculosis, susceptibility to, 607948
105	simvastatin	Dysprothrombinemia
105	simvastatin	Statins, attenuated cholesterol lowering by
105	simvastatin	Hyperapobetalipoproteinemia, susceptibility to
105	simvastatin	Malaria, cerebral, susceptibility to
105	simvastatin	Kaposi sarcoma, susceptibility to, 148000
105	simvastatin	AIDS, rapid progression to, 609423
105	simvastatin	Tuberous sclerosis
105	simvastatin	Hypertension
105	simvastatin	Dementia
105	simvastatin	Hypoprothrombinemia
105	simvastatin	Aplastic anemia, 609135
105	simvastatin	Migraine
105	simvastatin	Hyperprothrombinemia
105	simvastatin	Coronary artery disease
105	simvastatin	Asthma, susceptibility to, 600807
105	simvastatin	Preeclampsia, susceptibility to
105	simvastatin	Migraine without aura, susceptibility to, 157300
105	simvastatin	Renal tubular dysgenesis
105	simvastatin	Leukocyte adhesion deficiency
105	simvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
105	simvastatin	Kaposi sarcoma
105	simvastatin	Coronary heart disease, susceptibility to
105	simvastatin	Diabetes mellitus
105	simvastatin	AIDS
105	simvastatin	Immunodeficiency with hyper-IgM, type 3, 606843
105	simvastatin	Statins
105	simvastatin	TSC2 angiomyolipomas, renal, modifier of, 191100
105	simvastatin	Hypertension, essential, susceptibility to, 145500
105	simvastatin	Tuberculosis
105	simvastatin	Asthma
105	simvastatin	Septic shock, susceptibility to
105	simvastatin	Sepsis
105	simvastatin	Preeclampsia
105	simvastatin	Malaria
105	simvastatin	Dementia, vascular, susceptibility to
109	etoposide	DNA topoisomerase II, resistance to inhibition of, by amsacrine
109	etoposide	DNA topoisomerase
110	atorvastatin	Tall stature
110	atorvastatin	Tall stature, susceptibility to
110	atorvastatin	Hypercholesterolemia
110	atorvastatin	Obesity, resistance to
110	atorvastatin	Hypolactasia, adult type, 223100
110	atorvastatin	Immunodeficiency
110	atorvastatin	Renal tubular dysgenesis, 267430
110	atorvastatin	Hyperapobetalipoproteinemia
110	atorvastatin	Hypobetalipoproteinemia
110	atorvastatin	Immunodeficiency, X-linked, with hyper-IgM, 308230
110	atorvastatin	Statins, attenuated cholesterol lowering by
110	atorvastatin	Glioblastoma
110	atorvastatin	Hyperapobetalipoproteinemia, susceptibility to
110	atorvastatin	Malaria, cerebral, susceptibility to
110	atorvastatin	Insulin resistance, severe, digenic, 604367
110	atorvastatin	Hypercholesterolemia, due to ligand-defective apo B, 144010
110	atorvastatin	Hypertension
110	atorvastatin	Dementia
110	atorvastatin	Obesity
110	atorvastatin	Obesity, severe, 601665
110	atorvastatin	Migraine
110	atorvastatin	Diabetes mellitus, insulin-resistant, with acanthosis nigricans and hypertension, 604367
110	atorvastatin	Coronary artery disease
110	atorvastatin	Asthma, susceptibility to, 600807
110	atorvastatin	Preeclampsia, susceptibility to
110	atorvastatin	Migraine without aura, susceptibility to, 157300
110	atorvastatin	Renal tubular dysgenesis
110	atorvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
110	atorvastatin	Glioblastoma, susceptibility to, 137800
110	atorvastatin	Diabetes mellitus
110	atorvastatin	Statins
110	atorvastatin	Hypolactasia, adult type
110	atorvastatin	Abetalipoproteinemia
110	atorvastatin	Hypertension, essential, susceptibility to, 145500
110	atorvastatin	Insulin resistance
110	atorvastatin	Asthma
110	atorvastatin	Lipodystrophy, familial partial, 151660
110	atorvastatin	Coronary artery disease, susceptibility to
110	atorvastatin	Septic shock, susceptibility to
110	atorvastatin	Sepsis
110	atorvastatin	Preeclampsia
110	atorvastatin	Coronary artery spasm, susceptibility to
110	atorvastatin	Malaria
110	atorvastatin	Lipodystrophy
110	atorvastatin	Dementia, vascular, susceptibility to
111	atorvastatin	Tall stature
111	atorvastatin	Tall stature, susceptibility to
111	atorvastatin	Hypercholesterolemia
111	atorvastatin	Obesity, resistance to
111	atorvastatin	Hypolactasia, adult type, 223100
111	atorvastatin	Immunodeficiency
111	atorvastatin	Renal tubular dysgenesis, 267430
111	atorvastatin	Hyperapobetalipoproteinemia
111	atorvastatin	Hypobetalipoproteinemia
111	atorvastatin	Immunodeficiency, X-linked, with hyper-IgM, 308230
111	atorvastatin	Statins, attenuated cholesterol lowering by
111	atorvastatin	Glioblastoma
111	atorvastatin	Hyperapobetalipoproteinemia, susceptibility to
111	atorvastatin	Malaria, cerebral, susceptibility to
111	atorvastatin	Insulin resistance, severe, digenic, 604367
111	atorvastatin	Hypercholesterolemia, due to ligand-defective apo B, 144010
111	atorvastatin	Hypertension
111	atorvastatin	Dementia
111	atorvastatin	Obesity
111	atorvastatin	Obesity, severe, 601665
111	atorvastatin	Migraine
111	atorvastatin	Diabetes mellitus, insulin-resistant, with acanthosis nigricans and hypertension, 604367
111	atorvastatin	Coronary artery disease
111	atorvastatin	Asthma, susceptibility to, 600807
111	atorvastatin	Preeclampsia, susceptibility to
111	atorvastatin	Migraine without aura, susceptibility to, 157300
111	atorvastatin	Renal tubular dysgenesis
111	atorvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
111	atorvastatin	Glioblastoma, susceptibility to, 137800
111	atorvastatin	Diabetes mellitus
111	atorvastatin	Statins
111	atorvastatin	Hypolactasia, adult type
111	atorvastatin	Abetalipoproteinemia
111	atorvastatin	Hypertension, essential, susceptibility to, 145500
111	atorvastatin	Insulin resistance
111	atorvastatin	Asthma
111	atorvastatin	Lipodystrophy, familial partial, 151660
111	atorvastatin	Coronary artery disease, susceptibility to
111	atorvastatin	Septic shock, susceptibility to
111	atorvastatin	Sepsis
111	atorvastatin	Preeclampsia
111	atorvastatin	Coronary artery spasm, susceptibility to
111	atorvastatin	Malaria
111	atorvastatin	Lipodystrophy
111	atorvastatin	Dementia, vascular, susceptibility to
112	atorvastatin	Tall stature
112	atorvastatin	Tall stature, susceptibility to
112	atorvastatin	Hypercholesterolemia
112	atorvastatin	Obesity, resistance to
112	atorvastatin	Hypolactasia, adult type, 223100
112	atorvastatin	Immunodeficiency
112	atorvastatin	Renal tubular dysgenesis, 267430
112	atorvastatin	Hyperapobetalipoproteinemia
112	atorvastatin	Hypobetalipoproteinemia
112	atorvastatin	Immunodeficiency, X-linked, with hyper-IgM, 308230
112	atorvastatin	Statins, attenuated cholesterol lowering by
112	atorvastatin	Glioblastoma
112	atorvastatin	Hyperapobetalipoproteinemia, susceptibility to
112	atorvastatin	Malaria, cerebral, susceptibility to
112	atorvastatin	Insulin resistance, severe, digenic, 604367
112	atorvastatin	Hypercholesterolemia, due to ligand-defective apo B, 144010
112	atorvastatin	Hypertension
112	atorvastatin	Dementia
112	atorvastatin	Obesity
112	atorvastatin	Obesity, severe, 601665
112	atorvastatin	Migraine
112	atorvastatin	Diabetes mellitus, insulin-resistant, with acanthosis nigricans and hypertension, 604367
112	atorvastatin	Coronary artery disease
112	atorvastatin	Asthma, susceptibility to, 600807
112	atorvastatin	Preeclampsia, susceptibility to
112	atorvastatin	Migraine without aura, susceptibility to, 157300
112	atorvastatin	Renal tubular dysgenesis
112	atorvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
112	atorvastatin	Glioblastoma, susceptibility to, 137800
112	atorvastatin	Diabetes mellitus
112	atorvastatin	Statins
112	atorvastatin	Hypolactasia, adult type
112	atorvastatin	Abetalipoproteinemia
112	atorvastatin	Hypertension, essential, susceptibility to, 145500
112	atorvastatin	Insulin resistance
112	atorvastatin	Asthma
112	atorvastatin	Lipodystrophy, familial partial, 151660
112	atorvastatin	Coronary artery disease, susceptibility to
112	atorvastatin	Septic shock, susceptibility to
112	atorvastatin	Sepsis
112	atorvastatin	Preeclampsia
112	atorvastatin	Coronary artery spasm, susceptibility to
112	atorvastatin	Malaria
112	atorvastatin	Lipodystrophy
112	atorvastatin	Dementia, vascular, susceptibility to
113	etoposide	DNA topoisomerase II, resistance to inhibition of, by amsacrine
113	etoposide	DNA topoisomerase
113	cyclosporine	Colchicine resistance
116	simvastatin	Aplastic anemia
116	simvastatin	Leukocyte adhesion deficiency, 116920
116	simvastatin	Immunodeficiency
116	simvastatin	Renal tubular dysgenesis, 267430
116	simvastatin	Hyperapobetalipoproteinemia
116	simvastatin	Tuberculosis, susceptibility to, 607948
116	simvastatin	Dysprothrombinemia
116	simvastatin	Statins, attenuated cholesterol lowering by
116	simvastatin	Hyperapobetalipoproteinemia, susceptibility to
116	simvastatin	Malaria, cerebral, susceptibility to
116	simvastatin	Kaposi sarcoma, susceptibility to, 148000
116	simvastatin	AIDS, rapid progression to, 609423
116	simvastatin	Tuberous sclerosis
116	simvastatin	Hypertension
116	simvastatin	Dementia
116	simvastatin	Hypoprothrombinemia
116	simvastatin	Aplastic anemia, 609135
116	simvastatin	Migraine
116	simvastatin	Hyperprothrombinemia
116	simvastatin	Coronary artery disease
116	simvastatin	Asthma, susceptibility to, 600807
116	simvastatin	Preeclampsia, susceptibility to
116	simvastatin	Migraine without aura, susceptibility to, 157300
116	simvastatin	Renal tubular dysgenesis
116	simvastatin	Leukocyte adhesion deficiency
116	simvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
116	simvastatin	Kaposi sarcoma
116	simvastatin	Coronary heart disease, susceptibility to
116	simvastatin	Diabetes mellitus
116	simvastatin	AIDS
116	simvastatin	Immunodeficiency with hyper-IgM, type 3, 606843
116	simvastatin	Statins
116	simvastatin	TSC2 angiomyolipomas, renal, modifier of, 191100
116	simvastatin	Hypertension, essential, susceptibility to, 145500
116	simvastatin	Tuberculosis
116	simvastatin	Asthma
116	simvastatin	Septic shock, susceptibility to
116	simvastatin	Sepsis
116	simvastatin	Preeclampsia
116	simvastatin	Malaria
116	simvastatin	Dementia, vascular, susceptibility to
117	methylphenidate	Anxiety-related personality traits
117	methylphenidate	Obsessive-compulsive disorder 1, 164230
117	methylphenidate	Obsessive-compulsive disorder
117	methylphenidate	Orthostatic intolerance
117	methylphenidate	Orthostatic intolerance, 604715
120	simvastatin	Aplastic anemia
120	simvastatin	Leukocyte adhesion deficiency, 116920
120	simvastatin	Immunodeficiency
120	simvastatin	Renal tubular dysgenesis, 267430
120	simvastatin	Hyperapobetalipoproteinemia
120	simvastatin	Tuberculosis, susceptibility to, 607948
120	simvastatin	Dysprothrombinemia
120	simvastatin	Statins, attenuated cholesterol lowering by
120	simvastatin	Hyperapobetalipoproteinemia, susceptibility to
120	simvastatin	Malaria, cerebral, susceptibility to
120	simvastatin	Kaposi sarcoma, susceptibility to, 148000
120	simvastatin	AIDS, rapid progression to, 609423
120	simvastatin	Tuberous sclerosis
120	simvastatin	Hypertension
120	simvastatin	Dementia
120	simvastatin	Hypoprothrombinemia
120	simvastatin	Aplastic anemia, 609135
120	simvastatin	Migraine
120	simvastatin	Hyperprothrombinemia
120	simvastatin	Coronary artery disease
120	simvastatin	Asthma, susceptibility to, 600807
120	simvastatin	Preeclampsia, susceptibility to
120	simvastatin	Migraine without aura, susceptibility to, 157300
120	simvastatin	Renal tubular dysgenesis
120	simvastatin	Leukocyte adhesion deficiency
120	simvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
120	simvastatin	Kaposi sarcoma
120	simvastatin	Coronary heart disease, susceptibility to
120	simvastatin	Diabetes mellitus
120	simvastatin	AIDS
120	simvastatin	Immunodeficiency with hyper-IgM, type 3, 606843
120	simvastatin	Statins
120	simvastatin	TSC2 angiomyolipomas, renal, modifier of, 191100
120	simvastatin	Hypertension, essential, susceptibility to, 145500
120	simvastatin	Tuberculosis
120	simvastatin	Asthma
120	simvastatin	Septic shock, susceptibility to
120	simvastatin	Sepsis
120	simvastatin	Preeclampsia
120	simvastatin	Malaria
120	simvastatin	Dementia, vascular, susceptibility to
122	methotrexate	Analbuminemia
122	methotrexate	Dysalbuminemic hyperthyroxinemia
123	simvastatin	Aplastic anemia
123	simvastatin	Leukocyte adhesion deficiency, 116920
123	simvastatin	Immunodeficiency
123	simvastatin	Renal tubular dysgenesis, 267430
123	simvastatin	Hyperapobetalipoproteinemia
123	simvastatin	Tuberculosis, susceptibility to, 607948
123	simvastatin	Dysprothrombinemia
123	simvastatin	Statins, attenuated cholesterol lowering by
123	simvastatin	Hyperapobetalipoproteinemia, susceptibility to
123	simvastatin	Malaria, cerebral, susceptibility to
123	simvastatin	Kaposi sarcoma, susceptibility to, 148000
123	simvastatin	AIDS, rapid progression to, 609423
123	simvastatin	Tuberous sclerosis
123	simvastatin	Hypertension
123	simvastatin	Dementia
123	simvastatin	Hypoprothrombinemia
123	simvastatin	Aplastic anemia, 609135
123	simvastatin	Migraine
123	simvastatin	Hyperprothrombinemia
123	simvastatin	Coronary artery disease
123	simvastatin	Asthma, susceptibility to, 600807
123	simvastatin	Preeclampsia, susceptibility to
123	simvastatin	Migraine without aura, susceptibility to, 157300
123	simvastatin	Renal tubular dysgenesis
123	simvastatin	Leukocyte adhesion deficiency
123	simvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
123	simvastatin	Kaposi sarcoma
123	simvastatin	Coronary heart disease, susceptibility to
123	simvastatin	Diabetes mellitus
123	simvastatin	AIDS
123	simvastatin	Immunodeficiency with hyper-IgM, type 3, 606843
123	simvastatin	Statins
123	simvastatin	TSC2 angiomyolipomas, renal, modifier of, 191100
123	simvastatin	Hypertension, essential, susceptibility to, 145500
123	simvastatin	Tuberculosis
123	simvastatin	Asthma
123	simvastatin	Septic shock, susceptibility to
123	simvastatin	Sepsis
123	simvastatin	Preeclampsia
123	simvastatin	Malaria
123	simvastatin	Dementia, vascular, susceptibility to
125	methotrexate	Analbuminemia
125	methotrexate	Dysalbuminemic hyperthyroxinemia
127	ursodeoxycholic acid	Obesity, hyperphagia, and developmental delay
127	ursodeoxycholic acid	Obesity
128	simvastatin	Aplastic anemia
128	simvastatin	Leukocyte adhesion deficiency, 116920
128	simvastatin	Immunodeficiency
128	simvastatin	Renal tubular dysgenesis, 267430
128	simvastatin	Hyperapobetalipoproteinemia
128	simvastatin	Tuberculosis, susceptibility to, 607948
128	simvastatin	Dysprothrombinemia
128	simvastatin	Statins, attenuated cholesterol lowering by
128	simvastatin	Hyperapobetalipoproteinemia, susceptibility to
128	simvastatin	Malaria, cerebral, susceptibility to
128	simvastatin	Kaposi sarcoma, susceptibility to, 148000
128	simvastatin	AIDS, rapid progression to, 609423
128	simvastatin	Tuberous sclerosis
128	simvastatin	Hypertension
128	simvastatin	Dementia
128	simvastatin	Hypoprothrombinemia
128	simvastatin	Aplastic anemia, 609135
128	simvastatin	Migraine
128	simvastatin	Hyperprothrombinemia
128	simvastatin	Coronary artery disease
128	simvastatin	Asthma, susceptibility to, 600807
128	simvastatin	Preeclampsia, susceptibility to
128	simvastatin	Migraine without aura, susceptibility to, 157300
128	simvastatin	Renal tubular dysgenesis
128	simvastatin	Leukocyte adhesion deficiency
128	simvastatin	Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
128	simvastatin	Kaposi sarcoma
128	simvastatin	Coronary heart disease, susceptibility to
128	simvastatin	Diabetes mellitus
128	simvastatin	AIDS
128	simvastatin	Immunodeficiency with hyper-IgM, type 3, 606843
128	simvastatin	Statins
128	simvastatin	TSC2 angiomyolipomas, renal, modifier of, 191100
128	simvastatin	Hypertension, essential, susceptibility to, 145500
128	simvastatin	Tuberculosis
128	simvastatin	Asthma
128	simvastatin	Septic shock, susceptibility to
128	simvastatin	Sepsis
128	simvastatin	Preeclampsia
128	simvastatin	Malaria
128	simvastatin	Dementia, vascular, susceptibility to
132	warfarin	Warfarin resistance, 122700
132	warfarin	Dysprothrombinemia
132	warfarin	Hyperprothrombinemia
132	warfarin	Warfarin resistance/sensitivity
132	warfarin	Vitamin K-dependent coagulation defect
132	warfarin	Vitamin K-dependent clotting factors, combined deficiency of, 2, 607473
132	warfarin	Hypoprothrombinemia
\.


--
-- Data for Name: trial_researchers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trial_researchers (trial_id, researcher_id) FROM stdin;
1	122
2	49
3	31
4	109
5	7
6	96
7	22
8	90
9	60
10	9
11	99
12	32
12	32
14	18
15	114
16	25
17	121
18	34
19	45
20	67
21	81
22	92
23	73
24	70
25	64
26	84
27	100
28	13
29	58
30	1
31	28
32	24
33	69
34	17
35	37
36	124
37	94
38	80
39	20
40	44
41	106
42	23
43	102
44	56
45	53
46	79
47	86
48	126
49	68
50	48
51	74
52	97
53	11
54	16
55	88
56	30
57	108
58	42
59	46
60	87
61	63
62	52
63	19
64	5
65	78
66	8
67	35
68	3
69	39
70	76
71	54
71	54
73	43
74	98
75	71
75	71
77	71
77	71
79	50
80	82
81	103
82	6
83	27
84	118
85	89
86	32
86	32
88	93
89	83
90	95
91	66
92	113
93	111
94	14
95	54
95	54
97	36
98	38
99	15
100	119
101	10
102	91
103	29
104	75
105	77
106	21
107	4
108	123
109	2
110	107
111	104
112	117
113	61
114	112
115	115
116	59
117	26
118	120
119	40
120	47
121	51
122	65
123	41
124	57
125	12
126	116
127	110
128	62
129	85
130	105
131	101
132	125
\.


--
-- PostgreSQL database dump complete
--

