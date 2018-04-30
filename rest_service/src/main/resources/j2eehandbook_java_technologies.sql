-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: 127.0.0.1    JavaEETechnologyDatabase: j2eehandbook
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `java_technologies`
--

DROP TABLE IF EXISTS `java_technologies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `java_technologies` (
  `tech_id` int(11) NOT NULL AUTO_INCREMENT,
  `tech_name` varchar(10) NOT NULL,
  `versions` int(11) NOT NULL,
  `description` text,
  PRIMARY KEY (`tech_id`),
  UNIQUE KEY `java_technologies_tech_name_uindex` (`tech_name`),
  KEY `java_technologies_used_versions_used_versions_id_fk` (`versions`),
  KEY `java_technologies_tech_name_index` (`tech_name`),
  CONSTRAINT `java_technologies_used_versions_used_versions_id_fk` FOREIGN KEY (`versions`) REFERENCES `used_versions` (`used_versions_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `java_technologies`
--

LOCK TABLES `java_technologies` WRITE;
/*!40000 ALTER TABLE `java_technologies` DISABLE KEYS */;
INSERT INTO `java_technologies` (`tech_id`, `tech_name`, `versions`, `description`) VALUES (2,'EJB',1,'Enterprise JavaBeans (EJB) is one of several Java APIs for modular construction of enterprise software. EJB is a server-side software component that encapsulates business logic of an application. An EJB web container provides a runtime environment for web related software components, including computer security, Java servlet lifecycle management, transaction processing, and other web services. The EJB specification is a subset of the Java EE specification.');
INSERT INTO `java_technologies` (`tech_id`, `tech_name`, `versions`, `description`) VALUES (3,'JavaMail',8,'JavaMail is a Java API used to send and receive email via SMTP, POP3 and IMAP. JavaMail is built into the Java EE platform, but also provides an optional package for use in Java SE.');
INSERT INTO `java_technologies` (`tech_id`, `tech_name`, `versions`, `description`) VALUES (4,'JAX-WS',6,'The Java API for XML Web Services (JAX-WS) is a Java programming language API for creating web services');
INSERT INTO `java_technologies` (`tech_id`, `tech_name`, `versions`, `description`) VALUES (5,'JNDI',88,'The Java Naming and Directory Interface (JNDI) is a Java API for a directory service that allows Java software clients to discover and look up data and objects via a name. Like all Java APIs that interface with host systems, JNDI is independent of the underlying implementation. Additionally, it specifies a service provider interface (SPI) that allows directory service implementations to be plugged into the framework.[1] It may make use of a server, a flat file, or a database; the choice is up to the vendor.');
INSERT INTO `java_technologies` (`tech_id`, `tech_name`, `versions`, `description`) VALUES (6,'JPA',4,'The Java Persistence API (JPA) is a Java application programming interface specification that describes the management of relational data in applications using Java Platform, Standard Edition and Java Platform, Enterprise Edition.');
INSERT INTO `java_technologies` (`tech_id`, `tech_name`, `versions`, `description`) VALUES (7,'JSP',2,'JavaServer Pages (JSP) is a technology that helps software developers create dynamically generated web pages based on HTML, XML, or other document types. Released in 1999 by Sun Microsystems, JSP is similar to PHP and ASP, but it uses the Java programming language.');
INSERT INTO `java_technologies` (`tech_id`, `tech_name`, `versions`, `description`) VALUES (8,'JSTL',90,'The JavaServer Pages Standard Tag Library (JSTL) is a component of the Java EE Web application development platform. It extends the JSP specification by adding a tag library of JSP tags for common tasks, such as XML data processing, conditional execution, database access, loops and internationalization.');
INSERT INTO `java_technologies` (`tech_id`, `tech_name`, `versions`, `description`) VALUES (9,'Servlet',3,'A Java servlet is a Java program that extends the capabilities of a server. Although servlets can respond to any types of requests, they most commonly implement applications hosted on Web servers. Such Web servlets are the Java counterpart to other dynamic Web content technologies such as PHP and ASP.NET.');
INSERT INTO `java_technologies` (`tech_id`, `tech_name`, `versions`, `description`) VALUES (10,'WebSocket',86,'WebSocket is a computer communications protocol, providing full-duplex communication channels over a single TCP connection. The WebSocket protocol was standardized by the IETF as RFC 6455 in 2011, and the WebSocket API in Web IDL is being standardized by the W3C. WebSocket is a different TCP protocol from HTTP. Both protocols are located at layer 7 in the OSI model and, as such, depend on TCP at layer 4. Although they are different, RFC 6455 states that WebSocket is designed to work over HTTP ports 80 and 443 as well as to support HTTP proxies and intermediaries thus making it compatible with the HTTP protocol. To achieve compatibility, the WebSocket handshake uses the HTTP Upgrade header to change from the HTTP protocol to the WebSocket protocol.');
INSERT INTO `java_technologies` (`tech_id`, `tech_name`, `versions`, `description`) VALUES (11,'CDI',10,'The ability to bind the lifecycle and interactions of stateful components to well-defined but extensible lifecycle contexts.');
/*!40000 ALTER TABLE `java_technologies` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tr_j2eehandbook_bi
  before INSERT
  on java_technologies
  for each row
  BEGIN
    IF NEW.tech_name = '' THEN
      SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Blank value on j2eehandbook.tech_name';
    END IF;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
# /*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tr_j2eehandbook_bd
#   after DELETE
#   on java_technologies
#   for each row
#   BEGIN
#     DECLARE v_count int;
#
#     SELECT count(*)
#     FROM java_technologies
#     WHERE versions = OLD.versions
#     GROUP BY versions
#     INTO v_count;
#
#     IF v_count IS NULL THEN
#       DELETE FROM used_versions
#       WHERE used_versions_id = OLD.versions;
#     END IF ;
#   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `used_versions`
--

DROP TABLE IF EXISTS `used_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `used_versions` (
  `used_versions_id` int(11) NOT NULL AUTO_INCREMENT,
  `java_4` varchar(6) DEFAULT NULL,
  `java_5` varchar(6) DEFAULT NULL,
  `java_6` varchar(6) DEFAULT NULL,
  `java_7` varchar(6) DEFAULT NULL,
  `java_8` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`used_versions_id`),
  UNIQUE KEY `used_versions_j2ee_v1_4_java_5_java_6_java_7_java_8_pk` (`java_4`,`java_5`,`java_6`,`java_7`,`java_8`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `used_versions`
--

LOCK TABLES `used_versions` WRITE;
/*!40000 ALTER TABLE `used_versions` DISABLE KEYS */;
INSERT INTO `used_versions` (`used_versions_id`, `java_4`, `java_5`, `java_6`, `java_7`, `java_8`) VALUES (10,NULL,NULL,'1.0','1.1','2.0');
INSERT INTO `used_versions` (`used_versions_id`, `java_4`, `java_5`, `java_6`, `java_7`, `java_8`) VALUES (4,NULL,'1.0','2.0','2.1','2.2');
INSERT INTO `used_versions` (`used_versions_id`, `java_4`, `java_5`, `java_6`, `java_7`, `java_8`) VALUES (86,'','','','1.0','1.1');
INSERT INTO `used_versions` (`used_versions_id`, `java_4`, `java_5`, `java_6`, `java_7`, `java_8`) VALUES (90,'','1.2','1.2','1.2','1.2');
INSERT INTO `used_versions` (`used_versions_id`, `java_4`, `java_5`, `java_6`, `java_7`, `java_8`) VALUES (126,'1','2','3','','5');
INSERT INTO `used_versions` (`used_versions_id`, `java_4`, `java_5`, `java_6`, `java_7`, `java_8`) VALUES (6,'1.0','1.1','1.2','2.2','2.2');
INSERT INTO `used_versions` (`used_versions_id`, `java_4`, `java_5`, `java_6`, `java_7`, `java_8`) VALUES (88,'1.2','1.2','1.2','','');
INSERT INTO `used_versions` (`used_versions_id`, `java_4`, `java_5`, `java_6`, `java_7`, `java_8`) VALUES (8,'1.2','1.4','1.4','1.5','1.6');
INSERT INTO `used_versions` (`used_versions_id`, `java_4`, `java_5`, `java_6`, `java_7`, `java_8`) VALUES (2,'2.0','2.1','2.2','2.3','2.3');
INSERT INTO `used_versions` (`used_versions_id`, `java_4`, `java_5`, `java_6`, `java_7`, `java_8`) VALUES (1,'2.1','3.0','3.1','3.2','3.3');
INSERT INTO `used_versions` (`used_versions_id`, `java_4`, `java_5`, `java_6`, `java_7`, `java_8`) VALUES (3,'2.4','2.5','3.0','3.1','4.0');
INSERT INTO `used_versions` (`used_versions_id`, `java_4`, `java_5`, `java_6`, `java_7`, `java_8`) VALUES (127,'asdf','fsa','fsad','asdf','fsa');
/*!40000 ALTER TABLE `used_versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-28  1:04:40
