DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100),
    salary DECIMAL(12,2),
    department VARCHAR(50)
);

DELIMITER $$

CREATE PROCEDURE sp_check_employee_income (
    IN in_name VARCHAR(100),
    IN in_salary DECIMAL(12,2)
)
BEGIN
    DECLARE income_level VARCHAR(50);

    IF in_salary >= 15000000 THEN
        SET income_level = 'Thu nhập cao';
    ELSEIF in_salary >= 8000000 THEN
        SET income_level = 'Thu nhập trung bình';
    ELSE
        SET income_level = 'Thu nhập thấp';
    END IF;

    SELECT in_name AS ten_nhan_vien,
           in_salary AS muc_luong,
           income_level AS muc_thu_nhap;
END $$

DELIMITER ;

CALL sp_check_employee_income('Nguyen Van A', 17000000);
