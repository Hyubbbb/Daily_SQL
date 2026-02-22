WITH max_length AS (
  SELECT
    fish_type,
    MAX(length) AS length
  FROM fish_info
  GROUP BY fish_type
)
SELECT
  fi.id AS ID,
  fni.fish_name AS fish_name,
  fi.length AS length
FROM fish_info AS fi
  JOIN max_length AS ml
    ON fi.fish_type = ml.fish_type
    AND fi.length = ml.length
  JOIN fish_name_info AS fni
    ON fi.fish_type = fni.fish_type
ORDER BY fi.id;
