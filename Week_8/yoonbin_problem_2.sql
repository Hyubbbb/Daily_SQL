```sql
-- 물고기 종류 별 대어 찾기
SELECT 
    fi.ID, 
    fn.FISH_NAME, 
    fi.LENGTH
FROM 
    FISH_INFO fi
JOIN 
    FISH_NAME_INFO fn 
ON 
    fi.FISH_TYPE = fn.FISH_TYPE
WHERE 
    fi.LENGTH = (
        SELECT MAX(LENGTH) 
        FROM FISH_INFO 
        WHERE FISH_TYPE = fi.FISH_TYPE
    )
ORDER BY 
    fi.ID ASC;
```
