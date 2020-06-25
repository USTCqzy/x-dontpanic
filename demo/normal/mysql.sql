DROP DATABASE DFS;
CREATE SCHEMA DFS;

use DFS;

CREATE TABLE `DEVICE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IP` char(20) NOT NULL DEFAULT '',
  `PORT` int NOT NULL DEFAULT 0,
  `ISONLINE` boolean NOT NULL,
  `RS` int NULL DEFAULT 0 ,
  `TIME` int NULL DEFAULT 0 ,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `FRAGMENT` (
  `ID` int NOT NULL,
  `PATH` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `FILE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` char(50) NOT NULL DEFAULT '',
  `PATH` char(60) NOT NULL DEFAULT '',
  `ATTRIBUTE` char(10) NOT NULL DEFAULT 'rwxrwxrwx',
  `TIME` char(10) NOT NULL DEFAULT '',
  `NOD` int NOT NULL DEFAULT 1,
  `NOA` int NOT NULL DEFAULT 0,
  `ISFOLDER` boolean NOT NULL DEFAULT false,
  `WHOSE` char(20) NOT NULL DEFAULT '',
  `FILETYPE` char(20) NOT NULL DEFAULT '',
  `FILESIZE` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `REQUEST` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TYPE` int NOT NULL DEFAULT 0,
  `FRAGMENTID` int NOT NULL DEFAULT 0,
  `DEVICEID` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `USER` (
`ID` int NOT NULL AUTO_INCREMENT,
`NAME` char(20) NOT NULL UNIQUE DEFAULT '',
`PASSWD` char(20) NOT NULL DEFAULT '',
`URIS` varchar(1000) NOT NULL DEFAULT '',
PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `GROUP_ROLE` (
`ID` int NOT NULL AUTO_INCREMENT,
`NAME` char(20) NOT NULL UNIQUE DEFAULT '',
`URIS` varchar(1000) NOT NULL DEFAULT '',
PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `USER_GROUP` (
`ID` int NOT NULL AUTO_INCREMENT,
`GID` int NOT NULL DEFAULT '0',
PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE UNIQUE INDEX `idx_FILE_PATH_NAME`  ON `DFS`.`FILE` (PATH, NAME) COMMENT '' ALGORITHM DEFAULT LOCK DEFAULT;

CREATE UNIQUE INDEX `idx_USER_NAME`  ON `DFS`.`USER` (NAME) COMMENT '' ALGORITHM DEFAULT LOCK DEFAULT;

INSERT INTO `FILE` VALUES (9, '1.txt', 'TIM/hello/', 'rw-r--r--', '20170420', 5,0, false, 'xixi','txt',0);

INSERT INTO `FILE` VALUES (10, '2.txt', 'TIM/hello/', 'rw-r--r--', '20170421', 3, 0,false, 'xixi','txt',0);

INSERT INTO `FILE` VALUES (11, '3', 'TIM/hello/', 'rwxr-xr-x', '20170421', 5, 0,true, 'xixi','',0);

INSERT INTO `FILE` VALUES (12, '4.txt', '233/hi/', 'rw-r--r--', '20170421', 5, 0,false, 'haha','txt',0);

INSERT INTO `FILE` VALUES (1, 'TIM', '/', 'rwxrwxrwx', '20170419', 0,0, true, 'xixi','',0);

INSERT INTO `FILE` VALUES (4, '233', '/', 'rwxrwxrwx', '20170419', 0,0, true, 'haha','',0);

INSERT INTO `FILE` VALUES (2, 'hi', '233/', 'rwxrwxrwx', '20170419', 0,0, true, 'haha','',0);

INSERT INTO `FILE` VALUES (3, 'hello', 'TIM/', 'rwxrwxrwx', '20170419', 0,0, true, 'xixi','',0);

INSERT INTO `FILE` VALUES (5, 'test.txt', '/', 'rwxrwxrwx', '20170419', 1,0, false, 'xixi','txt',8);
INSERT INTO `FILE` VALUES (6, 'test.jpg', '/', 'rwxrwxrwx', '20170419', 1,0, false, 'xixi','jpg',74347);

INSERT INTO FRAGMENT VALUES (500, '1');

INSERT INTO FRAGMENT VALUES (600, '1');

INSERT INTO `DEVICE` VALUES (1, '127.0.0.1', 9998, true, 10, 33554431);

INSERT INTO `DEVICE` VALUES (2, '1.2.3.4', 2111, true, 20, 0);

INSERT INTO `DEVICE` VALUES (3, '8.8.8.9', 2560, false, 21, 0);

INSERT INTO `DEVICE` VALUES (4, '11.12.13.14', 2480, false, 22, 0);

INSERT INTO `DEVICE` VALUES (5, '11.87.13.33', 5556, false, 30, 0);

INSERT INTO `DEVICE` VALUES (6, '121.37.233.322', 5012, false, 40, 0);

INSERT INTO `USER` VALUES (1, 'xixi', '123456', 'xixi');

INSERT INTO `USER` VALUES (2, 'haha', '888888', 'haha');

INSERT INTO `USER` VALUES (3, 'huhu', '520520', 'huhu');

GRANT ALL PRIVILEGES ON *.* TO 'root'@'127.0.0.1' IDENTIFIED BY 'root';