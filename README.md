# 🔄 Automatisation ETL — Entrepôt de Données avec Talend

## Contexte

Ce projet a été réalisé dans le cadre du **Master 2 Systèmes d'Information et d'Intelligence des Données** à l'Université Jean Moulin Lyon 3.

L'objectif était de concevoir et d'alimenter un **entrepôt de données (Data Warehouse)** en automatisant l'ensemble du flux ETL (Extract, Transform, Load) à l'aide de **Talend Open Studio for Data Integration**.

## 🎯 Problématique

Une mutuelle d'assurance santé génère des données de remboursement dispersées dans plusieurs sources. Le projet consiste à centraliser ces données dans un modèle en étoile pour permettre des analyses décisionnelles fiables.

## 🏗️ Architecture du Data Warehouse

### Modèle en étoile

**Table de faits :**
- `sinistre_fact` — Données de remboursement (frais réels, montant Sécurité Sociale, montant remboursé, température, ancienneté)

**Tables de dimensions :**

| Dimension | Clé primaire | Description |
|-----------|-------------|-------------|
| `beneficiaire_dim` | `b_id` | Sexe et régime social du bénéficiaire |
| `adresse_dim` | `cp` | Code postal, département, région |
| `acte_dim` | `Acte` | Désignation et catégorie de l'acte médical |
| `contrat_dim` | `c_id` | Formule, catégorie, type de bénéficiaire, profession |
| `age_dim` | `age_id` | Groupe d'âge |
| `temps_dim` | `date_id` | Année, trimestre, mois, saison, jour |

## ⚙️ Pipeline ETL (Talend Open Studio)

```
[Sources CSV/Excel]
        │
        ▼
[Extraction]
  └── Lecture des fichiers sources
        │
        ▼
[Transformation]
  ├── Nettoyage des données (valeurs nulles, doublons)
  ├── Normalisation des formats (dates, codes postaux)
  ├── Enrichissement (calcul des catégories d'âge, saisons)
  └── Application des règles métier
        │
        ▼
[Chargement]
  └── Alimentation du Data Warehouse MySQL
        │
        ▼
[Data Warehouse MySQL — Modèle en étoile]
```

## 📁 Contenu du dépôt

```
├── rendu-entrepot-de-données-Glenn_MADZOU-A-MIERE.pdf   # Rapport complet du projet
└── script_creation_tables_talend_mysql.sql               # Script SQL de création du schéma en étoile
```

## 🛠️ Technologies

| Outil | Usage |
|-------|-------|
| **Talend Open Studio** | Conception et exécution des jobs ETL |
| **MySQL** | Stockage du Data Warehouse |
| **SQL** | Création du schéma relationnel (DDL) |
| **Java** | Langage sous-jacent des jobs Talend |

## 📊 Résultats

- Entrepôt de données fonctionnel alimenté automatiquement
- Modèle en étoile avec 1 table de faits et 6 dimensions
- Pipeline ETL couvrant l'extraction, la transformation et le chargement
- Documentation complète du flux de données

## 👤 Auteur

**Glenn Madzou-A-Mière** — Master 2 SIID, Université Jean Moulin Lyon 3

[![Portfolio](https://img.shields.io/badge/Portfolio-Voir%20en%20ligne-0077ff?style=flat-square)](https://glenn-mam.github.io/Portfolio/)