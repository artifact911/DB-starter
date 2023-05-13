ALTER TABLE IF EXISTS employee
    ADD COLUMN gender INT;

UPDATE employee
SET gender = 0
WHERE id > 5;

UPDATE employee
SET gender = 1
WHERE id <= 5;

ALTER TABLE employee
    ALTER COLUMN gender SET NOT NULL;

ALTER TABLE employee
DROP COLUMN gender;