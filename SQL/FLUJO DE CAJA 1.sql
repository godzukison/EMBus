
SELECT DISTINCT FORMAT (FECHA_ARQUEO, 'dd-MM-yyyy') AS FECHA, PATENTE AS PATENTE, TOTAL_FINAL AS INGRESOS, 
TOTAL_GASTOS AS EGRESOS, TOTAL_FINAL - TOTAL_GASTOS AS LIQUIDO
FROM ARQUEO
where TOTAL_FINAL<>0 and FECHA_ARQUEO BETWEEN '30-03-2017' AND '13-04-2017' and PATENTE='BKRJ42'
ORDER BY PATENTE

SELECT SUM(DISTINCT TOTAL_FINAL) AS TOTAL_INGRESOS, SUM(DISTINCT TOTAL_GASTOS) AS TOTAL_GASTOS,
SUM(DISTINCT TOTAL_FINAL) - SUM(DISTINCT TOTAL_GASTOS) AS TOTAL_LIQUIDO FROM ARQUEO
where TOTAL_FINAL<>0 and FECHA_ARQUEO BETWEEN '30-03-2017' AND '13-04-2017' and PATENTE='BKRJ42'