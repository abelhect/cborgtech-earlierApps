
CREATE SCHEMA `toasthub_client1` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
CREATE SCHEMA `toasthub_client2` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
CREATE SCHEMA `cthreat_client1` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
CREATE SCHEMA `cthreat_main` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
CREATE SCHEMA `toasthub_main` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;

CREATE USER 'cyborg'@'localhost' IDENTIFIED BY 'c7b8rg';
GRANT ALL PRIVILEGES ON *.* TO 'cyborg'@'localhost' WITH GRANT OPTION;

CREATE USER 'cyborg'@'%' IDENTIFIED BY 'c7b8rg';
GRANT ALL PRIVILEGES ON *.* TO 'cyborg'@'%' WITH GRANT OPTION;

CREATE USER 'toasthub'@'localhost' IDENTIFIED BY 'T0asth3b#';
GRANT SELECT,INSERT,UPDATE,DELETE ON toasthub_main.* TO 'toasthub'@'localhost';
GRANT SELECT,INSERT,UPDATE,DELETE ON toasthub_client1.* TO 'toasthub'@'localhost';
GRANT SELECT,INSERT,UPDATE,DELETE ON toasthub_client2.* TO 'toasthub'@'localhost';
GRANT SELECT,INSERT,UPDATE,DELETE ON cthreat_main.* TO 'toasthub'@'localhost';
GRANT SELECT,INSERT,UPDATE,DELETE ON cthreat_client1.* TO 'toasthub'@'localhost';

FLUSH PRIVILEGES;


