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
Early Use of Rosuvastatin in Acute Coronary Syndromes: Targeting Platelet-Leukocyte Interactions	2011-06-01	2014-02-01	54	Completed	Susan Smyth	University of Kentucky
Allogeneic Transplantation Using TL1 & ATG for Older Patients With Hematologic Malignancies	2003-03-01	2015-01-01	299	Completed	Robert Lowsky	Stanford University
Comparison of Cephalexin Versus Clindamycin for Suspected CA-MRSA Skin Infections	2006-09-01	2009-08-01	200	Completed	Aaron Chen	Johns Hopkins University
Trial of Early Aggressive Drug Therapy in Juvenile Idiopathic Arthritis	2007-05-01	2010-10-01	85	Completed	Carol Wallace	Seattle Children's Hospital
Prothrombin Times Outside the Therapeutic Range in Otherwise Stable Patients	2006-07-01	2009-04-01	160	Completed	Sam Schulman	McMaster University
Modafinil Treatment for Sleep/Wake Disturbances in Older Adults	2008-02-01	2012-10-01	2	Terminated	Jamie M. Zeitzer, Ph.D.	VA Palo Alto Health Care System
Warfarin Versus Aspirin in Reduced Cardiac Ejection Fraction (WARCEF) Trial	2002-10-01	2014-07-01	2305	Completed	Shunichi Homma	Columbia University
Fluoxetine for Motor, Aphasia, and Neglect Recovery After Ischemic Stroke	2013-04-01	2015-12-01	0	Withdrawn	Randie Black-Schaffer MD	Spaulding Rehabilitation Hospital
Prophylactic Phenobarbital After Neonatal Seizures	2010-09-01	2014-11-01	13	Terminated	Ronnie Guillet	University of Rochester
Low Doses Corticosteroids as Adjuvant Therapy for the Treatment of Severe H1N1 Flu	2010-03-01	2011-12-01	40	Terminated	Djillali Annane	University of Versailles
Atorvastatin for Preventing Occlusion and Restenosis After Intracranial Artery Stenting	2011-01-01	2014-12-01	100	Active, not recruiting	Xinfeng Liu	Jinling Hospital, China
Anesthetics in Rhytidoplasty - A Comparison Study	2013-09-01	2014-06-01	30	Completed	Kristin A. Jones	Mercy Facial Plastic Surgery Center
Treatment of Acute Lymphoblastic Leukemia in Children	2000-09-01	2011-05-01	498	Completed	Lewis B. Silverman, M.D.	Dana-Farber Cancer Institute
Pharmacokinetic, Safety and Efficacy of Intermittent Application of Caspofungin for Antifungal Prophylaxis	2011-04-01	2013-10-01	25	Completed	Werner J. Heinz	Wuerzburg University Hospital
Comparing Smoking Treatment Programs for Lighter Smokers - 1	2003-09-01	2009-06-01	260	Completed	Peter Gariti	University of Pennsylvania
Treatment of Post Stroke Fatigue With a Wakefulness Promoting Agent	2012-10-01	2015-03-01	41	Terminated	Karsten Overgaard	Herlev Hospital
Radical Lung Radiotherapy Plus Nelfinavir	2012-02-01	2012-10-01	0	Withdrawn	Linda Ward	Oxford University Hospitals NHS Trust
Pharmacokinetic Interactions Between Antiretroviral Agents and Antimalarial Drug Combinations	2005-07-01	2010-12-01	38	Completed	Fran Aweeka	University of California, San Francisco
Optima: Optimizing Prograf Therapy in Maintenance Allografts II	2003-08-01	2008-07-01	63	Completed	Paul Bolin	East Carolina University
Effects of Statins on the Pharmacokinetics for Midazolam in Healthy Volunteers	2006-06-01	2008-08-01	11	Completed	Naoki Inui	Hamamatsu University
Safety and Efficacy of Bosentan in Patients With Diastolic Heart Failure and Secondary Pulmonary Hypertension	2009-01-01	2014-06-01	20	Completed	Wilhelm Grander, M.D.	University Teaching Hospital Hall in Tirol
MgSO4 vs Metoclopramide for Headache in Pregnant Women	2008-08-01	2010-03-01	0	Withdrawn	Ghada Bourjeily	Women and Infants Hospital of Rhode Island
Safety Study of Combined Azithromycin, Ivermectin and Albendazole for Trachoma and Lymphatic Filariasis	2014-02-01	2014-07-01	0	Withdrawn	Huub Gelderblom MD, PhD, MPH	Emory University
Warfarine in Unexplained Oligohydramnios	2009-01-01	2011-07-01	200	Completed	alaa eldeen mahmoud ismail	Woman's Health University Hospital, Egypt
Randomized Clinical Trial to Assess the Efficacy and Safety of Concomitant Use of Rifampicin and Efavirenz 600 X 800mg	2007-01-01	2012-10-01	130	Terminated	Valeria Cavalcanti Rolla	Oswaldo Cruz Foundation
Distribution of Bupropion and Varenicline to Increase Smoking Cessation Attempts	2010-04-01	2011-12-01	923	Completed	Dr. Peter Selby	Centre for Addiction and Mental Health
Comparison of Blood Pressure Medications on Metabolism	2004-01-01	2008-07-01	21	Completed	Kathleen Colleran	University of New Mexico
Comparison of Methotrexate vs Placebo in Corticosteroid-dependent Ulcerative Colitis	2007-09-01	2014-06-01	110	Completed	Franck Carbonnel	Centre Hospitalier Universitaire de Besancon
Indomethacin Germinal Matrix Hemorrhage/Intraventricular Hemorrhage (GMH/IVH) Prevention Trial	1989-09-01	2012-03-01	630	Completed	Laura R. Ment	Yale University
Efficacy of Intravenous Dexketoprofen and Tenoxicam on Propofol Associated Injection Pain	2014-11-01	2015-04-01	118	Completed	özgür yağan	T.C. ORDU ÜNİVERSİTESİ
Evaluating the Transporter Protein Inhibitor Probenecid In Patients With Epilepsy	2006-03-01	2011-06-01	8	Terminated	Jim McAuley	The Ohio State University
Aizthromycin or Clarithromycin in H-pylori Eradication Regimen	2011-03-01	2012-03-01	78	Completed	Behnam Baghianimoghadam	Shahid Sadoughi University of Medical Sciences and Health Services
Aspirin Attenuates Inflammation in Human Cerebral Aneurysms	2011-08-01	2014-08-01	11	Completed	David Hasan	University of Iowa
Single Center Pilot Study of Corticosteroid Discontinuation in Liver Transplant Recipients	2002-10-01	2008-01-01	40	Completed	E. Steve Woodle	University of Cincinnati
Cryptococcal Optimal ART Timing Trial	2010-11-01	2013-03-01	177	Completed	David Boulware	University of Minnesota - Clinical and Translational Science Institute
Organ Donation and Hydrocortisone Treatment	2008-05-01	2011-12-01	38	Terminated	Stepani Bendel	Kuopio University Hospital
Prevention of Pegfilgrastim-Induced Bone Pain (PIBP)	2008-06-01	2012-03-01	510	Completed	Gary Morrow	University of Rochester
Effect of Diabetes Mellitus on Cholesterol Metabolism	2008-08-01	2013-07-01	52	Completed	Srividya Kidambi, MD	Medical College of Wisconsin
Allogeneic Hematopoietic Stem Cell Transplantation for Relapsed or Refractory High-Risk NBL.	2008-09-01	2012-06-01	2	Terminated	Sandeep Soni, M.D.	Nationwide Children's Hospital
Comparing the Efficacy of Tacrolimus and Mycophenolate Mofetil for the Initial Therapy of Active Lupus Nephritis	2005-09-01	2014-06-01	150	Completed	Chi Chiu Mok	Tuen Mun Hospital
Asthma Clinical Research Network (ACRN) Trial - Macrolides in Asthma (MIA)	2006-06-01	2009-04-01	92	Completed	Vernon M. Chinchilli, PhD	Milton S. Hershey Medical Center
Salsalate for Insulin Resistance in Schizophrenia	2010-08-01	2011-12-01	13	Completed	Robert W. Buchanan, M.D.	University of Maryland
Prophylaxis to Reduce Postoperative Atrial Fibrillation in Cardiac Surgery	2009-08-01	2012-02-01	304	Completed	Peter C. Donovan	Maine Medical Center
Rituximab and Combination Chemotherapy Followed by Bone Marrow or Peripheral Stem Cell Transplantation in Treating Patients With Relapsed or Refractory Non-Hodgkin's Lymphoma	2000-09-01	2011-01-01	44	Completed	Julie M Vose, MD	University of Nebraska
Stem Cell Transplantation in Patients With High-Risk and Recurrent Pediatric Sarcomas	2002-08-01	2012-04-01	60	Completed	Kristin Baird, M.D.	National Institutes of Health Clinical Center (CC)
The Effect of Azithromycin in Patients With Chronic Obstructive Pulmonary Disease (COPD) and Chronic Productive Cough	2009-09-01	2012-02-01	84	Completed	Jan W.K. van den Berg	Isala Klinieken
Evaluation of SQ109, High-dose Rifampicin, and Moxifloxacin in Adults With Smear-positive Pulmonary TB in a MAMS Design	2013-04-01	2014-12-01	365	Active, not recruiting	Michael Hoelscher	Ludwig-Maximilians - University of Munich
Combination Chemotherapy Followed By Autologous Stem Cell Transplant, and White Blood Cell Infusions in Treating Patients With Non-Hodgkin's Lymphoma	2004-03-01	2013-03-01	15	Completed	Lawrence Lum	Barbara Ann Karmanos Cancer Institute
Vascular and Metabolic Effects of Vytorin vs Simvastatin	2011-11-01	2012-11-01	204	Completed	Kwang Kon Koh	Gachon University Gil Medical Center
Determine the Effects of Gene Differences and Voriconazole on Enzyme CYP2B6 Activity in the Liver in Healthy Volunteers	2010-03-01	2013-04-01	61	Completed	Zeruesenay Desta	Indiana University
Monoclonal Antibody Therapy, Combination Chemotherapy, and Peripheral Stem Cell Transplant in Treating Patients With Relapsed or Refractory Non-Hodgkin's Lymphoma	2000-04-01	2014-12-01	50	Completed	Julie M Vose, MD	University of Nebraska
Craving, Binge Eating and Obesity	2005-12-01	2011-03-01	61	Completed	Marney A. White	Yale University
Ursodeoxycholic Acid in the Treatment of Intrahepatic Cholestasis of Pregnancy	1998-01-01	1998-12-01	20	Completed	Titta Joutsiniemi	Turku University Hospital
Mild Versus Potent Corticosteroids as Treatment for Phimosis in Children	2009-08-01	2009-09-01	0	Withdrawn	Anindya Niyogi	Chelsea and Westminster NHS Foundation Trust
The Impact of Proton Pump Inhibitors on the Fecal Microbiome	2013-03-01	2013-12-01	15	Completed	John K. DiBaise	Mayo Clinic
Effect of Ezetimibe or Simvastatin or Both on Low Densitiy Lipoprotein -Subfractions in Patients With Type 2 Diabetes	2007-11-01	2010-06-01	41	Completed	Karl Winkler	University Hospital Freiburg
A Pilot Trial of Modafinil for Treatment of Methamphetamine Dependence	2008-01-01	2011-06-01	20	Completed	Gantt Galloway, PharmD	California Pacific Medical Center Research Institute
Combination Chemotherapy Based on Risk of Relapse in Treating Young Patients With Acute Lymphoblastic Leukemia	2000-07-01	2012-01-01	4559	Completed	Martin Schrappe	University of Schleswig-Holstein
Effect of Daily Low Dose Aspirin on Exhaled Inflammatory Mediators in Normal Subjects	2009-05-01	2009-08-01	4	Completed	Elliot Israel, MD	Brigham and Women's Hospital
Oxycodone Extended-release in the Treatment of Perioperative Pain in Patients Undergoing Orthopaedic Surgery	2012-03-01	2012-09-01	40	Completed	Beatriz Arismendi Gómez	Hospital Central Dr. Luis Ortega
Statins to Reduce D-dimer Levels in Patients With Venous Thrombosis	2007-05-01	2011-05-01	10	Terminated	Walter Ageno	Università degli Studi dell'Insubria
Atorvastatin Treatment to Attenuate the Progression of Cardiovascular Disease in Hemodialysis Patients	2006-11-01	2008-12-01	446	Completed	Ercan OK	Ege University
Caspofungin Maximum Tolerated Dose in Patients With Invasive Aspergillosis	2006-10-01	2009-10-01	46	Completed	Oliver Cornely, MD	University of Cologne
Opioid Effects on Swallowing and Esophageal Sphincter Pressure	2010-10-01	2010-11-01	14	Completed	Johanna Savilampi	University Hospital Orebro
Cisplatin, Etoposide, and Cyclophosphamide in Treating Patients With Extensive-Stage Small Cell Lung Cancer	2003-06-01	2010-05-01	8	Completed	Ronald Go	Gundersen Lutheran Health System
Beneficial Effect of Salicylates: Insulin Action, Secretion or Clearance?	2010-07-01	2013-11-01	41	Completed	Gerald M Reaven	Stanford University
Developing Adaptive Treatment Strategies for Children and Adolescents With Obsessive-compulsive Disorder.	2010-08-01	2013-12-01	144	Completed	Roseli Shavitt	University of Sao Paulo
Sirolimus, Tacrolimus, Thymoglobulin and Rituximab as Graft-versus-Host-Disease Prophylaxis in Patients Undergoing Haploidentical and HLA Partially Matched Donor Hematopoietic Cell Transplantation	2010-08-01	2013-06-01	1	Terminated	Zaid Al-Kadhimi	Barbara Ann Karmanos Cancer Institute
A Randomized Controlled Trial of Oral Naproxen and Transdermal Estradiol for Bleeding in LNG-IUC	2008-11-01	2011-01-01	129	Completed	Tessa Madden, MD	Washington University School of Medicine
Allogeneic Stem Cell Transplant After ATG, High-Dose Melphalan, and Fludarabine for Patients With Metastatic Breast Cancer	2003-07-01	2008-03-01	5	Terminated	Edward Ball	University of California, San Diego
Maraviroc Plus Darunavir/Ritonavir for Treatment-Naïve Patients Infected With R5-tropic HIV-1	2010-05-01	2013-04-01	25	Completed	Babafemi Taiwo	Northwestern University
Omeprazole and Reflux Disease - Improvement of Clinical Outcome by Genotype-adjusted Dosing	2007-04-01	2010-12-01	68	Terminated	Matthias Schwab	Dr. Margarete Fischer-Bosch-Institut für Klinische Pharmakologie (IKP) am Robert-Bosch-Krankenhaus (RBK)
Bortezomib, Melphalan, and Dexamethasone in Treating Patients With Primary Amyloidosis or Light Chain Deposition Disease	2007-09-01	2010-10-01	35	Completed	Jeffrey Zonder	Barbara Ann Karmanos Cancer Institute
Sirolimus to Treat Cowden Syndrome and Other PTEN Hamartomatous Tumor Syndromes	2008-07-01	2012-10-01	18	Completed	Arun Rajan, M.D.	National Institutes of Health Clinical Center (CC)
Treatment of HDL to Reduce the Incidence of Vascular Events HPS2-THRIVE	2007-01-01	2012-10-01	25673	Completed	Jane Armitage	University of Oxford
Efficacy Study of Prophylactic Ibuprofen Versus Placebo on Pain Relief and Success Rates of Medical Abortion	2009-10-01	2010-10-01	61	Completed	Prof.  Daniel Seidman	Sheba Medical Center
Gastric pH and Anthocyanin Absorption	2010-05-01	2010-12-01	13	Completed	Janet Novotny	USDA Beltsville Human Nutrition Research Center
Study Evaluating Conversion From Tacrolimus to Sirolimus in Stable Kidney Transplant Recipients Receiving Myfortic	2007-05-01	2010-11-01	13	Completed	V. Ram Peddi	California Pacific Medical Center Research Institute
Pilot Study for HLA Identical Living Donor Renal Transplant Recipients	2002-06-01	2007-12-01	20	Completed	Rita Alloway	University of Cincinnati
The Discriminative Effects of Tramadol in Humans	2007-11-01	2011-08-01	12	Completed	Eric Strain, MD	Johns Hopkins University
Improved Induction and Maintenance Immunosuppression in Kidney Transplantation	2004-04-01	2011-06-01	180	Completed	R. Brian Stevens, MD	University of Nebraska Medical Center
Inflammation and Vascular Function in Atherosclerosis	2005-08-01	2011-02-01	44	Completed	Joshua A. Beckman, MD	Brigham and Women's Hospital
Tacrolimus and Sirolimus as Prophylaxis After Allogenic Non-myeloablative Peripheral Blood Stem Cell Transplantation	2006-01-01	2009-07-01	31	Completed	Vincent T. Ho, MD	Dana-Farber Cancer Institute
Open Label Study for the Functional Characterization of Drug Metabolism and Transport	2012-01-01	2015-05-01	144	Completed	Matthias Schwab	University Hospital Tuebingen
Fluconazole Prophylaxis for the Prevention of Candidiasis in Infants Less Than 750 Grams Birthweight	2008-11-01	2013-04-01	362	Completed	Daniel Benjamin	Duke University Medical Center
Etoposide, Cyclophosphamide, Thalidomide, Celecoxib, and Fenofibrate in Relapsed or Progressive Cancer	2005-01-01	2013-12-01	101	Completed	Mark W. Kieran, MD, PhD	Dana-Farber Cancer Institute
Fluoxetine for Obsessive-Compulsive Disorder in Children and Adolescents With Bipolar Disorder	2005-12-01	2010-09-01	13	Terminated	Gagan Joshi, MD	Massachusetts General Hospital
Bosentan for Poorly Controlled Asthma	2008-12-01	2010-09-01	11	Terminated	Mark Metersky	University of Connecticut Health Center
Salivary Epidermal Growth Factor (EGF) Concentration Before and After Treatment of Reflux Laryngitis	2009-01-01	2011-07-01	36	Completed	CLAUDIA ALESSANDRA ECKLEY	Faculdade de Ciências Médicas da Santa Casa de São Paulo
Nephropathy In Type 2 Diabetes and Cardio-renal Events	2003-03-01	2012-09-01	850	Active, not recruiting	Sasso Ferdinando Carlo	Second University of Naples
Antibiotic Therapy in Preventing Early Infection in Patients With Multiple Myeloma Who Are Receiving Chemotherapy	1997-03-01	2012-01-01	212	Completed	Gary Morrow	University of Rochester
Resistance to Antithrombotic Therapy	2008-05-01	2012-05-01	46	Completed	Christoph W. Kopp	Medical University of Vienna
Rosuvastatin Prevent Contrast Induced Acute Kidney Injury in Patients With Diabetes	2008-12-01	2011-11-01	2998	Completed	Han Yaling, MD	Shenyang Northern Hospital
Comparing the Effectiveness Between Ritonavir Boosted Atazanavir and Efavirenz for the First HIV Treatment	2005-09-01	2009-09-01	71	Completed	Shinichi Oka, M.D.	International Medical Center of Japan
Does Allopurinol Prolong a Treated, Acute Gout Flare?	2007-12-01	2013-06-01	35	Completed	Jay B. Higgs, MD	Wilford Hall Medical Center
Modafinil for Treatment of Cognitive Dysfunction in Schizophrenia	2005-09-01	2012-12-01	38	Completed	Michael Minzenberg, MD	University of California, Davis
Statin Therapy to Improve Atherosclerosis in HIV Patients	2009-09-01	2014-01-01	40	Completed	Steven K. Grinspoon, MD	Massachusetts General Hospital
Evaluation of the Use of Indomethacin as Co-treatment in Women With Preterm Labor and High Risk of Intraamniotic Inflammation	2012-04-01	2014-09-01	16	Completed	Sara Varea	Fundació Clínic per la Recerca Biomèdica
Simvastatin in Aneurysmal Subarachnoid Haemorrhage (STASH) a Multicentre Randomised Controlled Clinical Trial	2007-01-01	2014-02-01	803	Completed	Mr PJ Kirkpatrick	Cambridge University Hospitals NHS Foundation Trust
A Pilot Study of the Treatment of Central Serous Chorioretinopathy With Ketoconazole	2005-05-01	2008-04-01	5	Completed	Joan	Manhattan Eye, Ear & Throat Hospital
Metoclopramide for Migraine: A Dose Finding Study	2008-04-01	2010-03-01	349	Completed	Benjamin Friedman	Montefiore Medical Center
NSAIDs in Acute Achilles Tendinopathy: Effect on Pain Control, Leg Stiffness and Functional Recovery in Athletes	2009-08-01	2012-02-01	56	Completed	Javier Maquirriain	Argentine Tennis Association
Fluvastatin, Rosuvastatin Added to Pegylated Interferon and Ribavirin	2007-06-01	2010-10-01	40	Completed	Ted Bader, MD	Bader, Ted, M.D.
Umbilical Cord Blood Stem Cell Transplant in Treating Patients With Hematologic Cancer or Other Disease	2007-01-01	2015-01-01	2	Completed	Voravit Ratanatharathorn	Barbara Ann Karmanos Cancer Institute
Recovery of Diaphragmatic Function After Neuromuscular Blockade and Sugammadex	2013-10-01	2014-12-01	75	Completed	Tom Schepens, MD	University Hospital, Antwerp
Cocaine Withdrawal and Pharmacotherapy Response	2007-09-01	2013-01-01	77	Completed	Mehmet Sofuoglu	Yale University
Comparison of the Efficacy of Topical Ibuprofen to Oral Ibuprofen in Adolescent Athletes	2006-05-01	2009-04-01	60	Terminated	Eloise Lemon	Akron Children's Hospital
Detection of Plaque Inflammation by Positron Emission Tomography (PET)-Effects of Simvastatin on Plaque Inflammation	2004-09-01	2009-04-01	43	Completed	Hisashi Kai	Kurume University
Voriconazole Trough Plasma Levels : Genetic Polymorphism, Efficacy, Safety in Patients With Hematologic Malignancy	2010-08-01	2014-04-01	10	Terminated	Sung-Han Kim	Asan Medical Center
Voriconazole Pharmacokinetics in Children With Gastrointestinal Graft Versus Host Disease	2008-12-01	2012-07-01	5	Completed	Phillip Brian Smith	Duke University Medical Center
The Effect and Safety of Different Intensity Anticoagulation Therapy in Elderly Patients With Non-valvular Atrial Fibrillation	2010-01-01	2012-04-01	260	Completed	Wu Jun	Nanjing Medical University
A Controlled Study of Uric Acid on the Progression of IgA Nephropathy	2007-07-01	2009-06-01	40	Completed	Xue Qing Yu	Sun Yat-sen University
Short-term Atorvastatin's Effect on Acute Kidney Injury Following Cardiac Surgery	2009-07-01	2015-12-01	653	Active, not recruiting	Frederic T Billings IV	Vanderbilt University
Antibiotic Prophylaxis for Simple Hand Lacerations	2010-02-01	2012-02-01	73	Terminated	Shahriar Zehtabchi	State University of New York - Downstate Medical Center
Melphalan and Palifermin in Treating Patients Undergoing An Autologous Peripheral Stem Cell Transplant for Stage II or III Multiple Myeloma	2007-06-01	2012-09-01	38	Completed	Muneer Abidi	Barbara Ann Karmanos Cancer Institute
FOTO: Five Consecutive Days on Treatment With Efavirenz, Tenofovir, and Emtricitabine Followed by Two Days Off Treatment Versus Continuous Treatment	2006-08-01	2009-12-01	60	Completed	Cal Cohen	Community Research Initiative of New England
Simvastatin With or Without Ezetimibe and Atherothrombotic Biomarker Assessment	2009-01-01	2011-11-01	15	Completed	Michael Miller	University of Maryland
Anti-inflammatory Treatment at the Onset of Necrotizing Enterocolitis (NEC) in Preterm Infants	2009-09-01	2012-11-01	2	Terminated	Brandy Frost	NorthShore University HealthSystem Research Institute
Diagnosis and Therapy of Vulnerable Atherosclerotic Plaque	2005-09-01	2009-01-01	300	Completed	Nikolaos Kadoglou	Aristotle University Of Thessaloniki
Safety and Efficacy Trial of Danazol in Patients With Fanconi Anemia or Dyskeratosis Congenita	2009-11-01	2014-05-01	5	Terminated	Colin Sieff	Children's Hospital Boston
Gefitinib With or Without Simvastatin in Non-Small Cell Lung Cancer (NSCLC)	2006-05-01	2011-03-01	110	Completed	Ji-youn Han	National Cancer Center, Korea
The Effect of XueZhiKang on Fatigue：Comparing With Simvastatin	2012-08-01	2013-09-01	60	Completed	JiFei Tang	Wenzhou Medical University
Sorafenib, Cisplatin, and Etoposide in Treating Patients With Extensive-Stage Small Cell Lung Cancer	2008-07-01	2012-07-01	18	Terminated	Afshin Dowlati, MD	Case Comprehensive Cancer Center
Effectiveness of Modafinil and D-amphetamine in Treating Cocaine Dependent Individuals	2006-03-01	2012-01-01	73	Completed	Joy Schmitz	The University of Texas Health Science Center, Houston
Statin Therapy in Heart Failure: Potential Mechanisms of Benefit	2005-08-01	2009-02-01	27	Completed	Tamara Horwich	University of California, Los Angeles
The Additive Anti-inflammatory Effect of Simvastatin in Combination With Inhaled Corticosteroids in Asthma	2008-12-01	2009-09-01	53	Completed	Kittipong Maneechotesuwan	Mahidol University
\.


--
-- Data for Name: contains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contains (drugproduct, drugname) FROM stdin;
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
-- Data for Name: disease; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disease (diseasename) FROM stdin;
Sick sinus syndrome, 608567
Leukemia, post-chemotherapy, susceptibility to
Cholestasis
Central hypoventilation syndrome, congenital, 209880
Congestive heart failure
Familial Mediterranean fever, 249100
Heinz body anemia
Migraine, resistance to, 157300
Abetalipoproteinemia
Schizophrenia, susceptibility to, 181500
Tangier disease
Carpal tunnel syndrome, familial
Epilepsy, generalized, with febrile seizures plus, type 2, 604233
Medullary thyroid carcinoma, 155240
Costello syndrome
Bladder cancer, somatic, 109800
Obsessive-compulsive disorder
Diabetes mellitus, insulin-resistant, with acanthosis nigricans and hypertension, 604367
Beta-2-adrenoreceptor agonist, reduced response to
Blood group, Colton, 110450
IgG receptor I, phagocytic, familial deficiency of
Obesity
HDL cholesterol level QTL
Dementia
Lymphoma
Asthma, dimished response to antileukotriene treatment in, 600807
Diabetes mellitus, permanent neonatal, with neurologic features, 606176
Amyloidosis, senile systemic
Anorexia nervosa
Epilepsy, juvenile myoclonic, 606904
Ventricular fibrillation, idiopathic
Heinz body anemias, alpha-
Complementary component deficiency
Benzene toxicity
Hyperapobetalipoproteinemia
Diabetes, permanent neonatal, 606176
ABCD syndrome, 600501
Anorexia nervosa, susceptibility to, 606788
Hypereosinophilic syndrome, idiopathic, resistant to imatinib, 607685
Lymphoma, progression of
Timothy syndrome, 601005
Myelomonocytic leukemia, chronic
Combined hyperlipemia, familial
Ataxia
Bladder cancer
Renal tubular acidosis
Lipodystrophy
Blood group, Yt system, 112100
Alcohol dependence
Lipodystrophy, familial partial, 151660
Benzene toxicity, susceptibility to
Estrogen resistance
Alzheimer disease
Methemoglobinemia
Hypereosinophilic syndrome
Persistent hyperinsulinemic hypoglycemia of infancy
Seasonal affective disorder
Obsessive-compulsive disorder, susceptibility to, 164230
Waardenburg-Shah syndrome, 277580
Multiple endocrine neoplasia IIB, 162300
Hypokalemic periodic paralysis
Ataxia, episodic
Viral infection
Atherosclerosis
Myelogenous leukemia
Insensitivity to pain
Hypercholesterolemia, due to ligand-defective apo B, 144010
Medullary thyroid carcinoma
Immunodeficiency due to defect in CD3-epsilon
Ezetimibe, nonresponse to
Anxiety-related personality traits
Methemoglobinemias, alpha-
Tuberculosis, susceptibility to, 607948
Hypoglycemia
Bartter syndrome, type 2, 241200
Congenital bilateral absence of vas deferens, 277180
HDL response to hormone replacement, augmented
Xanthinuria, type I
Tall stature
Sepsis
Orthostatic intolerance
Waardenburg-Shah syndrome
Leukemia
Hypolactasia, adult type
Sweat chloride elevation without CF
Diabetes mellitus
Epilepsy
Medullary thyroid carcinoma, familial, 155240
Leukocyte adhesion deficiency
Night blindness, congenital stationary, X-linked, type 2, 300071
Fertile eunuch syndrome
Colchicine resistance
Migraine
Epilepsy, severe myoclonic, of infancy, 607208
Hypertension
Amyloid neuropathy
Coronary spasms
Gastrointestinal stromal tumor
Xanthinuria, type I, 278300
AIDS, rapid progression to, 609423
Congenital bilateral absence of vas deferens
Insensitivity to pain, congenital, with anhidrosis, 256800
Lupus erythematosus
Cerebral amyloid angiopathy, 105150
Orthostatic intolerance, 604715
ABCD syndrome
Amyloidosis
Coronary spasms, susceptibility to
Cortisol resistance
Immunodeficiency
Obesity, resistance to
Hypercholesterolemia
Tall stature, susceptibility to
Myeloproliferative disorder
Coronary artery disease in familial hypercholesterolemia, protection against, 143890
Acromegaly, 102200
Aquaporin-1 deficiency
Epilepsy, generalized idiopathic, 600669
Mental retardation
Vitamin K-dependent coagulation defect, 277450
Malaria
Preeclampsia
Persistent hyperinsulinemic hypoglycemia of infancy, 256450
Atrioventricular block
Erythremias, alpha-
Tuberculosis
Long QT syndrome-2
Thyrotoxic periodic paralysis, susceptibility to, 188580
Hypertension, essential, susceptibility to, 145500
Dubin-Johnson syndrome, 237500
Hypokalemic periodic paralysis, 170400
Syndactyly, type III, 186100
Glioblastoma, susceptibility to, 137800
AIDS
Coronary heart disease, susceptibility to
Kaposi sarcoma
Lupus nephritis, susceptibility to
Brugada syndrome
Renal tubular dysgenesis
Combined hyperlipemia
Dystonia
Preeclampsia, susceptibility to
Brugada syndrome, 601144
Obesity, severe, 601665
Hypoprothrombinemia
Acquired long QT syndrome
Hypoplastic left heart syndrome, 241550
Seasonal affective disorder, susceptibility to, 608516
Hirschsprung disease
Multiple endocrine neoplasia IIA, 171400
Insulin resistance, severe, digenic, 604367
Kaposi sarcoma, susceptibility to, 148000
Hyperapobetalipoproteinemia, susceptibility to
Statins, attenuated cholesterol lowering by
Long QT syndrome
Warfarin resistance, 122700
Familial Mediterranean fever
Cardiomyopathy
Alpha-methylacetoacetic aciduria, 203750
Hypertrypsinemia
Thalassemias, alpha-
DNA topoisomerase
Atherosclerosis, susceptibility to
Myeloproliferative disorder with eosinophilia, 131440
Leukocyte adhesion deficiency, 116920
Hypertrypsinemia, neonatal
Leukemia, acute myeloid, 601626
Septic shock, susceptibility to
Multiple endocrine neoplasia
Leukemia, Philadelphia chromosome-positive, resistant to imatinib
TSC2 angiomyolipomas, renal, modifier of, 191100
Statins
Immunodeficiency with hyper-IgM, type 3, 606843
Asthma, susceptibility to, 600807
Piebaldism
Costello syndrome, 218040
Chylomicronemia syndrome, familial
Atrioventricular septal defect, 600309
Oculodentodigital dysplasia
Vitamin K-dependent clotting factors, combined deficiency of, 2, 607473
Tuberous sclerosis
Dysalbuminemic hyperthyroxinemia
Acromegaly
Ventricular fibrillation, idiopathic, 603829
Timothy syndrome
Dysprothrombinemia
Alpha-methylacetoacetic aciduria
Germ cell tumor
Schizophrenia
Cerebral amyloid angiopathy
Pancreatitis, idiopathic
Sick sinus syndrome
Aplastic anemia
Pancreatitis
Hypertension, pregnancy-induced, 189800
Tangier disease, 205400
Thyroid carcinoma
Myeloid malignancy, predisposition to
Asthma, nocturnal, susceptibility to
Erythremias
Platelet ADP receptor defect
Central hypoventilation syndrome
Heart block, nonprogressive, 113900
Long QT syndrome-3, 603830
Diabetic retinopathy, NIDDM-related, susceptibility to, 125853
Vitamin K-dependent coagulation defect
Coronary artery disease
Alzheimer disease, late-onset, susceptibility to, 104300
C1q deficiency, type A
Hyperprothrombinemia
Dubin-Johnson syndrome
Dystransthyretinemic hyperthyroxinemia
Alcohol dependence, susceptibility to, 103780
Heart block, progressive, type I, 113900
Aplastic anemia, 609135
Malignant hyperthermia susceptibility
Resting heart rate
Migraine, susceptibility to, 157300
Warfarin resistance/sensitivity
Glioblastoma
Hypoplastic left heart syndrome
Renal tubular acidosis-osteopetrosis syndrome
Immunodeficiency, X-linked, with hyper-IgM, 308230
Neutropenia, alloimmune neonatal
Night blindness
DNA topoisomerase II, resistance to inhibition of, by amsacrine
Germ cell tumors, 273300
Hirschsprung disease, 142623
Cystic fibrosis
Amyloid neuropathy, familial, several allelic types
Thalassemias
Heart block
Coronary artery spasm, susceptibility to
Blood group
HDL deficiency, familial, 604091
Syndactyly
Obesity, hyperphagia, and developmental delay
Asthma
Platelet defect/deficiency
Mast cell leukemia
Thyroid carcinoma, follicular, somatic, 188470
Diabetes mellitus, 125853
Hypertension, susceptibility to, 145500
Migraine without aura, susceptibility to, 157300
Hypoglycemia of infancy, leucine-sensitive, 240800
Gastrointestinal stromal tumor, somatic, 606764
Obsessive-compulsive disorder 1, 164230
Osteolysis
Acquired long QT syndrome, susceptibility to
Malaria, cerebral, susceptibility to
Hypoglycemia of infancy, persistent hyperinsulinemic, 256450
Lipoprotein lipase deficiency
Hypobetalipoproteinemia
Hypolactasia, adult type, 223100
Obesity, susceptibility to, 601665
Hirschsprung disease-2, 600155
C1q deficiency, type B
Thyrotoxic periodic paralysis
Dementia, vascular, susceptibility to
Coronary artery disease, susceptibility to
Insulin resistance
Analbuminemia
Cystic fibrosis, 219700
Fertile eunuch syndrome, 228300
Dystransthyretinemic hyperthyroxinemia(3)
Mastocytosis with associated hematologic disorder
Obesity, adrenal insufficiency, and red hair
Malignant hyperthermia susceptibility 5, 601887
Malaria, resistance to, 248310
Placental abruption
Cardiomyopathy, dilated, with ventricular tachycardia, 608569
Resting heart rate, 607276
Viral infections, recurrent
Cholestasis, progressive familial intrahepatic 2, 601847
C1s deficiency, isolated
Colonic aganglionosis, total, with small bowel involvement
Neutropenia
Oculodentodigital dysplasia, 164200
Renal tubular dysgenesis, 267430
Bartter syndrome
Osteolysis, idiopathic, Saudi type, 605156
Dystonia, myoclonic, 159900
Congestive heart failure, susceptibility to
Hypogonadotropic hypogonadism
\.


