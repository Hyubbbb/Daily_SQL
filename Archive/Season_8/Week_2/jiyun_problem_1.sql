SELECT unique_id, name
FROM employees E1
    LEFT JOIN employeeuni E2
        ON E1.id = E2.id
