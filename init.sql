CREATE TABLE spectacle (
    num_spec SERIAL PRIMARY KEY,
    titre_spec TEXT,
    salle TEXT,
    organisateur TEXT
);

CREATE TABLE jouer (
    nom_acteur TEXT,
    num_spec INT,
    PRIMARY KEY(nom_acteur, num_spec)
);

CREATE TABLE representation (
    date_rep DATE,
    heure_rep TIME,
    num_spec INT,
    -- Won't have a tarif more expensive than 999.99
    tarif NUMERIC(5,2),
    PRIMARY KEY(date_rep, heure_rep, num_spec)
);

INSERT INTO spectacle 
VALUES (1, 'Pinocchio',             'Chopin',   'Dupont')
     , (2, 'Les noces de Figaro',   'Chopin',   'Dupont')
     , (3, 'Tartuffe',              'Chopin',   'Durand')
     , (4, 'La divine Comédie',     'Alcazar',  'Dupont')
     , (5, 'Zorro',                 'Alcazar',  'Bovard')
     , (6, 'Gribouille',            'Alcazar',  'Deringer')
     , (7, 'Pinocchio',             'Chopin',   'Deringer')
     ;

INSERT INTO representation 
VALUES ('2004-10-12', '15:00:00', 1, 20.00)
     , ('2004-10-12', '15:00:00', 4, 25.00)
     , ('2004-10-12', '20:00:00', 1, 30.00)
     , ('2004-10-12', '20:00:00', 4, 28.00)
     , ('2004-10-13', '15:00:00', 1, 20.00)
     , ('2004-10-13', '15:00:00', 3, 23.00)
     , ('2004-10-13', '20:00:00', 1, 20.00)
     , ('2004-10-13', '20:00:00', 2, 28.00)
     , ('2004-10-13', '20:00:00', 7, 30.00)
     , ('2004-10-14', '20:00:00', 7, 30.00)
     ;

INSERT INTO jouer 
VALUES ('Auteuil',  1)
     , ('Auteuil',  2)
     , ('Auteuil',  7)
     , ('Delon',    1)
     , ('Delon',    2)
     , ('Delon',    7)
     , ('Girardot', 3)
     , ('Marceau',  2)
     , ('Marceau',  3)
     ;