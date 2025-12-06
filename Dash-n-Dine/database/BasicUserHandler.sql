/* User creation and deletion file */

CREATE USER 'basicUser'@'127.0.0.1';
GRANT SELECT ON dashndine.* TO 'basicUser'@'127.0.0.1';

CREATE USER 'admin'@'127.0.0.1' IDENTIFIED BY '12345';
GRANT SELECT, INSERT, UPDATE, DELETE ON dashndine.* TO 'admin'@'127.0.0.1';

CREATE USER 'developer'@'127.0.0.1' IDENTIFIED BY '123456789';
GRANT ALL PRIVILEGES ON dashndine.* TO 'developer'@'127.0.0.1';

CREATE USER 'basicUser'@'localhost';
GRANT SELECT ON dashndine.* TO 'basicUser'@'localhost';

CREATE USER 'admin'@'localhost' IDENTIFIED BY '12345';
GRANT SELECT, INSERT, UPDATE, DELETE ON dashndine.* TO 'admin'@'localhost';

CREATE USER 'developer'@'localhost' IDENTIFIED BY '123456789';
GRANT ALL PRIVILEGES ON dashndine.* TO 'developer'@'localhost';