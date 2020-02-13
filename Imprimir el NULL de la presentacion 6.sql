SELECT cta || ' '  || LISTAGG(valor,' ') 
       WITHIN GROUP(ORDER BY cons ASC)
       AS listado
FROM mvto
WHERE cons <= 3
GROUP BY cta
UNION
SELECT TO_CHAR(nro)
FROM cuenta
WHERE nro NOT IN (SELECT cta FROM mvto)
ORDER BY 1;

--------------------------------------------------------------------------+

SELECT aux.cta || ' '  || LISTAGG(m.valor,' ') 
       WITHIN GROUP(ORDER BY m.cons ASC)
       AS listado
FROM mvto m
RIGHT OUTER JOIN (SELECT nro AS cta FROM cuenta) aux
ON m.cta = aux.cta
WHERE ((aux.cta = 3 OR aux.cta = 2 AND m.cons <= 3) 
    OR (aux.cta = 1 AND m.cons IS NULL))
GROUP BY aux.cta
ORDER BY 1;

--------------------------------------------------------------------------+

SELECT aux.cta || ' '  || LISTAGG(m.valor,' ') 
       WITHIN GROUP(ORDER BY m.cons ASC)
       AS listado
FROM mvto m
RIGHT OUTER JOIN (SELECT nro AS cta FROM cuenta) aux
ON m.cta = aux.cta
WHERE ( m.cons <= 3
    OR m.cons IS NULL)
GROUP BY aux.cta
ORDER BY 1;