CREATE OR REPLACE PACKAGE mat IS
 TYPE t_num IS TABLE OF NUMBER(3) 
  INDEX BY BINARY_INTEGER;
 FUNCTION suma(arr IN t_num) RETURN NUMBER; 
 FUNCTION suma(a IN NUMBER, b IN NUMBER) RETURN NUMBER;
 FUNCTION segundoMayor(arr IN t_num) return number;
END; --Fin de la especificación
/


CREATE OR REPLACE PACKAGE BODY mat IS
FUNCTION suma(arr IN t_num) RETURN 
NUMBER IS
i NUMBER := arr.FIRST;
suma NUMBER(8) := 0;
BEGIN 
 WHILE i IS NOT NULL LOOP
  suma := suma + arr(i);
  i := arr.NEXT(i);
 END LOOP;
 RETURN suma;
END; --Fin de la función suma
FUNCTION suma(a IN NUMBER, b IN NUMBER) RETURN 
NUMBER IS
BEGIN
 RETURN a+b; 
END; --Fin de la función suma
FUNCTION segundoMayor(arr IN t_num) RETURN 
NUMBER IS
mayor NUMBER;
segundo NUMBER;
ind NUMBER := arr.FIRST;
begin
if ind = arr.FIRST then
    mayor := arr(ind);
    segundo := arr(arr.NEXT(ind));
end if;

  while ind != arr.LAST loop
    ind := arr.NEXT(ind);
    if arr(ind) > mayor THEN
        segundo := mayor;
        mayor := arr(ind);
    end if;
    if arr(ind) > segundo AND arr(ind) < mayor THEN
        segundo := arr(ind);
    end if;
  end loop;
return segundo;
exception
  when no_data_found then
    DBMS_OUTPUT.PUT_LINE(ind);
end;
END; --Fin del cuerpo del paquete
/



DECLARE
mi_arr mat.t_num;
BEGIN
mi_arr(10):= 3; 
mi_arr(8):= 2;
mi_arr(-1):= 1;
DBMS_OUTPUT.PUT_LINE(mat.segundoMayor(mi_arr));
END;
/
