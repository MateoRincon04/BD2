DECLARE
palabra VARCHAR(100) := 'BALLENA';
palabraAux VARCHAR(200);
BEGIN
FOR i IN 0 .. LENGTH(palabra)-1 LOOP
    palabraAux := palabraAux || ' ' || SUBSTR(palabra, LENGTH(palabra)-i, 1);
END LOOP;
DBMS_OUTPUT.PUT_LINE(palabraAux);
END;
/