--
-- Data for Name: diseasecategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diseasecategory (catname) FROM stdin;
Unclassified
Gastrointestinal
Psychiatric
Endocrine
Bone
Hematological
Connective_tissue_disorder
Cancer
multiple
Respiratory
Cardiovascular
Skeletal
Immunological
Connective%5Ftissue%5Fdisorder
Metabolic
Nutritional
Ophthamological
Renal
Neurological
Dermatological
\.


--
-- Data for Name: drug; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drug (name) FROM stdin;
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
-- Data for Name: drugcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drugcategory (catname) FROM stdin;
Anti-infectives
Estrogens
Nonnucleoside reverse transcriptase inhibitors
Antibiotics
Dopamine antagonists
Reverse transcriptase inhibitors
Proton-pump inhibitors
Quinolones
Antibiotics, antineoplastic
Abortifacient agents, nonsteroidal
Protease inhibitors
Sulfonamides
Antihypertensive agents
Folic acid antagonists
Enzyme inhibitors
Antiprotozoals
Fibrinolytic agents
Antimetabolites, antineoplastic
Hydroxymethylglutaryl-coa reductase inhibitors
Anti-bacterial agents
Allylamines
Other macrolides
Analgesics, non-narcotic
Stimulants
Abortifacient agents
Ketolides
Anorexigenic agents
Antibacterial agents
Cyclooxygenase inhibitors
Anticonvulsants
Immunomodulatory agents
Central nervous system stimulants
Cholesterol absorption inhibitors
Hypoglycemic agents
Immunosuppressive agents
Neuroprotective agents
Anti-obesity agents
Nucleic acid synthesis inhibitors
Antifungal agents
Central nervous system agents
Antibiotics, antitubercular
Analgesics
Protein synthesis inhibitors
Gout suppressants
Hiv protease inhibitors
Vasodilator agents
Prokinetic agents
Antiprotozoal agents
Salicylates
Leprostatic agents
Antiemetics
Anti-infective agents
Dermatologic agents
Antibiotics, antifungal
Cardiovascular agents
Antirheumatic agents
Nonsteroidal antiinflammatory agents(nsaids)
Antilipemic agents
Antimanic agents
Trypanocidal agents
Meglitinides
Anti-inflammatory agents
Antineoplastic agents
Antituberculosis agents
Tocolytic agents
Anti-hiv agents
Antimetabolites
Anti-inflammatory agents, non-steroidal
Anticoagulants
Anticholesteremic agents
Antifungals
Anti-ulcer agents
Hmg-coa reductase inhibitors
Platelet aggregation inhibitors
\.


--
-- Data for Name: drugtreats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drugtreats (drugname, diseasename) FROM stdin;
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
-- Data for Name: hascategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hascategory (drug, category) FROM stdin;
efavirenz	Anti-hiv agents
efavirenz	Nonnucleoside reverse transcriptase inhibitors
efavirenz	Reverse transcriptase inhibitors
oxcarbazepine	Anticonvulsants
tacrolimus	Immunosuppressive agents
orlistat	Enzyme inhibitors
orlistat	Anti-obesity agents
naproxen	Cyclooxygenase inhibitors
naproxen	Anti-inflammatory agents, non-steroidal
naproxen	Gout suppressants
aspirin	Cyclooxygenase inhibitors
aspirin	Anticoagulants
aspirin	Fibrinolytic agents
aspirin	Anti-inflammatory agents, non-steroidal
aspirin	Platelet aggregation inhibitors
aspirin	Salicylates
rifampin	Enzyme inhibitors
rifampin	Antituberculosis agents
rifampin	Antibiotics, antitubercular
rifampin	Antibiotics
rifampin	Leprostatic agents
rifampin	Nucleic acid synthesis inhibitors
lovastatin	Antineoplastic agents
lovastatin	Anticholesteremic agents
lovastatin	Hydroxymethylglutaryl-coa reductase inhibitors
lovastatin	Hmg-coa reductase inhibitors
etodolac	Nonsteroidal antiinflammatory agents(nsaids)
etodolac	Cyclooxygenase inhibitors
etodolac	Anti-inflammatory agents, non-steroidal
bosentan	Antihypertensive agents
ketoprofen	Cyclooxygenase inhibitors
ketoprofen	Anti-inflammatory agents, non-steroidal
piroxicam	Cyclooxygenase inhibitors
piroxicam	Anti-inflammatory agents, non-steroidal
sulfamethoxazole	Anti-infectives
sulfamethoxazole	Anti-infective agents
sulfamethoxazole	Sulfonamides
ethinyl estradiol	Estrogens
omeprazole	Enzyme inhibitors
omeprazole	Anti-ulcer agents
omeprazole	Proton-pump inhibitors
ezetimibe	Anticholesteremic agents
ezetimibe	Cholesterol absorption inhibitors
telithromycin	Ketolides
telithromycin	Anti-bacterial agents
quinupristin	Antibacterial agents
erythromycin	Anti-bacterial agents
glipizide	Hypoglycemic agents
indomethacin	Nonsteroidal antiinflammatory agents(nsaids)
indomethacin	Tocolytic agents
indomethacin	Cyclooxygenase inhibitors
indomethacin	Anti-inflammatory agents, non-steroidal
indomethacin	Gout suppressants
indomethacin	Cardiovascular agents
indomethacin	Anti-inflammatory agents
cyclosporine	Enzyme inhibitors
cyclosporine	Immunomodulatory agents
cyclosporine	Immunosuppressive agents
cyclosporine	Antirheumatic agents
cyclosporine	Antifungal agents
cyclosporine	Dermatologic agents
norfloxacin	Anti-infectives
norfloxacin	Enzyme inhibitors
norfloxacin	Anti-bacterial agents
norfloxacin	Quinolones
norfloxacin	Nucleic acid synthesis inhibitors
sirolimus	Antifungals
sirolimus	Anti-bacterial agents
sirolimus	Antibiotics, antineoplastic
sirolimus	Immunosuppressive agents
sirolimus	Antifungal agents
imipenem	Anti-bacterial agents
simvastatin	Anticholesteremic agents
simvastatin	Hydroxymethylglutaryl-coa reductase inhibitors
simvastatin	Antilipemic agents
methotrexate	Antineoplastic agents
methotrexate	Folic acid antagonists
methotrexate	Abortifacient agents
methotrexate	Enzyme inhibitors
methotrexate	Antimetabolites
methotrexate	Antimetabolites, antineoplastic
methotrexate	Immunosuppressive agents
methotrexate	Antirheumatic agents
methotrexate	Dermatologic agents
methotrexate	Nucleic acid synthesis inhibitors
methotrexate	Abortifacient agents, nonsteroidal
rifabutin	Antibiotics, antitubercular
rifabutin	Anti-bacterial agents
terbinafine	Enzyme inhibitors
terbinafine	Antifungals
terbinafine	Allylamines
terbinafine	Trypanocidal agents
terbinafine	Antifungal agents
voriconazole	Antifungals
voriconazole	Antifungal agents
itraconazole	Antiprotozoals
itraconazole	Antifungals
itraconazole	Antiprotozoal agents
itraconazole	Antifungal agents
atazanavir	Anti-hiv agents
atazanavir	Hiv protease inhibitors
atazanavir	Protease inhibitors
ritonavir	Anti-hiv agents
ritonavir	Hiv protease inhibitors
ibuprofen	Nonsteroidal antiinflammatory agents(nsaids)
ibuprofen	Analgesics
ibuprofen	Cyclooxygenase inhibitors
ibuprofen	Anti-inflammatory agents, non-steroidal
ibuprofen	Analgesics, non-narcotic
ibuprofen	Anti-inflammatory agents
carbamazepine	Analgesics
carbamazepine	Anticonvulsants
carbamazepine	Antimanic agents
carbamazepine	Analgesics, non-narcotic
posaconazole	Antibiotics, antifungal
posaconazole	Trypanocidal agents
pravastatin	Anticholesteremic agents
pravastatin	Hydroxymethylglutaryl-coa reductase inhibitors
pravastatin	Hmg-coa reductase inhibitors
azithromycin	Anti-bacterial agents
azithromycin	Other macrolides
nabumetone	Antineoplastic agents
nabumetone	Anti-inflammatory agents, non-steroidal
troglitazone	Antineoplastic agents
troglitazone	Fibrinolytic agents
troglitazone	Vasodilator agents
troglitazone	Hypoglycemic agents
troglitazone	Platelet aggregation inhibitors
modafinil	Central nervous system stimulants
modafinil	Anorexigenic agents
modafinil	Stimulants
modafinil	Neuroprotective agents
modafinil	Central nervous system agents
repaglinide	Hypoglycemic agents
repaglinide	Meglitinides
clarithromycin	Protein synthesis inhibitors
clarithromycin	Anti-bacterial agents
clarithromycin	Other macrolides
ethotoin	Anticonvulsants
metoclopramide	Dopamine antagonists
metoclopramide	Prokinetic agents
metoclopramide	Antiemetics
\.


--
-- Data for Name: hasdiseasecategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hasdiseasecategory (disease, diseasecategory) FROM stdin;
Sick sinus syndrome, 608567	Cardiovascular
Leukemia, post-chemotherapy, susceptibility to	Cancer
Cholestasis	Gastrointestinal
Central hypoventilation syndrome, congenital, 209880	Respiratory
Congestive heart failure	Cardiovascular
Familial Mediterranean fever, 249100	Immunological
Heinz body anemia	Hematological
Migraine, resistance to, 157300	Neurological
Abetalipoproteinemia	Metabolic
Schizophrenia, susceptibility to, 181500	Psychiatric
Tangier disease	Metabolic
Carpal tunnel syndrome, familial	Unclassified
Epilepsy, generalized, with febrile seizures plus, type 2, 604233	Neurological
Medullary thyroid carcinoma, 155240	Cancer
Costello syndrome	multiple
Bladder cancer, somatic, 109800	Cancer
Obsessive-compulsive disorder	Psychiatric
Diabetes mellitus, insulin-resistant, with acanthosis nigricans and hypertension, 604367	Endocrine
Beta-2-adrenoreceptor agonist, reduced response to	Unclassified
Blood group, Colton, 110450	Hematological
IgG receptor I, phagocytic, familial deficiency of	Immunological
Obesity	Nutritional
HDL cholesterol level QTL	Metabolic
Dementia	Neurological
Lymphoma	Cancer
Asthma, dimished response to antileukotriene treatment in, 600807	Respiratory
Diabetes mellitus, permanent neonatal, with neurologic features, 606176	Endocrine
Amyloidosis, senile systemic	Neurological
Anorexia nervosa	Nutritional
Epilepsy, juvenile myoclonic, 606904	Neurological
Ventricular fibrillation, idiopathic	Cardiovascular
Heinz body anemias, alpha-	Hematological
Complementary component deficiency	Immunological
Benzene toxicity	Unclassified
Hyperapobetalipoproteinemia	Metabolic
Diabetes, permanent neonatal, 606176	Endocrine
ABCD syndrome, 600501	multiple
Anorexia nervosa, susceptibility to, 606788	Nutritional
Hypereosinophilic syndrome, idiopathic, resistant to imatinib, 607685	Hematological
Lymphoma, progression of	Cancer
Timothy syndrome, 601005	multiple
Myelomonocytic leukemia, chronic	Cancer
Combined hyperlipemia, familial	Metabolic
Ataxia	Neurological
Bladder cancer	Cancer
Renal tubular acidosis	Renal
Lipodystrophy	Metabolic
Blood group, Yt system, 112100	Hematological
Alcohol dependence	Unclassified
Lipodystrophy, familial partial, 151660	Metabolic
Benzene toxicity, susceptibility to	Unclassified
Estrogen resistance	Endocrine
Alzheimer disease	Neurological
Methemoglobinemia	Hematological
Hypereosinophilic syndrome	Hematological
Persistent hyperinsulinemic hypoglycemia of infancy	Metabolic
Seasonal affective disorder	Psychiatric
Obsessive-compulsive disorder, susceptibility to, 164230	Psychiatric
Waardenburg-Shah syndrome, 277580	multiple
Multiple endocrine neoplasia IIB, 162300	Cancer
Hypokalemic periodic paralysis	Renal
Ataxia, episodic	Neurological
Viral infection	Immunological
Atherosclerosis	Cardiovascular
Myelogenous leukemia	Cancer
Insensitivity to pain	Neurological
Hypercholesterolemia, due to ligand-defective apo B, 144010	Metabolic
Medullary thyroid carcinoma	Cancer
Immunodeficiency due to defect in CD3-epsilon	Immunological
Ezetimibe, nonresponse to	Unclassified
Anxiety-related personality traits	Psychiatric
Methemoglobinemias, alpha-	Hematological
Tuberculosis, susceptibility to, 607948	Respiratory
Hypoglycemia	Metabolic
Bartter syndrome, type 2, 241200	multiple
Congenital bilateral absence of vas deferens, 277180	Unclassified
HDL response to hormone replacement, augmented	Metabolic
Xanthinuria, type I	Metabolic
Tall stature	Skeletal
Sepsis	Immunological
Orthostatic intolerance	Cardiovascular
Waardenburg-Shah syndrome	multiple
Leukemia	Cancer
Hypolactasia, adult type	Metabolic
Sweat chloride elevation without CF	Unclassified
Diabetes mellitus	Endocrine
Epilepsy	Neurological
Medullary thyroid carcinoma, familial, 155240	Cancer
Leukocyte adhesion deficiency	Immunological
Night blindness, congenital stationary, X-linked, type 2, 300071	Ophthamological
Fertile eunuch syndrome	Endocrine
Colchicine resistance	Unclassified
Migraine	Neurological
Epilepsy, severe myoclonic, of infancy, 607208	Neurological
Hypertension	Cardiovascular
Amyloid neuropathy	Neurological
Coronary spasms	Cardiovascular
Gastrointestinal stromal tumor	Cancer
Xanthinuria, type I, 278300	Metabolic
AIDS, rapid progression to, 609423	Immunological
Congenital bilateral absence of vas deferens	Unclassified
Insensitivity to pain, congenital, with anhidrosis, 256800	Neurological
Lupus erythematosus	Connective%5Ftissue%5Fdisorder
Cerebral amyloid angiopathy, 105150	Neurological
Orthostatic intolerance, 604715	Cardiovascular
ABCD syndrome	multiple
Amyloidosis	Neurological
Coronary spasms, susceptibility to	Cardiovascular
Cortisol resistance	Endocrine
Immunodeficiency	Immunological
Obesity, resistance to	Nutritional
Hypercholesterolemia	Metabolic
Tall stature, susceptibility to	Skeletal
Myeloproliferative disorder	Cancer
Coronary artery disease in familial hypercholesterolemia, protection against, 143890	Cardiovascular
Acromegaly, 102200	Endocrine
Aquaporin-1 deficiency	Unclassified
Epilepsy, generalized idiopathic, 600669	Neurological
Mental retardation	Neurological
Vitamin K-dependent coagulation defect, 277450	Hematological
Malaria	Immunological
Preeclampsia	Cardiovascular
Persistent hyperinsulinemic hypoglycemia of infancy, 256450	Metabolic
Atrioventricular block	Cardiovascular
Erythremias, alpha-	Hematological
Tuberculosis	Respiratory
Long QT syndrome-2	Cardiovascular
Thyrotoxic periodic paralysis, susceptibility to, 188580	Endocrine
Hypertension, essential, susceptibility to, 145500	Cardiovascular
Dubin-Johnson syndrome, 237500	Metabolic
Hypokalemic periodic paralysis, 170400	Renal
Syndactyly, type III, 186100	Skeletal
Glioblastoma, susceptibility to, 137800	Cancer
AIDS	Immunological
Coronary heart disease, susceptibility to	Cardiovascular
Kaposi sarcoma	Immunological
Lupus nephritis, susceptibility to	Connective_tissue_disorder
Brugada syndrome	Cardiovascular
Renal tubular dysgenesis	Renal
Combined hyperlipemia	Metabolic
Dystonia	Neurological
Preeclampsia, susceptibility to	Cardiovascular
Brugada syndrome, 601144	Cardiovascular
Obesity, severe, 601665	Nutritional
Hypoprothrombinemia	Hematological
Acquired long QT syndrome	Cardiovascular
Hypoplastic left heart syndrome, 241550	Cardiovascular
Seasonal affective disorder, susceptibility to, 608516	Psychiatric
Hirschsprung disease	Gastrointestinal
Multiple endocrine neoplasia IIA, 171400	Cancer
Insulin resistance, severe, digenic, 604367	Metabolic
Kaposi sarcoma, susceptibility to, 148000	Immunological
Hyperapobetalipoproteinemia, susceptibility to	Metabolic
Statins, attenuated cholesterol lowering by	Metabolic
Long QT syndrome	Cardiovascular
Warfarin resistance, 122700	Hematological
Familial Mediterranean fever	Immunological
Cardiomyopathy	Cardiovascular
Alpha-methylacetoacetic aciduria, 203750	Metabolic
Hypertrypsinemia	Gastrointestinal
Thalassemias, alpha-	Hematological
DNA topoisomerase	Metabolic
Atherosclerosis, susceptibility to	Cardiovascular
Myeloproliferative disorder with eosinophilia, 131440	Cancer
Leukocyte adhesion deficiency, 116920	Immunological
Hypertrypsinemia, neonatal	Gastrointestinal
Leukemia, acute myeloid, 601626	Cancer
Septic shock, susceptibility to	Immunological
Multiple endocrine neoplasia	Cancer
Leukemia, Philadelphia chromosome-positive, resistant to imatinib	Cancer
TSC2 angiomyolipomas, renal, modifier of, 191100	multiple
Statins	Metabolic
Immunodeficiency with hyper-IgM, type 3, 606843	Immunological
Asthma, susceptibility to, 600807	Respiratory
Piebaldism	Dermatological
Costello syndrome, 218040	multiple
Chylomicronemia syndrome, familial	Metabolic
Atrioventricular septal defect, 600309	Cardiovascular
Oculodentodigital dysplasia	Skeletal
Vitamin K-dependent clotting factors, combined deficiency of, 2, 607473	Hematological
Tuberous sclerosis	multiple
Dysalbuminemic hyperthyroxinemia	Hematological
Acromegaly	Endocrine
Ventricular fibrillation, idiopathic, 603829	Cardiovascular
Timothy syndrome	multiple
Dysprothrombinemia	Hematological
Alpha-methylacetoacetic aciduria	Metabolic
Germ cell tumor	Cancer
Schizophrenia	Psychiatric
Cerebral amyloid angiopathy	Neurological
Pancreatitis, idiopathic	Gastrointestinal
Sick sinus syndrome	Cardiovascular
Aplastic anemia	Hematological
Pancreatitis	Gastrointestinal
Hypertension, pregnancy-induced, 189800	Cardiovascular
Tangier disease, 205400	Metabolic
Thyroid carcinoma	Cancer
Myeloid malignancy, predisposition to	Cancer
Asthma, nocturnal, susceptibility to	Respiratory
Erythremias	Hematological
Platelet ADP receptor defect	Hematological
Central hypoventilation syndrome	Respiratory
Heart block, nonprogressive, 113900	Cardiovascular
Long QT syndrome-3, 603830	Cardiovascular
Diabetic retinopathy, NIDDM-related, susceptibility to, 125853	Endocrine
Vitamin K-dependent coagulation defect	Hematological
Coronary artery disease	Cardiovascular
Alzheimer disease, late-onset, susceptibility to, 104300	Neurological
C1q deficiency, type A	Immunological
Hyperprothrombinemia	Hematological
Dubin-Johnson syndrome	Metabolic
Dystransthyretinemic hyperthyroxinemia	Hematological
Alcohol dependence, susceptibility to, 103780	Unclassified
Heart block, progressive, type I, 113900	Cardiovascular
Aplastic anemia, 609135	Hematological
Malignant hyperthermia susceptibility	Neurological
Resting heart rate	Cardiovascular
Migraine, susceptibility to, 157300	Neurological
Warfarin resistance/sensitivity	Hematological
Glioblastoma	Cancer
Hypoplastic left heart syndrome	Cardiovascular
Renal tubular acidosis-osteopetrosis syndrome	Renal
Immunodeficiency, X-linked, with hyper-IgM, 308230	Immunological
Neutropenia, alloimmune neonatal	Hematological
Night blindness	Ophthamological
DNA topoisomerase II, resistance to inhibition of, by amsacrine	Metabolic
Germ cell tumors, 273300	Cancer
Hirschsprung disease, 142623	Gastrointestinal
Cystic fibrosis	Respiratory
Amyloid neuropathy, familial, several allelic types	Neurological
Thalassemias	Hematological
Heart block	Cardiovascular
Coronary artery spasm, susceptibility to	Cardiovascular
Blood group	Hematological
HDL deficiency, familial, 604091	Metabolic
Syndactyly	Skeletal
Obesity, hyperphagia, and developmental delay	Nutritional
Asthma	Respiratory
Platelet defect/deficiency	Hematological
Mast cell leukemia	Cancer
Thyroid carcinoma, follicular, somatic, 188470	Cancer
Diabetes mellitus, 125853	Endocrine
Hypertension, susceptibility to, 145500	Cardiovascular
Migraine without aura, susceptibility to, 157300	Neurological
Hypoglycemia of infancy, leucine-sensitive, 240800	Metabolic
Gastrointestinal stromal tumor, somatic, 606764	Cancer
Obsessive-compulsive disorder 1, 164230	Psychiatric
Osteolysis	Bone
Acquired long QT syndrome, susceptibility to	Cardiovascular
Malaria, cerebral, susceptibility to	Immunological
Hypoglycemia of infancy, persistent hyperinsulinemic, 256450	Metabolic
Lipoprotein lipase deficiency	Metabolic
Hypobetalipoproteinemia	Metabolic
Hypolactasia, adult type, 223100	Metabolic
Obesity, susceptibility to, 601665	Nutritional
Hirschsprung disease-2, 600155	Gastrointestinal
C1q deficiency, type B	Immunological
Thyrotoxic periodic paralysis	Endocrine
Dementia, vascular, susceptibility to	Neurological
Coronary artery disease, susceptibility to	Cardiovascular
Insulin resistance	Metabolic
Analbuminemia	Hematological
Cystic fibrosis, 219700	Respiratory
Fertile eunuch syndrome, 228300	Endocrine
Dystransthyretinemic hyperthyroxinemia(3)	Hematological
Mastocytosis with associated hematologic disorder	Immunological
Obesity, adrenal insufficiency, and red hair	Nutritional
Malignant hyperthermia susceptibility 5, 601887	Neurological
Malaria, resistance to, 248310	Immunological
Placental abruption	Unclassified
Cardiomyopathy, dilated, with ventricular tachycardia, 608569	Cardiovascular
Resting heart rate, 607276	Cardiovascular
Viral infections, recurrent	Immunological
Cholestasis, progressive familial intrahepatic 2, 601847	Gastrointestinal
C1s deficiency, isolated	Immunological
Colonic aganglionosis, total, with small bowel involvement	Gastrointestinal
Neutropenia	Hematological
Oculodentodigital dysplasia, 164200	Skeletal
Renal tubular dysgenesis, 267430	Renal
Bartter syndrome	multiple
Osteolysis, idiopathic, Saudi type, 605156	Bone
Dystonia, myoclonic, 159900	Neurological
Congestive heart failure, susceptibility to	Cardiovascular
Hypogonadotropic hypogonadism	Endocrine
\.


