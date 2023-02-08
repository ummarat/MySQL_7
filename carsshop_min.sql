-- Завдання 5
USE carsshop;

DELIMITER |
CREATE FUNCTION AverageAge()
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
	RETURN (SELECT MIN(age) 
	FROM clients);
END
| 

SELECT AverageAge(); |

SELECT name, age as min_age, (SELECT model FROM cars
WHERE id = (SELECT car_id FROM orders
			WHERE orders.client_id = clients.id ))  AS model,
           
           (SELECT mark FROM marks
WHERE id = (select mark_id from cars WHERE cars.mark_id = (SELECT car_id FROM orders
			WHERE orders.client_id = clients.id ))) as mark 

from clients WHERE age = min_age();