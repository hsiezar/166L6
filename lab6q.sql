SELECT S.sname, COUNT(C.sid)
FROM Suppliers S, Catalog C
WHERE S.sid = C.sid
GROUP BY S.sname
HAVING COUNT(C.sid) > 2


