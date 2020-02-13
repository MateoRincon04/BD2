SET SERVEROUTPUT ON
DECLARE --EFICIENCIA O(N)
TYPE mis_emp IS TABLE OF empi%ROWTYPE
INDEX BY BINARY_INTEGER;
arr mis_emp; --ARREGLO DE FILAS DE EMPI
aux VARCHAR(1000) := ''; --AYUDA PARA IMPRIMIR LOS NOMBRES
BEGIN
    SELECT * BULK COLLECT INTO arr FROM empi ORDER BY depto DESC; --LLENAR EL ARREGLO

    IF arr.FIRST IS NOT NULL THEN --SI NO ESTA VACIO EL ARREGLO
    FOR i IN arr.FIRST .. arr.LAST LOOP
        IF i = arr.FIRST THEN --PASO BASE
            aux := arr(i).nombre;
        END IF;
        

        IF i <> arr.FIRST THEN
            IF arr(i).depto = arr(i-1).depto THEN --NOMBRES
                aux := arr(i).nombre || '-' || aux;
            END IF;

            IF i <> arr.LAST THEN --EXCEPCION DE QUE SEA LA ULTIMA FILA
                IF arr(i).depto != arr(i+1).depto THEN --SI EN LA SIGUIENTE FILA EMPIEZA NUEVO DEPTO
                    DBMS_OUTPUT.PUT_LINE(arr(i).depto);
                    DBMS_OUTPUT.PUT_LINE(aux);
                    aux := arr(i+1).nombre;
                END IF;

	        ELSE --IMPRIMIR EL ULTIMO DEPTO
                DBMS_OUTPUT.PUT_LINE(arr(i).depto);
                DBMS_OUTPUT.PUT_LINE(aux);
            END IF;
        END IF;
        
    END LOOP;
    END IF;

END;
/