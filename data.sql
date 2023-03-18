insert into delivery_schema.shop (id, name, description, address)
values (1, 'shop_name', 'shop 1', 'Savushkina 5'),
       (2, 'shop_name', 'shop 2', 'Savushkina 5'),
       (3, 'shop_name', 'shop 3', 'Savushkina 5'),
       (4, 'shop_name', 'shop 4', 'Savushkina 5'),
       (5, 'shop_name', 'shop 5', 'Savushkina 5');

insert into delivery_schema.product (id, full_name, shop_id)
values (1, 'Potato', 1),
       (2, 'Tomato', 1),
       (3, 'Cucumber', 1),
       (4, 'Tomato', 1),
       (5, 'Carrot', 1),
       (6, 'Potato', 2),
       (7, 'Tomato', 2),
       (8, 'Cucumber', 2),
       (9, 'Tomato', 2),
       (10, 'Carrot', 2),
       (11, 'Potato', 3),
       (12, 'Tomato', 3),
       (13, 'Cucumber', 3),
       (14, 'Tomato', 3),
       (15, 'Carrot', 3);

insert into delivery_schema.customer (id, full_name, age, username, password)
values (1, 'Ekaterina', 20, 'Korotkova', 'qwerty'),
       (2, 'Egor', 20, 'Savkovskij', 'qwerty'),
       (3, 'Nastja', 20, 'Schulyak', 'qwerty'),
       (4, 'Irina', 20, 'Korotkova', 'qwerty'),
       (5, 'Artem', 20, 'Korotkov', 'qwerty');


insert into delivery_schema.deliveryman (id, full_name, age, username, password, shop_id)
values (1, 'Best', 20, 'deliveryman', 'qwerty', 1);

insert into delivery_schema.salesman(id, full_name, age, username, password, shop_id)
values (1, 'Best', 20, 'salesman', 'qwerty', 1);

insert into delivery_schema."order" (id, full_name, shop_id, customer_id, salesman_id)
values (1, 'Order 1', 1, 1, 1);

insert into delivery_schema.deliveryman_customer(id, customer_id, deliveryman_id)
values (1, 1, 1);

insert into delivery_schema.order_product (id, product_id, order_id)
values (1, 1, 1),
       (2, 2, 1),
       (3, 3, 1);
