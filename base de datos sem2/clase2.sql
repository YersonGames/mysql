create database information_schema;
use schema;

create table schemata(
    schema_name varchar(100);
);

select schema from information_schema.schemata