--
-- Data for Name: hassideeffect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hassideeffect (drugname, sideeffect) FROM stdin;
efavirenz	ulceration
efavirenz	agitation
efavirenz	hepatitis b
efavirenz	carcinogenicity
efavirenz	sweating
efavirenz	somnolence
efavirenz	abuse
efavirenz	mania
efavirenz	aggressive
efavirenz	dermatitis
efavirenz	congenital anomalies
efavirenz	blister
efavirenz	epidermal necrolysis
efavirenz	asthenia
efavirenz	psychosis
efavirenz	ataxia
efavirenz	lipodystrophy
efavirenz	skin discoloration
efavirenz	fasting
efavirenz	cpi
efavirenz	hepatitis c
efavirenz	drowsiness
efavirenz	obesity
efavirenz	fat redistribution
efavirenz	erythema
efavirenz	impaired concentration
efavirenz	hepatitis c antibody positive
efavirenz	abdominal pain
efavirenz	muscular disorder
efavirenz	photoallergic dermatitis
efavirenz	exfoliative dermatitis
efavirenz	tinnitus
efavirenz	hypesthesia
efavirenz	nail disorder
efavirenz	increased sweating
efavirenz	erythema multiforme
efavirenz	teratogenicity
efavirenz	liver failure
efavirenz	tremor
efavirenz	psychiatric disorders
efavirenz	anorexia
efavirenz	hiv disease
efavirenz	nervousness
efavirenz	allergy
efavirenz	lactation
efavirenz	confusion
efavirenz	neurologic symptoms
efavirenz	ovary
efavirenz	headache
efavirenz	diarrhea
efavirenz	psychiatric symptoms
efavirenz	scaling
efavirenz	depersonalization
efavirenz	nausea
efavirenz	fertility
efavirenz	pneumocystis jiroveci pneumonia
efavirenz	palpitation
efavirenz	pain
efavirenz	hypercholesterolemia
efavirenz	geriatric
efavirenz	pancreatitis
efavirenz	gas
efavirenz	rash
efavirenz	neuropathy
efavirenz	pneumonia
efavirenz	tuberculosis
efavirenz	anencephaly
efavirenz	gynecomastia
efavirenz	abnormal vision
efavirenz	gastric disorder
efavirenz	incoordination
efavirenz	suicide
efavirenz	infection
efavirenz	fever
efavirenz	fatigue
efavirenz	eruptions
efavirenz	anxiety
efavirenz	vomiting
efavirenz	necrosis
efavirenz	constipation
efavirenz	dyspepsia
efavirenz	maculopapular rash
efavirenz	paranoia
efavirenz	opportunistic infections
efavirenz	lam
efavirenz	immune reconstitution syndrome
efavirenz	pharmacokinetic interaction
efavirenz	liver impairment
efavirenz	central obesity
efavirenz	increased liver enzymes
efavirenz	mac
efavirenz	flushing
efavirenz	elevated triglycerides
efavirenz	myalgia
efavirenz	neurosis
efavirenz	emotional lability
efavirenz	thinking abnormal
efavirenz	antibody positive
efavirenz	dyspnea
efavirenz	amnesia
efavirenz	euphoric
efavirenz	anophthalmia
efavirenz	illness
efavirenz	arrhythmia
efavirenz	enzyme induction
efavirenz	dizziness
efavirenz	toxic epidermal necrolysis
efavirenz	insomnia
efavirenz	suicide attempt
efavirenz	convulsion
efavirenz	hallucination
efavirenz	substance abuse
efavirenz	abnormal dreams
efavirenz	arthralgia
efavirenz	migraine
efavirenz	paresthesia
efavirenz	suicidal ideation
efavirenz	hepatitis
efavirenz	itching
efavirenz	stupor
efavirenz	drug interaction
efavirenz	delusions
efavirenz	pneumocystis
efavirenz	malabsorption
oxcarbazepine	gum hyperplasia
oxcarbazepine	epilepsy
oxcarbazepine	ulceration
oxcarbazepine	hematemesis
oxcarbazepine	abnormality of accommodation
oxcarbazepine	sweating
oxcarbazepine	somnolence
oxcarbazepine	feeling drunk
oxcarbazepine	cough
oxcarbazepine	genital pruritus
oxcarbazepine	aggressive
oxcarbazepine	panic
oxcarbazepine	metrorrhagia
oxcarbazepine	drunk
oxcarbazepine	vitiligo
oxcarbazepine	convulsions aggravated
oxcarbazepine	tachycardia
oxcarbazepine	heart failure
oxcarbazepine	cataract
oxcarbazepine	serum transaminase increased
oxcarbazepine	manic reaction
oxcarbazepine	dysphonia
oxcarbazepine	renal pain
oxcarbazepine	hypertonia
oxcarbazepine	adjuvant treatment
oxcarbazepine	respiratory infection
oxcarbazepine	visual field defect
oxcarbazepine	erythema
oxcarbazepine	erythematous rash
oxcarbazepine	epistaxis
oxcarbazepine	urinary frequency
oxcarbazepine	hyponatremia
oxcarbazepine	tinnitus
oxcarbazepine	hypesthesia
oxcarbazepine	aggressive reaction
oxcarbazepine	eye edema
oxcarbazepine	panic disorder
oxcarbazepine	upper respiratory tract infection
oxcarbazepine	erythema multiforme
oxcarbazepine	tremor
oxcarbazepine	angioedema
oxcarbazepine	syncope
oxcarbazepine	allergy
oxcarbazepine	hyperreflexia
oxcarbazepine	rectal disorder
oxcarbazepine	paralysis
oxcarbazepine	rectal hemorrhage
oxcarbazepine	dystonia
oxcarbazepine	mydriasis
oxcarbazepine	ear pain
oxcarbazepine	hemiplegia
oxcarbazepine	dysuria
oxcarbazepine	nausea
oxcarbazepine	thirst
oxcarbazepine	palpitation
oxcarbazepine	viral infection
oxcarbazepine	priapism
oxcarbazepine	hysteria
oxcarbazepine	kidney calculus
oxcarbazepine	chest pain
oxcarbazepine	rash
oxcarbazepine	pneumonia
oxcarbazepine	colitis
oxcarbazepine	gum hemorrhage
oxcarbazepine	polyuria
oxcarbazepine	acne
oxcarbazepine	hypotension
oxcarbazepine	otitis externa
oxcarbazepine	back pain
oxcarbazepine	incoordination
oxcarbazepine	rigors
oxcarbazepine	hemianopia
oxcarbazepine	xerophthalmia
oxcarbazepine	feeling abnormal
oxcarbazepine	fever
oxcarbazepine	lymphadenopathy
oxcarbazepine	infestations
oxcarbazepine	dyspepsia
oxcarbazepine	pharyngitis
oxcarbazepine	bradycardia
oxcarbazepine	leukorrhea
oxcarbazepine	weight decreased
oxcarbazepine	sinusitis
oxcarbazepine	eeg abnormal
oxcarbazepine	pleuritis
oxcarbazepine	gastritis
oxcarbazepine	extrapyramidal syndrome
oxcarbazepine	dysgeusia
oxcarbazepine	increased liver enzymes
oxcarbazepine	flushing
oxcarbazepine	nystagmus
oxcarbazepine	thinking abnormal
oxcarbazepine	ear infection
oxcarbazepine	hot flushes
oxcarbazepine	enteritis
oxcarbazepine	tetany
oxcarbazepine	edema
oxcarbazepine	dyspnea
oxcarbazepine	amnesia
oxcarbazepine	euphoric
oxcarbazepine	vertigo
oxcarbazepine	illness
oxcarbazepine	toxic epidermal necrolysis
oxcarbazepine	insomnia
oxcarbazepine	thrombocytopenia
oxcarbazepine	weight gain
oxcarbazepine	itching
oxcarbazepine	decreased consciousness
oxcarbazepine	hyperplasia
oxcarbazepine	urticaria
oxcarbazepine	hypoglycemia
oxcarbazepine	hemorrhoids
oxcarbazepine	oculogyric crisis
oxcarbazepine	infectious
oxcarbazepine	conjunctival hemorrhage
oxcarbazepine	agitation
oxcarbazepine	status epilepticus
oxcarbazepine	ptosis
oxcarbazepine	delirium
oxcarbazepine	bleeding
oxcarbazepine	ache
oxcarbazepine	urinary tract infection
oxcarbazepine	mania
oxcarbazepine	photophobia
oxcarbazepine	dysmetria
oxcarbazepine	dermatitis
oxcarbazepine	nightmares
oxcarbazepine	epidermal necrolysis
oxcarbazepine	hyperglycemia
oxcarbazepine	increased eosinophils
oxcarbazepine	asthenia
oxcarbazepine	ataxia
oxcarbazepine	psychosis
oxcarbazepine	folliculitis
oxcarbazepine	neuralgia
oxcarbazepine	precordial chest pain
oxcarbazepine	weakness
oxcarbazepine	diplopia
oxcarbazepine	falling down
oxcarbazepine	asthma
oxcarbazepine	impaired concentration
oxcarbazepine	hiccups
oxcarbazepine	abdominal pain
oxcarbazepine	cerebral hemorrhage
oxcarbazepine	menorrhagia
oxcarbazepine	apathy
oxcarbazepine	duodenal ulcer
oxcarbazepine	leukopenia
oxcarbazepine	increased sweating
oxcarbazepine	personality disorder
oxcarbazepine	eczema
oxcarbazepine	hypocalcemia
oxcarbazepine	involuntary muscle contractions
oxcarbazepine	anorexia
oxcarbazepine	nervousness
oxcarbazepine	leg edema
oxcarbazepine	retching
oxcarbazepine	purpura
oxcarbazepine	laryngospasm
oxcarbazepine	hepatic dysfunction
oxcarbazepine	confusion
oxcarbazepine	psoriasis
oxcarbazepine	hematuria
oxcarbazepine	aphasia
oxcarbazepine	increased appetite
oxcarbazepine	libido increased
oxcarbazepine	headache
oxcarbazepine	systemic lupus erythematosus
oxcarbazepine	diarrhea
oxcarbazepine	hypotonia
oxcarbazepine	speech disorder
oxcarbazepine	flatulence
oxcarbazepine	pain
oxcarbazepine	contact dermatitis
oxcarbazepine	generalized edema
oxcarbazepine	hyperkinesia
oxcarbazepine	stomach ulcer
oxcarbazepine	rhinitis
oxcarbazepine	hyporeflexia
oxcarbazepine	abnormal vision
oxcarbazepine	abnormal gait
oxcarbazepine	alopecia
oxcarbazepine	postural hypotension
oxcarbazepine	suffered
oxcarbazepine	infection
oxcarbazepine	liver function tests abnormal
oxcarbazepine	fatigue
oxcarbazepine	anxiety
oxcarbazepine	vomiting
oxcarbazepine	otitis
oxcarbazepine	constipation
oxcarbazepine	aura
oxcarbazepine	bronchitis
oxcarbazepine	malaise
oxcarbazepine	maculopapular rash
oxcarbazepine	heat rash
oxcarbazepine	hypokinesia
oxcarbazepine	muscular weakness
oxcarbazepine	cholelithiasis
oxcarbazepine	eructation
oxcarbazepine	vaginitis
oxcarbazepine	stomatitis
oxcarbazepine	emotional lability
oxcarbazepine	dysphagia
oxcarbazepine	dizziness
oxcarbazepine	hypertension
oxcarbazepine	ulcerative stomatitis
oxcarbazepine	convulsion
oxcarbazepine	hypokalemia
oxcarbazepine	dry mouth
oxcarbazepine	sialadenitis
oxcarbazepine	biliary pain
oxcarbazepine	arthralgia
oxcarbazepine	pain urinary tract
oxcarbazepine	migraine
oxcarbazepine	esophagitis
oxcarbazepine	stupor
oxcarbazepine	delusions
oxcarbazepine	photosensitivity reaction
oxcarbazepine	blood in stool
oxcarbazepine	photosensitivity
oxcarbazepine	libido decreased
oxcarbazepine	lupus
oxcarbazepine	dental pain
oxcarbazepine	facial rash
tacrolimus	cerebrovascular accident
tacrolimus	encephalopathy
tacrolimus	ulceration
tacrolimus	sweating
tacrolimus	somnolence
tacrolimus	ventricular dysfunction
tacrolimus	cough
tacrolimus	squamous cell carcinoma
tacrolimus	cholangitis
tacrolimus	breast pain
tacrolimus	torsades de pointes
tacrolimus	hypothyroidism
tacrolimus	herpes simplex
tacrolimus	cough increased
tacrolimus	tachycardia
tacrolimus	skin discoloration
tacrolimus	cataract
tacrolimus	hypopigmentation
tacrolimus	hypertonia
tacrolimus	lung disorder
tacrolimus	immunosuppressive effect
tacrolimus	prothrombin decreased
tacrolimus	tingling
tacrolimus	erythema
tacrolimus	epistaxis
tacrolimus	bilirubinemia
tacrolimus	urinary frequency
tacrolimus	hyponatremia
tacrolimus	exfoliative dermatitis
tacrolimus	tinnitus
tacrolimus	generalized spasm
tacrolimus	pyuria
tacrolimus	glycosuria
tacrolimus	procedural complication
tacrolimus	mouth ulcer
tacrolimus	hyperlipemia
tacrolimus	tremor
tacrolimus	lymphoproliferative disease
tacrolimus	tooth disorder
tacrolimus	angioedema
tacrolimus	syncope
tacrolimus	hyperkalemia
tacrolimus	allergy
tacrolimus	iron decreased
tacrolimus	jaundice
tacrolimus	rectal disorder
tacrolimus	decreased kidney function
tacrolimus	peritonitis
tacrolimus	nausea and vomiting
tacrolimus	tubular necrosis
tacrolimus	gastrointestinal perforation
tacrolimus	ear pain
tacrolimus	dysuria
tacrolimus	nausea
tacrolimus	skin neoplasm
tacrolimus	palpitation
tacrolimus	hirsutism
tacrolimus	abscess
tacrolimus	acidosis
tacrolimus	hypercholesterolemia
tacrolimus	myoclonus
tacrolimus	chest pain
tacrolimus	pancreatitis
tacrolimus	arthritis
tacrolimus	hyperuricemia
tacrolimus	alkalosis
tacrolimus	vascular disorders
tacrolimus	breast neoplasm
tacrolimus	rash
tacrolimus	neuropathy
tacrolimus	pneumonia
tacrolimus	colitis
tacrolimus	angina
tacrolimus	diabetes
tacrolimus	varicella
tacrolimus	skin carcinoma
tacrolimus	eye pain
tacrolimus	hypercalcemia
tacrolimus	acne
tacrolimus	osteomyelitis
tacrolimus	respiratory system disorders
tacrolimus	hypotension
tacrolimus	renal impairment
tacrolimus	skin infections
tacrolimus	thrombosis
tacrolimus	leukocytosis
tacrolimus	gastric disorder
tacrolimus	otitis externa
tacrolimus	nephropathy
tacrolimus	pleural effusion
tacrolimus	back pain
tacrolimus	incoordination
tacrolimus	effusion
tacrolimus	neck pain
tacrolimus	dry eyes
tacrolimus	lack of drug effect
tacrolimus	dysmenorrhea
tacrolimus	fever
tacrolimus	lymphadenopathy
tacrolimus	ear disorder
tacrolimus	kidney function abnormal
tacrolimus	spasm
tacrolimus	herpes
tacrolimus	osteoporosis
tacrolimus	dyspepsia
tacrolimus	pharyngitis
tacrolimus	flu
tacrolimus	tendon disorder
tacrolimus	unintended pregnancy
tacrolimus	periodontal abscess
tacrolimus	sinusitis
tacrolimus	furunculosis
tacrolimus	gastritis
tacrolimus	dysgeusia
tacrolimus	pleural
tacrolimus	tumors
tacrolimus	creatinine increased
tacrolimus	anaphylactic reaction
tacrolimus	valvular heart disease
tacrolimus	varicella zoster
tacrolimus	skin hypertrophy
tacrolimus	thinking abnormal
tacrolimus	myocardial hypertrophy
tacrolimus	phototoxicity
tacrolimus	oliguria
tacrolimus	edema
tacrolimus	dyspnea
tacrolimus	nocturia
tacrolimus	amnesia
tacrolimus	thrombocytopenic purpura
tacrolimus	vertigo
tacrolimus	arrhythmia
tacrolimus	insomnia
tacrolimus	hepatocellular damage
tacrolimus	urinary incontinence
tacrolimus	hydronephrosis
tacrolimus	oral moniliasis
tacrolimus	thrombocytopenia
tacrolimus	weight gain
tacrolimus	ileus
tacrolimus	tingling skin
tacrolimus	paresthesia
tacrolimus	hepatitis
tacrolimus	itching
tacrolimus	tubular
tacrolimus	malignant neoplasm
tacrolimus	urticaria
tacrolimus	hypoglycemia
tacrolimus	leukoencephalopathy
tacrolimus	peripheral edema
tacrolimus	abdomen enlarged
tacrolimus	eczema herpeticum
tacrolimus	lip
tacrolimus	agitation
tacrolimus	cramping
tacrolimus	phlebitis
tacrolimus	bleeding
tacrolimus	delirium
tacrolimus	urinary tract infection
tacrolimus	heart disorder
tacrolimus	dermatitis
tacrolimus	impetigo
tacrolimus	conjunctivitis
tacrolimus	hyperglycemia
tacrolimus	dry skin
tacrolimus	asthenia
tacrolimus	psychosis
tacrolimus	coagulation
tacrolimus	folliculitis
tacrolimus	voice alteration
tacrolimus	albuminuria
tacrolimus	hyperphosphatemia
tacrolimus	carcinoma
tacrolimus	pneumothorax
tacrolimus	toxic nephropathy
tacrolimus	delayed healing
tacrolimus	asthma
tacrolimus	coagulation disorder
tacrolimus	hypoproteinemia
tacrolimus	abdominal pain
tacrolimus	amylase increased
tacrolimus	sensitization
tacrolimus	seborrhea
tacrolimus	pulmonary edema
tacrolimus	renal failure
tacrolimus	amblyopia
tacrolimus	incontinence
tacrolimus	vaginal candidiasis
tacrolimus	rosacea
tacrolimus	nail disorder
tacrolimus	leukopenia
tacrolimus	hernia
tacrolimus	increased sgot
tacrolimus	eczema
tacrolimus	facial edema
tacrolimus	hypoxia
tacrolimus	hypocalcemia
tacrolimus	otitis media
tacrolimus	anorexia
tacrolimus	cystitis
tacrolimus	nervousness
tacrolimus	skin disorder
tacrolimus	acute renal failure
tacrolimus	purpura
tacrolimus	fungal dermatitis
tacrolimus	confusion
tacrolimus	hypomagnesemia
tacrolimus	hematuria
tacrolimus	alcohol intolerance
tacrolimus	increased appetite
tacrolimus	anemia
tacrolimus	bursitis
tacrolimus	headache
tacrolimus	diarrhea
tacrolimus	flatulence
tacrolimus	pain
tacrolimus	contact dermatitis
tacrolimus	generalized edema
tacrolimus	hypophosphatemia
tacrolimus	polycythemia
tacrolimus	cyst
tacrolimus	hyperesthesia
tacrolimus	melanoma
tacrolimus	stomach ulcer
tacrolimus	bone disorders
tacrolimus	increased alkaline phosphatase
tacrolimus	dehydration
tacrolimus	ebv infection
tacrolimus	rhinitis
tacrolimus	leg cramps
tacrolimus	neuritis
tacrolimus	anaphylactoid reactions
tacrolimus	cellulitis
tacrolimus	abnormal vision
tacrolimus	myasthenia
tacrolimus	peripheral vascular disorder
tacrolimus	alopecia
tacrolimus	postural hypotension
tacrolimus	atelectasis
tacrolimus	abnormal ecg
tacrolimus	infection
tacrolimus	liver function tests abnormal
tacrolimus	enlargement
tacrolimus	thrombophlebitis
tacrolimus	anxiety
tacrolimus	vomiting
tacrolimus	otitis
tacrolimus	constipation
tacrolimus	necrosis
tacrolimus	bronchitis
tacrolimus	chills
tacrolimus	bullous impetigo
tacrolimus	ecchymosis
tacrolimus	malaise
tacrolimus	maculopapular rash
tacrolimus	eye disorders
tacrolimus	serum iron decreased
tacrolimus	ascites
tacrolimus	dental caries
tacrolimus	vasodilatation
tacrolimus	gastroenteritis
tacrolimus	increased ggt
tacrolimus	deep thrombophlebitis
tacrolimus	hearing loss
tacrolimus	herpes zoster
tacrolimus	vesiculobullous rash
tacrolimus	increased bun
tacrolimus	laryngitis
tacrolimus	vaginitis
tacrolimus	stomatitis
tacrolimus	myalgia
tacrolimus	cheilitis
tacrolimus	emotional lability
tacrolimus	dysphagia
tacrolimus	dizziness
tacrolimus	hypertension
tacrolimus	arthropathy
tacrolimus	uremic syndrome
tacrolimus	pustular rash
tacrolimus	convulsion
tacrolimus	hypokalemia
tacrolimus	dry mouth
tacrolimus	hallucination
tacrolimus	skin ulcer
tacrolimus	cholestatic jaundice
tacrolimus	abnormal dreams
tacrolimus	arthralgia
tacrolimus	moniliasis
tacrolimus	migraine
tacrolimus	esophagitis
tacrolimus	fluid overload
tacrolimus	seizures
tacrolimus	coma
tacrolimus	sepsis
tacrolimus	photosensitivity reaction
tacrolimus	lymphoma
tacrolimus	hypochromic anemia
tacrolimus	photosensitivity
tacrolimus	septicemia
tacrolimus	deafness
tacrolimus	basal cell carcinoma
tacrolimus	gastrointestinal bleeding
tacrolimus	gastrointestinal disorders
orlistat	pancreatitis
orlistat	arthritis
orlistat	infectious
orlistat	rash
orlistat	increased inr
orlistat	discomfort
orlistat	fecal incontinence
orlistat	urinary tract infection
orlistat	metrorrhagia
orlistat	bronchospasm
orlistat	abdominal distension
orlistat	back pain
orlistat	dry skin
orlistat	infection
orlistat	fatigue
orlistat	respiratory infection
orlistat	anticoagulant treatment
orlistat	eruptions
orlistat	dysentery
orlistat	anxiety
orlistat	vomiting
orlistat	obesity
orlistat	otitis
orlistat	abdominal pain
orlistat	flu
orlistat	cardiovascular disorders
orlistat	incontinence
orlistat	upper respiratory tract infection
orlistat	anaphylactic reaction
orlistat	vaginitis
orlistat	myalgia
orlistat	tendinitis
orlistat	rectal pain
orlistat	gum disorder
orlistat	edema
orlistat	psychiatric disorders
orlistat	angioedema
orlistat	tooth disorder
orlistat	dizziness
orlistat	arthropathy
orlistat	menstruation irregular
orlistat	allergy
orlistat	sleep disorder
orlistat	lower respiratory tract infection
orlistat	headache
orlistat	diarrhea
orlistat	oily
orlistat	hepatitis
orlistat	itching
orlistat	drug interaction
orlistat	nausea
orlistat	flatulence
orlistat	pain
orlistat	urticaria
orlistat	pedal edema
orlistat	hypoglycemia
orlistat	bullous eruptions
naproxen	cerebrovascular accident
naproxen	ulceration
naproxen	hematemesis
naproxen	pseudoporphyria
naproxen	sweating
naproxen	somnolence
naproxen	cough
naproxen	breast pain
naproxen	glossitis
naproxen	hypothyroidism
naproxen	congestive heart failure
naproxen	parosmia
naproxen	tachycardia
naproxen	heart failure
naproxen	cough increased
naproxen	synovitis
naproxen	death
naproxen	renal pain
naproxen	skin fragility
naproxen	hypertonia
naproxen	retinal degeneration
naproxen	esophageal stricture
naproxen	visual field defect
naproxen	breast tenderness
naproxen	goiter
naproxen	erythema
naproxen	epistaxis
naproxen	urinary frequency
naproxen	bilirubinemia
naproxen	decreased electrolytes
naproxen	stridor
naproxen	tinnitus
naproxen	exfoliative dermatitis
naproxen	breast enlargement
naproxen	hypesthesia
naproxen	wbc abnormal
naproxen	glycosuria
naproxen	myocardial infarction
naproxen	mouth ulcer
naproxen	erythema multiforme
naproxen	gastrointestinal reactions
naproxen	liver failure
naproxen	menstrual disorder
naproxen	hyperlipemia
naproxen	tremor
naproxen	lightheadedness
naproxen	penis
naproxen	angioedema
naproxen	syncope
naproxen	abnormal rbc
naproxen	hyperkalemia
naproxen	allergy
naproxen	taste loss
naproxen	jaundice
naproxen	rectal disorder
naproxen	nausea and vomiting
naproxen	rectal hemorrhage
naproxen	hemiplegia
naproxen	dysuria
naproxen	nausea
naproxen	thirst
naproxen	palpitation
naproxen	nephrotic syndrome
naproxen	kidney calculus
naproxen	pancreatitis
naproxen	chest pain
naproxen	arthritis
naproxen	rash
naproxen	pneumonia
naproxen	colitis
naproxen	angina
naproxen	diabetes
naproxen	gum hemorrhage
naproxen	polyuria
naproxen	skin carcinoma
naproxen	eye pain
naproxen	acne
naproxen	respiratory system disorders
naproxen	hypotension
naproxen	epidermolysis
naproxen	nephropathy
naproxen	back pain
naproxen	visual disturbances
naproxen	porphyria cutanea tarda
naproxen	neck pain
naproxen	dry eyes
naproxen	hemolysis
naproxen	dysmenorrhea
naproxen	increased ldh
naproxen	pancytopenia
naproxen	fever
naproxen	lymphadenopathy
naproxen	ear disorder
naproxen	kidney function abnormal
naproxen	pain in urethra
naproxen	interstitial nephritis
naproxen	dyspepsia
naproxen	pharyngitis
naproxen	bradycardia
naproxen	leukorrhea
naproxen	bezoar
naproxen	flu
naproxen	sinusitis
naproxen	gastritis
naproxen	dysgeusia
naproxen	increased liver enzymes
naproxen	pleural
naproxen	tumors
naproxen	anaphylactic reaction
naproxen	porphyria
naproxen	creatinine increased
naproxen	chills and fever
naproxen	neurosis
naproxen	pelvic pain
naproxen	gastrin increased
naproxen	enteritis
naproxen	oliguria
naproxen	edema
naproxen	heartburn
naproxen	dyspnea
naproxen	musculoskeletal pain
naproxen	amnesia
naproxen	thrombocytopenic purpura
naproxen	vertigo
naproxen	bleeding time increased
naproxen	arrhythmia
naproxen	toxic epidermal necrolysis
naproxen	myositis
naproxen	insomnia
naproxen	peptic ulcer
naproxen	shock
naproxen	increased salivation
naproxen	thrombocytopenia
naproxen	oral moniliasis
naproxen	weight gain
naproxen	esophageal
naproxen	polyps
naproxen	paresthesia
naproxen	rigidity
naproxen	hepatitis
naproxen	itching
naproxen	halitosis
naproxen	blurred vision
naproxen	urticaria
naproxen	hypoglycemia
naproxen	peripheral edema
naproxen	abdomen enlarged
naproxen	neutropenia
naproxen	agitation
naproxen	cramping
naproxen	bleeding
naproxen	aseptic meningitis
naproxen	urinary tract infection
naproxen	increased sgpt
naproxen	photophobia
naproxen	dermatitis
naproxen	blister
naproxen	epidermal necrolysis
naproxen	conjunctivitis
naproxen	hyperglycemia
naproxen	epidermolysis bullosa
naproxen	increased eosinophils
naproxen	dry skin
naproxen	asthenia
naproxen	abnormal platelets
naproxen	albuminuria
naproxen	carcinoma
naproxen	laryngeal neoplasia
naproxen	weakness
naproxen	diplopia
naproxen	drowsiness
naproxen	salivation
naproxen	inflammation
naproxen	asthma
naproxen	impaired concentration
naproxen	hiccups
naproxen	abdominal pain
naproxen	menorrhagia
naproxen	renal failure
naproxen	apathy
naproxen	nail disorder
naproxen	leukopenia
naproxen	cardiospasm
naproxen	increased sgot
naproxen	juvenile rheumatoid arthritis
naproxen	otitis media
naproxen	cystitis
naproxen	anorexia
naproxen	nervousness
naproxen	skin disorder
naproxen	osteoarthritis
naproxen	purpura
naproxen	rheumatoid arthritis
naproxen	hepatic dysfunction
naproxen	confusion
naproxen	tongue disorder
naproxen	hematuria
naproxen	increased appetite
naproxen	anemia
naproxen	headache
naproxen	diarrhea
naproxen	fundic gland polyps
naproxen	depersonalization
naproxen	infarction
naproxen	hemoptysis
naproxen	flatulence
naproxen	speech disorder
naproxen	pain
naproxen	contact dermatitis
naproxen	abnormal urine
naproxen	hyperkinesia
naproxen	stomach ulcer
naproxen	gout
naproxen	bone disorders
naproxen	increased alkaline phosphatase
naproxen	fixed eruption
naproxen	dehydration
naproxen	rhinitis
naproxen	leg cramps
naproxen	cognitive dysfunction
naproxen	tenesmus
naproxen	respiratory depression
naproxen	hostility
naproxen	gynecomastia
naproxen	anaphylactoid reactions
naproxen	aplastic anemia
naproxen	abnormal vision
naproxen	meningitis
naproxen	myasthenia
naproxen	ulcerative colitis
naproxen	alopecia
naproxen	urination impaired
naproxen	esophageal ulceration
naproxen	infection
naproxen	liver function tests abnormal
naproxen	enlargement
naproxen	eruptions
naproxen	anxiety
naproxen	vomiting
naproxen	otitis
naproxen	constipation
naproxen	necrosis
naproxen	hair disorder
naproxen	testicular disorder
naproxen	chills
naproxen	bronchitis
naproxen	ecchymosis
naproxen	malaise
naproxen	maculopapular rash
naproxen	eosinophilic pneumonitis
naproxen	proteinuria
naproxen	vasodilatation
naproxen	urinary urgency
naproxen	gastroenteritis
naproxen	cerebral infarct
naproxen	muscular weakness
naproxen	hearing loss
naproxen	cholelithiasis
naproxen	eructation
naproxen	nephritis
naproxen	vaginitis
naproxen	stomatitis
naproxen	myalgia
naproxen	emotional lability
naproxen	gastrointestinal anomaly
naproxen	vasculitis
naproxen	melena
naproxen	abnormal stools
naproxen	dysphagia
naproxen	dizziness
naproxen	hypertension
naproxen	ulcerative stomatitis
naproxen	arthropathy
naproxen	convulsion
naproxen	tenderness
naproxen	sleep disorder
naproxen	hallucination
naproxen	dry mouth
naproxen	hemolytic anemia
naproxen	nodule
naproxen	abnormal dreams
naproxen	agranulocytosis
naproxen	arthralgia
naproxen	impotence
naproxen	moniliasis
naproxen	migraine
naproxen	esophagitis
naproxen	coma
naproxen	renal papillary necrosis
naproxen	sepsis
naproxen	neck rigidity
naproxen	photosensitivity reaction
naproxen	thrombotic thrombocytopenic purpura
naproxen	photosensitivity
naproxen	discolored feces
naproxen	urinary retention
naproxen	deafness
naproxen	libido decreased
naproxen	gastrointestinal bleeding
naproxen	gastrointestinal disorders
aspirin	ulceration
aspirin	hematemesis
aspirin	sweating
aspirin	somnolence
aspirin	abuse
aspirin	cough
aspirin	dermatomyositis
aspirin	glossitis
aspirin	nerve paralysis
aspirin	bronchospasm
aspirin	stillbirths
aspirin	stevens johnson syndrome
aspirin	congestive heart failure
aspirin	tachycardia
aspirin	heart failure
aspirin	death
aspirin	hyperpnea
aspirin	erythema
aspirin	miosis
aspirin	muscular disorder
aspirin	tinnitus
aspirin	exfoliative dermatitis
aspirin	respiratory alkalosis
aspirin	myocardial infarction
aspirin	erythema multiforme
aspirin	liver failure
aspirin	drug abuse
aspirin	lightheadedness
aspirin	tremor
aspirin	angioedema
aspirin	syncope
aspirin	hyperkalemia
aspirin	obstruction
aspirin	allergy
aspirin	jaundice
aspirin	paralysis
aspirin	rectal hemorrhage
aspirin	laryngeal edema
aspirin	dysuria
aspirin	nausea
aspirin	thirst
aspirin	disseminated intravascular coagulation
aspirin	palpitation
aspirin	aspiration
aspirin	acidosis
aspirin	cerebral edema
aspirin	polymyalgia
aspirin	pancreatitis
aspirin	chest pain
aspirin	alkalosis
aspirin	arthritis
aspirin	rash
aspirin	postpartum hemorrhage
aspirin	pneumonia
aspirin	polyuria
aspirin	cardiac arrest
aspirin	hypotension
aspirin	visual disturbances
aspirin	drug dependence
aspirin	pancytopenia
aspirin	renal insufficiency
aspirin	fever
aspirin	lymphadenopathy
aspirin	kidney function abnormal
aspirin	red eye
aspirin	interstitial nephritis
aspirin	dyspepsia
aspirin	bradycardia
aspirin	patent ductus arteriosis
aspirin	flu
aspirin	hepatic necrosis
aspirin	gastritis
aspirin	dysgeusia
aspirin	flushing
aspirin	anaphylactic reaction
aspirin	oliguria
aspirin	edema
aspirin	heartburn
aspirin	dyspnea
aspirin	euphoric
aspirin	vertigo
aspirin	bleeding time increased
aspirin	circulatory depression
aspirin	arrhythmia
aspirin	toxic epidermal necrolysis
aspirin	insomnia
aspirin	epidermal necrosis
aspirin	shock
aspirin	peptic ulcer
aspirin	thrombocytopenia
aspirin	sedation
aspirin	ileus
aspirin	paresthesia
aspirin	hepatitis
aspirin	itching
aspirin	drug interaction
aspirin	blurred vision
aspirin	hypoventilation
aspirin	urticaria
aspirin	hypoglycemia
aspirin	skin changes
aspirin	peripheral nerve palsy
aspirin	agitation
aspirin	reticulocytosis
aspirin	bleeding
aspirin	intestinal obstruction
aspirin	dermatitis
aspirin	intracranial bleeding
aspirin	epidermal necrolysis
aspirin	hyperglycemia
aspirin	conjunctivitis
aspirin	increased eosinophils
aspirin	asthenia
aspirin	coagulation
aspirin	facial paresis
aspirin	tachypnea
aspirin	diplopia
aspirin	drowsiness
aspirin	acute anaphylaxis
aspirin	asthma
aspirin	abdominal pain
aspirin	pulmonary edema
aspirin	renal failure
aspirin	duodenal ulcer
aspirin	leukopenia
aspirin	increased sweating
aspirin	polymyalgia rheumatica
aspirin	anorexia
aspirin	cystitis
aspirin	nervousness
aspirin	acute renal failure
aspirin	apnea
aspirin	purpura
aspirin	reye syndrome
aspirin	confusion
aspirin	prolonged pregnancy
aspirin	hematuria
aspirin	anemia
aspirin	headache
aspirin	diarrhea
aspirin	infarction
aspirin	flatulence
aspirin	pain
aspirin	increased alkaline phosphatase
aspirin	dehydration
aspirin	respiratory depression
aspirin	mental impairment
aspirin	gynecomastia
aspirin	anaphylactoid reactions
aspirin	aplastic anemia
aspirin	abnormal vision
aspirin	meningitis
aspirin	chronic active hepatitis
aspirin	dysphoria
aspirin	alopecia
aspirin	postural hypotension
aspirin	rhabdomyolysis
aspirin	infection
aspirin	fatigue
aspirin	liver fatty
aspirin	anxiety
aspirin	vomiting
aspirin	constipation
aspirin	necrosis
aspirin	chills
aspirin	ecchymosis
aspirin	malaise
aspirin	proteinuria
aspirin	metabolic acidosis
aspirin	positive ana
aspirin	hearing loss
aspirin	eructation
aspirin	hypothermia
aspirin	respiratory arrest
aspirin	nephritis
aspirin	stomatitis
aspirin	myalgia
aspirin	paresis
aspirin	chronic urticaria
aspirin	vasculitis
aspirin	melena
aspirin	hepatoma
aspirin	dizziness
aspirin	decreased plasma iron
aspirin	hypertension
aspirin	cirrhosis
aspirin	intestinal perforation
aspirin	convulsion
aspirin	hallucination
aspirin	dry mouth
aspirin	hemolytic anemia
aspirin	nodule
aspirin	cholestatic jaundice
aspirin	agranulocytosis
aspirin	arthralgia
aspirin	esophagitis
aspirin	seizures
aspirin	coma
aspirin	renal papillary necrosis
aspirin	stupor
aspirin	sepsis
aspirin	photosensitivity
aspirin	urinary retention
aspirin	lupus
aspirin	gastrointestinal bleeding
aspirin	lethargy
rifampin	gas
rifampin	rash
rifampin	cramping
rifampin	colitis
rifampin	bleeding
rifampin	epidermal necrolysis
rifampin	conjunctivitis
rifampin	increased eosinophils
rifampin	visual disturbances
rifampin	ataxia
rifampin	psychosis
rifampin	adrenal insufficiency
rifampin	coagulation
rifampin	sore mouth
rifampin	sore tongue
rifampin	hemolysis
rifampin	wheezing
rifampin	liver function tests abnormal
rifampin	renal insufficiency
rifampin	fever
rifampin	fatigue
rifampin	immunosuppressive effect
rifampin	weakness
rifampin	vomiting
rifampin	drowsiness
rifampin	interstitial nephritis
rifampin	necrosis
rifampin	chills
rifampin	impaired concentration
rifampin	erythema
rifampin	cerebral hemorrhage
rifampin	muscular disorder
rifampin	flu
rifampin	renal failure
rifampin	pseudomembranous enterocolitis
rifampin	decreased hemoglobin
rifampin	numbness
rifampin	generalized numbness
rifampin	pemphigoid
rifampin	acute tubular necrosis
rifampin	muscular weakness
rifampin	flushing
rifampin	leukopenia
rifampin	distress
rifampin	anaphylactic reaction
rifampin	nephritis
rifampin	erythema multiforme
rifampin	facial edema
rifampin	hemoglobinuria
rifampin	vasculitis
rifampin	heartburn
rifampin	edema
rifampin	dyspnea
rifampin	anorexia
rifampin	dizziness
rifampin	enterocolitis
rifampin	toxic epidermal necrolysis
rifampin	acute renal failure
rifampin	shock
rifampin	allergy
rifampin	tenderness
rifampin	purpura
rifampin	bone pain
rifampin	jaundice
rifampin	hemolytic anemia
rifampin	hepatic dysfunction
rifampin	confusion
rifampin	thrombocytopenia
rifampin	agranulocytosis
rifampin	hematuria
rifampin	epigastric distress
rifampin	anemia
rifampin	tubular necrosis
rifampin	headache
rifampin	diarrhea
rifampin	hepatitis
rifampin	itching
rifampin	tubular
rifampin	transient abnormalities in liver
rifampin	nausea
rifampin	disseminated intravascular coagulation
rifampin	pemphigoid reaction
rifampin	pseudomembranous colitis
rifampin	flatulence
rifampin	pain
rifampin	urticaria
rifampin	interrupted treatment
lovastatin	chest pain
lovastatin	pancreatitis
lovastatin	arthritis
lovastatin	peripheral nerve palsy
lovastatin	menarche
lovastatin	cramping
lovastatin	neuropathy
lovastatin	rash
lovastatin	peripheral neuropathy
lovastatin	gynecomastia
lovastatin	dermatomyositis
lovastatin	leg pain
lovastatin	epidermal necrolysis
lovastatin	nerve paralysis
lovastatin	increased eosinophils
lovastatin	asthenia
lovastatin	elevated transaminases
lovastatin	chronic active hepatitis
lovastatin	alopecia
lovastatin	cataract
lovastatin	rhabdomyolysis
lovastatin	lens
lovastatin	facial paresis
lovastatin	fever
lovastatin	liver fatty
lovastatin	anxiety
lovastatin	vomiting
lovastatin	memory loss
lovastatin	constipation
lovastatin	necrosis
lovastatin	regurgitation
lovastatin	hypersensitivity syndrome
lovastatin	chills
lovastatin	erythema
lovastatin	dyspepsia
lovastatin	malaise
lovastatin	abdominal pain
lovastatin	muscular disorder
lovastatin	shoulder pain
lovastatin	hepatic necrosis
lovastatin	positive ana
lovastatin	dysgeusia
lovastatin	flushing
lovastatin	leukopenia
lovastatin	anaphylactic reaction
lovastatin	myalgia
lovastatin	erythema multiforme
lovastatin	polymyalgia rheumatica
lovastatin	atherosclerosis
lovastatin	paresis
lovastatin	tremor
lovastatin	vasculitis
lovastatin	dyspnea
lovastatin	anorexia
lovastatin	angioedema
lovastatin	vertigo
lovastatin	ocular irritation
lovastatin	hepatoma
lovastatin	dizziness
lovastatin	toxic epidermal necrolysis
lovastatin	cirrhosis
lovastatin	insomnia
lovastatin	allergy
lovastatin	purpura
lovastatin	lens opacity
lovastatin	arteriosclerotic heart disease
lovastatin	dry mouth
lovastatin	jaundice
lovastatin	hemolytic anemia
lovastatin	hepatic dysfunction
lovastatin	thrombocytopenia
lovastatin	nodule
lovastatin	cholestatic jaundice
lovastatin	loss of libido
lovastatin	arthralgia
lovastatin	impotence
lovastatin	anemia
lovastatin	paralysis
lovastatin	paresthesia
lovastatin	headache
lovastatin	diarrhea
lovastatin	hepatitis
lovastatin	itching
lovastatin	nausea
lovastatin	disease progression
lovastatin	blurred vision
lovastatin	flatulence
lovastatin	pain
lovastatin	urticaria
lovastatin	photosensitivity
lovastatin	ophthalmoplegia
lovastatin	lupus
lovastatin	skin changes
lovastatin	hypercholesterolemia
lovastatin	polymyalgia
etodolac	cerebrovascular accident
etodolac	neutropenia
etodolac	ulceration
etodolac	pulmonary infiltrates
etodolac	hematemesis
etodolac	sweating
etodolac	somnolence
etodolac	bleeding
etodolac	photophobia
etodolac	glossitis
etodolac	dermatitis
etodolac	peeling
etodolac	epidermal necrolysis
etodolac	conjunctivitis
etodolac	hyperglycemia
etodolac	increased eosinophils
etodolac	cutaneous vasculitis
etodolac	asthenia
etodolac	congestive heart failure
etodolac	cholestatic hepatitis
etodolac	tachycardia
etodolac	heart failure
etodolac	death
etodolac	erythema
etodolac	asthma
etodolac	abdominal pain
etodolac	urinary frequency
etodolac	tinnitus
etodolac	exfoliative dermatitis
etodolac	renal failure
etodolac	myocardial infarction
etodolac	leukopenia
etodolac	cardiospasm
etodolac	erythema multiforme
etodolac	liver failure
etodolac	tremor
etodolac	anorexia
etodolac	cystitis
etodolac	angioedema
etodolac	nervousness
etodolac	syncope
etodolac	intestinal ulcer
etodolac	allergy
etodolac	purpura
etodolac	osteoarthritis
etodolac	jaundice
etodolac	confusion
etodolac	hematuria
etodolac	anemia
etodolac	rectal hemorrhage
etodolac	headache
etodolac	diarrhea
etodolac	scaling
etodolac	infarction
etodolac	dysuria
etodolac	nausea
etodolac	thirst
etodolac	palpitation
etodolac	duodenitis
etodolac	flatulence
etodolac	pain
etodolac	kidney calculus
etodolac	uterine hemorrhage
etodolac	pancreatitis
etodolac	rash
etodolac	rhinitis
etodolac	pneumonia
etodolac	colitis
etodolac	polyuria
etodolac	respiratory depression
etodolac	anaphylactoid reactions
etodolac	aplastic anemia
etodolac	hypotension
etodolac	hyperpigmentation
etodolac	visual disturbances
etodolac	meningitis
etodolac	alopecia
etodolac	pancytopenia
etodolac	infection
etodolac	renal insufficiency
etodolac	fever
etodolac	lymphadenopathy
etodolac	kidney function abnormal
etodolac	anxiety
etodolac	vomiting
etodolac	constipation
etodolac	interstitial nephritis
etodolac	necrosis
etodolac	bronchitis
etodolac	chills
etodolac	dyspepsia
etodolac	ecchymosis
etodolac	maculopapular rash
etodolac	malaise
etodolac	pharyngitis
etodolac	leukorrhea
etodolac	sinusitis
etodolac	proteinuria
etodolac	hepatic necrosis
etodolac	gastritis
etodolac	dysgeusia
etodolac	increased liver enzymes
etodolac	hearing loss
etodolac	flushing
etodolac	vesiculobullous rash
etodolac	increased bun
etodolac	eructation
etodolac	anaphylactic reaction
etodolac	nephritis
etodolac	chills and fever
etodolac	stomatitis
etodolac	oliguria
etodolac	vasculitis
etodolac	edema
etodolac	heartburn
etodolac	dyspnea
etodolac	melena
etodolac	vertigo
etodolac	bleeding time increased
etodolac	arrhythmia
etodolac	dizziness
etodolac	hypertension
etodolac	ulcerative stomatitis
etodolac	toxic epidermal necrolysis
etodolac	insomnia
etodolac	epidermal necrosis
etodolac	shock
etodolac	peptic ulcer
etodolac	convulsion
etodolac	hallucination
etodolac	dry mouth
etodolac	hemolytic anemia
etodolac	thrombocytopenia
etodolac	cholestatic jaundice
etodolac	agranulocytosis
etodolac	paresthesia
etodolac	esophagitis
etodolac	coma
etodolac	hepatitis
etodolac	renal papillary necrosis
etodolac	itching
etodolac	sepsis
etodolac	blurred vision
etodolac	urticaria
etodolac	photosensitivity
etodolac	deafness
bosentan	heart failure
bosentan	hepatic dysfunction
bosentan	thrombocytopenia
bosentan	rash
bosentan	pulmonary arterial hypertension
bosentan	flushing
bosentan	fatigue
bosentan	chronic heart failure
bosentan	nasopharyngitis
bosentan	headache
bosentan	pulmonary hypertension
bosentan	itching
bosentan	als
bosentan	hypotension
bosentan	edema
bosentan	palpitation
bosentan	dyspepsia
bosentan	angioedema
bosentan	hypertension
bosentan	cirrhosis
bosentan	allergy
bosentan	decreased hemoglobin
ketoprofen	ulceration
ketoprofen	hematemesis
ketoprofen	sweating
ketoprofen	somnolence
ketoprofen	bleeding
ketoprofen	aseptic meningitis
ketoprofen	dermatitis
ketoprofen	nightmares
ketoprofen	epidermal necrolysis
ketoprofen	bronchospasm
ketoprofen	conjunctivitis
ketoprofen	congestive heart failure
ketoprofen	cholestatic hepatitis
ketoprofen	upper gastrointestinal symptoms
ketoprofen	tachycardia
ketoprofen	heart failure
ketoprofen	skin discoloration
ketoprofen	menometrorrhagia
ketoprofen	drowsiness
ketoprofen	salivation
ketoprofen	erythema
ketoprofen	abdominal pain
ketoprofen	epistaxis
ketoprofen	retinal hemorrhage
ketoprofen	hyponatremia
ketoprofen	tinnitus
ketoprofen	exfoliative dermatitis
ketoprofen	renal failure
ketoprofen	myocardial infarction
ketoprofen	erythema multiforme
ketoprofen	gastrointestinal reactions
ketoprofen	personality disorder
ketoprofen	eczema
ketoprofen	facial edema
ketoprofen	anorexia
ketoprofen	nervousness
ketoprofen	intestinal ulcer
ketoprofen	onycholysis
ketoprofen	allergy
ketoprofen	osteoarthritis
ketoprofen	purpura
ketoprofen	rheumatoid arthritis
ketoprofen	jaundice
ketoprofen	hepatic dysfunction
ketoprofen	confusion
ketoprofen	hematuria
ketoprofen	increased appetite
ketoprofen	anemia
ketoprofen	rectal hemorrhage
ketoprofen	headache
ketoprofen	diarrhea
ketoprofen	gastrointestinal perforation
ketoprofen	infarction
ketoprofen	purpuric rash
ketoprofen	laryngeal edema
ketoprofen	nausea
ketoprofen	thirst
ketoprofen	hemoptysis
ketoprofen	palpitation
ketoprofen	flatulence
ketoprofen	pain
ketoprofen	nephrotic syndrome
ketoprofen	pancreatitis
ketoprofen	vascular disorders
ketoprofen	arthritis
ketoprofen	rash
ketoprofen	rhinitis
ketoprofen	colitis
ketoprofen	diabetes
ketoprofen	eye pain
ketoprofen	gynecomastia
ketoprofen	renal impairment
ketoprofen	visual disturbances
ketoprofen	meningitis
ketoprofen	ulcerative colitis
ketoprofen	peripheral vascular disorder
ketoprofen	alopecia
ketoprofen	dysphoria
ketoprofen	hemolysis
ketoprofen	infection
ketoprofen	vomiting
ketoprofen	constipation
ketoprofen	interstitial nephritis
ketoprofen	necrosis
ketoprofen	chills
ketoprofen	dyspepsia
ketoprofen	malaise
ketoprofen	pharyngitis
ketoprofen	weight decreased
ketoprofen	vasodilatation
ketoprofen	gastritis
ketoprofen	dysgeusia
ketoprofen	hearing loss
ketoprofen	increased bun
ketoprofen	eructation
ketoprofen	anaphylactic reaction
ketoprofen	nephritis
ketoprofen	pigmentation
ketoprofen	stomatitis
ketoprofen	myalgia
ketoprofen	edema
ketoprofen	dyspnea
ketoprofen	amnesia
ketoprofen	melena
ketoprofen	vertigo
ketoprofen	arrhythmia
ketoprofen	dizziness
ketoprofen	hypertension
ketoprofen	toxic epidermal necrolysis
ketoprofen	insomnia
ketoprofen	shock
ketoprofen	peptic ulcer
ketoprofen	hallucination
ketoprofen	dry mouth
ketoprofen	bullous rash
ketoprofen	thrombocytopenia
ketoprofen	weight gain
ketoprofen	gastrointestinal symptoms
ketoprofen	agranulocytosis
ketoprofen	impotence
ketoprofen	migraine
ketoprofen	paresthesia
ketoprofen	hepatitis
ketoprofen	itching
ketoprofen	urticaria
ketoprofen	photosensitivity
ketoprofen	septicemia
ketoprofen	gastrointestinal bleeding
ketoprofen	sicca
piroxicam	ulceration
piroxicam	hematemesis
piroxicam	sweating
piroxicam	somnolence
piroxicam	bleeding
piroxicam	glossitis
piroxicam	dermatitis
piroxicam	conjunctivitis
piroxicam	hyperglycemia
piroxicam	increased eosinophils
piroxicam	asthenia
piroxicam	congestive heart failure
piroxicam	akathisia
piroxicam	tachycardia
piroxicam	heart failure
piroxicam	death
piroxicam	drowsiness
piroxicam	erythema
piroxicam	asthma
piroxicam	abdominal pain
piroxicam	epistaxis
piroxicam	tinnitus
piroxicam	exfoliative dermatitis
piroxicam	renal failure
piroxicam	myocardial infarction
piroxicam	leukopenia
piroxicam	erythema multiforme
piroxicam	liver failure
piroxicam	tremor
piroxicam	anorexia
piroxicam	cystitis
piroxicam	angioedema
piroxicam	nervousness
piroxicam	syncope
piroxicam	hyperkalemia
piroxicam	onycholysis
piroxicam	allergy
piroxicam	purpura
piroxicam	jaundice
piroxicam	confusion
piroxicam	hematuria
piroxicam	anemia
piroxicam	rectal hemorrhage
piroxicam	headache
piroxicam	diarrhea
piroxicam	scaling
piroxicam	infarction
piroxicam	dysuria
piroxicam	nausea
piroxicam	palpitation
piroxicam	flatulence
piroxicam	pain
piroxicam	nephrotic syndrome
piroxicam	pancreatitis
piroxicam	eye swelling
piroxicam	rash
piroxicam	pneumonia
piroxicam	angina
piroxicam	polyuria
piroxicam	respiratory depression
piroxicam	aplastic anemia
piroxicam	hypotension
piroxicam	meningitis
piroxicam	alopecia
piroxicam	pancytopenia
piroxicam	infection
piroxicam	fever
piroxicam	lymphadenopathy
piroxicam	kidney function abnormal
piroxicam	anxiety
piroxicam	vomiting
piroxicam	constipation
piroxicam	interstitial nephritis
piroxicam	necrosis
piroxicam	swelling
piroxicam	dyspepsia
piroxicam	ecchymosis
piroxicam	malaise
piroxicam	colic
piroxicam	flu
piroxicam	proteinuria
piroxicam	gastritis
piroxicam	positive ana
piroxicam	increased liver enzymes
piroxicam	hearing loss
piroxicam	eructation
piroxicam	anaphylactic reaction
piroxicam	nephritis
piroxicam	stomatitis
piroxicam	oliguria
piroxicam	vasculitis
piroxicam	edema
piroxicam	heartburn
piroxicam	dyspnea
piroxicam	melena
piroxicam	vertigo
piroxicam	bleeding time increased
piroxicam	illness
piroxicam	arrhythmia
piroxicam	dizziness
piroxicam	hypertension
piroxicam	insomnia
piroxicam	epidermal necrosis
piroxicam	convulsion
piroxicam	serum sickness
piroxicam	hallucination
piroxicam	dry mouth
piroxicam	hemolytic anemia
piroxicam	thrombocytopenia
piroxicam	agranulocytosis
piroxicam	petechia
piroxicam	paresthesia
piroxicam	esophagitis
piroxicam	coma
piroxicam	hepatitis
piroxicam	itching
piroxicam	sepsis
piroxicam	blurred vision
piroxicam	urticaria
piroxicam	photosensitivity
piroxicam	hypoglycemia
sulfamethoxazole	pancreatitis
sulfamethoxazole	neutropenia
sulfamethoxazole	pulmonary infiltrates
sulfamethoxazole	rash
sulfamethoxazole	allergic myocarditis
sulfamethoxazole	neuritis
sulfamethoxazole	aseptic meningitis
sulfamethoxazole	cough
sulfamethoxazole	crystalluria
sulfamethoxazole	glossitis
sulfamethoxazole	dermatitis
sulfamethoxazole	aplastic anemia
sulfamethoxazole	epidermal necrolysis
sulfamethoxazole	megaloblastic
sulfamethoxazole	increased eosinophils
sulfamethoxazole	diuresis
sulfamethoxazole	ataxia
sulfamethoxazole	meningitis
sulfamethoxazole	periarteritis nodosa
sulfamethoxazole	anuria
sulfamethoxazole	drug fever
sulfamethoxazole	nephrosis
sulfamethoxazole	fever
sulfamethoxazole	fatigue
sulfamethoxazole	weakness
sulfamethoxazole	eruptions
sulfamethoxazole	vomiting
sulfamethoxazole	interstitial nephritis
sulfamethoxazole	necrosis
sulfamethoxazole	myocarditis
sulfamethoxazole	chills
sulfamethoxazole	erythema
sulfamethoxazole	abdominal pain
sulfamethoxazole	scleral injection
sulfamethoxazole	hyponatremia
sulfamethoxazole	tinnitus
sulfamethoxazole	exfoliative dermatitis
sulfamethoxazole	renal failure
sulfamethoxazole	apathy
sulfamethoxazole	pseudomembranous enterocolitis
sulfamethoxazole	hepatic necrosis
sulfamethoxazole	hypoprothrombinemia
sulfamethoxazole	oliguria and anuria
sulfamethoxazole	leukopenia
sulfamethoxazole	anaphylactic reaction
sulfamethoxazole	nephritis
sulfamethoxazole	stomatitis
sulfamethoxazole	myalgia
sulfamethoxazole	erythema multiforme
sulfamethoxazole	oliguria
sulfamethoxazole	dyspnea
sulfamethoxazole	anorexia
sulfamethoxazole	angioedema
sulfamethoxazole	nervousness
sulfamethoxazole	vertigo
sulfamethoxazole	illness
sulfamethoxazole	hyperkalemia
sulfamethoxazole	toxic epidermal necrolysis
sulfamethoxazole	enterocolitis
sulfamethoxazole	insomnia
sulfamethoxazole	convulsion
sulfamethoxazole	allergy
sulfamethoxazole	serum sickness
sulfamethoxazole	purpura
sulfamethoxazole	hematologic disorders
sulfamethoxazole	hallucination
sulfamethoxazole	jaundice
sulfamethoxazole	hemolytic anemia
sulfamethoxazole	thrombocytopenia
sulfamethoxazole	cholestatic jaundice
sulfamethoxazole	agranulocytosis
sulfamethoxazole	arthralgia
sulfamethoxazole	anemia
sulfamethoxazole	headache
sulfamethoxazole	systemic lupus erythematosus
sulfamethoxazole	diarrhea
sulfamethoxazole	hepatitis
sulfamethoxazole	itching
sulfamethoxazole	nausea
sulfamethoxazole	pain
sulfamethoxazole	urticaria
sulfamethoxazole	photosensitivity
sulfamethoxazole	gastrointestinal disturbance
sulfamethoxazole	methemoglobinemia
sulfamethoxazole	hypoglycemia
sulfamethoxazole	lupus
ethinyl estradiol	cerebrovascular accident
ethinyl estradiol	mood disturbances
ethinyl estradiol	epilepsy
ethinyl estradiol	cramping
ethinyl estradiol	withdrawal bleeding
ethinyl estradiol	optic neuritis
ethinyl estradiol	hemolytic uremic syndrome
ethinyl estradiol	bleeding
ethinyl estradiol	urinary tract infection
ethinyl estradiol	cough
ethinyl estradiol	breast pain
ethinyl estradiol	metrorrhagia
ethinyl estradiol	device expulsion
ethinyl estradiol	bloating
ethinyl estradiol	venous thrombosis
ethinyl estradiol	asthenia
ethinyl estradiol	cough increased
ethinyl estradiol	cataract
ethinyl estradiol	chorea
ethinyl estradiol	carcinoma
ethinyl estradiol	nodular regenerative hyperplasia
ethinyl estradiol	respiratory infection
ethinyl estradiol	diplopia
ethinyl estradiol	amenorrhea
ethinyl estradiol	reduced carbohydrate tolerance
ethinyl estradiol	breast tenderness
ethinyl estradiol	blood pressure increased
ethinyl estradiol	focal nodular hyperplasia
ethinyl estradiol	retinal vascular thrombosis
ethinyl estradiol	erythema
ethinyl estradiol	asthma
ethinyl estradiol	abdominal pain
ethinyl estradiol	cerebral hemorrhage
ethinyl estradiol	abdominal cramping
ethinyl estradiol	uterine fibroids
ethinyl estradiol	menorrhagia
ethinyl estradiol	exophthalmos
ethinyl estradiol	vision loss
ethinyl estradiol	vaginal candidiasis
ethinyl estradiol	breast malignant neoplasm
ethinyl estradiol	endometrial hyperplasia
ethinyl estradiol	premenstrual syndrome
ethinyl estradiol	upper respiratory tract infection
ethinyl estradiol	myocardial infarction
ethinyl estradiol	erythema multiforme
ethinyl estradiol	embolism cerebral
ethinyl estradiol	menstrual disorder
ethinyl estradiol	chiari syndrome
ethinyl estradiol	hyperlipemia
ethinyl estradiol	hypocalcemia
ethinyl estradiol	hemorrhagic eruption
ethinyl estradiol	cystitis
ethinyl estradiol	foreign body sensation
ethinyl estradiol	angioedema
ethinyl estradiol	tooth disorder
ethinyl estradiol	nervousness
ethinyl estradiol	thromboembolism
ethinyl estradiol	adenomas
ethinyl estradiol	skin disorder
ethinyl estradiol	allergy
ethinyl estradiol	fibroids
ethinyl estradiol	lactation
ethinyl estradiol	jaundice
ethinyl estradiol	asthma exacerbation
ethinyl estradiol	otosclerosis
ethinyl estradiol	ovarian cancer
ethinyl estradiol	increased appetite
ethinyl estradiol	headache
ethinyl estradiol	systemic lupus erythematosus
ethinyl estradiol	diarrhea
ethinyl estradiol	vaginal bleeding
ethinyl estradiol	smear cervix abnormal
ethinyl estradiol	infarction
ethinyl estradiol	nausea
ethinyl estradiol	papanicolaou smear suspicious
ethinyl estradiol	viral infection
ethinyl estradiol	pulmonary embolism
ethinyl estradiol	flatulence
ethinyl estradiol	pain
ethinyl estradiol	hirsutism
ethinyl estradiol	deep venous thrombosis
ethinyl estradiol	pancreatitis
ethinyl estradiol	amentia
ethinyl estradiol	varicose veins
ethinyl estradiol	rash
ethinyl estradiol	discomfort
ethinyl estradiol	rhinitis
ethinyl estradiol	leg cramps
ethinyl estradiol	colitis
ethinyl estradiol	neuritis
ethinyl estradiol	liver tumors
ethinyl estradiol	acne
ethinyl estradiol	cervical ectropion
ethinyl estradiol	anaphylactoid reactions
ethinyl estradiol	liver disease
ethinyl estradiol	thrombosis
ethinyl estradiol	renal impairment
ethinyl estradiol	uterine disorders
ethinyl estradiol	back pain
ethinyl estradiol	ectropion
ethinyl estradiol	dysmenorrhea
ethinyl estradiol	infection
ethinyl estradiol	irritability
ethinyl estradiol	hemangioma
ethinyl estradiol	enlargement
ethinyl estradiol	fatigue
ethinyl estradiol	fever
ethinyl estradiol	eruptions
ethinyl estradiol	thrombophlebitis
ethinyl estradiol	hepatic adenomas
ethinyl estradiol	vomiting
ethinyl estradiol	breast discharge
ethinyl estradiol	gallbladder disease
ethinyl estradiol	bronchitis
ethinyl estradiol	changes in blood pressure
ethinyl estradiol	transient ischemic attack
ethinyl estradiol	abnormal withdrawal bleeding
ethinyl estradiol	dyspepsia
ethinyl estradiol	galactorrhea
ethinyl estradiol	pharyngitis
ethinyl estradiol	leukorrhea
ethinyl estradiol	flu
ethinyl estradiol	fibrocystic breast
ethinyl estradiol	sinusitis
ethinyl estradiol	application site reaction
ethinyl estradiol	gastroenteritis
ethinyl estradiol	superficial venous thrombosis
ethinyl estradiol	pmdd
ethinyl estradiol	elevated triglycerides
ethinyl estradiol	tumors
ethinyl estradiol	porphyria
ethinyl estradiol	vaginitis
ethinyl estradiol	myalgia
ethinyl estradiol	emotional lability
ethinyl estradiol	melasma
ethinyl estradiol	pelvic pain
ethinyl estradiol	fluid retention
ethinyl estradiol	edema
ethinyl estradiol	benign liver tumors
ethinyl estradiol	dizziness
ethinyl estradiol	hypertension
ethinyl estradiol	insomnia
ethinyl estradiol	uremic syndrome
ethinyl estradiol	abnormal bleeding
ethinyl estradiol	menstruation irregular
ethinyl estradiol	tenderness
ethinyl estradiol	cholestatic jaundice
ethinyl estradiol	cervical erosion
ethinyl estradiol	weight gain
ethinyl estradiol	gastrointestinal symptoms
ethinyl estradiol	embolism
ethinyl estradiol	erythema nodosum
ethinyl estradiol	endometriosis
ethinyl estradiol	arthralgia
ethinyl estradiol	moniliasis
ethinyl estradiol	migraine
ethinyl estradiol	infertility
ethinyl estradiol	itching
ethinyl estradiol	hyperplasia
ethinyl estradiol	cerebral thrombosis
ethinyl estradiol	endometrial cancer
ethinyl estradiol	mesenteric thrombosis
ethinyl estradiol	sore throat
ethinyl estradiol	malignant neoplasm
ethinyl estradiol	pain in limb
ethinyl estradiol	urticaria
ethinyl estradiol	mental depression
ethinyl estradiol	lupus
ethinyl estradiol	libido decreased
ethinyl estradiol	abdomen enlarged
omeprazole	adult respiratory distress syndrome
omeprazole	infectious
omeprazole	neutropenia
omeprazole	encephalopathy
omeprazole	respiratory failure
omeprazole	ulceration
omeprazole	agitation
omeprazole	cramping
omeprazole	dysesthesia
omeprazole	atrophy
omeprazole	optic neuritis
omeprazole	somnolence
omeprazole	metabolism and nutrition disorders
omeprazole	bleeding
omeprazole	cough
omeprazole	urinary tract infection
omeprazole	ischemic optic neuropathy
omeprazole	aggressive
omeprazole	hepatic encephalopathy
omeprazole	heart disorder
omeprazole	edema gastrointestinal
omeprazole	dermatitis
omeprazole	thoracic
omeprazole	epidermal necrolysis
omeprazole	atrophy of the tongue
omeprazole	hyperglycemia
omeprazole	dry skin
omeprazole	asthenia
omeprazole	tachycardia
omeprazole	dry eye syndrome
omeprazole	weakness
omeprazole	diplopia
omeprazole	pneumothorax
omeprazole	regurgitation
omeprazole	inflammation
omeprazole	blood pressure increased
omeprazole	erythema
omeprazole	abdominal pain
omeprazole	epistaxis
omeprazole	urinary frequency
omeprazole	hyponatremia
omeprazole	tinnitus
omeprazole	apathy
omeprazole	pyuria
omeprazole	glycosuria
omeprazole	upper respiratory tract infection
omeprazole	duodenal ulcer
omeprazole	decubitus ulcer
omeprazole	optic nerve
omeprazole	leukopenia
omeprazole	mediastinal disorders
omeprazole	distress
omeprazole	erythema multiforme
omeprazole	liver failure
omeprazole	tremor
omeprazole	metabolic alkalosis
omeprazole	hypocalcemia
omeprazole	psychiatric disorders
omeprazole	anorexia
omeprazole	angioedema
omeprazole	nervousness
omeprazole	ocular irritation
omeprazole	blood and lymphatic system disorders
omeprazole	hyperkalemia
omeprazole	supraventricular tachycardia
omeprazole	allergy
omeprazole	hyperhidrosis
omeprazole	purpura
omeprazole	jaundice
omeprazole	confusion
omeprazole	anterior ischemic optic neuropathy
omeprazole	hypomagnesemia
omeprazole	hematuria
omeprazole	anemia
omeprazole	headache
omeprazole	diarrhea
omeprazole	hypernatremia
omeprazole	fundic gland polyps
omeprazole	respiratory distress syndrome
omeprazole	nausea
omeprazole	palpitation
omeprazole	flatulence
omeprazole	pain
omeprazole	hypophosphatemia
omeprazole	chest pain
omeprazole	pancreatitis
omeprazole	testicular pain
omeprazole	vascular disorders
omeprazole	alkalosis
omeprazole	rash
omeprazole	neuropathy
omeprazole	pneumonia
omeprazole	angina
omeprazole	neuritis
omeprazole	gynecomastia
omeprazole	hypotension
omeprazole	liver disease
omeprazole	leg pain
omeprazole	leukocytosis
omeprazole	increased serum creatinine
omeprazole	back pain
omeprazole	gastric hypomotility
omeprazole	dry eyes
omeprazole	alopecia
omeprazole	anaemia nos aggravated
omeprazole	pancytopenia
omeprazole	infection
omeprazole	liver function tests abnormal
omeprazole	irritability
omeprazole	respiratory distress
omeprazole	optic atrophy
omeprazole	fever
omeprazole	fatigue
omeprazole	mucosal atrophy
omeprazole	anxiety
omeprazole	vomiting
omeprazole	infestations
omeprazole	constipation
omeprazole	interstitial nephritis
omeprazole	necrosis
omeprazole	swelling
omeprazole	malaise
omeprazole	bradycardia
omeprazole	proteinuria
omeprazole	hepatic necrosis
omeprazole	dysgeusia
omeprazole	muscular weakness
omeprazole	abdominal swelling
omeprazole	nosocomial pneumonia
omeprazole	tumors
omeprazole	anaphylactic reaction
omeprazole	nephritis
omeprazole	irritable bowel
omeprazole	stomatitis
omeprazole	myalgia
omeprazole	ventricular tachycardia
omeprazole	ze syndrome
omeprazole	skin and subcutaneous tissue disorders
omeprazole	tetany
omeprazole	edema
omeprazole	hyperpyrexia
omeprazole	vertigo
omeprazole	carcinoids
omeprazole	dizziness
omeprazole	hypertension
omeprazole	toxic epidermal necrolysis
omeprazole	insomnia
omeprazole	hypokalemia
omeprazole	hallucination
omeprazole	dry mouth
omeprazole	hemolytic anemia
omeprazole	thrombocytopenia
omeprazole	oral moniliasis
omeprazole	weight gain
omeprazole	esophageal candidiasis
omeprazole	agranulocytosis
omeprazole	petechia
omeprazole	arthralgia
omeprazole	esophageal
omeprazole	moniliasis
omeprazole	polyps
omeprazole	paresthesia
omeprazole	fluid overload
omeprazole	seizures
omeprazole	hepatitis
omeprazole	itching
omeprazole	sepsis
omeprazole	fibrillation
omeprazole	blurred vision
omeprazole	urticaria
omeprazole	photosensitivity
omeprazole	discolored feces
omeprazole	hypoglycemia
omeprazole	atrial fibrillation
omeprazole	peripheral edema
omeprazole	gastrointestinal disorders
ezetimibe	peripheral nerve palsy
ezetimibe	menarche
ezetimibe	cramping
ezetimibe	metabolism and nutrition disorders
ezetimibe	cough
ezetimibe	dermatomyositis
ezetimibe	musculoskeletal and connective tissue disorders
ezetimibe	epidermal necrolysis
ezetimibe	nerve paralysis
ezetimibe	increased eosinophils
ezetimibe	asthenia
ezetimibe	elevated transaminases
ezetimibe	cataract
ezetimibe	lens
ezetimibe	facial paresis
ezetimibe	respiratory infection
ezetimibe	skeletal system disorders
ezetimibe	hypersensitivity syndrome
ezetimibe	erythema
ezetimibe	abdominal pain
ezetimibe	muscular disorder
ezetimibe	creatine phosphokinase increased
ezetimibe	upper respiratory tract infection
ezetimibe	leukopenia
ezetimibe	reproductive system and breast disorders
ezetimibe	erythema multiforme
ezetimibe	polymyalgia rheumatica
ezetimibe	liver failure
ezetimibe	eczema
ezetimibe	tremor
ezetimibe	psychiatric disorders
ezetimibe	anorexia
ezetimibe	angioedema
ezetimibe	allergy
ezetimibe	purpura
ezetimibe	lens opacity
ezetimibe	jaundice
ezetimibe	anemia
ezetimibe	paralysis
ezetimibe	musculoskeletal system disorders
ezetimibe	headache
ezetimibe	diarrhea
ezetimibe	nausea
ezetimibe	disease progression
ezetimibe	viral infection
ezetimibe	cholecystitis
ezetimibe	flatulence
ezetimibe	pain
ezetimibe	ophthalmoplegia
ezetimibe	polymyalgia
ezetimibe	chest pain
ezetimibe	pancreatitis
ezetimibe	arthritis
ezetimibe	rash
ezetimibe	neuropathy
ezetimibe	peripheral neuropathy
ezetimibe	gynecomastia
ezetimibe	respiratory system disorders
ezetimibe	back pain
ezetimibe	chronic active hepatitis
ezetimibe	alopecia
ezetimibe	rhabdomyolysis
ezetimibe	infection
ezetimibe	fatigue
ezetimibe	fever
ezetimibe	liver fatty
ezetimibe	anxiety
ezetimibe	vomiting
ezetimibe	infestations
ezetimibe	memory loss
ezetimibe	constipation
ezetimibe	necrosis
ezetimibe	gallbladder disease
ezetimibe	chills
ezetimibe	dyspepsia
ezetimibe	eye disorders
ezetimibe	malaise
ezetimibe	pharyngitis
ezetimibe	connective tissue disorders
ezetimibe	flu
ezetimibe	sinusitis
ezetimibe	breast disorders
ezetimibe	hepatic necrosis
ezetimibe	positive ana
ezetimibe	dysgeusia
ezetimibe	flushing
ezetimibe	cholelithiasis
ezetimibe	anaphylactic reaction
ezetimibe	myalgia
ezetimibe	paresis
ezetimibe	skin and subcutaneous tissue disorders
ezetimibe	vasculitis
ezetimibe	dyspnea
ezetimibe	vertigo
ezetimibe	hepatoma
ezetimibe	dizziness
ezetimibe	toxic epidermal necrolysis
ezetimibe	cirrhosis
ezetimibe	insomnia
ezetimibe	hemolytic anemia
ezetimibe	thrombocytopenia
ezetimibe	nodule
ezetimibe	cholestatic jaundice
ezetimibe	loss of libido
ezetimibe	arthralgia
ezetimibe	impotence
ezetimibe	nervous system disorders
ezetimibe	paresthesia
ezetimibe	hepatobiliary disorders
ezetimibe	hepatitis
ezetimibe	itching
ezetimibe	drug interaction
ezetimibe	pain in limb
ezetimibe	urticaria
ezetimibe	photosensitivity
ezetimibe	lupus
ezetimibe	skin changes
telithromycin	pancreatitis
telithromycin	rash
telithromycin	cramping
telithromycin	sweating
telithromycin	thrombocythemia
telithromycin	somnolence
telithromycin	glossitis
telithromycin	hypotension
telithromycin	gi irritation
telithromycin	abdominal distension
telithromycin	cholestatic hepatitis
telithromycin	myasthenia
telithromycin	elevated transaminases
telithromycin	atrial arrhythmia
telithromycin	liver function tests abnormal
telithromycin	upset
telithromycin	fatigue
telithromycin	abdominal pain upper
telithromycin	anxiety
telithromycin	diplopia
telithromycin	vomiting
telithromycin	constipation
telithromycin	necrosis
telithromycin	erythema
telithromycin	dyspepsia
telithromycin	abdominal pain
telithromycin	bradycardia
telithromycin	hepatic necrosis
telithromycin	gastroenteritis
telithromycin	fulminant hepatitis
telithromycin	gastritis
telithromycin	vaginal candidiasis
telithromycin	dysgeusia
telithromycin	increased liver enzymes
telithromycin	flushing
telithromycin	increased sweating
telithromycin	anaphylactic reaction
telithromycin	vaginitis
telithromycin	stomatitis
telithromycin	erythema multiforme
telithromycin	liver failure
telithromycin	eczema
telithromycin	facial edema
telithromycin	edema
telithromycin	anorexia
telithromycin	angioedema
telithromycin	vertigo
telithromycin	arrhythmia
telithromycin	dizziness
telithromycin	insomnia
telithromycin	allergy
telithromycin	dry mouth
telithromycin	jaundice
telithromycin	hepatic dysfunction
telithromycin	oral moniliasis
telithromycin	moniliasis
telithromycin	paresthesia
telithromycin	headache
telithromycin	diarrhea
telithromycin	hepatitis
telithromycin	itching
telithromycin	increased eosinophil count
telithromycin	nausea
telithromycin	blurred vision
telithromycin	myasthenia gravis
telithromycin	palpitation
telithromycin	flatulence
telithromycin	pain
telithromycin	urticaria
quinupristin	cerebrovascular accident
quinupristin	encephalopathy
quinupristin	ulceration
quinupristin	cramping
quinupristin	phlebitis
quinupristin	sweating
quinupristin	pericarditis
quinupristin	bleeding
quinupristin	dysautonomia
quinupristin	coagulation
quinupristin	tachycardia
quinupristin	hypertonia
quinupristin	mesenteric arterial occlusion
quinupristin	inflammation
quinupristin	coagulation disorder
quinupristin	abdominal pain
quinupristin	cerebral hemorrhage
quinupristin	hyponatremia
quinupristin	grand mal
quinupristin	hypovolemia
quinupristin	distress
quinupristin	pericardial effusion
quinupristin	tremor
quinupristin	hypoxia
quinupristin	blood clot
quinupristin	angioedema
quinupristin	syncope
quinupristin	supraventricular tachycardia
quinupristin	allergy
quinupristin	apnea
quinupristin	jaundice
quinupristin	paraplegia
quinupristin	confusion
quinupristin	hematuria
quinupristin	anemia
quinupristin	headache
quinupristin	diarrhea
quinupristin	respiratory distress syndrome
quinupristin	nausea
quinupristin	palpitation
quinupristin	pain
quinupristin	arterial occlusion
quinupristin	acidosis
quinupristin	gout
quinupristin	chest pain
quinupristin	pancreatitis
quinupristin	rash
quinupristin	neuropathy
quinupristin	leg cramps
quinupristin	anaphylactoid reactions
quinupristin	reactions at the infusion site
quinupristin	cardiac arrest
quinupristin	hypotension
quinupristin	pleural effusion
quinupristin	effusion
quinupristin	myasthenia
quinupristin	hemolysis
quinupristin	pancytopenia
quinupristin	infection
quinupristin	respiratory distress
quinupristin	fever
quinupristin	thrombophlebitis
quinupristin	anxiety
quinupristin	vomiting
quinupristin	constipation
quinupristin	dyspepsia
quinupristin	maculopapular rash
quinupristin	pseudomembranous enterocolitis
quinupristin	vasodilatation
quinupristin	pleural
quinupristin	anaphylactic reaction
quinupristin	vaginitis
quinupristin	stomatitis
quinupristin	myalgia
quinupristin	edema
quinupristin	dyspnea
quinupristin	illness
quinupristin	arrhythmia
quinupristin	dizziness
quinupristin	enterocolitis
quinupristin	insomnia
quinupristin	shock
quinupristin	convulsion
quinupristin	bone pain
quinupristin	premature ventricular contraction
quinupristin	hemolytic anemia
quinupristin	skin ulcer
quinupristin	oral moniliasis
quinupristin	arthralgia
quinupristin	moniliasis
quinupristin	paresthesia
quinupristin	rigidity
quinupristin	hepatitis
quinupristin	itching
quinupristin	hypoplastic anemia
quinupristin	ventricular fibrillation
quinupristin	neck rigidity
quinupristin	extrasystoles
quinupristin	fibrillation
quinupristin	hypoventilation
quinupristin	urticaria
quinupristin	hypoglycemia
quinupristin	peripheral edema
quinupristin	gastrointestinal bleeding
erythromycin	pancreatitis
erythromycin	hearing loss
erythromycin	colitis
erythromycin	anaphylactic reaction
erythromycin	erythema multiforme
erythromycin	ventricular tachycardia
erythromycin	torsades de pointes
erythromycin	epidermal necrolysis
erythromycin	anorexia
erythromycin	arrhythmia
erythromycin	toxic epidermal necrolysis
erythromycin	allergy
erythromycin	convulsion
erythromycin	tachycardia
erythromycin	hepatic dysfunction
erythromycin	liver function tests abnormal
erythromycin	renal insufficiency
erythromycin	eruptions
erythromycin	diarrhea
erythromycin	vomiting
erythromycin	hepatitis
erythromycin	qtc
erythromycin	nausea
erythromycin	erythema
erythromycin	pseudomembranous colitis
erythromycin	pain
erythromycin	urticaria
erythromycin	abdominal pain
erythromycin	symptoms of hepatitis
glipizide	rash
glipizide	cramping
glipizide	rhinitis
glipizide	leg cramps
glipizide	sweating
glipizide	somnolence
glipizide	polyuria
glipizide	bleeding
glipizide	gi irritation
glipizide	abnormal gait
glipizide	conjunctivitis
glipizide	asthenia
glipizide	shakiness
glipizide	infection
glipizide	hypertonia
glipizide	respiratory infection
glipizide	vomiting
glipizide	anxiety
glipizide	constipation
glipizide	syndrome of inappropriate antidiuretic hormone
glipizide	chills
glipizide	dyspepsia
glipizide	abdominal pain
glipizide	pharyngitis
glipizide	hunger
glipizide	retinal hemorrhage
glipizide	hyponatremia
glipizide	hypesthesia
glipizide	hepatic porphyria
glipizide	upper respiratory tract infection
glipizide	flushing
glipizide	porphyria
glipizide	myalgia
glipizide	gastrointestinal reactions
glipizide	tremor
glipizide	edema
glipizide	musculoskeletal pain
glipizide	dyspnea
glipizide	anorexia
glipizide	nervousness
glipizide	vertigo
glipizide	syncope
glipizide	arrhythmia
glipizide	dizziness
glipizide	hypertension
glipizide	insomnia
glipizide	jaundice
glipizide	confusion
glipizide	gastrointestinal symptoms
glipizide	arthralgia
glipizide	migraine
glipizide	paresthesia
glipizide	headache
glipizide	diarrhea
glipizide	itching
glipizide	dysuria
glipizide	nausea
glipizide	thirst
glipizide	blood in stool
glipizide	blurred vision
glipizide	flatulence
glipizide	pain
glipizide	urticaria
glipizide	hypoglycemia
glipizide	libido decreased
glipizide	gastrointestinal bleeding
indomethacin	arthritis
indomethacin	ulceration
indomethacin	diverticulum
indomethacin	colitis
indomethacin	ileitis
indomethacin	tenesmus
indomethacin	somnolence
indomethacin	bleeding
indomethacin	epigastric pain
indomethacin	abdominal distress
indomethacin	gastric disorder
indomethacin	bloating
indomethacin	ulcerative colitis
indomethacin	psychotic episodes
indomethacin	carcinoma
indomethacin	proctitis
indomethacin	fatigue
indomethacin	weakness
indomethacin	anxiety
indomethacin	vomiting
indomethacin	drowsiness
indomethacin	constipation
indomethacin	regional ileitis
indomethacin	dyspepsia
indomethacin	malaise
indomethacin	apathy
indomethacin	gastroenteritis
indomethacin	muscular weakness
indomethacin	distress
indomethacin	stomatitis
indomethacin	heartburn
indomethacin	anorexia
indomethacin	nervousness
indomethacin	vertigo
indomethacin	intestinal ulcer
indomethacin	obstruction
indomethacin	dizziness
indomethacin	ulcerative stomatitis
indomethacin	insomnia
indomethacin	peptic ulcer
indomethacin	rheumatoid arthritis
indomethacin	jaundice
indomethacin	confusion
indomethacin	esophageal
indomethacin	rectal hemorrhage
indomethacin	headache
indomethacin	diarrhea
indomethacin	hepatitis
indomethacin	nausea
indomethacin	flatulence
indomethacin	pain
indomethacin	gastrointestinal bleeding
cyclosporine	gum hyperplasia
cyclosporine	ulceration
cyclosporine	sweating
cyclosporine	somnolence
cyclosporine	red blood cell disorders
cyclosporine	cough
cyclosporine	peripheral ischemia
cyclosporine	breast pain
cyclosporine	glossitis
cyclosporine	bronchospasm
cyclosporine	herpes simplex
cyclosporine	renal abscess
cyclosporine	heart failure
cyclosporine	cataract
cyclosporine	death
cyclosporine	respiratory infection
cyclosporine	abnormal heart sounds
cyclosporine	tingling
cyclosporine	goiter
cyclosporine	epistaxis
cyclosporine	urinary frequency
cyclosporine	bilirubinemia
cyclosporine	tinnitus
cyclosporine	acute tubular necrosis
cyclosporine	hypesthesia
cyclosporine	night sweats
cyclosporine	upper respiratory tract infection
cyclosporine	conjunctival hyperemia
cyclosporine	myocardial infarction
cyclosporine	distention
cyclosporine	hyperlipemia
cyclosporine	menstrual disorder
cyclosporine	tremor
cyclosporine	lymphoproliferative disease
cyclosporine	psychiatric disorders
cyclosporine	angioedema
cyclosporine	tooth disorder
cyclosporine	foreign body sensation
cyclosporine	obstruction
cyclosporine	hyperkalemia
cyclosporine	allergy
cyclosporine	microangiopathy
cyclosporine	decreased kidney function
cyclosporine	tubular necrosis
cyclosporine	rectal hemorrhage
cyclosporine	dysuria
cyclosporine	nausea
cyclosporine	viral infection
cyclosporine	hirsutism
cyclosporine	abscess
cyclosporine	chest pain
cyclosporine	pancreatitis
cyclosporine	arthritis
cyclosporine	hyperuricemia
cyclosporine	rash
cyclosporine	neuropathy
cyclosporine	discomfort
cyclosporine	pneumonia
cyclosporine	diabetes
cyclosporine	gum hemorrhage
cyclosporine	polyuria
cyclosporine	eye pain
cyclosporine	peripheral neuropathy
cyclosporine	acne
cyclosporine	respiratory system disorders
cyclosporine	thrombosis
cyclosporine	skin infections
cyclosporine	visual disturbances
cyclosporine	rigors
cyclosporine	watery eyes
cyclosporine	fever
cyclosporine	lymphadenopathy
cyclosporine	ear disorder
cyclosporine	systemic fungal infection
cyclosporine	lack of efficacy
cyclosporine	herpes
cyclosporine	dyspepsia
cyclosporine	pharyngitis
cyclosporine	leukorrhea
cyclosporine	flu
cyclosporine	tendon disorder
cyclosporine	weight decreased
cyclosporine	sinusitis
cyclosporine	gastritis
cyclosporine	dysgeusia
cyclosporine	flushing
cyclosporine	gingivitis
cyclosporine	tumors
cyclosporine	creatinine increased
cyclosporine	hot flushes
cyclosporine	edema
cyclosporine	dyspnea
cyclosporine	nocturia
cyclosporine	hypocholesterolemia
cyclosporine	vertigo
cyclosporine	arrhythmia
cyclosporine	insomnia
cyclosporine	peptic ulcer
cyclosporine	chest sound abnormalities
cyclosporine	hepatocellular damage
cyclosporine	urinary incontinence
cyclosporine	thrombocytopenia
cyclosporine	weight gain
cyclosporine	microangiopathic hemolytic anemia
cyclosporine	paresthesia
cyclosporine	ischemia
cyclosporine	itching
cyclosporine	tubular
cyclosporine	upper gi bleeding
cyclosporine	hyperplasia
cyclosporine	blurred vision
cyclosporine	malignant neoplasm
cyclosporine	urticaria
cyclosporine	hypoglycemia
cyclosporine	bullous eruptions
cyclosporine	infectious
cyclosporine	cramping
cyclosporine	hypertrichosis
cyclosporine	progressive renal failure
cyclosporine	bleeding
cyclosporine	urinary tract infection
cyclosporine	dermatitis
cyclosporine	nightmares
cyclosporine	conjunctivitis
cyclosporine	hyperglycemia
cyclosporine	dry skin
cyclosporine	asthenia
cyclosporine	coagulation
cyclosporine	folliculitis
cyclosporine	keratoses
cyclosporine	carcinoma
cyclosporine	weakness
cyclosporine	hyperemia
cyclosporine	infection bacterial
cyclosporine	toxic nephropathy
cyclosporine	impaired concentration
cyclosporine	coagulation disorder
cyclosporine	hiccups
cyclosporine	abdominal pain
cyclosporine	abnormal pigmentation
cyclosporine	renal failure
cyclosporine	autonomic nervous system disorders
cyclosporine	cardiovascular disorders
cyclosporine	incontinence
cyclosporine	nail disorder
cyclosporine	leukopenia
cyclosporine	increased sweating
cyclosporine	eczema
cyclosporine	anorexia
cyclosporine	nervousness
cyclosporine	skin disorder
cyclosporine	salivary gland enlargement
cyclosporine	purpura
cyclosporine	rheumatoid arthritis
cyclosporine	confusion
cyclosporine	tongue disorder
cyclosporine	hypomagnesemia
cyclosporine	psoriasis
cyclosporine	synovial cyst
cyclosporine	hematuria
cyclosporine	increased appetite
cyclosporine	anemia
cyclosporine	libido increased
cyclosporine	musculoskeletal system disorders
cyclosporine	bursitis
cyclosporine	headache
cyclosporine	diarrhea
cyclosporine	enanthema
cyclosporine	infarction
cyclosporine	flatulence
cyclosporine	pain
cyclosporine	abnormal urine
cyclosporine	stinging
cyclosporine	cyst
cyclosporine	hyperesthesia
cyclosporine	attacks of gout
cyclosporine	stomach ulcer
cyclosporine	gout
cyclosporine	uterine hemorrhage
cyclosporine	vestibular disorder
cyclosporine	rhinitis
cyclosporine	leg cramps
cyclosporine	gynecomastia
cyclosporine	cellulitis
cyclosporine	abnormal vision
cyclosporine	abdominal distension
cyclosporine	pyelonephritis
cyclosporine	alopecia
cyclosporine	infection
cyclosporine	stiffness
cyclosporine	fatigue
cyclosporine	enlargement
cyclosporine	eruptions
cyclosporine	anxiety
cyclosporine	vomiting
cyclosporine	constipation
cyclosporine	necrosis
cyclosporine	abdominal discomfort
cyclosporine	graft failure
cyclosporine	bronchitis
cyclosporine	malaise
cyclosporine	urinary urgency
cyclosporine	gastroenteritis
cyclosporine	infection fungal
cyclosporine	hearing loss
cyclosporine	elevated triglycerides
cyclosporine	herpes zoster
cyclosporine	increased bun
cyclosporine	eructation
cyclosporine	pigmentation
cyclosporine	myalgia
cyclosporine	stomatitis
cyclosporine	emotional lability
cyclosporine	dysphagia
cyclosporine	hypertension
cyclosporine	dizziness
cyclosporine	arthropathy
cyclosporine	uremic syndrome
cyclosporine	convulsion
cyclosporine	renal and urinary disorders
cyclosporine	breast fibroadenosis
cyclosporine	dry mouth
cyclosporine	hemolytic anemia
cyclosporine	skin ulcer
cyclosporine	arthralgia
cyclosporine	nervous system disorders
cyclosporine	tonsillitis
cyclosporine	moniliasis
cyclosporine	migraine
cyclosporine	esophagitis
cyclosporine	lymphoma
cyclosporine	septicemia
cyclosporine	deafness
cyclosporine	libido decreased
cyclosporine	gastrointestinal bleeding
cyclosporine	lethargy
cyclosporine	gastrointestinal disorders
norfloxacin	chest pain
norfloxacin	increased alkaline phosphatase
norfloxacin	ulceration
norfloxacin	rash
norfloxacin	cramping
norfloxacin	somnolence
norfloxacin	increased urine protein
norfloxacin	generalized seizures
norfloxacin	urinary tract infection
norfloxacin	increased serum creatinine
norfloxacin	back pain
norfloxacin	increased eosinophils
norfloxacin	hand swelling
norfloxacin	visual disturbances
norfloxacin	asthenia
norfloxacin	decreased wbc
norfloxacin	dysmenorrhea
norfloxacin	increased ldh
norfloxacin	infection
norfloxacin	fever
norfloxacin	anxiety
norfloxacin	vomiting
norfloxacin	constipation
norfloxacin	tingling
norfloxacin	prostatitis
norfloxacin	sleep disturbances
norfloxacin	decreased platelet
norfloxacin	decreased hematocrit
norfloxacin	swelling
norfloxacin	chills
norfloxacin	dyspepsia
norfloxacin	abdominal pain
norfloxacin	colic
norfloxacin	abdominal cramping
norfloxacin	pruritus ani
norfloxacin	glycosuria
norfloxacin	gonorrhea
norfloxacin	abdominal swelling
norfloxacin	myocardial infarction
norfloxacin	increased bun
norfloxacin	mouth ulcer
norfloxacin	increased sgot
norfloxacin	rectal pain
norfloxacin	tremor
norfloxacin	edema
norfloxacin	heartburn
norfloxacin	anorexia
norfloxacin	dizziness
norfloxacin	insomnia
norfloxacin	bitter taste
norfloxacin	hyperhidrosis
norfloxacin	dry mouth
norfloxacin	bursitis
norfloxacin	headache
norfloxacin	diarrhea
norfloxacin	seizures
norfloxacin	itching
norfloxacin	infarction
norfloxacin	nausea
norfloxacin	blurred vision
norfloxacin	palpitation
norfloxacin	flatulence
norfloxacin	pain
norfloxacin	renal colic
norfloxacin	myoclonus
sirolimus	gum hyperplasia
sirolimus	mycobacterial infections
sirolimus	ulceration
sirolimus	bronchiolitis
sirolimus	sweating
sirolimus	somnolence
sirolimus	hemolytic uremic syndrome
sirolimus	graft loss
sirolimus	cough
sirolimus	metrorrhagia
sirolimus	congestive heart failure
sirolimus	herpes simplex
sirolimus	cough increased
sirolimus	tachycardia
sirolimus	heart failure
sirolimus	fibrosis
sirolimus	cataract
sirolimus	death
sirolimus	renal pain
sirolimus	hypertonia
sirolimus	lung disorder
sirolimus	respiratory infection
sirolimus	epistaxis
sirolimus	urinary frequency
sirolimus	hyponatremia
sirolimus	creatine phosphokinase increased
sirolimus	tinnitus
sirolimus	exfoliative dermatitis
sirolimus	hypesthesia
sirolimus	pyuria
sirolimus	glycosuria
sirolimus	upper respiratory tract infection
sirolimus	chronic allograft nephropathy
sirolimus	mouth ulcer
sirolimus	hyperlipemia
sirolimus	organizing pneumonia
sirolimus	tremor
sirolimus	lymphoproliferative disease
sirolimus	angioedema
sirolimus	syncope
sirolimus	hyperkalemia
sirolimus	thromboembolism
sirolimus	allergy
sirolimus	bronchiolitis obliterans organizing pneumonia
sirolimus	rectal disorder
sirolimus	peritonitis
sirolimus	tubular necrosis
sirolimus	ear pain
sirolimus	dysuria
sirolimus	nausea
sirolimus	palpitation
sirolimus	pulmonary embolism
sirolimus	hirsutism
sirolimus	nephrotic syndrome
sirolimus	abscess
sirolimus	acidosis
sirolimus	hypercholesterolemia
sirolimus	venous thromboembolism
sirolimus	chest pain
sirolimus	pancreatitis
sirolimus	vascular disorders
sirolimus	hyperuricemia
sirolimus	rash
sirolimus	neuropathy
sirolimus	pneumonia
sirolimus	diabetes
sirolimus	polyuria
sirolimus	skin carcinoma
sirolimus	hypercalcemia
sirolimus	acne
sirolimus	hypotension
sirolimus	thrombosis
sirolimus	leukocytosis
sirolimus	nephropathy
sirolimus	pleural effusion
sirolimus	back pain
sirolimus	effusion
sirolimus	withdrawn
sirolimus	increased ldh
sirolimus	pancytopenia
sirolimus	fever
sirolimus	lymphadenopathy
sirolimus	kidney function abnormal
sirolimus	hypersensitivity vasculitis
sirolimus	pulmonary hemorrhage
sirolimus	herpes
sirolimus	osteoporosis
sirolimus	dyspepsia
sirolimus	pharyngitis
sirolimus	flu
sirolimus	weight decreased
sirolimus	sinusitis
sirolimus	lymphedema
sirolimus	hepatic necrosis
sirolimus	gastritis
sirolimus	gingivitis
sirolimus	pleural
sirolimus	creatinine increased
sirolimus	skin hypertrophy
sirolimus	pelvic pain
sirolimus	oliguria
sirolimus	tetany
sirolimus	edema
sirolimus	dyspnea
sirolimus	nocturia
sirolimus	thrombocytopenic purpura
sirolimus	insomnia
sirolimus	urinary incontinence
sirolimus	hydronephrosis
sirolimus	thrombocytopenia
sirolimus	oral moniliasis
sirolimus	weight gain
sirolimus	ileus
sirolimus	paresthesia
sirolimus	itching
sirolimus	tubular
sirolimus	hyperplasia
sirolimus	fibrillation
sirolimus	malignant neoplasm
sirolimus	hypoglycemia
sirolimus	atrial fibrillation
sirolimus	peripheral edema
sirolimus	bladder pain
sirolimus	abdomen enlarged
sirolimus	infectious
sirolimus	neutropenia
sirolimus	cramping
sirolimus	bleeding
sirolimus	urinary tract infection
sirolimus	increased sgpt
sirolimus	dermatitis
sirolimus	conjunctivitis
sirolimus	hyperglycemia
sirolimus	venous thrombosis
sirolimus	asthenia
sirolimus	albuminuria
sirolimus	hyperphosphatemia
sirolimus	carcinoma
sirolimus	lymphocele
sirolimus	toxic nephropathy
sirolimus	delayed healing
sirolimus	asthma
sirolimus	abdominal pain
sirolimus	acute renal rejection
sirolimus	pulmonary edema
sirolimus	menorrhagia
sirolimus	incontinence
sirolimus	leukopenia
sirolimus	hernia
sirolimus	pulmonary fibrosis
sirolimus	increased sgot
sirolimus	hypoxia
sirolimus	facial edema
sirolimus	hypocalcemia
sirolimus	otitis media
sirolimus	anorexia
sirolimus	purpura
sirolimus	fungal dermatitis
sirolimus	hepatic dysfunction
sirolimus	confusion
sirolimus	hypomagnesemia
sirolimus	hematuria
sirolimus	anemia
sirolimus	headache
sirolimus	diarrhea
sirolimus	hypotonia
sirolimus	bronchiolitis obliterans
sirolimus	flatulence
sirolimus	increased serum triglycerides
sirolimus	pain
sirolimus	generalized edema
sirolimus	hypophosphatemia
sirolimus	polycythemia
sirolimus	melanoma
sirolimus	deep venous thrombosis
sirolimus	increased alkaline phosphatase
sirolimus	scrotal edema
sirolimus	dehydration
sirolimus	rhinitis
sirolimus	leg cramps
sirolimus	osteonecrosis
sirolimus	anaphylactoid reactions
sirolimus	cellulitis
sirolimus	abnormal vision
sirolimus	pyelonephritis
sirolimus	peripheral vascular disorder
sirolimus	postural hypotension
sirolimus	atelectasis
sirolimus	infection
sirolimus	liver function tests abnormal
sirolimus	enlargement
sirolimus	thrombophlebitis
sirolimus	anxiety
sirolimus	vomiting
sirolimus	otitis
sirolimus	constipation
sirolimus	necrosis
sirolimus	testicular disorder
sirolimus	bronchitis
sirolimus	chills
sirolimus	ecchymosis
sirolimus	malaise
sirolimus	ascites
sirolimus	proteinuria
sirolimus	vasodilatation
sirolimus	gastroenteritis
sirolimus	interstitial lung disease
sirolimus	skin melanoma
sirolimus	herpes zoster
sirolimus	increased bun
sirolimus	eructation
sirolimus	stomatitis
sirolimus	myalgia
sirolimus	emotional lability
sirolimus	vasculitis
sirolimus	dysphagia
sirolimus	dizziness
sirolimus	hypertension
sirolimus	arthropathy
sirolimus	uremic syndrome
sirolimus	hypokalemia
sirolimus	skin ulcer
sirolimus	embolism
sirolimus	acute allograft rejection
sirolimus	arthralgia
sirolimus	impotence
sirolimus	moniliasis
sirolimus	esophagitis
sirolimus	fluid overload
sirolimus	sepsis
sirolimus	lymphoma
sirolimus	thrombotic thrombocytopenic purpura
sirolimus	urinary retention
sirolimus	deafness
imipenem	neutropenia
imipenem	encephalopathy
imipenem	rash
imipenem	bone marrow depression
imipenem	hemorrhagic colitis
imipenem	discomfort
imipenem	colitis
imipenem	somnolence
imipenem	polyuria
imipenem	glossitis
imipenem	hypotension
imipenem	thoracic
imipenem	epidermal necrolysis
imipenem	thoracic spine pain
imipenem	increased eosinophils
imipenem	asthenia
imipenem	tooth discoloration
imipenem	hyperventilation
imipenem	decreased wbc
imipenem	tachycardia
imipenem	anuria
imipenem	drug fever
imipenem	increased ldh
imipenem	pancytopenia
imipenem	fever
imipenem	enlargement
imipenem	lymphocytes increased
imipenem	weakness
imipenem	vomiting
imipenem	prothrombin increased
imipenem	salivation
imipenem	decreased platelet
imipenem	erythema
imipenem	increased monocytes
imipenem	abdominal pain
imipenem	hyponatremia
imipenem	tinnitus
imipenem	renal failure
imipenem	spine pain
imipenem	decreased hemoglobin
imipenem	gastroenteritis
imipenem	fulminant hepatitis
imipenem	dysgeusia
imipenem	potassium increased
imipenem	antibiotic treatment
imipenem	hearing loss
imipenem	cyanosis
imipenem	flushing
imipenem	leukopenia
imipenem	increased bun
imipenem	increased sgot
imipenem	erythema multiforme
imipenem	liver failure
imipenem	tremor
imipenem	pruritus vulvae
imipenem	oliguria
imipenem	edema
imipenem	heartburn
imipenem	dyspnea
imipenem	angioedema
imipenem	vertigo
imipenem	pain at the injection
imipenem	dizziness
imipenem	toxic epidermal necrolysis
imipenem	acute renal failure
imipenem	hyperhidrosis
imipenem	increased salivation
imipenem	positive coombs test
imipenem	skin texture changes
imipenem	hallucination
imipenem	jaundice
imipenem	polyarthralgia
imipenem	hemolytic anemia
imipenem	confusion
imipenem	thrombocytopenia
imipenem	agranulocytosis
imipenem	chest discomfort
imipenem	moniliasis
imipenem	anemia
imipenem	paresthesia
imipenem	headache
imipenem	diarrhea
imipenem	seizures
imipenem	hepatitis
imipenem	itching
imipenem	nausea
imipenem	pain at the injection site
imipenem	palpitation
imipenem	pseudomembranous colitis
imipenem	pain
imipenem	urticaria
imipenem	discolored urine
imipenem	myoclonus
simvastatin	peripheral nerve palsy
simvastatin	menarche
simvastatin	cramping
simvastatin	metabolism and nutrition disorders
simvastatin	cough
simvastatin	dermatomyositis
simvastatin	musculoskeletal and connective tissue disorders
simvastatin	epidermal necrolysis
simvastatin	nerve paralysis
simvastatin	increased eosinophils
simvastatin	asthenia
simvastatin	elevated transaminases
simvastatin	cataract
simvastatin	lens
simvastatin	facial paresis
simvastatin	respiratory infection
simvastatin	hypersensitivity syndrome
simvastatin	erythema
simvastatin	abdominal pain
simvastatin	muscular disorder
simvastatin	creatine phosphokinase increased
simvastatin	upper respiratory tract infection
simvastatin	leukopenia
simvastatin	reproductive system and breast disorders
simvastatin	erythema multiforme
simvastatin	polymyalgia rheumatica
simvastatin	liver failure
simvastatin	eczema
simvastatin	tremor
simvastatin	psychiatric disorders
simvastatin	familial hypercholesterolemia
simvastatin	anorexia
simvastatin	angioedema
simvastatin	allergy
simvastatin	purpura
simvastatin	lens opacity
simvastatin	jaundice
simvastatin	hepatic dysfunction
simvastatin	anemia
simvastatin	paralysis
simvastatin	musculoskeletal system disorders
simvastatin	headache
simvastatin	diarrhea
simvastatin	nausea
simvastatin	disease progression
simvastatin	cholecystitis
simvastatin	viral infection
simvastatin	flatulence
simvastatin	pain
simvastatin	ophthalmoplegia
simvastatin	hypercholesterolemia
simvastatin	polymyalgia
simvastatin	pancreatitis
simvastatin	arthritis
simvastatin	heterozygous familial hypercholesterolemia
simvastatin	rash
simvastatin	neuropathy
simvastatin	peripheral neuropathy
simvastatin	gynecomastia
simvastatin	respiratory system disorders
simvastatin	back pain
simvastatin	chronic active hepatitis
simvastatin	alopecia
simvastatin	rhabdomyolysis
simvastatin	infection
simvastatin	fever
simvastatin	liver fatty
simvastatin	fatigue
simvastatin	anxiety
simvastatin	vomiting
simvastatin	memory loss
simvastatin	infestations
simvastatin	constipation
simvastatin	necrosis
simvastatin	chills
simvastatin	dyspepsia
simvastatin	malaise
simvastatin	eye disorders
simvastatin	pharyngitis
simvastatin	connective tissue disorders
simvastatin	flu
simvastatin	sinusitis
simvastatin	breast disorders
simvastatin	hepatic necrosis
simvastatin	positive ana
simvastatin	dysgeusia
simvastatin	flushing
simvastatin	cholelithiasis
simvastatin	anaphylactic reaction
simvastatin	myalgia
simvastatin	paresis
simvastatin	skin and subcutaneous tissue disorders
simvastatin	vasculitis
simvastatin	dyspnea
simvastatin	vertigo
simvastatin	hepatoma
simvastatin	dizziness
simvastatin	toxic epidermal necrolysis
simvastatin	cirrhosis
simvastatin	insomnia
simvastatin	hemolytic anemia
simvastatin	thrombocytopenia
simvastatin	nodule
simvastatin	cholestatic jaundice
simvastatin	loss of libido
simvastatin	arthralgia
simvastatin	impotence
simvastatin	nervous system disorders
simvastatin	paresthesia
simvastatin	hepatobiliary disorders
simvastatin	hepatitis
simvastatin	itching
simvastatin	pain in limb
simvastatin	urticaria
simvastatin	photosensitivity
simvastatin	lupus
simvastatin	skin changes
methotrexate	death fetal
methotrexate	neutropenia
methotrexate	encephalopathy
methotrexate	mood disturbances
methotrexate	ulceration
methotrexate	hematemesis
methotrexate	cryptococcosis
methotrexate	pericarditis
methotrexate	bleeding
methotrexate	abdominal distress
methotrexate	alveolitis
methotrexate	dermatitis
methotrexate	epidermal necrolysis
methotrexate	conjunctivitis
methotrexate	skin necrosis
methotrexate	venous thrombosis
methotrexate	increased eosinophils
methotrexate	fibrosis
methotrexate	death
methotrexate	lung disorder
methotrexate	lysis
methotrexate	soft tissue necrosis
methotrexate	drowsiness
methotrexate	histoplasmosis
methotrexate	erythema
methotrexate	hypogammaglobulinemia
methotrexate	exfoliative dermatitis
methotrexate	renal failure
methotrexate	vision loss
methotrexate	dysarthria
methotrexate	leukopenia
methotrexate	distress
methotrexate	erythema multiforme
methotrexate	obstructive pulmonary disease
methotrexate	liver failure
methotrexate	menstrual disorder
methotrexate	nocardiosis
methotrexate	pericardial effusion
methotrexate	lymphoproliferative disease
methotrexate	anorexia
methotrexate	cystitis
methotrexate	cytomegaloviral pneumonia
methotrexate	rheumatoid arthritis
methotrexate	ulcer and gastrointestinal bleeding
methotrexate	psoriasis
methotrexate	hematuria
methotrexate	aphasia
methotrexate	cmv infection
methotrexate	anemia
methotrexate	headache
methotrexate	diarrhea
methotrexate	dysuria
methotrexate	nausea
methotrexate	hemiparesis
methotrexate	pulmonary embolism
methotrexate	acute hepatitis
methotrexate	deep venous thrombosis
methotrexate	bone disorders
methotrexate	pancreatitis
methotrexate	arthritis
methotrexate	rash
methotrexate	pneumonia
methotrexate	cognitive dysfunction
methotrexate	diabetes
methotrexate	oligospermia
methotrexate	osteonecrosis
methotrexate	acne
methotrexate	gynecomastia
methotrexate	anaphylactoid reactions
methotrexate	embolus
methotrexate	aplastic anemia
methotrexate	hypotension
methotrexate	thrombosis
methotrexate	interstitial pneumonitis
methotrexate	nephropathy
methotrexate	effusion
methotrexate	alopecia
methotrexate	pancytopenia
methotrexate	infection
methotrexate	fever
methotrexate	fatigue
methotrexate	lymphadenopathy
methotrexate	thrombophlebitis
methotrexate	vomiting
methotrexate	necrosis
methotrexate	chills
methotrexate	herpes
methotrexate	osteoporosis
methotrexate	ecchymosis
methotrexate	eye disorders
methotrexate	malaise
methotrexate	transient blindness
methotrexate	pharyngitis
methotrexate	opportunistic infections
methotrexate	proteinuria
methotrexate	furunculosis
methotrexate	serum albumin decreased
methotrexate	increased liver enzymes
methotrexate	gingivitis
methotrexate	herpes zoster
methotrexate	tumors
methotrexate	chills and fever
methotrexate	stomatitis
methotrexate	myalgia
methotrexate	paresis
methotrexate	thromboembolic events
methotrexate	enteritis
methotrexate	vasculitis
methotrexate	arterial thrombosis
methotrexate	melena
methotrexate	dizziness
methotrexate	toxic epidermal necrolysis
methotrexate	ulcerative stomatitis
methotrexate	cirrhosis
methotrexate	convulsion
methotrexate	thrombocytopenia
methotrexate	retinal vein thrombosis
methotrexate	azotemia
methotrexate	agranulocytosis
methotrexate	loss of libido
methotrexate	arthralgia
methotrexate	impotence
methotrexate	telangiectasia
methotrexate	hepatobiliary disorders
methotrexate	infertility
methotrexate	hepatitis
methotrexate	itching
methotrexate	vaginal discharge
methotrexate	psoriatic plaque
methotrexate	sepsis
methotrexate	sudden death
methotrexate	cerebral thrombosis
methotrexate	blurred vision
methotrexate	lymphoma
methotrexate	pneumocystis
methotrexate	urticaria
methotrexate	photosensitivity
methotrexate	tumor lysis syndrome
methotrexate	leukoencephalopathy
methotrexate	plaque
rifabutin	chest pain
rifabutin	neutropenia
rifabutin	rash
rifabutin	nausea and vomiting
rifabutin	fever
rifabutin	headache
rifabutin	eructation
rifabutin	diarrhea
rifabutin	vomiting
rifabutin	myalgia
rifabutin	nausea
rifabutin	dyspepsia
rifabutin	flatulence
rifabutin	pain
rifabutin	anorexia
rifabutin	abdominal pain
rifabutin	asthenia
rifabutin	insomnia
terbinafine	dermatitis
terbinafine	skin discoloration
terbinafine	hyperpigmentation
terbinafine	tinea cruris
terbinafine	contact dermatitis
terbinafine	skin disorder
terbinafine	itching
terbinafine	scaling
terbinafine	tinea
voriconazole	gum hyperplasia
voriconazole	cerebrovascular accident
voriconazole	encephalopathy
voriconazole	ulceration
voriconazole	hematemesis
voriconazole	bone marrow depression
voriconazole	abnormality of accommodation
voriconazole	atrophy
voriconazole	sweating
voriconazole	somnolence
voriconazole	cough
voriconazole	cerebral ischemia
voriconazole	torsades de pointes
voriconazole	bigeminy
voriconazole	glossitis
voriconazole	metrorrhagia
voriconazole	hypothyroidism
voriconazole	congestive heart failure
voriconazole	herpes simplex
voriconazole	akathisia
voriconazole	cough increased
voriconazole	tachycardia
voriconazole	heart failure
voriconazole	elevated liver function tests
voriconazole	skin discoloration
voriconazole	granuloma
voriconazole	death
voriconazole	renal pain
voriconazole	hypertonia
voriconazole	respiratory infection
voriconazole	visual field defect
voriconazole	erythema
voriconazole	epistaxis
voriconazole	bilirubinemia
voriconazole	retinal hemorrhage
voriconazole	muscular disorder
voriconazole	hyponatremia
voriconazole	creatine phosphokinase increased
voriconazole	tinnitus
voriconazole	exfoliative dermatitis
voriconazole	grand mal
voriconazole	av block
voriconazole	hypesthesia
voriconazole	vision loss
voriconazole	glycosuria
voriconazole	cyanosis
voriconazole	myocardial infarction
voriconazole	mouth ulcer
voriconazole	encephalitis
voriconazole	erythema multiforme
voriconazole	liver failure
voriconazole	tremor
voriconazole	eye hemorrhage
voriconazole	hemorrhagic cystitis
voriconazole	angioedema
voriconazole	syncope
voriconazole	intestinal ulcer
voriconazole	hyperkalemia
voriconazole	microcytic
voriconazole	endocarditis
voriconazole	allergy
voriconazole	taste loss
voriconazole	jaundice
voriconazole	hypermagnesemia
voriconazole	decreased kidney function
voriconazole	rectal disorder
voriconazole	peritonitis
voriconazole	rectal hemorrhage
voriconazole	tubular necrosis
voriconazole	mydriasis
voriconazole	ear pain
voriconazole	osteomalacia
voriconazole	dysuria
voriconazole	nausea
voriconazole	flank pain
voriconazole	pain at the injection site
voriconazole	tolerance decreased
voriconazole	disseminated intravascular coagulation
voriconazole	palpitation
voriconazole	pulmonary embolism
voriconazole	infection at the injection site
voriconazole	hypercholesterolemia
voriconazole	chest pain
voriconazole	pancreatitis
voriconazole	amentia
voriconazole	arthritis
voriconazole	hyperuricemia
voriconazole	rash
voriconazole	neuropathy
voriconazole	pneumonia
voriconazole	colitis
voriconazole	diabetes
voriconazole	gum hemorrhage
voriconazole	scleritis
voriconazole	eye pain
voriconazole	hypercalcemia
voriconazole	cardiac arrest
voriconazole	respiratory system disorders
voriconazole	hypotension
voriconazole	liver disease
voriconazole	gastric disorder
voriconazole	otitis externa
voriconazole	pleural effusion
voriconazole	back pain
voriconazole	visual disturbances
voriconazole	effusion
voriconazole	uveitis
voriconazole	dry eyes
voriconazole	keratitis
voriconazole	anuria
voriconazole	dysmenorrhea
voriconazole	atrial arrhythmia
voriconazole	pancytopenia
voriconazole	optic atrophy
voriconazole	fever
voriconazole	lymphadenopathy
voriconazole	kidney function abnormal
voriconazole	discoid lupus
voriconazole	herpes
voriconazole	osteoporosis
voriconazole	dyspepsia
voriconazole	pharyngitis
voriconazole	bradycardia
voriconazole	flu
voriconazole	sinusitis
voriconazole	furunculosis
voriconazole	blepharitis
voriconazole	diabetes insipidus
voriconazole	extrapyramidal syndrome
voriconazole	dysgeusia
voriconazole	increased liver enzymes
voriconazole	gingivitis
voriconazole	pleural
voriconazole	antifungal therapy
voriconazole	creatinine increased
voriconazole	nystagmus
voriconazole	pelvic pain
voriconazole	oliguria
voriconazole	edema
voriconazole	dyspnea
voriconazole	amnesia
voriconazole	thrombocytopenic purpura
voriconazole	euphoric
voriconazole	vertigo
voriconazole	bleeding time increased
voriconazole	arrhythmia
voriconazole	substernal chest pain
voriconazole	toxic epidermal necrolysis
voriconazole	aspergillosis
voriconazole	insomnia
voriconazole	urinary incontinence
voriconazole	hydronephrosis
voriconazole	graft versus host reaction
voriconazole	supraventricular extrasystoles
voriconazole	thrombocytopenia
voriconazole	esophageal
voriconazole	uremia
voriconazole	paresthesia
voriconazole	corneal opacity
voriconazole	hepatitis
voriconazole	ischemia
voriconazole	itching
voriconazole	tubular
voriconazole	retinopathy
voriconazole	extrasystoles
voriconazole	hyperplasia
voriconazole	fibrillation
voriconazole	blurred vision
voriconazole	malignant neoplasm
voriconazole	urticaria
voriconazole	hyperthyroidism
voriconazole	hypoglycemia
voriconazole	chromatopsia
voriconazole	atrial fibrillation
voriconazole	peripheral edema
voriconazole	creatinine clearance decreased
voriconazole	abdomen enlarged
voriconazole	oculogyric crisis
voriconazole	agitation
voriconazole	cramping
voriconazole	phlebitis
voriconazole	optic neuritis
voriconazole	third degree heart block
voriconazole	delirium
voriconazole	bleeding
voriconazole	urinary tract infection
voriconazole	increased sgpt
voriconazole	photophobia
voriconazole	hepatic coma
voriconazole	glucose tolerance decreased
voriconazole	dermatitis
voriconazole	epidermal necrolysis
voriconazole	megaloblastic
voriconazole	conjunctivitis
voriconazole	hyperglycemia
voriconazole	increased eosinophils
voriconazole	dry skin
voriconazole	nodal arrhythmia
voriconazole	asthenia
voriconazole	ataxia
voriconazole	psychosis
voriconazole	drug eruption
voriconazole	color blindness
voriconazole	voice alteration
voriconazole	neuralgia
voriconazole	albuminuria
voriconazole	nephrosis
voriconazole	proctitis
voriconazole	splenomegaly
voriconazole	lymphangitis
voriconazole	diplopia
voriconazole	infection bacterial
voriconazole	inflammation
voriconazole	retinitis
voriconazole	abdominal pain
voriconazole	cerebral hemorrhage
voriconazole	pulmonary edema
voriconazole	renal failure
voriconazole	incontinence
voriconazole	duodenal ulcer
voriconazole	leukopenia
voriconazole	distress
voriconazole	increased sgot
voriconazole	cardiomegaly
voriconazole	night blindness
voriconazole	eczema
voriconazole	hypoxia
voriconazole	facial edema
voriconazole	hypocalcemia
voriconazole	anorexia
voriconazole	cystitis
voriconazole	fixed drug eruption
voriconazole	skin disorder
voriconazole	supraventricular tachycardia
voriconazole	acute renal failure
voriconazole	purpura
voriconazole	hepatomegaly
voriconazole	hepatic dysfunction
voriconazole	confusion
voriconazole	hypomagnesemia
voriconazole	psoriasis
voriconazole	hematuria
voriconazole	prolonged qt
voriconazole	anemia
voriconazole	headache
voriconazole	systemic lupus erythematosus
voriconazole	diarrhea
voriconazole	keratoconjunctivitis
voriconazole	hypernatremia
voriconazole	depersonalization
voriconazole	respiratory distress syndrome
voriconazole	infarction
voriconazole	cardiomyopathy
voriconazole	vaginal hemorrhage
voriconazole	hemoptysis
voriconazole	cholecystitis
voriconazole	pseudomembranous colitis
voriconazole	duodenitis
voriconazole	flatulence
voriconazole	pain
voriconazole	contact dermatitis
voriconazole	hypophosphatemia
voriconazole	ventricular arrhythmia
voriconazole	stomach ulcer
voriconazole	uterine hemorrhage
voriconazole	increased alkaline phosphatase
voriconazole	scrotal edema
voriconazole	rhinitis
voriconazole	leg cramps
voriconazole	organ failure
voriconazole	neuritis
voriconazole	osteonecrosis
voriconazole	brain edema
voriconazole	anaphylactoid reactions
voriconazole	cellulitis
voriconazole	abnormal vision
voriconazole	embolus
voriconazole	aplastic anemia
voriconazole	adrenal cortex insufficiency
voriconazole	myasthenia
voriconazole	alopecia
voriconazole	postural hypotension
voriconazole	esophageal ulceration
voriconazole	infection
voriconazole	liver function tests abnormal
voriconazole	respiratory distress
voriconazole	blighted ovum
voriconazole	enlargement
voriconazole	eruptions
voriconazole	thrombophlebitis
voriconazole	anxiety
voriconazole	vomiting
voriconazole	otitis
voriconazole	constipation
voriconazole	necrosis
voriconazole	mucous membrane
voriconazole	chills
voriconazole	parotid gland enlargement
voriconazole	ecchymosis
voriconazole	maculopapular rash
voriconazole	ascites
voriconazole	hematological malignancy
voriconazole	candidemia
voriconazole	vasodilatation
voriconazole	gastroenteritis
voriconazole	infection fungal
voriconazole	intracranial hypertension
voriconazole	deep thrombophlebitis
voriconazole	epididymitis
voriconazole	hearing loss
voriconazole	cholelithiasis
voriconazole	increased bun
voriconazole	nephritis
voriconazole	stomatitis
voriconazole	myalgia
voriconazole	cheilitis
voriconazole	ventricular tachycardia
voriconazole	papilledema
voriconazole	melena
voriconazole	dysphagia
voriconazole	dizziness
voriconazole	hypertension
voriconazole	convulsion
voriconazole	intestinal perforation
voriconazole	hypokalemia
voriconazole	hallucination
voriconazole	dry mouth
voriconazole	bone pain
voriconazole	hemolytic anemia
voriconazole	periodontitis
voriconazole	cholestatic jaundice
voriconazole	bundle branch block
voriconazole	esophageal candidiasis
voriconazole	abnormal dreams
voriconazole	agranulocytosis
voriconazole	petechia
voriconazole	arthralgia
voriconazole	impotence
voriconazole	color vision change
voriconazole	moniliasis
voriconazole	esophagitis
voriconazole	fluid overload
voriconazole	coma
voriconazole	suicidal ideation
voriconazole	multisystem organ failure
voriconazole	sepsis
voriconazole	ventricular fibrillation
voriconazole	photosensitivity reaction
voriconazole	melanosis
voriconazole	thrombotic thrombocytopenic purpura
voriconazole	photosensitivity
voriconazole	urinary retention
voriconazole	tongue edema
voriconazole	deafness
voriconazole	libido decreased
voriconazole	lupus
voriconazole	duodenal ulcer perforation
voriconazole	gastrointestinal bleeding
itraconazole	sputum increased
itraconazole	neutropenia
itraconazole	ulceration
itraconazole	pulmonary infiltrates
itraconazole	sweating
itraconazole	somnolence
itraconazole	urinary tract infection
itraconazole	cough
itraconazole	increased sgpt
itraconazole	breast pain
itraconazole	congenital anomalies
itraconazole	cystic fibrosis
itraconazole	hyperglycemia
itraconazole	congestive heart failure
itraconazole	asthenia
itraconazole	adrenal insufficiency
itraconazole	tachycardia
itraconazole	heart failure
itraconazole	fibrosis
itraconazole	albuminuria
itraconazole	death
itraconazole	respiratory infection
itraconazole	urea increased
itraconazole	erythematous rash
itraconazole	abdominal pain
itraconazole	bilirubinemia
itraconazole	empiric therapy
itraconazole	pulmonary edema
itraconazole	tinnitus
itraconazole	cardiovascular disorders
itraconazole	upper respiratory tract infection
itraconazole	increased sweating
itraconazole	increased sgot
itraconazole	liver failure
itraconazole	menstrual disorder
itraconazole	tremor
itraconazole	male breast pain
itraconazole	hypocalcemia
itraconazole	psychiatric disorders
itraconazole	angioedema
itraconazole	anorexia
itraconazole	cystitis
itraconazole	skin disorder
itraconazole	allergy
itraconazole	jaundice
itraconazole	hepatic dysfunction
itraconazole	hypomagnesemia
itraconazole	hematuria
itraconazole	increased appetite
itraconazole	bursitis
itraconazole	headache
itraconazole	diarrhea
itraconazole	nausea
itraconazole	flatulence
itraconazole	pneumocystis carinii infection
itraconazole	pain
itraconazole	hypophosphatemia
itraconazole	cyst
itraconazole	hiv positive
itraconazole	chest pain
itraconazole	increased alkaline phosphatase
itraconazole	rash
itraconazole	neuropathy
itraconazole	dehydration
itraconazole	rhinitis
itraconazole	pneumonia
itraconazole	peripheral neuropathy
itraconazole	gynecomastia
itraconazole	oropharyngeal candidiasis
itraconazole	respiratory system disorders
itraconazole	abnormal vision
itraconazole	hypotension
itraconazole	liver disease
itraconazole	increased serum creatinine
itraconazole	back pain
itraconazole	rigors
itraconazole	alopecia
itraconazole	postural hypotension
itraconazole	increased ldh
itraconazole	infection
itraconazole	fever
itraconazole	fatigue
itraconazole	kidney function abnormal
itraconazole	vomiting
itraconazole	anxiety
itraconazole	constipation
itraconazole	herpes
itraconazole	dyspepsia
itraconazole	malaise
itraconazole	pharyngitis
itraconazole	weight decreased
itraconazole	application site reaction
itraconazole	sinusitis
itraconazole	male breast
itraconazole	implantation complication
itraconazole	gastroenteritis
itraconazole	gastritis
itraconazole	dysgeusia
itraconazole	infection fungal
itraconazole	increased liver enzymes
itraconazole	gingivitis
itraconazole	flushing
itraconazole	elevated triglycerides
itraconazole	herpes zoster
itraconazole	increased bun
itraconazole	anaphylactic reaction
itraconazole	creatinine increased
itraconazole	stomatitis
itraconazole	myalgia
itraconazole	hot flushes
itraconazole	vasculitis
itraconazole	edema
itraconazole	dyspnea
itraconazole	vertigo
itraconazole	dysphagia
itraconazole	dizziness
itraconazole	hypertension
itraconazole	ulcerative stomatitis
itraconazole	insomnia
itraconazole	renal and urinary disorders
itraconazole	hypokalemia
itraconazole	esophageal candidiasis
itraconazole	impotence
itraconazole	esophageal
itraconazole	nervous system disorders
itraconazole	moniliasis
itraconazole	fluid overload
itraconazole	hepatitis
itraconazole	itching
itraconazole	drug interaction
itraconazole	pneumocystis
itraconazole	urticaria
itraconazole	onychomycosis
itraconazole	photosensitivity
itraconazole	vein disorder
itraconazole	libido decreased
itraconazole	peripheral edema
itraconazole	hemorrhoids
itraconazole	gastrointestinal disorders
atazanavir	ulceration
atazanavir	agitation
atazanavir	heat intolerance
atazanavir	hepatitis b
atazanavir	atrophy
atazanavir	sweating
atazanavir	somnolence
atazanavir	cough
atazanavir	urinary tract infection
atazanavir	dry skin
atazanavir	asthenia
atazanavir	psychosis
atazanavir	buffalo hump
atazanavir	pallor
atazanavir	cough increased
atazanavir	lipodystrophy
atazanavir	aphthous stomatitis
atazanavir	renal pain
atazanavir	hepatitis c
atazanavir	obesity
atazanavir	amenorrhea
atazanavir	hiccups
atazanavir	abdominal pain
atazanavir	urinary frequency
atazanavir	muscular disorder
atazanavir	lactic acidosis
atazanavir	heart block
atazanavir	seborrhea
atazanavir	tinnitus
atazanavir	renal failure
atazanavir	hypesthesia
atazanavir	muscle twitching
atazanavir	mouth ulcer
atazanavir	menstrual disorder
atazanavir	eczema
atazanavir	acholia
atazanavir	hypoxia
atazanavir	anorexia
atazanavir	angioedema
atazanavir	nervousness
atazanavir	syncope
atazanavir	allergy
atazanavir	purpura
atazanavir	hepatomegaly
atazanavir	jaundice
atazanavir	confusion
atazanavir	hyperreflexia
atazanavir	neurologic symptoms
atazanavir	hematuria
atazanavir	increased appetite
atazanavir	headache
atazanavir	diarrhea
atazanavir	nausea
atazanavir	fertility
atazanavir	palpitation
atazanavir	flatulence
atazanavir	pain
atazanavir	generalized edema
atazanavir	abnormal urine
atazanavir	hyperkinesia
atazanavir	kidney calculus
atazanavir	acidosis
atazanavir	gout
atazanavir	chest pain
atazanavir	pancreatitis
atazanavir	liver fatty deposit
atazanavir	rash
atazanavir	dehydration
atazanavir	colitis
atazanavir	diabetes
atazanavir	polyuria
atazanavir	crystalluria
atazanavir	hostility
atazanavir	gynecomastia
atazanavir	cardiac arrest
atazanavir	cellulitis
atazanavir	abnormal gait
atazanavir	back pain
atazanavir	myasthenia
atazanavir	suicide
atazanavir	alopecia
atazanavir	burning sensation
atazanavir	dysplasia
atazanavir	lipohypertrophy
atazanavir	esophageal ulceration
atazanavir	infection
atazanavir	fever
atazanavir	fatigue
atazanavir	liver fatty
atazanavir	anxiety
atazanavir	vomiting
atazanavir	otitis
atazanavir	constipation
atazanavir	myocarditis
atazanavir	dyspepsia
atazanavir	ecchymosis
atazanavir	malaise
atazanavir	weight decreased
atazanavir	proteinuria
atazanavir	vasodilatation
atazanavir	gastroenteritis
atazanavir	gastritis
atazanavir	dysgeusia
atazanavir	vesiculobullous rash
atazanavir	stomatitis
atazanavir	myalgia
atazanavir	decreased male fertility
atazanavir	emotional lability
atazanavir	pelvic pain
atazanavir	dermatophytosis
atazanavir	oliguria
atazanavir	edema
atazanavir	dyspnea
atazanavir	amnesia
atazanavir	substernal chest pain
atazanavir	dizziness
atazanavir	hypertension
atazanavir	insomnia
atazanavir	hepatocellular damage
atazanavir	peptic ulcer
atazanavir	convulsion
atazanavir	suicide attempt
atazanavir	sleep disorder
atazanavir	hepatosplenomegaly
atazanavir	hallucination
atazanavir	bone pain
atazanavir	weight gain
atazanavir	arthralgia
atazanavir	esophageal
atazanavir	impotence
atazanavir	muscle atrophy
atazanavir	esophagitis
atazanavir	hepatitis
atazanavir	dyslipidemia
atazanavir	itching
atazanavir	pain in limb
atazanavir	urticaria
atazanavir	photosensitivity
atazanavir	libido decreased
atazanavir	peripheral edema
atazanavir	abdomen enlarged
atazanavir	gastrointestinal disorders
ritonavir	molluscum contagiosum
ritonavir	abnormal electroretinogram
ritonavir	hemophilia
ritonavir	encephalopathy
ritonavir	ulceration
ritonavir	sweating
ritonavir	somnolence
ritonavir	cough
ritonavir	cerebral ischemia
ritonavir	cholangitis
ritonavir	breast pain
ritonavir	hypothyroidism
ritonavir	stevens johnson syndrome
ritonavir	leukemia
ritonavir	parosmia
ritonavir	cough increased
ritonavir	tachycardia
ritonavir	skin discoloration
ritonavir	fasting
ritonavir	manic reaction
ritonavir	renal pain
ritonavir	lung disorder
ritonavir	hypertonia
ritonavir	obesity
ritonavir	visual field defect
ritonavir	amenorrhea
ritonavir	erythema
ritonavir	epistaxis
ritonavir	urinary frequency
ritonavir	lactic acidosis
ritonavir	benign neoplasm
ritonavir	tinnitus
ritonavir	exfoliative dermatitis
ritonavir	breast enlargement
ritonavir	grand mal
ritonavir	hypesthesia
ritonavir	myeloproliferative disorder
ritonavir	glycosuria
ritonavir	myocardial infarction
ritonavir	mouth ulcer
ritonavir	erythema multiforme
ritonavir	tremor
ritonavir	penis
ritonavir	xanthomatosis
ritonavir	syncope
ritonavir	hyperamylasemia
ritonavir	allergy
ritonavir	taste loss
ritonavir	jaundice
ritonavir	hormone level altered
ritonavir	rectal disorder
ritonavir	paralysis
ritonavir	rectal hemorrhage
ritonavir	ear pain
ritonavir	lymphocytosis
ritonavir	dysuria
ritonavir	laryngeal edema
ritonavir	nausea
ritonavir	thirst
ritonavir	tolerance decreased
ritonavir	palpitation
ritonavir	viral infection
ritonavir	avitaminosis
ritonavir	kidney calculus
ritonavir	acidosis
ritonavir	hypercholesterolemia
ritonavir	chest pain
ritonavir	pancreatitis
ritonavir	amentia
ritonavir	ftc
ritonavir	vascular disorders
ritonavir	arthritis
ritonavir	varicose veins
ritonavir	liver fatty deposit
ritonavir	rash
ritonavir	neuropathy
ritonavir	hemorrhagic colitis
ritonavir	pneumonia
ritonavir	colitis
ritonavir	diabetes
ritonavir	polyuria
ritonavir	eye pain
ritonavir	peripheral neuropathy
ritonavir	acne
ritonavir	hypotension
ritonavir	thrombosis
ritonavir	aversion
ritonavir	interstitial pneumonitis
ritonavir	back pain
ritonavir	incoordination
ritonavir	adrenal suppression
ritonavir	neck pain
ritonavir	uveitis
ritonavir	urethritis
ritonavir	hypogonadism male
ritonavir	renal insufficiency
ritonavir	fever
ritonavir	lymphadenopathy
ritonavir	kidney function abnormal
ritonavir	dyspepsia
ritonavir	pharyngitis
ritonavir	bradycardia
ritonavir	flu
ritonavir	weight decreased
ritonavir	sinusitis
ritonavir	furunculosis
ritonavir	blepharitis
ritonavir	gastritis
ritonavir	extrapyramidal syndrome
ritonavir	dysgeusia
ritonavir	gingivitis
ritonavir	tumors
ritonavir	skin hypertrophy
ritonavir	thinking abnormal
ritonavir	pelvic pain
ritonavir	enteritis
ritonavir	enzymatic abnormality
ritonavir	edema
ritonavir	dyspnea
ritonavir	nocturia
ritonavir	amnesia
ritonavir	euphoric
ritonavir	vertigo
ritonavir	skin benign neoplasm
ritonavir	substernal chest pain
ritonavir	cerebral venous thrombosis
ritonavir	myositis
ritonavir	enterocolitis
ritonavir	insomnia
ritonavir	hepatocellular damage
ritonavir	thrombocytopenia
ritonavir	weight gain
ritonavir	gastrointestinal symptoms
ritonavir	esophageal
ritonavir	ileus
ritonavir	paresthesia
ritonavir	rigidity
ritonavir	hepatitis
ritonavir	ischemia
ritonavir	itching
ritonavir	drug interaction
ritonavir	blurred vision
ritonavir	fibrillation
ritonavir	hypoventilation
ritonavir	urticaria
ritonavir	onychomycosis
ritonavir	peripheral edema
ritonavir	atrial fibrillation
ritonavir	abdomen enlarged
ritonavir	neutropenia
ritonavir	agitation
ritonavir	cramping
ritonavir	phlebitis
ritonavir	fecal incontinence
ritonavir	bleeding
ritonavir	urinary tract infection
ritonavir	mania
ritonavir	photophobia
ritonavir	hepatic coma
ritonavir	glucose tolerance decreased
ritonavir	dermatitis
ritonavir	conjunctivitis
ritonavir	venous thrombosis
ritonavir	dry skin
ritonavir	extraocular palsy
ritonavir	asthenia
ritonavir	ataxia
ritonavir	folliculitis
ritonavir	neuralgia
ritonavir	albuminuria
ritonavir	hypogonadism
ritonavir	weakness
ritonavir	diplopia
ritonavir	infection bacterial
ritonavir	fat redistribution
ritonavir	asthma
ritonavir	peripheral sensory neuropathy
ritonavir	hiccups
ritonavir	vitreous disorders
ritonavir	vasospasm
ritonavir	abdominal pain
ritonavir	seborrhea
ritonavir	menorrhagia
ritonavir	pulmonary edema
ritonavir	renal failure
ritonavir	apathy
ritonavir	amblyopia
ritonavir	cardiovascular disorders
ritonavir	incontinence
ritonavir	nail disorder
ritonavir	muscle twitching
ritonavir	leukopenia
ritonavir	facial paralysis
ritonavir	myeloblastic leukemia
ritonavir	drug level increased
ritonavir	increased sgot
ritonavir	personality disorder
ritonavir	eczema
ritonavir	facial edema
ritonavir	otitis media
ritonavir	anorexia
ritonavir	cystitis
ritonavir	nervousness
ritonavir	skin disorder
ritonavir	acute renal failure
ritonavir	hepatomegaly
ritonavir	fungal dermatitis
ritonavir	confusion
ritonavir	psoriasis
ritonavir	hematuria
ritonavir	aphasia
ritonavir	alcohol intolerance
ritonavir	increased appetite
ritonavir	anemia
ritonavir	headache
ritonavir	diarrhea
ritonavir	depersonalization
ritonavir	infarction
ritonavir	pseudomembranous colitis
ritonavir	cholecystitis
ritonavir	speech disorder
ritonavir	flatulence
ritonavir	pain
ritonavir	contact dermatitis
ritonavir	hyperkinesia
ritonavir	abnormal urine
ritonavir	cyst
ritonavir	hyperesthesia
ritonavir	melanoma
ritonavir	deep venous thrombosis
ritonavir	gout
ritonavir	bone disorders
ritonavir	vestibular disorder
ritonavir	dehydration
ritonavir	rhinitis
ritonavir	leg cramps
ritonavir	tenesmus
ritonavir	aml
ritonavir	neuritis
ritonavir	osteonecrosis
ritonavir	gynecomastia
ritonavir	abnormal vision
ritonavir	abnormal ejaculation
ritonavir	abnormal gait
ritonavir	adrenal cortex insufficiency
ritonavir	ulcerative colitis
ritonavir	myasthenia
ritonavir	iritis
ritonavir	peripheral vascular disorder
ritonavir	alopecia
ritonavir	postural hypotension
ritonavir	esophageal ulceration
ritonavir	infection
ritonavir	hematoma
ritonavir	enlargement
ritonavir	liver fatty
ritonavir	thrombophlebitis
ritonavir	anxiety
ritonavir	vomiting
ritonavir	otitis
ritonavir	constipation
ritonavir	necrosis
ritonavir	bronchitis
ritonavir	chills
ritonavir	bloody diarrhea
ritonavir	ecchymosis
ritonavir	eye disorders
ritonavir	malaise
ritonavir	maculopapular rash
ritonavir	swelling of the vein
ritonavir	abnormal movements
ritonavir	vasodilatation
ritonavir	gastroenteritis
ritonavir	cerebral infarct
ritonavir	skin melanoma
ritonavir	muscular weakness
ritonavir	deep thrombophlebitis
ritonavir	hearing loss
ritonavir	vesiculobullous rash
ritonavir	increased bun
ritonavir	eructation
ritonavir	hypothermia
ritonavir	vaginitis
ritonavir	nephritis
ritonavir	stomatitis
ritonavir	myalgia
ritonavir	cheilitis
ritonavir	emotional lability
ritonavir	vasculitis
ritonavir	melena
ritonavir	abnormal stools
ritonavir	dysphagia
ritonavir	dizziness
ritonavir	hypertension
ritonavir	arthropathy
ritonavir	ulcerative stomatitis
ritonavir	convulsion
ritonavir	pustular rash
ritonavir	tenderness
ritonavir	sleep disorder
ritonavir	hepatosplenomegaly
ritonavir	hallucination
ritonavir	dry mouth
ritonavir	bone pain
ritonavir	cachexia
ritonavir	periodontitis
ritonavir	cholestatic jaundice
ritonavir	sialadenitis
ritonavir	skin ulcer
ritonavir	abnormal dreams
ritonavir	arthralgia
ritonavir	impotence
ritonavir	migraine
ritonavir	esophagitis
ritonavir	seizures
ritonavir	coma
ritonavir	skin striae
ritonavir	stupor
ritonavir	facial pain
ritonavir	neck rigidity
ritonavir	photosensitivity reaction
ritonavir	photosensitivity
ritonavir	urinary retention
ritonavir	tongue edema
ritonavir	liver tenderness
ritonavir	libido decreased
ritonavir	gastrointestinal bleeding
ritonavir	gastrointestinal disorders
ritonavir	subdural hematoma
ibuprofen	cerebrovascular accident
ibuprofen	neutropenia
ibuprofen	ulceration
ibuprofen	hematemesis
ibuprofen	agitation
ibuprofen	cramping
ibuprofen	sweating
ibuprofen	slurred
ibuprofen	somnolence
ibuprofen	bleeding
ibuprofen	aseptic meningitis
ibuprofen	cough
ibuprofen	abdominal distress
ibuprofen	pulmonary congestion
ibuprofen	glossitis
ibuprofen	dermatitis
ibuprofen	epidermal necrolysis
ibuprofen	bloating
ibuprofen	conjunctivitis
ibuprofen	hyperglycemia
ibuprofen	increased eosinophils
ibuprofen	stevens johnson syndrome
ibuprofen	asthenia
ibuprofen	congestive heart failure
ibuprofen	periarteritis nodosa
ibuprofen	shallow breathing
ibuprofen	decreased creatinine
ibuprofen	cough increased
ibuprofen	tachycardia
ibuprofen	heart failure
ibuprofen	neuralgia
ibuprofen	hypertonia
ibuprofen	fullness of gi
ibuprofen	drowsiness
ibuprofen	visual field defect
ibuprofen	hoarseness
ibuprofen	bad taste
ibuprofen	erythema
ibuprofen	asthma
ibuprofen	hiccups
ibuprofen	abdominal pain
ibuprofen	urinary frequency
ibuprofen	abdominal cramping
ibuprofen	clenching teeth
ibuprofen	tinnitus
ibuprofen	exfoliative dermatitis
ibuprofen	renal failure
ibuprofen	amblyopia
ibuprofen	incontinence
ibuprofen	glycosuria
ibuprofen	duodenal ulcer
ibuprofen	myocardial infarction
ibuprofen	leukopenia
ibuprofen	distress
ibuprofen	mouth ulcer
ibuprofen	erythema multiforme
ibuprofen	liver failure
ibuprofen	tremor
ibuprofen	anorexia
ibuprofen	cystitis
ibuprofen	angioedema
ibuprofen	nervousness
ibuprofen	syncope
ibuprofen	acute renal failure
ibuprofen	allergy
ibuprofen	rheumatoid arthritis
ibuprofen	apnea
ibuprofen	purpura
ibuprofen	jaundice
ibuprofen	hepatic dysfunction
ibuprofen	confusion
ibuprofen	hematuria
ibuprofen	nausea and vomiting
ibuprofen	anemia
ibuprofen	rectal hemorrhage
ibuprofen	tubular necrosis
ibuprofen	headache
ibuprofen	diarrhea
ibuprofen	infarction
ibuprofen	dysuria
ibuprofen	nausea
ibuprofen	thirst
ibuprofen	palpitation
ibuprofen	flatulence
ibuprofen	pain
ibuprofen	pancreatitis
ibuprofen	arthritis
ibuprofen	rash
ibuprofen	rhinitis
ibuprofen	pneumonia
ibuprofen	polyuria
ibuprofen	epigastric pain
ibuprofen	respiratory depression
ibuprofen	anaphylactoid reactions
ibuprofen	abnormal vision
ibuprofen	aplastic anemia
ibuprofen	hypotension
ibuprofen	renal impairment
ibuprofen	meningitis
ibuprofen	dry eyes
ibuprofen	alopecia
ibuprofen	pancytopenia
ibuprofen	liver function tests abnormal
ibuprofen	infection
ibuprofen	fever
ibuprofen	lymphadenopathy
ibuprofen	eruptions
ibuprofen	kidney function abnormal
ibuprofen	vomiting
ibuprofen	anxiety
ibuprofen	constipation
ibuprofen	interstitial nephritis
ibuprofen	necrosis
ibuprofen	spasm
ibuprofen	hepatorenal syndrome
ibuprofen	bronchitis
ibuprofen	dyspepsia
ibuprofen	ecchymosis
ibuprofen	malaise
ibuprofen	pharyngitis
ibuprofen	flu
ibuprofen	weight decreased
ibuprofen	sinusitis
ibuprofen	proteinuria
ibuprofen	vasodilatation
ibuprofen	hepatic necrosis
ibuprofen	gastroenteritis
ibuprofen	gastritis
ibuprofen	increased liver enzymes
ibuprofen	hearing loss
ibuprofen	tumors
ibuprofen	eructation
ibuprofen	anaphylactic reaction
ibuprofen	nephritis
ibuprofen	myalgia
ibuprofen	stomatitis
ibuprofen	emotional lability
ibuprofen	oliguria
ibuprofen	fluid retention
ibuprofen	vasculitis
ibuprofen	heartburn
ibuprofen	edema
ibuprofen	dyspnea
ibuprofen	melena
ibuprofen	euphoric
ibuprofen	vertigo
ibuprofen	bleeding time increased
ibuprofen	dysphagia
ibuprofen	arrhythmia
ibuprofen	esophageal spasm
ibuprofen	dizziness
ibuprofen	toxic epidermal necrolysis
ibuprofen	hypertension
ibuprofen	insomnia
ibuprofen	epidermal necrosis
ibuprofen	convulsion
ibuprofen	urinary incontinence
ibuprofen	hallucination
ibuprofen	dry mouth
ibuprofen	hemolytic anemia
ibuprofen	thrombocytopenia
ibuprofen	abnormal dreams
ibuprofen	azotemia
ibuprofen	arthralgia
ibuprofen	esophageal
ibuprofen	impotence
ibuprofen	color vision change
ibuprofen	paresthesia
ibuprofen	esophagitis
ibuprofen	coma
ibuprofen	hepatitis
ibuprofen	renal papillary necrosis
ibuprofen	itching
ibuprofen	tubular
ibuprofen	sepsis
ibuprofen	glomerulitis
ibuprofen	blurred vision
ibuprofen	urticaria
ibuprofen	photosensitivity
ibuprofen	urinary retention
ibuprofen	libido decreased
ibuprofen	gastrointestinal bleeding
carbamazepine	chest pain
carbamazepine	depressive reaction
carbamazepine	rhinitis
carbamazepine	somnolence
carbamazepine	extrapyramidal symptoms
carbamazepine	urinary tract infection
carbamazepine	mania
carbamazepine	unsteadiness
carbamazepine	bipolar disorder
carbamazepine	amnesia
carbamazepine	nervousness
carbamazepine	back pain
carbamazepine	asthenia
carbamazepine	ataxia
carbamazepine	insomnia
carbamazepine	suicide attempt
carbamazepine	suicide
carbamazepine	bipolar i disorder
carbamazepine	manic reaction
carbamazepine	infection
carbamazepine	memory impairment
carbamazepine	anxiety
carbamazepine	suicidal ideation
carbamazepine	ear pain
carbamazepine	itching
carbamazepine	depersonalization
carbamazepine	bronchitis
carbamazepine	dyspepsia
carbamazepine	speech disorder
carbamazepine	pharyngitis
carbamazepine	forgetfulness
carbamazepine	peripheral edema
carbamazepine	sinusitis
carbamazepine	amblyopia
posaconazole	neutropenia
posaconazole	sweating
posaconazole	somnolence
posaconazole	hemolytic uremic syndrome
posaconazole	bleeding
posaconazole	cough
posaconazole	increased sgpt
posaconazole	torsades de pointes
posaconazole	drug level altered
posaconazole	transplant rejection
posaconazole	bacteremia
posaconazole	hyperglycemia
posaconazole	asthenia
posaconazole	adrenal insufficiency
posaconazole	herpes simplex
posaconazole	coagulation
posaconazole	tachycardia
posaconazole	neutropenic fever
posaconazole	respiratory infection
posaconazole	weakness
posaconazole	skeletal system disorders
posaconazole	coagulation disorder
posaconazole	abdominal pain
posaconazole	epistaxis
posaconazole	bilirubinemia
posaconazole	renal failure
posaconazole	cardiovascular disorders
posaconazole	neutropenia aggravated
posaconazole	upper respiratory tract infection
posaconazole	increased sweating
posaconazole	increased sgot
posaconazole	tremor
posaconazole	hypocalcemia
posaconazole	psychiatric disorders
posaconazole	anorexia
posaconazole	hiv disease
posaconazole	leg edema
posaconazole	acute renal failure
posaconazole	allergy
posaconazole	purpura
posaconazole	mucositis
posaconazole	hepatomegaly
posaconazole	jaundice
posaconazole	hepatic dysfunction
posaconazole	hypomagnesemia
posaconazole	cmv infection
posaconazole	anemia
posaconazole	musculoskeletal system disorders
posaconazole	headache
posaconazole	diarrhea
posaconazole	nausea
posaconazole	vaginal hemorrhage
posaconazole	palpitation
posaconazole	pulmonary embolism
posaconazole	flatulence
posaconazole	pain
posaconazole	increased alkaline phosphatase
posaconazole	rash
posaconazole	dehydration
posaconazole	pneumonia
posaconazole	oropharyngeal candidiasis
posaconazole	respiratory system disorders
posaconazole	embolus
posaconazole	hypotension
posaconazole	back pain
posaconazole	rigors
posaconazole	infection
posaconazole	liver function tests abnormal
posaconazole	fever
posaconazole	fatigue
posaconazole	anxiety
posaconazole	vomiting
posaconazole	infestations
posaconazole	constipation
posaconazole	qtc
posaconazole	herpes
posaconazole	dyspepsia
posaconazole	pharyngitis
posaconazole	flu
posaconazole	weight decreased
posaconazole	increased ggt
posaconazole	dysgeusia
posaconazole	increased liver enzymes
posaconazole	creatinine increased
posaconazole	myalgia
posaconazole	skin and subcutaneous tissue disorders
posaconazole	blood creatinine increased
posaconazole	edema
posaconazole	dyspnea
posaconazole	musculoskeletal pain
posaconazole	thrombocytopenic purpura
posaconazole	dizziness
posaconazole	hypertension
posaconazole	insomnia
posaconazole	hepatocellular damage
posaconazole	uremic syndrome
posaconazole	renal and urinary disorders
posaconazole	hypokalemia
posaconazole	bone pain
posaconazole	dry mouth
posaconazole	thrombocytopenia
posaconazole	petechia
posaconazole	arthralgia
posaconazole	nervous system disorders
posaconazole	moniliasis
posaconazole	hepatitis
posaconazole	itching
posaconazole	blurred vision
posaconazole	thrombotic thrombocytopenic purpura
pravastatin	chest pain
pravastatin	pancreatitis
pravastatin	arthritis
pravastatin	peripheral nerve palsy
pravastatin	rash
pravastatin	neuropathy
pravastatin	rhinitis
pravastatin	cough
pravastatin	peripheral neuropathy
pravastatin	gynecomastia
pravastatin	dermatomyositis
pravastatin	epidermal necrolysis
pravastatin	nerve paralysis
pravastatin	common cold
pravastatin	increased eosinophils
pravastatin	asthenia
pravastatin	elevated transaminases
pravastatin	chronic active hepatitis
pravastatin	alopecia
pravastatin	cataract
pravastatin	rhabdomyolysis
pravastatin	lens
pravastatin	facial paresis
pravastatin	fever
pravastatin	fatigue
pravastatin	liver fatty
pravastatin	anxiety
pravastatin	vomiting
pravastatin	memory loss
pravastatin	constipation
pravastatin	necrosis
pravastatin	hypersensitivity syndrome
pravastatin	chills
pravastatin	erythema
pravastatin	malaise
pravastatin	abdominal pain
pravastatin	muscular disorder
pravastatin	flu
pravastatin	hepatic necrosis
pravastatin	positive ana
pravastatin	dysgeusia
pravastatin	localized pain
pravastatin	flushing
pravastatin	leukopenia
pravastatin	anaphylactic reaction
pravastatin	myalgia
pravastatin	erythema multiforme
pravastatin	polymyalgia rheumatica
pravastatin	paresis
pravastatin	tremor
pravastatin	vasculitis
pravastatin	heartburn
pravastatin	dyspnea
pravastatin	anorexia
pravastatin	angioedema
pravastatin	vertigo
pravastatin	hepatoma
pravastatin	dizziness
pravastatin	toxic epidermal necrolysis
pravastatin	cirrhosis
pravastatin	insomnia
pravastatin	allergy
pravastatin	purpura
pravastatin	lens opacity
pravastatin	jaundice
pravastatin	hemolytic anemia
pravastatin	thrombocytopenia
pravastatin	nodule
pravastatin	cholestatic jaundice
pravastatin	loss of libido
pravastatin	arthralgia
pravastatin	impotence
pravastatin	anemia
pravastatin	paralysis
pravastatin	paresthesia
pravastatin	headache
pravastatin	diarrhea
pravastatin	hepatitis
pravastatin	itching
pravastatin	nausea
pravastatin	disease progression
pravastatin	flatulence
pravastatin	pain
pravastatin	urticaria
pravastatin	photosensitivity
pravastatin	ophthalmoplegia
pravastatin	lupus
pravastatin	skin changes
pravastatin	chest pain cardiac
pravastatin	geriatric
pravastatin	polymyalgia
azithromycin	neutropenia
azithromycin	elevated bilirubin
azithromycin	agitation
azithromycin	tongue discoloration
azithromycin	somnolence
azithromycin	cough
azithromycin	increased sgpt
azithromycin	torsades de pointes
azithromycin	aggressive
azithromycin	dermatitis
azithromycin	epidermal necrolysis
azithromycin	bronchospasm
azithromycin	increased eosinophils
azithromycin	stevens johnson syndrome
azithromycin	asthenia
azithromycin	parosmia
azithromycin	bacterial sinusitis
azithromycin	tachycardia
azithromycin	cough increased
azithromycin	death
azithromycin	lung disorder
azithromycin	inflammation
azithromycin	decreased platelet
azithromycin	erythema
azithromycin	asthma
azithromycin	abdominal pain
azithromycin	lymphocytopenia
azithromycin	tinnitus
azithromycin	renal failure
azithromycin	aggressive reaction
azithromycin	gonorrhea
azithromycin	leukopenia
azithromycin	copd
azithromycin	erythema multiforme
azithromycin	increased sgot
azithromycin	obstructive pulmonary disease
azithromycin	liver failure
azithromycin	otitis media
azithromycin	anorexia
azithromycin	angioedema
azithromycin	nervousness
azithromycin	syncope
azithromycin	acute renal failure
azithromycin	mucositis
azithromycin	pelvic inflammatory disease
azithromycin	jaundice
azithromycin	fungal dermatitis
azithromycin	hepatic dysfunction
azithromycin	headache
azithromycin	diarrhea
azithromycin	dysuria
azithromycin	nausea
azithromycin	pain at the injection site
azithromycin	gonococcal urethritis
azithromycin	palpitation
azithromycin	pseudomembranous colitis
azithromycin	flatulence
azithromycin	pain
azithromycin	hyperkinesia
azithromycin	chest pain
azithromycin	pancreatitis
azithromycin	increased alkaline phosphatase
azithromycin	rash
azithromycin	dehydration
azithromycin	rhinitis
azithromycin	pneumonia
azithromycin	colitis
azithromycin	hostility
azithromycin	abnormal vision
azithromycin	hypotension
azithromycin	elevated serum creatine phosphokinase
azithromycin	serum alkaline phosphatase increased
azithromycin	potassium decreased
azithromycin	urethritis
azithromycin	increased ldh
azithromycin	irritability
azithromycin	infection
azithromycin	fatigue
azithromycin	fever
azithromycin	cervicitis
azithromycin	anxiety
azithromycin	vomiting
azithromycin	otitis
azithromycin	constipation
azithromycin	interstitial nephritis
azithromycin	necrosis
azithromycin	bronchitis
azithromycin	chills
azithromycin	dyspepsia
azithromycin	malaise
azithromycin	maculopapular rash
azithromycin	pharyngitis
azithromycin	flu
azithromycin	sinusitis
azithromycin	application site reaction
azithromycin	hepatic necrosis
azithromycin	gastritis
azithromycin	dysgeusia
azithromycin	hearing loss
azithromycin	mac
azithromycin	anaphylactic reaction
azithromycin	vaginitis
azithromycin	nephritis
azithromycin	stomatitis
azithromycin	ventricular tachycardia
azithromycin	edema
azithromycin	dyspnea
azithromycin	abnormal stools
azithromycin	melena
azithromycin	vertigo
azithromycin	arrhythmia
azithromycin	pain at the injection
azithromycin	dizziness
azithromycin	toxic epidermal necrolysis
azithromycin	insomnia
azithromycin	convulsion
azithromycin	thrombocytopenia
azithromycin	oral moniliasis
azithromycin	cholestatic jaundice
azithromycin	arthralgia
azithromycin	moniliasis
azithromycin	tonsillitis
azithromycin	paresthesia
azithromycin	hepatitis
azithromycin	itching
azithromycin	drug interaction
azithromycin	urticaria
azithromycin	photosensitivity
azithromycin	deafness
azithromycin	acute otitis media
azithromycin	gastrointestinal disorders
nabumetone	ulceration
nabumetone	pseudoporphyria
nabumetone	agitation
nabumetone	sweating
nabumetone	somnolence
nabumetone	bleeding
nabumetone	cough
nabumetone	glossitis
nabumetone	nightmares
nabumetone	epidermal necrolysis
nabumetone	hyperglycemia
nabumetone	disorders taste
nabumetone	asthenia
nabumetone	albuminuria
nabumetone	erythema
nabumetone	asthma
nabumetone	abdominal pain
nabumetone	tinnitus
nabumetone	renal failure
nabumetone	duodenal ulcer
nabumetone	myocardial infarction
nabumetone	leukopenia
nabumetone	increased sweating
nabumetone	erythema multiforme
nabumetone	liver failure
nabumetone	tremor
nabumetone	anorexia
nabumetone	angioedema
nabumetone	nervousness
nabumetone	syncope
nabumetone	eosinophilic pneumonia
nabumetone	allergy
nabumetone	jaundice
nabumetone	hepatic dysfunction
nabumetone	confusion
nabumetone	hematuria
nabumetone	increased appetite
nabumetone	anemia
nabumetone	rectal hemorrhage
nabumetone	headache
nabumetone	diarrhea
nabumetone	vaginal bleeding
nabumetone	infarction
nabumetone	dysuria
nabumetone	nausea
nabumetone	palpitation
nabumetone	duodenitis
nabumetone	flatulence
nabumetone	pain
nabumetone	nephrotic syndrome
nabumetone	kidney calculus
nabumetone	stomach ulcer
nabumetone	pancreatitis
nabumetone	hyperuricemia
nabumetone	rash
nabumetone	pneumonia
nabumetone	angina
nabumetone	acne
nabumetone	anaphylactoid reactions
nabumetone	abnormal vision
nabumetone	fecal occult blood positive
nabumetone	interstitial pneumonitis
nabumetone	alopecia
nabumetone	fever
nabumetone	fatigue
nabumetone	eruptions
nabumetone	thrombophlebitis
nabumetone	anxiety
nabumetone	vomiting
nabumetone	constipation
nabumetone	interstitial nephritis
nabumetone	chills
nabumetone	dyspepsia
nabumetone	malaise
nabumetone	weight decreased
nabumetone	gastroenteritis
nabumetone	allergic alveolitis
nabumetone	gastritis
nabumetone	gingivitis
nabumetone	cholelithiasis
nabumetone	eructation
nabumetone	anaphylactic reaction
nabumetone	nephritis
nabumetone	stomatitis
nabumetone	vasculitis
nabumetone	edema
nabumetone	dyspnea
nabumetone	melena
nabumetone	vertigo
nabumetone	dysphagia
nabumetone	arrhythmia
nabumetone	dizziness
nabumetone	hypertension
nabumetone	toxic epidermal necrolysis
nabumetone	insomnia
nabumetone	hypokalemia
nabumetone	dry mouth
nabumetone	thrombocytopenia
nabumetone	weight gain
nabumetone	azotemia
nabumetone	agranulocytosis
nabumetone	impotence
nabumetone	paresthesia
nabumetone	itching
nabumetone	urticaria
nabumetone	photosensitivity
nabumetone	bullous eruptions
nabumetone	gastrointestinal bleeding
troglitazone	lab test abnormality
troglitazone	increased sgpt
troglitazone	edema
troglitazone	anorexia
troglitazone	hyperglycemia
troglitazone	syncope
troglitazone	congestive heart failure
troglitazone	idiosyncratic drug reaction
troglitazone	withdrawn
troglitazone	jaundice
troglitazone	heart failure
troglitazone	hepatic dysfunction
troglitazone	weight gain
troglitazone	liver function tests abnormal
troglitazone	fever
troglitazone	anemia
troglitazone	fatigue
troglitazone	vomiting
troglitazone	hepatitis
troglitazone	nausea
troglitazone	malaise
troglitazone	pain
troglitazone	abdominal pain
troglitazone	creatine phosphokinase increased
troglitazone	increased plasma volume
modafinil	ulceration
modafinil	agitation
modafinil	cramping
modafinil	sweating
modafinil	somnolence
modafinil	cough
modafinil	urinary tract infection
modafinil	mania
modafinil	narcolepsy
modafinil	conjunctivitis
modafinil	hyperglycemia
modafinil	common cold
modafinil	increased eosinophils
modafinil	dry skin
modafinil	asthenia
modafinil	psychosis
modafinil	ataxia
modafinil	herpes simplex
modafinil	cough increased
modafinil	tachycardia
modafinil	albuminuria
modafinil	hypertonia
modafinil	lung disorder
modafinil	drowsiness
modafinil	asthma
modafinil	abdominal pain
modafinil	epistaxis
modafinil	hypersomnia
modafinil	amblyopia
modafinil	pyuria
modafinil	mouth ulcer
modafinil	increased sgot
modafinil	tremor
modafinil	anorexia
modafinil	tooth disorder
modafinil	cystitis
modafinil	nervousness
modafinil	syncope
modafinil	skin disorder
modafinil	cataplexy
modafinil	allergy
modafinil	hepatic dysfunction
modafinil	confusion
modafinil	psoriasis
modafinil	hematuria
modafinil	increased appetite
modafinil	anemia
modafinil	headache
modafinil	diarrhea
modafinil	ear pain
modafinil	nausea
modafinil	thirst
modafinil	palpitation
modafinil	viral infection
modafinil	flatulence
modafinil	pain
modafinil	abnormal urine
modafinil	hyperkinesia
modafinil	abscess
modafinil	osahs
modafinil	chest pain
modafinil	arthritis
modafinil	rash
modafinil	rhinitis
modafinil	leg cramps
modafinil	pneumonia
modafinil	eye pain
modafinil	cardiac arrest
modafinil	abnormal vision
modafinil	abnormal ejaculation
modafinil	hypotension
modafinil	leukocytosis
modafinil	back pain
modafinil	neck pain
modafinil	dysmenorrhea
modafinil	abnormal ecg
modafinil	infection
modafinil	fever
modafinil	ear disorder
modafinil	anxiety
modafinil	vomiting
modafinil	constipation
modafinil	bronchitis
modafinil	chills
modafinil	herpes
modafinil	dyspepsia
modafinil	ecchymosis
modafinil	pharyngitis
modafinil	bradycardia
modafinil	flu
modafinil	periodontal abscess
modafinil	weight decreased
modafinil	sinusitis
modafinil	abnormal movements
modafinil	vasodilatation
modafinil	gastroenteritis
modafinil	dysgeusia
modafinil	increased liver enzymes
modafinil	gingivitis
modafinil	hypothermia
modafinil	myalgia
modafinil	emotional lability
modafinil	edema
modafinil	dyspnea
modafinil	amnesia
modafinil	vertigo
modafinil	arrhythmia
modafinil	dizziness
modafinil	hypertension
modafinil	wakefulness
modafinil	arthropathy
modafinil	insomnia
modafinil	sleep disorder
modafinil	dry mouth
modafinil	hallucination
modafinil	premature ventricular contraction
modafinil	weight gain
modafinil	agranulocytosis
modafinil	arthralgia
modafinil	migraine
modafinil	paresthesia
modafinil	rigidity
modafinil	itching
modafinil	neck rigidity
modafinil	extrasystoles
modafinil	urinary retention
modafinil	libido decreased
modafinil	peripheral edema
repaglinide	chest pain
repaglinide	pancreatitis
repaglinide	rhinitis
repaglinide	angina
repaglinide	diabetes
repaglinide	urinary tract infection
repaglinide	nph
repaglinide	anaphylactoid reactions
repaglinide	mod
repaglinide	congenital anomalies
repaglinide	myocardial ischemia
repaglinide	hyperglycemia
repaglinide	back pain
repaglinide	congestive heart failure
repaglinide	alopecia
repaglinide	heart failure
repaglinide	abnormal ecg
repaglinide	infection
repaglinide	vomiting
repaglinide	constipation
repaglinide	bronchitis
repaglinide	dyspepsia
repaglinide	sinusitis
repaglinide	increased liver enzymes
repaglinide	upper respiratory tract infection
repaglinide	myocardial infarction
repaglinide	leukopenia
repaglinide	gastrointestinal reactions
repaglinide	edema
repaglinide	tooth disorder
repaglinide	arrhythmia
repaglinide	hypertension
repaglinide	allergy
repaglinide	bending
repaglinide	lactation
repaglinide	jaundice
repaglinide	hemolytic anemia
repaglinide	hepatic dysfunction
repaglinide	thrombocytopenia
repaglinide	arthralgia
repaglinide	anemia
repaglinide	paresthesia
repaglinide	headache
repaglinide	diarrhea
repaglinide	ischemia
repaglinide	hepatitis
repaglinide	drug interaction
repaglinide	tubular
repaglinide	gestation
repaglinide	infarction
repaglinide	nausea
repaglinide	artery disorder
repaglinide	coronary artery disorder
repaglinide	palpitation
repaglinide	pain
repaglinide	hypoglycemia
repaglinide	peripheral edema
repaglinide	gestational diabetes
clarithromycin	cerebrovascular accident
clarithromycin	mycobacterial infections
clarithromycin	ulceration
clarithromycin	hematemesis
clarithromycin	fatal outcome
clarithromycin	tongue discoloration
clarithromycin	sweating
clarithromycin	somnolence
clarithromycin	cough
clarithromycin	torsades de pointes
clarithromycin	breast pain
clarithromycin	glossitis
clarithromycin	hypothyroidism
clarithromycin	tooth discoloration
clarithromycin	cholestatic hepatitis
clarithromycin	parosmia
clarithromycin	cough increased
clarithromycin	tachycardia
clarithromycin	synovitis
clarithromycin	renal pain
clarithromycin	hypertonia
clarithromycin	retinal degeneration
clarithromycin	esophageal stricture
clarithromycin	visual field defect
clarithromycin	breast tenderness
clarithromycin	goiter
clarithromycin	erythema
clarithromycin	epistaxis
clarithromycin	bilirubinemia
clarithromycin	urinary frequency
clarithromycin	decreased electrolytes
clarithromycin	stridor
clarithromycin	tinnitus
clarithromycin	exfoliative dermatitis
clarithromycin	breast enlargement
clarithromycin	wbc abnormal
clarithromycin	hypesthesia
clarithromycin	glycosuria
clarithromycin	myocardial infarction
clarithromycin	mouth ulcer
clarithromycin	erythema multiforme
clarithromycin	liver failure
clarithromycin	hyperlipemia
clarithromycin	menstrual disorder
clarithromycin	tremor
clarithromycin	penis
clarithromycin	syncope
clarithromycin	abnormal rbc
clarithromycin	allergy
clarithromycin	taste loss
clarithromycin	jaundice
clarithromycin	rectal disorder
clarithromycin	nausea and vomiting
clarithromycin	rectal hemorrhage
clarithromycin	hemiplegia
clarithromycin	dysuria
clarithromycin	nausea
clarithromycin	thirst
clarithromycin	palpitation
clarithromycin	kidney calculus
clarithromycin	chest pain
clarithromycin	pancreatitis
clarithromycin	arthritis
clarithromycin	rash
clarithromycin	discomfort
clarithromycin	pneumonia
clarithromycin	colitis
clarithromycin	angina
clarithromycin	diabetes
clarithromycin	gum hemorrhage
clarithromycin	polyuria
clarithromycin	skin carcinoma
clarithromycin	eye pain
clarithromycin	acne
clarithromycin	respiratory system disorders
clarithromycin	hypotension
clarithromycin	back pain
clarithromycin	neck pain
clarithromycin	dry eyes
clarithromycin	decreased wbc
clarithromycin	hemolysis
clarithromycin	increased ldh
clarithromycin	dysmenorrhea
clarithromycin	pancytopenia
clarithromycin	fever
clarithromycin	lymphadenopathy
clarithromycin	ear disorder
clarithromycin	pain in urethra
clarithromycin	interstitial nephritis
clarithromycin	dyspepsia
clarithromycin	pharyngitis
clarithromycin	bradycardia
clarithromycin	bezoar
clarithromycin	leukorrhea
clarithromycin	flu
clarithromycin	sinusitis
clarithromycin	pruritus ani
clarithromycin	gastritis
clarithromycin	dysgeusia
clarithromycin	increased liver enzymes
clarithromycin	pleural
clarithromycin	tumors
clarithromycin	anaphylactic reaction
clarithromycin	creatinine increased
clarithromycin	neurosis
clarithromycin	pelvic pain
clarithromycin	gastrin increased
clarithromycin	enteritis
clarithromycin	edema
clarithromycin	dyspnea
clarithromycin	musculoskeletal pain
clarithromycin	amnesia
clarithromycin	thrombocytopenic purpura
clarithromycin	vertigo
clarithromycin	illness
clarithromycin	arrhythmia
clarithromycin	toxic epidermal necrolysis
clarithromycin	myositis
clarithromycin	insomnia
clarithromycin	shock
clarithromycin	serum sickness
clarithromycin	increased salivation
clarithromycin	thrombocytopenia
clarithromycin	oral moniliasis
clarithromycin	weight gain
clarithromycin	esophageal
clarithromycin	polyps
clarithromycin	paresthesia
clarithromycin	rigidity
clarithromycin	hepatitis
clarithromycin	itching
clarithromycin	halitosis
clarithromycin	blurred vision
clarithromycin	urticaria
clarithromycin	hypoglycemia
clarithromycin	peripheral edema
clarithromycin	abdomen enlarged
clarithromycin	neutropenia
clarithromycin	agitation
clarithromycin	cramping
clarithromycin	bleeding
clarithromycin	mania
clarithromycin	urinary tract infection
clarithromycin	increased sgpt
clarithromycin	photophobia
clarithromycin	dermatitis
clarithromycin	nightmares
clarithromycin	epidermal necrolysis
clarithromycin	hyperglycemia
clarithromycin	conjunctivitis
clarithromycin	increased eosinophils
clarithromycin	dry skin
clarithromycin	asthenia
clarithromycin	psychosis
clarithromycin	abnormal platelets
clarithromycin	albuminuria
clarithromycin	carcinoma
clarithromycin	laryngeal neoplasia
clarithromycin	diplopia
clarithromycin	salivation
clarithromycin	inflammation
clarithromycin	asthma
clarithromycin	hiccups
clarithromycin	abdominal pain
clarithromycin	menorrhagia
clarithromycin	apathy
clarithromycin	vaginal candidiasis
clarithromycin	nail disorder
clarithromycin	antibiotic treatment
clarithromycin	leukopenia
clarithromycin	cardiospasm
clarithromycin	increased sgot
clarithromycin	otitis media
clarithromycin	anorexia
clarithromycin	nervousness
clarithromycin	skin disorder
clarithromycin	purpura
clarithromycin	hepatic dysfunction
clarithromycin	confusion
clarithromycin	tongue disorder
clarithromycin	hematuria
clarithromycin	prolonged qt
clarithromycin	increased appetite
clarithromycin	anemia
clarithromycin	headache
clarithromycin	disorientation
clarithromycin	diarrhea
clarithromycin	fundic gland polyps
clarithromycin	depersonalization
clarithromycin	hay fever
clarithromycin	infarction
clarithromycin	hemoptysis
clarithromycin	pseudomembranous colitis
clarithromycin	flatulence
clarithromycin	speech disorder
clarithromycin	pain
clarithromycin	contact dermatitis
clarithromycin	abnormal urine
clarithromycin	hyperkinesia
clarithromycin	gout
clarithromycin	bone disorders
clarithromycin	increased alkaline phosphatase
clarithromycin	fixed eruption
clarithromycin	dehydration
clarithromycin	rhinitis
clarithromycin	leg cramps
clarithromycin	tenesmus
clarithromycin	hostility
clarithromycin	gynecomastia
clarithromycin	anaphylactoid reactions
clarithromycin	aplastic anemia
clarithromycin	abnormal vision
clarithromycin	increased serum creatinine
clarithromycin	ulcerative colitis
clarithromycin	myasthenia
clarithromycin	alopecia
clarithromycin	urination impaired
clarithromycin	esophageal ulceration
clarithromycin	infection
clarithromycin	liver function tests abnormal
clarithromycin	enlargement
clarithromycin	eruptions
clarithromycin	anxiety
clarithromycin	vomiting
clarithromycin	prothrombin increased
clarithromycin	otitis
clarithromycin	constipation
clarithromycin	hair disorder
clarithromycin	testicular disorder
clarithromycin	bronchitis
clarithromycin	chills
clarithromycin	malaise
clarithromycin	maculopapular rash
clarithromycin	vasodilatation
clarithromycin	urinary urgency
clarithromycin	gastroenteritis
clarithromycin	cerebral infarct
clarithromycin	hearing loss
clarithromycin	cholelithiasis
clarithromycin	increased bun
clarithromycin	eructation
clarithromycin	vaginitis
clarithromycin	nephritis
clarithromycin	stomatitis
clarithromycin	myalgia
clarithromycin	ventricular tachycardia
clarithromycin	emotional lability
clarithromycin	gastrointestinal anomaly
clarithromycin	melena
clarithromycin	abnormal stools
clarithromycin	dysphagia
clarithromycin	dizziness
clarithromycin	hypertension
clarithromycin	arthropathy
clarithromycin	ulcerative stomatitis
clarithromycin	convulsion
clarithromycin	tenderness
clarithromycin	sleep disorder
clarithromycin	hallucination
clarithromycin	dry mouth
clarithromycin	hemolytic anemia
clarithromycin	nodule
clarithromycin	abnormal dreams
clarithromycin	agranulocytosis
clarithromycin	arthralgia
clarithromycin	impotence
clarithromycin	moniliasis
clarithromycin	migraine
clarithromycin	esophagitis
clarithromycin	neck rigidity
clarithromycin	thrombotic thrombocytopenic purpura
clarithromycin	discolored feces
clarithromycin	deafness
clarithromycin	urinary retention
clarithromycin	libido decreased
clarithromycin	gastrointestinal bleeding
clarithromycin	gastrointestinal disorders
ethotoin	chest pain
ethotoin	gum hypertrophy
ethotoin	rash
ethotoin	distress
ethotoin	nystagmus
ethotoin	remission
ethotoin	regression
ethotoin	dizziness
ethotoin	ataxia
ethotoin	insomnia
ethotoin	withdrawn
ethotoin	fever
ethotoin	fatigue
ethotoin	lymphadenopathy
ethotoin	enlargement
ethotoin	headache
ethotoin	systemic lupus erythematosus
ethotoin	diplopia
ethotoin	diarrhea
ethotoin	vomiting
ethotoin	nausea
ethotoin	withdrawal of treatment
ethotoin	lymphoma
ethotoin	pain
ethotoin	lupus
ethotoin	numbness
metoclopramide	neutropenia
metoclopramide	agitation
metoclopramide	rash
metoclopramide	feeling jittery
metoclopramide	gynecomastia
metoclopramide	motor restlessness
metoclopramide	hypotension
metoclopramide	eps
metoclopramide	bronchospasm
metoclopramide	autonomic dysfunction
metoclopramide	visual disturbances
metoclopramide	congestive heart failure
metoclopramide	malignant syndrome
metoclopramide	akathisia
metoclopramide	tachycardia
metoclopramide	heart failure
metoclopramide	grimacing
metoclopramide	opisthotonos
metoclopramide	hyperthermia
metoclopramide	tetanus
metoclopramide	fatigue
metoclopramide	drowsiness
metoclopramide	amenorrhea
metoclopramide	asthma
metoclopramide	galactorrhea
metoclopramide	bradycardia
metoclopramide	urinary frequency
metoclopramide	stridor
metoclopramide	dystonic reactions
metoclopramide	abnormal movements
metoclopramide	av block
metoclopramide	incontinence
metoclopramide	bradykinesia
metoclopramide	involuntary movement
metoclopramide	leukopenia
metoclopramide	porphyria
metoclopramide	tremor
metoclopramide	fluid retention
metoclopramide	edema
metoclopramide	dyspnea
metoclopramide	angioedema
metoclopramide	convulsive seizures
metoclopramide	dizziness
metoclopramide	hypertension
metoclopramide	torticollis
metoclopramide	insomnia
metoclopramide	supraventricular tachycardia
metoclopramide	trismus
metoclopramide	allergy
metoclopramide	sulfhemoglobinemia
metoclopramide	laryngospasm
metoclopramide	jaundice
metoclopramide	confusion
metoclopramide	cogwheel rigidity
metoclopramide	agranulocytosis
metoclopramide	impotence
metoclopramide	tardive dyskinesia
metoclopramide	headache
metoclopramide	rigidity
metoclopramide	diarrhea
metoclopramide	seizures
metoclopramide	suicidal ideation
metoclopramide	lassitude
metoclopramide	hyperprolactinemia
metoclopramide	laryngeal edema
metoclopramide	nausea
metoclopramide	neuroleptic malignant
metoclopramide	urticaria
metoclopramide	methemoglobinemia
metoclopramide	involuntary movements of extremities
metoclopramide	oculogyric crisis
\.


