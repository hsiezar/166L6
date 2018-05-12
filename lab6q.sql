SELECT S.sname, COUNT(C.sid)
FROM Suppliers S, Catalog C
WHERE S.sid = C.sid
GROUP BY S.sname;

SELECT S.sname, COUNT(C.sid)
FROM Suppliers S, Catalog C
WHERE S.sid = C.sid
GROUP BY S.sname
HAVING COUNT(C.sid) > 2;

      
SELECT S.sname, COUNT(C.pid) AS cp
FROM Suppliers S, catalog C
WHERE S.sid = C.sid AND S.sid 
IN ((SELECT C1.sid
     FROM Catalog C1, Parts P1
     WHERE C1.pid = P1.pid AND P1.color = 'Green')
     EXCEPT 
     (SELECT C2.sid       
     FROM Catalog C2, Parts P2
     WHERE C2.pid = P2.pid AND P2.color != 'Green')) 
GROUP BY S.sname;


SELECT T.sname, MAX(C.cost)
FROM ((SELECT C1.sid, S1.sname
     FROM Catalog C1, Parts P1, Suppliers S1
     WHERE C1.pid = P1.pid AND C1.sid = S1.sid AND P1.color = 'Red')
     INTERSECT
     (SELECT C2.sid, S2.sname
     FROM Catalog C2, Parts P2, Suppliers S2
     WHERE C2.pid = P2.pid AND C2.sid = S2.sid AND P2.color = 'Green')) T, Catalog C
WHERE C.sid = T.sid 
GROUP BY T.sname;

     

