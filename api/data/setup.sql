drop table if exists fyllevakna_beverages;
drop table if exists fyllevakna_brands;
drop table if exists fyllevakna_users;
drop table if exists fyllevakna_categories;
drop table if exists fyllevakna_countries;

create table fyllevakna_users (
    username varchar(50) not null,
    name varchar(100) not null,
    primary key (username)
);

create table fyllevakna_categories (
    name varchar(50) not null,
    primary key (name)
);

create table fyllevakna_countries (
    code varchar(2) not null,
    name varchar(100) not null,
    primary key (code)
);

create table fyllevakna_brands (
    id int not null auto_increment,
    name varchar(100) not null,
    countryCode varchar(2) not null,
    primary key (id),
    foreign key (countryCode) references fyllevakna_countries(code)
);

create table fyllevakna_beverages (
    id int not null auto_increment,
    brandId int not null,
    name varchar(100) not null,
    abv decimal not null,
    systembolagetId int,
    categoryName varchar(50) not null,
    primary key (id),
    foreign key (brandId) references fyllevakna_brands(id),
    foreign key (categoryName) references fyllevakna_categories(name)
);

insert into fyllevakna_users (username, name) values('admin', 'Admin');

insert into fyllevakna_categories (name) values('beer');

insert into fyllevakna_countries (code, name) values('gb', 'Great Britain');

insert into fyllevakna_brands (name, countryCode) values('Brewmeister', 'gb');

insert into fyllevakna_beverages (brandId, name, abv, systembolagetId,
    categoryName) values(last_insert_id(), 'Snake Venom', 67.5, null, 'beer');