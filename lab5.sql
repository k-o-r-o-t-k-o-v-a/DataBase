CREATE TABLE IF NOT EXISTS delivery_schema.customer_full_name_A_to_N
(
    check ( "full_name" >= 'A' and "full_name" < 'O' )
) INHERITS (delivery_schema.customer);

CREATE TABLE IF NOT EXISTS delivery_schema.customer_full_name_O_to_S
(
    check ( "full_name" >= '0' and "full_name" < 'T' )
) INHERITS (delivery_schema.customer);

CREATE TABLE IF NOT EXISTS delivery_schema.customer_full_name_T_to_Z
(
    check ( "full_name" >= 'T' and "full_name" ~* '[A-z]' )
) INHERITS (delivery_schema.customer);

CREATE OR REPLACE FUNCTION
    client_insert_trigger() RETURNS TRIGGER AS
$BODY$
BEGIN
    IF (new."full_name" >= 'A' and new."full_name" < 'O') THEN
        INSERT INTO delivery_schema.customer_full_name_A_to_N
        VALUES (new.id, new.full_name, new.age, new.username, new.password);
    ELSIF (new."full_name" >= 'O' and new."full_name" < 'T') THEN
        INSERT INTO delivery_schema.customer_full_name_O_to_S
        VALUES (new.id, new.full_name, new.age, new.username, new.password);
    ELSIF (new."full_name" >= 'T' and new."full_name" ~* '[A-z]') THEN
        INSERT INTO delivery_schema.customer_full_name_T_to_Z
        VALUES (new.id, new.full_name, new.age, new.username, new.password);
    ELSE
        RAISE EXCEPTION 'NAME ERROR';
    END IF;
    RETURN NULL;
END ;
$BODY$
    language plpgsql;

CREATE TRIGGER createPartitions
    before INSERT
    on delivery_schema.customer
    FOR EACH ROW
EXECUTE FUNCTION client_insert_trigger();

TRUNCATE ONLY delivery_schema.customer CASCADE;

INSERT INTO delivery_schema.customer (id, full_name, age, username, password)
VALUES (1, 'Ekaterina', 19, 'Korot', 'qwerty'),
       (2, 'ONastya', 26, 'Shulz', 'qwerty'),
       (3, 'WIrina', 30, 'Ivkorot', 'qwerty');

