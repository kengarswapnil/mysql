trigger



CREATE TABLE audit_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    action VARCHAR(50),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER after_student_update
AFTER UPDATE ON students
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (student_id, action)
    VALUES (OLD.student_id, 'Updated');
END $$

DELIMITER ;
