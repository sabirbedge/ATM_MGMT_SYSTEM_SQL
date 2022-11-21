create table acc
(
id int primary key,
nm varchar(10),
mob number,
accno varchar(15) unique,
acctype varchar(15),
bal number
);
commit;