--
-- Data for Name: institution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institution (instname, address, country) FROM stdin;
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
-- Data for Name: interacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interacts (drug1, drug2) FROM stdin;
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
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (productname, company) FROM stdin;
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
-- Data for Name: relatedcondition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.relatedcondition (cttitle, conditionname) FROM stdin;
Early Use of Rosuvastatin in Acute Coronary Syndromes: Targeting Platelet-Leukocyte Interactions	Hydroxymethylglutaryl-CoA Reductase Inhibitors
Early Use of Rosuvastatin in Acute Coronary Syndromes: Targeting Platelet-Leukocyte Interactions	Angioplasty, Transluminal, Percutaneous Coronary
Early Use of Rosuvastatin in Acute Coronary Syndromes: Targeting Platelet-Leukocyte Interactions	Blood Platelets
Early Use of Rosuvastatin in Acute Coronary Syndromes: Targeting Platelet-Leukocyte Interactions	Acute Coronary Syndrome
Allogeneic Transplantation Using TL1 & ATG for Older Patients With Hematologic Malignancies	Leukemia
Allogeneic Transplantation Using TL1 & ATG for Older Patients With Hematologic Malignancies	Blood Cancer
Comparison of Cephalexin Versus Clindamycin for Suspected CA-MRSA Skin Infections	Staphylococcal Infection
Comparison of Cephalexin Versus Clindamycin for Suspected CA-MRSA Skin Infections	Abscess
Comparison of Cephalexin Versus Clindamycin for Suspected CA-MRSA Skin Infections	Staphylococcal Skin Infection
Comparison of Cephalexin Versus Clindamycin for Suspected CA-MRSA Skin Infections	Folliculitis
Trial of Early Aggressive Drug Therapy in Juvenile Idiopathic Arthritis	Juvenile Idiopathic Arthritis
Trial of Early Aggressive Drug Therapy in Juvenile Idiopathic Arthritis	Juvenile Chronic Polyarthritis
Trial of Early Aggressive Drug Therapy in Juvenile Idiopathic Arthritis	Juvenile Rheumatoid Arthritis
Prothrombin Times Outside the Therapeutic Range in Otherwise Stable Patients	Ischemic Stroke
Prothrombin Times Outside the Therapeutic Range in Otherwise Stable Patients	Atrial Fibrillation
Prothrombin Times Outside the Therapeutic Range in Otherwise Stable Patients	Venous Thromboembolism
Prothrombin Times Outside the Therapeutic Range in Otherwise Stable Patients	Myocardial Infarction
Modafinil Treatment for Sleep/Wake Disturbances in Older Adults	Insomnia
Modafinil Treatment for Sleep/Wake Disturbances in Older Adults	Alzheimer Disease
Modafinil Treatment for Sleep/Wake Disturbances in Older Adults	Sleep Initiation and Maintenance Disorders
Warfarin Versus Aspirin in Reduced Cardiac Ejection Fraction (WARCEF) Trial	Stroke
Warfarin Versus Aspirin in Reduced Cardiac Ejection Fraction (WARCEF) Trial	Heart Disease
Warfarin Versus Aspirin in Reduced Cardiac Ejection Fraction (WARCEF) Trial	Myocardial Infarction
Warfarin Versus Aspirin in Reduced Cardiac Ejection Fraction (WARCEF) Trial	Ischemic Heart Disease
Fluoxetine for Motor, Aphasia, and Neglect Recovery After Ischemic Stroke	Stroke
Prophylactic Phenobarbital After Neonatal Seizures	Neonatal Seizures
Low Doses Corticosteroids as Adjuvant Therapy for the Treatment of Severe H1N1 Flu	Pneumonia, Viral
Low Doses Corticosteroids as Adjuvant Therapy for the Treatment of Severe H1N1 Flu	Influenza in Humans
Atorvastatin for Preventing Occlusion and Restenosis After Intracranial Artery Stenting	CVD
Anesthetics in Rhytidoplasty - A Comparison Study	Rhytidoplasty
Treatment of Acute Lymphoblastic Leukemia in Children	Acute Lymphoblastic Leukemia
Pharmacokinetic, Safety and Efficacy of Intermittent Application of Caspofungin for Antifungal Prophylaxis	Fungal Infection
Comparing Smoking Treatment Programs for Lighter Smokers - 1	Tobacco Use Disorder
Treatment of Post Stroke Fatigue With a Wakefulness Promoting Agent	Stroke
Treatment of Post Stroke Fatigue With a Wakefulness Promoting Agent	Post Stroke Fatigue
Radical Lung Radiotherapy Plus Nelfinavir	Lung Cancer
Pharmacokinetic Interactions Between Antiretroviral Agents and Antimalarial Drug Combinations	HIV Infections
Pharmacokinetic Interactions Between Antiretroviral Agents and Antimalarial Drug Combinations	Malaria
Optima: Optimizing Prograf Therapy in Maintenance Allografts II	Kidney Transplantation
Effects of Statins on the Pharmacokinetics for Midazolam in Healthy Volunteers	Healthy Volunteers
Safety and Efficacy of Bosentan in Patients With Diastolic Heart Failure and Secondary Pulmonary Hypertension	Hypertension, Pulmonary
Safety and Efficacy of Bosentan in Patients With Diastolic Heart Failure and Secondary Pulmonary Hypertension	Heart Failure, Diastolic
MgSO4 vs Metoclopramide for Headache in Pregnant Women	Headache
Safety Study of Combined Azithromycin, Ivermectin and Albendazole for Trachoma and Lymphatic Filariasis	Trachoma
Safety Study of Combined Azithromycin, Ivermectin and Albendazole for Trachoma and Lymphatic Filariasis	Lymphatic Filariasis
Warfarine in Unexplained Oligohydramnios	Oligohydramnios
Randomized Clinical Trial to Assess the Efficacy and Safety of Concomitant Use of Rifampicin and Efavirenz 600 X 800mg	HIV Infections
Randomized Clinical Trial to Assess the Efficacy and Safety of Concomitant Use of Rifampicin and Efavirenz 600 X 800mg	Tuberculosis
Distribution of Bupropion and Varenicline to Increase Smoking Cessation Attempts	Smoking Cessation
Distribution of Bupropion and Varenicline to Increase Smoking Cessation Attempts	Smoking
Distribution of Bupropion and Varenicline to Increase Smoking Cessation Attempts	Tobacco Use Disorder
Comparison of Blood Pressure Medications on Metabolism	Diabetes
Comparison of Methotrexate vs Placebo in Corticosteroid-dependent Ulcerative Colitis	Ulcerative Colitis
Indomethacin Germinal Matrix Hemorrhage/Intraventricular Hemorrhage (GMH/IVH) Prevention Trial	Bleeding in the Brain
Indomethacin Germinal Matrix Hemorrhage/Intraventricular Hemorrhage (GMH/IVH) Prevention Trial	Prematurity
Indomethacin Germinal Matrix Hemorrhage/Intraventricular Hemorrhage (GMH/IVH) Prevention Trial	Intraventricular Hemorrhage (IVH)
Indomethacin Germinal Matrix Hemorrhage/Intraventricular Hemorrhage (GMH/IVH) Prevention Trial	Very Low Birth Weight Infants
Efficacy of Intravenous Dexketoprofen and Tenoxicam on Propofol Associated Injection Pain	Injection Pain
Evaluating the Transporter Protein Inhibitor Probenecid In Patients With Epilepsy	Epilepsy
Aizthromycin or Clarithromycin in H-pylori Eradication Regimen	Dyspepsia
Aizthromycin or Clarithromycin in H-pylori Eradication Regimen	H-pylori
Aizthromycin or Clarithromycin in H-pylori Eradication Regimen	Peptic Ulcer
Aspirin Attenuates Inflammation in Human Cerebral Aneurysms	The Focus of the Study is to Monitor MRI Signal Changes and Inflammatory Biomarkers With Use of Aspirin in Patients With Unruptured Cerebral Aneurysm
Single Center Pilot Study of Corticosteroid Discontinuation in Liver Transplant Recipients	Liver Transplant
Cryptococcal Optimal ART Timing Trial	HIV Infections
Cryptococcal Optimal ART Timing Trial	AIDS
Cryptococcal Optimal ART Timing Trial	Cryptococcal Meningitis
Organ Donation and Hydrocortisone Treatment	Brain Death
Prevention of Pegfilgrastim-Induced Bone Pain (PIBP)	Pain
Prevention of Pegfilgrastim-Induced Bone Pain (PIBP)	Unspecified Adult Solid Tumor, Protocol Specific
Prevention of Pegfilgrastim-Induced Bone Pain (PIBP)	Musculoskeletal Complications
Effect of Diabetes Mellitus on Cholesterol Metabolism	Type 1 Diabetes Mellitus
Effect of Diabetes Mellitus on Cholesterol Metabolism	Type 2 Diabetes Mellitus
Effect of Diabetes Mellitus on Cholesterol Metabolism	Hypercholesterolemia
Allogeneic Hematopoietic Stem Cell Transplantation for Relapsed or Refractory High-Risk NBL.	Neuroblastoma
Comparing the Efficacy of Tacrolimus and Mycophenolate Mofetil for the Initial Therapy of Active Lupus Nephritis	Lupus Nephritis
Asthma Clinical Research Network (ACRN) Trial - Macrolides in Asthma (MIA)	Asthma
Salsalate for Insulin Resistance in Schizophrenia	Insulin Resistance
Salsalate for Insulin Resistance in Schizophrenia	Schizophrenia
Prophylaxis to Reduce Postoperative Atrial Fibrillation in Cardiac Surgery	Atrial Flutter
Prophylaxis to Reduce Postoperative Atrial Fibrillation in Cardiac Surgery	Atrial Fibrillation
Rituximab and Combination Chemotherapy Followed by Bone Marrow or Peripheral Stem Cell Transplantation in Treating Patients With Relapsed or Refractory Non-Hodgkin's Lymphoma	Lymphoma
Stem Cell Transplantation in Patients With High-Risk and Recurrent Pediatric Sarcomas	Sarcoma
The Effect of Azithromycin in Patients With Chronic Obstructive Pulmonary Disease (COPD) and Chronic Productive Cough	Cough
The Effect of Azithromycin in Patients With Chronic Obstructive Pulmonary Disease (COPD) and Chronic Productive Cough	Chronic Obstructive Pulmonary Disease
The Effect of Azithromycin in Patients With Chronic Obstructive Pulmonary Disease (COPD) and Chronic Productive Cough	Chronic Bronchitis
Evaluation of SQ109, High-dose Rifampicin, and Moxifloxacin in Adults With Smear-positive Pulmonary TB in a MAMS Design	Tuberculosis, Pulmonary
Combination Chemotherapy Followed By Autologous Stem Cell Transplant, and White Blood Cell Infusions in Treating Patients With Non-Hodgkin's Lymphoma	Lymphoma
Vascular and Metabolic Effects of Vytorin vs Simvastatin	Hypercholesterolemia
Determine the Effects of Gene Differences and Voriconazole on Enzyme CYP2B6 Activity in the Liver in Healthy Volunteers	Efavirenz, Metabolism and Pharmacokinetics Changes
Monoclonal Antibody Therapy, Combination Chemotherapy, and Peripheral Stem Cell Transplant in Treating Patients With Relapsed or Refractory Non-Hodgkin's Lymphoma	Lymphoma
Craving, Binge Eating and Obesity	Binge Eating Disorder
Craving, Binge Eating and Obesity	Obesity
Ursodeoxycholic Acid in the Treatment of Intrahepatic Cholestasis of Pregnancy	Intrahepatic Cholestasis
Ursodeoxycholic Acid in the Treatment of Intrahepatic Cholestasis of Pregnancy	Pregnancy
Mild Versus Potent Corticosteroids as Treatment for Phimosis in Children	Phimosis
The Impact of Proton Pump Inhibitors on the Fecal Microbiome	Healthy
The Impact of Proton Pump Inhibitors on the Fecal Microbiome	Clostridium Difficile Infection
Effect of Ezetimibe or Simvastatin or Both on Low Densitiy Lipoprotein -Subfractions in Patients With Type 2 Diabetes	Diabetes Mellitus Type 2
Effect of Ezetimibe or Simvastatin or Both on Low Densitiy Lipoprotein -Subfractions in Patients With Type 2 Diabetes	Hypercholesterolemia
A Pilot Trial of Modafinil for Treatment of Methamphetamine Dependence	Methamphetamine Addiction
Combination Chemotherapy Based on Risk of Relapse in Treating Young Patients With Acute Lymphoblastic Leukemia	Leukemia
Effect of Daily Low Dose Aspirin on Exhaled Inflammatory Mediators in Normal Subjects	Healthy
Oxycodone Extended-release in the Treatment of Perioperative Pain in Patients Undergoing Orthopaedic Surgery	Surgery
Statins to Reduce D-dimer Levels in Patients With Venous Thrombosis	Venous Thromboembolism
Statins to Reduce D-dimer Levels in Patients With Venous Thrombosis	Hypercholesterolemia
Atorvastatin Treatment to Attenuate the Progression of Cardiovascular Disease in Hemodialysis Patients	Inflammation
Atorvastatin Treatment to Attenuate the Progression of Cardiovascular Disease in Hemodialysis Patients	Vascular Calcification
Atorvastatin Treatment to Attenuate the Progression of Cardiovascular Disease in Hemodialysis Patients	Atherosclerosis
Atorvastatin Treatment to Attenuate the Progression of Cardiovascular Disease in Hemodialysis Patients	Dyslipidemia
Caspofungin Maximum Tolerated Dose in Patients With Invasive Aspergillosis	Invasive Aspergillosis
Opioid Effects on Swallowing and Esophageal Sphincter Pressure	Opioid Induced Pharyngeal and Esophageal Dysfunction
Cisplatin, Etoposide, and Cyclophosphamide in Treating Patients With Extensive-Stage Small Cell Lung Cancer	Lung Cancer
Beneficial Effect of Salicylates: Insulin Action, Secretion or Clearance?	Pre Diabetes
Beneficial Effect of Salicylates: Insulin Action, Secretion or Clearance?	Insulin Resistant
Developing Adaptive Treatment Strategies for Children and Adolescents With Obsessive-compulsive Disorder.	Obsessive-Compulsive Disorder
Sirolimus, Tacrolimus, Thymoglobulin and Rituximab as Graft-versus-Host-Disease Prophylaxis in Patients Undergoing Haploidentical and HLA Partially Matched Donor Hematopoietic Cell Transplantation	Myelodysplastic/Myeloproliferative Neoplasms
Sirolimus, Tacrolimus, Thymoglobulin and Rituximab as Graft-versus-Host-Disease Prophylaxis in Patients Undergoing Haploidentical and HLA Partially Matched Donor Hematopoietic Cell Transplantation	Graft Versus Host Disease
Sirolimus, Tacrolimus, Thymoglobulin and Rituximab as Graft-versus-Host-Disease Prophylaxis in Patients Undergoing Haploidentical and HLA Partially Matched Donor Hematopoietic Cell Transplantation	Multiple Myeloma and Plasma Cell Neoplasm
Sirolimus, Tacrolimus, Thymoglobulin and Rituximab as Graft-versus-Host-Disease Prophylaxis in Patients Undergoing Haploidentical and HLA Partially Matched Donor Hematopoietic Cell Transplantation	Lymphoma
Sirolimus, Tacrolimus, Thymoglobulin and Rituximab as Graft-versus-Host-Disease Prophylaxis in Patients Undergoing Haploidentical and HLA Partially Matched Donor Hematopoietic Cell Transplantation	Lymphoproliferative Disorder
Sirolimus, Tacrolimus, Thymoglobulin and Rituximab as Graft-versus-Host-Disease Prophylaxis in Patients Undergoing Haploidentical and HLA Partially Matched Donor Hematopoietic Cell Transplantation	Myelodysplastic Syndromes
Sirolimus, Tacrolimus, Thymoglobulin and Rituximab as Graft-versus-Host-Disease Prophylaxis in Patients Undergoing Haploidentical and HLA Partially Matched Donor Hematopoietic Cell Transplantation	Chronic Myeloproliferative Disorders
Sirolimus, Tacrolimus, Thymoglobulin and Rituximab as Graft-versus-Host-Disease Prophylaxis in Patients Undergoing Haploidentical and HLA Partially Matched Donor Hematopoietic Cell Transplantation	Leukemia
A Randomized Controlled Trial of Oral Naproxen and Transdermal Estradiol for Bleeding in LNG-IUC	Contraception
A Randomized Controlled Trial of Oral Naproxen and Transdermal Estradiol for Bleeding in LNG-IUC	Bleeding
Allogeneic Stem Cell Transplant After ATG, High-Dose Melphalan, and Fludarabine for Patients With Metastatic Breast Cancer	Breast Cancer
Maraviroc Plus Darunavir/Ritonavir for Treatment-Naïve Patients Infected With R5-tropic HIV-1	HIV Infections
Maraviroc Plus Darunavir/Ritonavir for Treatment-Naïve Patients Infected With R5-tropic HIV-1	HIV-1 Infection
Omeprazole and Reflux Disease - Improvement of Clinical Outcome by Genotype-adjusted Dosing	Gastroesophageal Reflux
Bortezomib, Melphalan, and Dexamethasone in Treating Patients With Primary Amyloidosis or Light Chain Deposition Disease	Primary Systemic Amyloidosis
Bortezomib, Melphalan, and Dexamethasone in Treating Patients With Primary Amyloidosis or Light Chain Deposition Disease	Light Chain Deposition Disease
Sirolimus to Treat Cowden Syndrome and Other PTEN Hamartomatous Tumor Syndromes	Cowden's Disease
Sirolimus to Treat Cowden Syndrome and Other PTEN Hamartomatous Tumor Syndromes	Hamartoma Syndrome, Multiple
Treatment of HDL to Reduce the Incidence of Vascular Events HPS2-THRIVE	Diabetes Mellitus
Treatment of HDL to Reduce the Incidence of Vascular Events HPS2-THRIVE	Coronary Heart Disease
Treatment of HDL to Reduce the Incidence of Vascular Events HPS2-THRIVE	Peripheral Arterial Disease
Treatment of HDL to Reduce the Incidence of Vascular Events HPS2-THRIVE	Cardiovascular Disease
Efficacy Study of Prophylactic Ibuprofen Versus Placebo on Pain Relief and Success Rates of Medical Abortion	Pain
Efficacy Study of Prophylactic Ibuprofen Versus Placebo on Pain Relief and Success Rates of Medical Abortion	Pregnancy
Gastric pH and Anthocyanin Absorption	Anthocyanin Metabolism
Study Evaluating Conversion From Tacrolimus to Sirolimus in Stable Kidney Transplant Recipients Receiving Myfortic	Renal Transplantation
Pilot Study for HLA Identical Living Donor Renal Transplant Recipients	Renal Transplant
The Discriminative Effects of Tramadol in Humans	Stimulant Abuse
The Discriminative Effects of Tramadol in Humans	Opioid Addiction
The Discriminative Effects of Tramadol in Humans	Stimulant Addiction
The Discriminative Effects of Tramadol in Humans	Opioid Abuse
Improved Induction and Maintenance Immunosuppression in Kidney Transplantation	End-stage Renal Disease
Inflammation and Vascular Function in Atherosclerosis	Atherosclerosis
Tacrolimus and Sirolimus as Prophylaxis After Allogenic Non-myeloablative Peripheral Blood Stem Cell Transplantation	GVHD
Tacrolimus and Sirolimus as Prophylaxis After Allogenic Non-myeloablative Peripheral Blood Stem Cell Transplantation	Graft Versus Host Disease
Open Label Study for the Functional Characterization of Drug Metabolism and Transport	Genotype-related Drug Metabolism
Fluconazole Prophylaxis for the Prevention of Candidiasis in Infants Less Than 750 Grams Birthweight	Candidiasis
Etoposide, Cyclophosphamide, Thalidomide, Celecoxib, and Fenofibrate in Relapsed or Progressive Cancer	Sarcoma
Etoposide, Cyclophosphamide, Thalidomide, Celecoxib, and Fenofibrate in Relapsed or Progressive Cancer	Neuroblastoma
Etoposide, Cyclophosphamide, Thalidomide, Celecoxib, and Fenofibrate in Relapsed or Progressive Cancer	Lymphoma
Etoposide, Cyclophosphamide, Thalidomide, Celecoxib, and Fenofibrate in Relapsed or Progressive Cancer	Central Nervous System Tumor, Pediatric
Etoposide, Cyclophosphamide, Thalidomide, Celecoxib, and Fenofibrate in Relapsed or Progressive Cancer	Unspecified Childhood Solid Tumor, Protocol Specific
Etoposide, Cyclophosphamide, Thalidomide, Celecoxib, and Fenofibrate in Relapsed or Progressive Cancer	Leukemia
Fluoxetine for Obsessive-Compulsive Disorder in Children and Adolescents With Bipolar Disorder	Pediatric Bipolar Disorder
Fluoxetine for Obsessive-Compulsive Disorder in Children and Adolescents With Bipolar Disorder	Pediatric OCD
Bosentan for Poorly Controlled Asthma	Asthma
Salivary Epidermal Growth Factor (EGF) Concentration Before and After Treatment of Reflux Laryngitis	Chronic Laryngitis
Salivary Epidermal Growth Factor (EGF) Concentration Before and After Treatment of Reflux Laryngitis	Gastroesophageal Reflux Disease (GERD)
Nephropathy In Type 2 Diabetes and Cardio-renal Events	Diabetic Nephropathy
Antibiotic Therapy in Preventing Early Infection in Patients With Multiple Myeloma Who Are Receiving Chemotherapy	Multiple Myeloma
Antibiotic Therapy in Preventing Early Infection in Patients With Multiple Myeloma Who Are Receiving Chemotherapy	Infection
Resistance to Antithrombotic Therapy	Atherosclerosis
Resistance to Antithrombotic Therapy	Angioplasty
Rosuvastatin Prevent Contrast Induced Acute Kidney Injury in Patients With Diabetes	Diabetes Mellitus
Rosuvastatin Prevent Contrast Induced Acute Kidney Injury in Patients With Diabetes	Chronic Kidney Disease
Comparing the Effectiveness Between Ritonavir Boosted Atazanavir and Efavirenz for the First HIV Treatment	HIV Infection
Does Allopurinol Prolong a Treated, Acute Gout Flare?	Gout
Modafinil for Treatment of Cognitive Dysfunction in Schizophrenia	Schizophrenia
Modafinil for Treatment of Cognitive Dysfunction in Schizophrenia	Schizoaffective Disorder
Statin Therapy to Improve Atherosclerosis in HIV Patients	Inflammation
Statin Therapy to Improve Atherosclerosis in HIV Patients	HIV Infections
Statin Therapy to Improve Atherosclerosis in HIV Patients	Atherosclerosis
Statin Therapy to Improve Atherosclerosis in HIV Patients	Statins, HMG-CoA
Statin Therapy to Improve Atherosclerosis in HIV Patients	Cardiovascular Disease
Statin Therapy to Improve Atherosclerosis in HIV Patients	HIV
Evaluation of the Use of Indomethacin as Co-treatment in Women With Preterm Labor and High Risk of Intraamniotic Inflammation	Preterm Labor With Intact Membranes
Simvastatin in Aneurysmal Subarachnoid Haemorrhage (STASH) a Multicentre Randomised Controlled Clinical Trial	Subarachnoid Haemorrhage
A Pilot Study of the Treatment of Central Serous Chorioretinopathy With Ketoconazole	Chronic Central Serous Chorioretinopathy
Metoclopramide for Migraine: A Dose Finding Study	Migraine
NSAIDs in Acute Achilles Tendinopathy: Effect on Pain Control, Leg Stiffness and Functional Recovery in Athletes	Achilles Tendinopathy
Fluvastatin, Rosuvastatin Added to Pegylated Interferon and Ribavirin	Chronic Hepatitis C
Umbilical Cord Blood Stem Cell Transplant in Treating Patients With Hematologic Cancer or Other Disease	Secondary Myelofibrosis
Umbilical Cord Blood Stem Cell Transplant in Treating Patients With Hematologic Cancer or Other Disease	Multiple Myeloma and Plasma Cell Neoplasm
Umbilical Cord Blood Stem Cell Transplant in Treating Patients With Hematologic Cancer or Other Disease	Lymphoma
Umbilical Cord Blood Stem Cell Transplant in Treating Patients With Hematologic Cancer or Other Disease	Myelodysplastic Syndromes
Umbilical Cord Blood Stem Cell Transplant in Treating Patients With Hematologic Cancer or Other Disease	Leukemia
Umbilical Cord Blood Stem Cell Transplant in Treating Patients With Hematologic Cancer or Other Disease	Precancerous Condition
Recovery of Diaphragmatic Function After Neuromuscular Blockade and Sugammadex	Muscle Weakness
Recovery of Diaphragmatic Function After Neuromuscular Blockade and Sugammadex	Diaphragmatic Dysfunction
Recovery of Diaphragmatic Function After Neuromuscular Blockade and Sugammadex	Muscle Fatigue
Cocaine Withdrawal and Pharmacotherapy Response	Cocaine Addictions
Comparison of the Efficacy of Topical Ibuprofen to Oral Ibuprofen in Adolescent Athletes	Soft Tissue Injury
Detection of Plaque Inflammation by Positron Emission Tomography (PET)-Effects of Simvastatin on Plaque Inflammation	Atherosclerosis
Voriconazole Trough Plasma Levels : Genetic Polymorphism, Efficacy, Safety in Patients With Hematologic Malignancy	Invasive Fungal Infection
Voriconazole Pharmacokinetics in Children With Gastrointestinal Graft Versus Host Disease	Graft Versus Host Disease
Voriconazole Pharmacokinetics in Children With Gastrointestinal Graft Versus Host Disease	Stem Cell Transplantation
The Effect and Safety of Different Intensity Anticoagulation Therapy in Elderly Patients With Non-valvular Atrial Fibrillation	Atrial Fibrillation
A Controlled Study of Uric Acid on the Progression of IgA Nephropathy	IgA Nephropathy
Short-term Atorvastatin's Effect on Acute Kidney Injury Following Cardiac Surgery	Acute Renal Failure
Short-term Atorvastatin's Effect on Acute Kidney Injury Following Cardiac Surgery	Post-Operative Delirium
Short-term Atorvastatin's Effect on Acute Kidney Injury Following Cardiac Surgery	Delirium
Short-term Atorvastatin's Effect on Acute Kidney Injury Following Cardiac Surgery	Acute Kidney Injury
Short-term Atorvastatin's Effect on Acute Kidney Injury Following Cardiac Surgery	Icu Delirium
Antibiotic Prophylaxis for Simple Hand Lacerations	Simple Hand Lacerations
Melphalan and Palifermin in Treating Patients Undergoing An Autologous Peripheral Stem Cell Transplant for Stage II or III Multiple Myeloma	Mucositis
Melphalan and Palifermin in Treating Patients Undergoing An Autologous Peripheral Stem Cell Transplant for Stage II or III Multiple Myeloma	Multiple Myeloma
FOTO: Five Consecutive Days on Treatment With Efavirenz, Tenofovir, and Emtricitabine Followed by Two Days Off Treatment Versus Continuous Treatment	HIV Infections
Simvastatin With or Without Ezetimibe and Atherothrombotic Biomarker Assessment	Metabolic Syndrome
Anti-inflammatory Treatment at the Onset of Necrotizing Enterocolitis (NEC) in Preterm Infants	Necrotizing Enterocolitis
Diagnosis and Therapy of Vulnerable Atherosclerotic Plaque	Carotid Atherosclerosis
Diagnosis and Therapy of Vulnerable Atherosclerotic Plaque	Stroke
Diagnosis and Therapy of Vulnerable Atherosclerotic Plaque	Type 2 Diabetes
Diagnosis and Therapy of Vulnerable Atherosclerotic Plaque	Metabolic Syndrome
Safety and Efficacy Trial of Danazol in Patients With Fanconi Anemia or Dyskeratosis Congenita	Dyskeratosis Congenita
Safety and Efficacy Trial of Danazol in Patients With Fanconi Anemia or Dyskeratosis Congenita	Fanconi Anemia
Gefitinib With or Without Simvastatin in Non-Small Cell Lung Cancer (NSCLC)	Lung Cancer
The Effect of XueZhiKang on Fatigue：Comparing With Simvastatin	Dyslipidemias
Sorafenib, Cisplatin, and Etoposide in Treating Patients With Extensive-Stage Small Cell Lung Cancer	Lung Cancer
Effectiveness of Modafinil and D-amphetamine in Treating Cocaine Dependent Individuals	Cocaine-Related Disorders
Statin Therapy in Heart Failure: Potential Mechanisms of Benefit	Heart Failure, Congestive
The Additive Anti-inflammatory Effect of Simvastatin in Combination With Inhaled Corticosteroids in Asthma	Asthma
\.


