SELECT CASE WHEN Marks < 70 THEN NULL
        ELSE Name END AS Name, 
            CASE WHEN Marks = 100 THEN 10
            ELSE Marks DIV 10 + 1 END AS Grade,
            Marks
FROM Students
ORDER BY grade desc, Name;
