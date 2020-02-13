CREATE TABLE valortipo(
tipo NUMBER(8) PRIMARY KEY CHECK(tipo > 0),
valor NUMBER(8) NOT NULL CHECK(valor > 0)
);

INSERT INTO valortipo VALUES(1, 70);
INSERT INTO valortipo VALUES(2, 50);
INSERT INTO valortipo VALUES(3, 30);
INSERT INTO valortipo VALUES(4, 25);
INSERT INTO valortipo VALUES(5, 15);

CREATE TABLE emp(
cedula NUMBER(8) PRIMARY KEY,
tipo NUMBER(8) NOT NULL CHECK(tipo >= 0),
salario NUMBER(20) NOT NULL CHECK(salario >= 0)
);

CREATE OR REPLACE TRIGGER si
BEFORE INSERT ON emp
FOR EACH ROW
DECLARE
numeroaux valortipo.valor%TYPE;
BEGIN
    SELECT valor INTO numeroaux FROM valortipo WHERE tipo = :NEW.tipo;
    :NEW.salario := :NEW.salario + numeroaux;
END;
/


INSERT INTO emp VALUES(100, 3, 5000);