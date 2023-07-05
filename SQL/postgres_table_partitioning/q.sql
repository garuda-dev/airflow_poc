create table dengg.t(col1 text,col2 text) partition by list(col1);

create table dengg.p1(col1 text,col2 text);
create table dengg.p2(col1 text,col2 text);

insert into dengg.p1 values('Vikas','ENGG');
insert into dengg.p2 values('Akshay','ENGG');

alter table dengg.t attach partition dengg.p1 for values in ('Vikas');
alter table dengg.t attach partition dengg.p2 for values in ('Akshay');


select * from dengg.t;

