-- BONUS: SQL Trigger to log changes made to the Orders table
-- This is an advanced feature added to demonstrate SQL trigger usage.

-- Step 1: Create an audit table to track changes
CREATE TABLE Order_Audit (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    old_quantity INT,
    new_quantity INT,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Step 2: Create a trigger that logs changes when quantity is updated in Orders
DELIMITER $$

CREATE TRIGGER log_order_update
AFTER UPDATE ON Orders
FOR EACH ROW
BEGIN
    -- Log the order update only if quantity has changed
    IF OLD.quantity <> NEW.quantity THEN
        INSERT INTO Order_Audit (order_id, old_quantity, new_quantity)
        VALUES (OLD.order_id, OLD.quantity, NEW.quantity);
    END IF;
END$$

DELIMITER ;