create table beneficiaire_dim (
b_id integer Primary Key,
sexe varchar(8),
regime_social varchar(100)
);

create table adresse_dim(
cp integer Primary Key,
departement varchar(200),
region varchar(200)
);


create table acte_dim(
Acte varchar(10) Primary Key,
designation_acte varchar(40),
categ_acte varchar(5)
);


create table contrat_dim 
(
c_id varchar(100) Primary Key,
formule varchar(30),
categ_formule varchar(30),
type_beneficiaire varchar(2),
libelle_profession varchar(100)
);

create table age_dim (
age_id integer Primary Key,
gp_age varchar(20)
);

create table temps_dim (
date_id DATE Primary Key,
annee integer,
Trimestre varchar(20),
Mois varchar(20),
Saison varchar(20),
num_jour_mois integer,
jour varchar(10));


create table sinistre_fact (
b_id integer, 
cp integer,
age_id integer, 
Acte varchar(10), 
c_id varchar(100), 
date_soins date,
date_remboursements date,
temperature float,
anciennete integer,
frais_reel float, 
montant_secu float, 
montant_rembourse float); 


ALTER table sinistre_fact ADD CONSTRAINT fk1_beneficiaire FOREIGN KEY (b_id) REFERENCES beneficiaire_dim(b_id);
ALTER table sinistre_fact ADD CONSTRAINT fk2_adresse FOREIGN KEY (cp) REFERENCES adresse_dim(cp);
ALTER table sinistre_fact ADD CONSTRAINT fk3_age FOREIGN KEY (age_id) REFERENCES age_dim(age_id);
ALTER table sinistre_fact ADD CONSTRAINT fk4_acte FOREIGN KEY (acte) REFERENCES acte_dim(acte);
ALTER table sinistre_fact ADD CONSTRAINT fk5_contrat FOREIGN KEY (c_id) REFERENCES contrat_dim(c_id);
ALTER table sinistre_fact ADD CONSTRAINT fk6_date_soins FOREIGN KEY (date_soins) REFERENCES temps_dim(date_id);
ALTER table sinistre_fact ADD CONSTRAINT fk7_date_remboursement FOREIGN KEY (date_remboursements) REFERENCES temps_dim(date_id);

