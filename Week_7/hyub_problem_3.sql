-- https://www.hackerrank.com/challenges/draw-the-triangle-1/problem?isFullScreen=true

DELIMITER $$

CREATE PROCEDURE repeat_numbers()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 20 DO
        SELECT REPEAT('* ', 20-i+1);
        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;

CALL repeat_numbers();
