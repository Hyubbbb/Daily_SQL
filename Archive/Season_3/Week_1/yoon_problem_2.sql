SELECT USERID, NAME, REGIST_NO, TELEPHONE
FROM EC_Member M
WHERE NOT EXISTS (SELECT *
                   FROM EC_Order O
                   WHERE M.USERID= O.ORDER_ID)
ORDER BY 2;