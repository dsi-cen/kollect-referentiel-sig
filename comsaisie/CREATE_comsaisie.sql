CREATE TABLE referentiel.comsaisie (
idcodecom integer not null
constraint comsaisie_pkey
primary key,
codecom varchar(5),
poly polygon
);