
/*==============================================================*/
/* Table : Article                                              */
/*==============================================================*/
create table Article
(
   reference            int not null,
   idfamille            int not null,
   nomarticle           varchar(254),
   prix                 float,
   quantite             int,
   primary key (reference)
);

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client
(
   idclient             int not null,
   primary key (idclient)
);

/*==============================================================*/
/* Table : Facture                                              */
/*==============================================================*/
create table Facture
(
   idfacture            int not null,
   idclient             int,
   date                 datetime,
   primary key (idfacture)
);

/*==============================================================*/
/* Table : Famille                                              */
/*==============================================================*/
create table Famille
(
   idfamille            int not null,
   nomfamille           varchar(254),
   primary key (idfamille)
);

/*==============================================================*/
/* Table : correspond                                           */
/*==============================================================*/
create table correspond
(
   reference            int not null,
   idfacture            int not null,
   primary key (reference, idfacture)
);

alter table Article add constraint FK_avoir foreign key (idfamille)
      references Famille (idfamille) on delete restrict on update restrict;

alter table Facture add constraint FK_posseder foreign key (idclient)
      references Client (idclient) on delete restrict on update restrict;

alter table correspond add constraint FK_correspond foreign key (reference)
      references Article (reference) on delete restrict on update restrict;

alter table correspond add constraint FK_correspond foreign key (idfacture)
      references Facture (idfacture) on delete restrict on update restrict;


