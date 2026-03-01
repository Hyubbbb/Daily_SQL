WITH maxfish AS (
  SELECT 
    fi.fish_type,
    MAX(fi.length) AS length
  FROM fish_info AS fi
  GROUP BY fi.fish_type
)

SELECT 
  fi.id,
  fn.fish_name,
  fi.length
FROM fish_info AS fi
  JOIN fish_name_info AS fn
     ON fi.fish_type = fn.fish_type
  JOIN maxfish AS mf
     ON fi.fish_type = mf.fish_type
       AND fi.length = mf.length
ORDER BY fi.id