--
-- Data for Name: studies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.studies (cttitle, drugname) FROM stdin;
Early Use of Rosuvastatin in Acute Coronary Syndromes: Targeting Platelet-Leukocyte Interactions	rosuvastatin
Allogeneic Transplantation Using TL1 & ATG for Older Patients With Hematologic Malignancies	cyclosporine
Comparison of Cephalexin Versus Clindamycin for Suspected CA-MRSA Skin Infections	clindamycin
Trial of Early Aggressive Drug Therapy in Juvenile Idiopathic Arthritis	methotrexate
Prothrombin Times Outside the Therapeutic Range in Otherwise Stable Patients	warfarin
Modafinil Treatment for Sleep/Wake Disturbances in Older Adults	modafinil
Warfarin Versus Aspirin in Reduced Cardiac Ejection Fraction (WARCEF) Trial	aspirin
Fluoxetine for Motor, Aphasia, and Neglect Recovery After Ischemic Stroke	fluoxetine
Prophylactic Phenobarbital After Neonatal Seizures	phenobarbital
Low Doses Corticosteroids as Adjuvant Therapy for the Treatment of Severe H1N1 Flu	hydrocortisone
Atorvastatin for Preventing Occlusion and Restenosis After Intracranial Artery Stenting	atorvastatin
Anesthetics in Rhytidoplasty - A Comparison Study	metoclopramide
Treatment of Acute Lymphoblastic Leukemia in Children	methotrexate
Pharmacokinetic, Safety and Efficacy of Intermittent Application of Caspofungin for Antifungal Prophylaxis	caspofungin
Comparing Smoking Treatment Programs for Lighter Smokers - 1	bupropion
Treatment of Post Stroke Fatigue With a Wakefulness Promoting Agent	modafinil
Radical Lung Radiotherapy Plus Nelfinavir	nelfinavir
Pharmacokinetic Interactions Between Antiretroviral Agents and Antimalarial Drug Combinations	efavirenz
Optima: Optimizing Prograf Therapy in Maintenance Allografts II	cyclosporine
Effects of Statins on the Pharmacokinetics for Midazolam in Healthy Volunteers	atorvastatin
Effects of Statins on the Pharmacokinetics for Midazolam in Healthy Volunteers	simvastatin
Safety and Efficacy of Bosentan in Patients With Diastolic Heart Failure and Secondary Pulmonary Hypertension	bosentan
MgSO4 vs Metoclopramide for Headache in Pregnant Women	metoclopramide
Safety Study of Combined Azithromycin, Ivermectin and Albendazole for Trachoma and Lymphatic Filariasis	azithromycin
Warfarine in Unexplained Oligohydramnios	warfarin
Randomized Clinical Trial to Assess the Efficacy and Safety of Concomitant Use of Rifampicin and Efavirenz 600 X 800mg	efavirenz
Distribution of Bupropion and Varenicline to Increase Smoking Cessation Attempts	bupropion
Comparison of Blood Pressure Medications on Metabolism	carvedilol
Comparison of Methotrexate vs Placebo in Corticosteroid-dependent Ulcerative Colitis	methotrexate
Indomethacin Germinal Matrix Hemorrhage/Intraventricular Hemorrhage (GMH/IVH) Prevention Trial	indomethacin
Efficacy of Intravenous Dexketoprofen and Tenoxicam on Propofol Associated Injection Pain	tenoxicam
Evaluating the Transporter Protein Inhibitor Probenecid In Patients With Epilepsy	phenytoin
Aizthromycin or Clarithromycin in H-pylori Eradication Regimen	azithromycin
Aspirin Attenuates Inflammation in Human Cerebral Aneurysms	aspirin
Single Center Pilot Study of Corticosteroid Discontinuation in Liver Transplant Recipients	tacrolimus
Cryptococcal Optimal ART Timing Trial	efavirenz
Organ Donation and Hydrocortisone Treatment	hydrocortisone
Prevention of Pegfilgrastim-Induced Bone Pain (PIBP)	naproxen
Effect of Diabetes Mellitus on Cholesterol Metabolism	simvastatin
Allogeneic Hematopoietic Stem Cell Transplantation for Relapsed or Refractory High-Risk NBL.	cyclosporine
Allogeneic Hematopoietic Stem Cell Transplantation for Relapsed or Refractory High-Risk NBL.	tacrolimus
Comparing the Efficacy of Tacrolimus and Mycophenolate Mofetil for the Initial Therapy of Active Lupus Nephritis	tacrolimus
Asthma Clinical Research Network (ACRN) Trial - Macrolides in Asthma (MIA)	clarithromycin
Salsalate for Insulin Resistance in Schizophrenia	salsalate
Prophylaxis to Reduce Postoperative Atrial Fibrillation in Cardiac Surgery	amiodarone
Rituximab and Combination Chemotherapy Followed by Bone Marrow or Peripheral Stem Cell Transplantation in Treating Patients With Relapsed or Refractory Non-Hodgkin's Lymphoma	etoposide
Rituximab and Combination Chemotherapy Followed by Bone Marrow or Peripheral Stem Cell Transplantation in Treating Patients With Relapsed or Refractory Non-Hodgkin's Lymphoma	melphalan
Stem Cell Transplantation in Patients With High-Risk and Recurrent Pediatric Sarcomas	cyclosporine
Stem Cell Transplantation in Patients With High-Risk and Recurrent Pediatric Sarcomas	tacrolimus
Stem Cell Transplantation in Patients With High-Risk and Recurrent Pediatric Sarcomas	sirolimus
Stem Cell Transplantation in Patients With High-Risk and Recurrent Pediatric Sarcomas	etoposide
Stem Cell Transplantation in Patients With High-Risk and Recurrent Pediatric Sarcomas	melphalan
The Effect of Azithromycin in Patients With Chronic Obstructive Pulmonary Disease (COPD) and Chronic Productive Cough	azithromycin
Evaluation of SQ109, High-dose Rifampicin, and Moxifloxacin in Adults With Smear-positive Pulmonary TB in a MAMS Design	pyrazinamide
Combination Chemotherapy Followed By Autologous Stem Cell Transplant, and White Blood Cell Infusions in Treating Patients With Non-Hodgkin's Lymphoma	etoposide
Combination Chemotherapy Followed By Autologous Stem Cell Transplant, and White Blood Cell Infusions in Treating Patients With Non-Hodgkin's Lymphoma	melphalan
Vascular and Metabolic Effects of Vytorin vs Simvastatin	simvastatin
Determine the Effects of Gene Differences and Voriconazole on Enzyme CYP2B6 Activity in the Liver in Healthy Volunteers	voriconazole
Monoclonal Antibody Therapy, Combination Chemotherapy, and Peripheral Stem Cell Transplant in Treating Patients With Relapsed or Refractory Non-Hodgkin's Lymphoma	etoposide
Monoclonal Antibody Therapy, Combination Chemotherapy, and Peripheral Stem Cell Transplant in Treating Patients With Relapsed or Refractory Non-Hodgkin's Lymphoma	melphalan
Craving, Binge Eating and Obesity	bupropion
Ursodeoxycholic Acid in the Treatment of Intrahepatic Cholestasis of Pregnancy	ursodeoxycholic acid
Mild Versus Potent Corticosteroids as Treatment for Phimosis in Children	hydrocortisone
The Impact of Proton Pump Inhibitors on the Fecal Microbiome	omeprazole
Effect of Ezetimibe or Simvastatin or Both on Low Densitiy Lipoprotein -Subfractions in Patients With Type 2 Diabetes	simvastatin
Effect of Ezetimibe or Simvastatin or Both on Low Densitiy Lipoprotein -Subfractions in Patients With Type 2 Diabetes	ezetimibe
A Pilot Trial of Modafinil for Treatment of Methamphetamine Dependence	modafinil
Combination Chemotherapy Based on Risk of Relapse in Treating Young Patients With Acute Lymphoblastic Leukemia	etoposide
Combination Chemotherapy Based on Risk of Relapse in Treating Young Patients With Acute Lymphoblastic Leukemia	methotrexate
Effect of Daily Low Dose Aspirin on Exhaled Inflammatory Mediators in Normal Subjects	aspirin
Oxycodone Extended-release in the Treatment of Perioperative Pain in Patients Undergoing Orthopaedic Surgery	ketoprofen
Statins to Reduce D-dimer Levels in Patients With Venous Thrombosis	atorvastatin
Atorvastatin Treatment to Attenuate the Progression of Cardiovascular Disease in Hemodialysis Patients	atorvastatin
Caspofungin Maximum Tolerated Dose in Patients With Invasive Aspergillosis	caspofungin
Opioid Effects on Swallowing and Esophageal Sphincter Pressure	metoclopramide
Cisplatin, Etoposide, and Cyclophosphamide in Treating Patients With Extensive-Stage Small Cell Lung Cancer	etoposide
Beneficial Effect of Salicylates: Insulin Action, Secretion or Clearance?	salsalate
Developing Adaptive Treatment Strategies for Children and Adolescents With Obsessive-compulsive Disorder.	fluoxetine
Sirolimus, Tacrolimus, Thymoglobulin and Rituximab as Graft-versus-Host-Disease Prophylaxis in Patients Undergoing Haploidentical and HLA Partially Matched Donor Hematopoietic Cell Transplantation	tacrolimus
Sirolimus, Tacrolimus, Thymoglobulin and Rituximab as Graft-versus-Host-Disease Prophylaxis in Patients Undergoing Haploidentical and HLA Partially Matched Donor Hematopoietic Cell Transplantation	sirolimus
A Randomized Controlled Trial of Oral Naproxen and Transdermal Estradiol for Bleeding in LNG-IUC	naproxen
Allogeneic Stem Cell Transplant After ATG, High-Dose Melphalan, and Fludarabine for Patients With Metastatic Breast Cancer	cyclosporine
Allogeneic Stem Cell Transplant After ATG, High-Dose Melphalan, and Fludarabine for Patients With Metastatic Breast Cancer	methotrexate
Allogeneic Stem Cell Transplant After ATG, High-Dose Melphalan, and Fludarabine for Patients With Metastatic Breast Cancer	melphalan
Maraviroc Plus Darunavir/Ritonavir for Treatment-Naïve Patients Infected With R5-tropic HIV-1	ritonavir
Omeprazole and Reflux Disease - Improvement of Clinical Outcome by Genotype-adjusted Dosing	omeprazole
Bortezomib, Melphalan, and Dexamethasone in Treating Patients With Primary Amyloidosis or Light Chain Deposition Disease	melphalan
Sirolimus to Treat Cowden Syndrome and Other PTEN Hamartomatous Tumor Syndromes	sirolimus
Treatment of HDL to Reduce the Incidence of Vascular Events HPS2-THRIVE	simvastatin
Efficacy Study of Prophylactic Ibuprofen Versus Placebo on Pain Relief and Success Rates of Medical Abortion	ibuprofen
Gastric pH and Anthocyanin Absorption	omeprazole
Study Evaluating Conversion From Tacrolimus to Sirolimus in Stable Kidney Transplant Recipients Receiving Myfortic	sirolimus
Pilot Study for HLA Identical Living Donor Renal Transplant Recipients	sirolimus
The Discriminative Effects of Tramadol in Humans	methylphenidate
Improved Induction and Maintenance Immunosuppression in Kidney Transplantation	tacrolimus
Improved Induction and Maintenance Immunosuppression in Kidney Transplantation	sirolimus
Inflammation and Vascular Function in Atherosclerosis	salsalate
Tacrolimus and Sirolimus as Prophylaxis After Allogenic Non-myeloablative Peripheral Blood Stem Cell Transplantation	tacrolimus
Tacrolimus and Sirolimus as Prophylaxis After Allogenic Non-myeloablative Peripheral Blood Stem Cell Transplantation	sirolimus
Open Label Study for the Functional Characterization of Drug Metabolism and Transport	pravastatin
Fluconazole Prophylaxis for the Prevention of Candidiasis in Infants Less Than 750 Grams Birthweight	fluconazole
Etoposide, Cyclophosphamide, Thalidomide, Celecoxib, and Fenofibrate in Relapsed or Progressive Cancer	etoposide
Fluoxetine for Obsessive-Compulsive Disorder in Children and Adolescents With Bipolar Disorder	fluoxetine
Bosentan for Poorly Controlled Asthma	bosentan
Salivary Epidermal Growth Factor (EGF) Concentration Before and After Treatment of Reflux Laryngitis	omeprazole
Nephropathy In Type 2 Diabetes and Cardio-renal Events	simvastatin
Nephropathy In Type 2 Diabetes and Cardio-renal Events	aspirin
Antibiotic Therapy in Preventing Early Infection in Patients With Multiple Myeloma Who Are Receiving Chemotherapy	ciprofloxacin
Resistance to Antithrombotic Therapy	aspirin
Rosuvastatin Prevent Contrast Induced Acute Kidney Injury in Patients With Diabetes	rosuvastatin
Comparing the Effectiveness Between Ritonavir Boosted Atazanavir and Efavirenz for the First HIV Treatment	efavirenz
Does Allopurinol Prolong a Treated, Acute Gout Flare?	allopurinol
Modafinil for Treatment of Cognitive Dysfunction in Schizophrenia	modafinil
Statin Therapy to Improve Atherosclerosis in HIV Patients	atorvastatin
Evaluation of the Use of Indomethacin as Co-treatment in Women With Preterm Labor and High Risk of Intraamniotic Inflammation	indomethacin
Simvastatin in Aneurysmal Subarachnoid Haemorrhage (STASH) a Multicentre Randomised Controlled Clinical Trial	simvastatin
A Pilot Study of the Treatment of Central Serous Chorioretinopathy With Ketoconazole	ketoconazole
Metoclopramide for Migraine: A Dose Finding Study	metoclopramide
NSAIDs in Acute Achilles Tendinopathy: Effect on Pain Control, Leg Stiffness and Functional Recovery in Athletes	diclofenac
Fluvastatin, Rosuvastatin Added to Pegylated Interferon and Ribavirin	fluvastatin
Umbilical Cord Blood Stem Cell Transplant in Treating Patients With Hematologic Cancer or Other Disease	tacrolimus
Recovery of Diaphragmatic Function After Neuromuscular Blockade and Sugammadex	neostigmine
Cocaine Withdrawal and Pharmacotherapy Response	carvedilol
Comparison of the Efficacy of Topical Ibuprofen to Oral Ibuprofen in Adolescent Athletes	ibuprofen
Detection of Plaque Inflammation by Positron Emission Tomography (PET)-Effects of Simvastatin on Plaque Inflammation	simvastatin
Voriconazole Trough Plasma Levels : Genetic Polymorphism, Efficacy, Safety in Patients With Hematologic Malignancy	voriconazole
Voriconazole Pharmacokinetics in Children With Gastrointestinal Graft Versus Host Disease	voriconazole
The Effect and Safety of Different Intensity Anticoagulation Therapy in Elderly Patients With Non-valvular Atrial Fibrillation	aspirin
A Controlled Study of Uric Acid on the Progression of IgA Nephropathy	allopurinol
Short-term Atorvastatin's Effect on Acute Kidney Injury Following Cardiac Surgery	atorvastatin
Antibiotic Prophylaxis for Simple Hand Lacerations	clindamycin
Melphalan and Palifermin in Treating Patients Undergoing An Autologous Peripheral Stem Cell Transplant for Stage II or III Multiple Myeloma	melphalan
FOTO: Five Consecutive Days on Treatment With Efavirenz, Tenofovir, and Emtricitabine Followed by Two Days Off Treatment Versus Continuous Treatment	efavirenz
Simvastatin With or Without Ezetimibe and Atherothrombotic Biomarker Assessment	simvastatin
Anti-inflammatory Treatment at the Onset of Necrotizing Enterocolitis (NEC) in Preterm Infants	hydrocortisone
Diagnosis and Therapy of Vulnerable Atherosclerotic Plaque	atorvastatin
Safety and Efficacy Trial of Danazol in Patients With Fanconi Anemia or Dyskeratosis Congenita	danazol
Gefitinib With or Without Simvastatin in Non-Small Cell Lung Cancer (NSCLC)	simvastatin
The Effect of XueZhiKang on Fatigue：Comparing With Simvastatin	simvastatin
Sorafenib, Cisplatin, and Etoposide in Treating Patients With Extensive-Stage Small Cell Lung Cancer	etoposide
Effectiveness of Modafinil and D-amphetamine in Treating Cocaine Dependent Individuals	modafinil
Statin Therapy in Heart Failure: Potential Mechanisms of Benefit	atorvastatin
The Additive Anti-inflammatory Effect of Simvastatin in Combination With Inhaled Corticosteroids in Asthma	simvastatin
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

