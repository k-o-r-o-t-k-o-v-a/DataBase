drop schema if exists delivery_schema cascade;


create schema if not exists delivery_schema;


drop table if exists delivery_schema.shop cascade;


create table delivery_schema.shop
(
    id          bigint not null,
    name        varchar(255),
    description varchar(255),
    address     varchar(255),
    primary key (id)
);


drop table if exists delivery_schema.salesman cascade;


create table delivery_schema.salesman
(
    id        bigint not null,
    full_name varchar(255),
    age       integer,
    username  varchar(255),
    password  varchar(255),
    shop_id   bigint,
    primary key (id),
    foreign key (shop_id) references delivery_schema.shop (id)
);


drop table if exists delivery_schema.customer cascade;


create table delivery_schema.customer
(
    id        bigint not null,
    full_name varchar(255),
    age       integer,
    username  varchar(255),
    password  varchar(255),
    primary key (id)
);


drop table if exists delivery_schema.order cascade;


create table delivery_schema.order
(
    id          bigint not null,
    full_name   varchar(255),
    shop_id     bigint,
    customer_id bigint,
    salesman_id bigint,
    primary key (id),
    foreign key (shop_id) references delivery_schema.shop (id),
    foreign key (customer_id) references delivery_schema.customer (id),
    foreign key (salesman_id) references delivery_schema.salesman (id)
);

create index  customer_shop on delivery_schema.order (customer_id, shop_id);


drop table if exists delivery_schema.product cascade;


create table delivery_schema.product
(
    id        bigint not null,
    full_name varchar(255),
    shop_id   bigint,
    primary key (id),
    foreign key (shop_id) references delivery_schema.shop (id)
);

create index  name_shop on delivery_schema.product (full_name, shop_id);


drop table if exists delivery_schema.order_product cascade;


create table delivery_schema.order_product
(
    id         bigint not null,
    product_id bigint,
    order_id   bigint,
    primary key (id),
    foreign key (product_id) references delivery_schema.product (id),
    foreign key (order_id) references delivery_schema.order (id)
);


drop table if exists delivery_schema.deliveryman cascade;


create table delivery_schema.deliveryman
(
    id        bigint not null,
    full_name varchar(255),
    age       integer,
    username  varchar(255),
    password  varchar(255),
    shop_id   bigint,
    primary key (id)
);


drop table if exists delivery_schema.deliveryman_customer cascade;


create table delivery_schema.deliveryman_customer
(
    id             bigint not null,
    customer_id    bigint,
    deliveryman_id bigint,
    primary key (id),
    foreign key (deliveryman_id) references delivery_schema.deliveryman (id),
    foreign key (customer_id) references delivery_schema.customer (id)
);

create view info_order
as select "order".full_name, shop_id, customer_id
FROM delivery_schema.order, delivery_schema.customer
WHERE "order".customer_id = customer.id;

create view info_selesman_shop
as select full_name, name, address
FROM delivery_schema.salesman, delivery_schema.shop
WHERE salesman.shop_id = shop.id;




