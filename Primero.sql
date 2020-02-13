DECLARE
nom VARCHAR(100) := 'Ballena';
aux  VARCHAR(200) :='';
BEGIN
  FOR indice IN REVERSE 1 .. LENGTH(nom) LOOP
  aux := aux  || SUBSTR(nom, indice, 1) || ' ';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(aux);
END;
/