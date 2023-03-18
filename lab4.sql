-- LAB 4

create extension if not exists "anon" cascade;

select anon.init();

select anon.start_dynamic_masking();

CREATE ROLE test_role password 'test_role' LOGIN;
SECURITY LABEL FOR anon ON ROLE test_role IS 'MASKED';

SECURITY LABEL FOR anon ON COLUMN delivery_schema.customer.username
    IS 'MASKED WITH FUNCTION anon.partial(username)';



create materialized view delivery_schema.generalized_customer_age as
select anon.generalize_int8range(age::int, 7) AS age
from delivery_schema.customer;

select *
from delivery_schema.generalized_customer_age;

create materialized view delivery_schema.fake_username as
select anon.fake_first_name() AS username
from delivery_schema.customer;

select *
from delivery_schema.fake_username;

create materialized view delivery_schema.hashed_name_address as
select anon.hash(name) AS name,
       anon.hash(address)  AS address
from delivery_schema.shop;

select *
from delivery_schema.hashed_name_address;
