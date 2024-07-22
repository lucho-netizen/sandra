CREATE DATABASE  IF NOT EXISTS `cancer` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cancer`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: cancer
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `atributos`
--

DROP TABLE IF EXISTS `atributos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atributos` (
  `id_atributo` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_atributo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atributos`
--

LOCK TABLES `atributos` WRITE;
/*!40000 ALTER TABLE `atributos` DISABLE KEYS */;
/*!40000 ALTER TABLE `atributos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atributoxuser`
--

DROP TABLE IF EXISTS `atributoxuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atributoxuser` (
  `id_atributoxuser` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `id_atributo` int DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_atributoxuser`),
  KEY `id_user` (`id_user`),
  KEY `id_atributo` (`id_atributo`),
  CONSTRAINT `atributoxuser_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_user`),
  CONSTRAINT `atributoxuser_ibfk_2` FOREIGN KEY (`id_atributo`) REFERENCES `atributos` (`id_atributo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atributoxuser`
--

LOCK TABLES `atributoxuser` WRITE;
/*!40000 ALTER TABLE `atributoxuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `atributoxuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostico`
--

DROP TABLE IF EXISTS `diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_role` int DEFAULT NULL,
  `id_sintomas` int NOT NULL,
  `id_estado` int DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `id_resultado` int DEFAULT NULL,
  `fecha_examen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id_paciente` (`id`),
  KEY `idx_id_sintomas` (`id_sintomas`),
  KEY `diagnostico_ibfk_1_idx` (`id_user`),
  KEY `diagnostico_ibfk_2_idx` (`id_resultado`),
  CONSTRAINT `diagnostico_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `diagnostico_ibfk_2` FOREIGN KEY (`id_resultado`) REFERENCES `resultados` (`id_resultado`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostico`
--

LOCK TABLES `diagnostico` WRITE;
/*!40000 ALTER TABLE `diagnostico` DISABLE KEYS */;
INSERT INTO `diagnostico` VALUES (23,1,1,1,1,30,1,'2024-07-21 10:00:00'),(24,2,2,2,2,25,2,'2024-07-21 11:00:00'),(25,3,1,3,1,40,3,'2024-07-21 12:00:00'),(26,4,2,1,2,35,1,'2024-07-21 13:00:00'),(27,5,1,4,1,22,2,'2024-07-21 14:00:00'),(28,6,2,2,2,50,3,'2024-07-21 15:00:00'),(29,7,1,5,1,28,1,'2024-07-21 16:00:00'),(30,8,2,3,2,45,2,'2024-07-21 17:00:00'),(31,9,1,1,1,33,3,'2024-07-21 18:00:00'),(32,10,2,4,2,29,1,'2024-07-21 19:00:00');
/*!40000 ALTER TABLE `diagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `estado_id` int NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`estado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (0,'disponible'),(1,'registrado');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultados`
--

DROP TABLE IF EXISTS `resultados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultados` (
  `id_resultado` int NOT NULL AUTO_INCREMENT,
  `nombre_resultado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_resultado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultados`
--

LOCK TABLES `resultados` WRITE;
/*!40000 ALTER TABLE `resultados` DISABLE KEYS */;
INSERT INTO `resultados` VALUES (1,'Tiene Cáncer'),(2,'No Tiene'),(3,'Tal Vez');
/*!40000 ALTER TABLE `resultados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_role` int NOT NULL,
  `role_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'paciente'),(2,'administrador');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sintomas`
--

DROP TABLE IF EXISTS `sintomas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sintomas` (
  `id_sintomas` int NOT NULL AUTO_INCREMENT,
  `sintoma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_sintomas`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sintomas`
--

LOCK TABLES `sintomas` WRITE;
/*!40000 ALTER TABLE `sintomas` DISABLE KEYS */;
INSERT INTO `sintomas` VALUES (1,'enrojecimiento'),(2,'sangrado'),(3,'abultamiento'),(4,'dolor'),(5,'fatiga'),(6,'pérdida de peso');
/*!40000 ALTER TABLE `sintomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sintomasxuser`
--

DROP TABLE IF EXISTS `sintomasxuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sintomasxuser` (
  `id_sintomasxuser` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_sintomas` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_sintomasxuser`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `sintomasxuser_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sintomasxuser`
--

LOCK TABLES `sintomasxuser` WRITE;
/*!40000 ALTER TABLE `sintomasxuser` DISABLE KEYS */;
INSERT INTO `sintomasxuser` VALUES (1,1,1,NULL,NULL),(2,2,2,NULL,NULL),(3,3,3,NULL,NULL),(4,4,1,NULL,NULL),(5,5,4,NULL,NULL),(6,6,2,NULL,NULL),(7,7,5,NULL,NULL),(8,8,3,NULL,NULL),(9,9,1,NULL,NULL),(10,10,4,NULL,NULL),(16,1,1,NULL,NULL),(17,2,2,NULL,NULL),(18,3,3,NULL,NULL),(19,4,1,NULL,NULL),(20,5,4,NULL,NULL),(21,6,2,NULL,NULL),(22,7,5,NULL,NULL),(23,8,3,NULL,NULL),(24,9,1,NULL,NULL),(25,10,4,NULL,NULL);
/*!40000 ALTER TABLE `sintomasxuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `googleId` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `celular` int DEFAULT NULL,
  `identificacion` int unsigned DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `peso` int DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_role` int DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `estado` int DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `googleId` (`googleId`),
  KEY `id_role` (`id_role`),
  KEY `usuario_ibfk_2_idx` (`estado`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`estado`) REFERENCES `estado` (`estado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,NULL,'wew','ewewe','TI',232323,1212,1,1,'112@i.com','112@i.com',1,'2024-02-17 07:20:22',0),(2,NULL,'admin','admin','CC',2345678,345678,0,0,'admin@i.com','admin@i.com',2,'2024-02-17 07:20:22',1),(3,NULL,'wewewe','ewew','',1222,34343434,20,30,'jhdua@xxx.com','jhdua@xxx.com1',1,'2024-02-17 07:20:22',1),(4,NULL,'wewewe','ewew','',1222,34343434,20,30,'jhdua@xxx.com','jhdua@xxx.com1',1,'2024-02-17 07:20:22',1),(5,NULL,'afvac','acaga','',4353,6565656,21,35,'jhdfas@xxx.com','jhdfas@xxx.com1',1,'2024-02-17 07:20:22',1),(6,NULL,'afvac','acaga','',4353,6565656,21,35,'jhdfas@xxx.com','jhdfas@xxx.com1',1,'2024-02-17 07:20:22',1),(7,NULL,'Luis','Jose','CC',NULL,NULL,12,12,NULL,'ser@i.com',2,'2024-07-19 01:19:35',1),(8,NULL,'pepa','pig','CC',5676567,NULL,37,3,NULL,'sero@i.com',1,'2024-07-19 01:25:18',1),(9,NULL,'Luisa','Jose','TI',NULL,NULL,121,121,'sero@i.como','sero@i.como',1,'2024-07-19 01:34:18',1),(10,NULL,'maria','jose','CC',5775688,12121,24,60,'zero@i.como','zero@i.como',1,'2024-07-19 01:37:18',1),(11,'111067985651154348053','Luis J','No Last Name','Unknown',0,0,0,0,'lj534974@gmail.com','null',1,'2024-07-20 15:10:31',1),(12,'101408401025399466563','Brayner Perez','No Last Name','Unknown',0,0,0,0,'perezbrayner80@gmail.com','null',1,'2024-07-20 15:11:35',1),(15,NULL,'senso','je32','CC',4567,987654,100,100,'perro@i.com','perro@i.com',1,'2024-07-20 16:02:00',1),(16,NULL,'SSSS','Jose','CC',32275853,6,66,66,'ad@i.com','ad@i.com',1,'2024-07-21 01:00:48',1),(17,NULL,'Luis','Jose','CC',32275853,65,1,1,'000@i.com','000@i.com',1,'2024-07-21 01:03:38',1),(18,NULL,'Marco','Aurelio','CC',111111,1111,30,70,'mc01@i.com','mc01@i.com',1,'2024-07-21 01:05:56',1),(19,'110517487857321375806','IngEso','No Last Name','CC',0,0,0,0,'i7695979@gmail.com','null',1,'2024-07-21 01:07:23',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cancer'
--
/*!50003 DROP PROCEDURE IF EXISTS `ps_diagnostico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ps_diagnostico`()
BEGIN
SELECT 
    u.nombre,
    d.edad,
    d.id_role,
	r.nombre_resultado,
    s.sintoma,
    d.id_estado,
    d.fecha_examen
FROM 
    diagnostico d
INNER JOIN 
    resultados r ON d.id_resultado = r.id_resultado INNER join sintomas s on s.id_sintomas = d.id_sintomas inner join usuario u on u.id_user = d.id_user;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sintomasxuser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sintomasxuser`()
BEGIN
    INSERT INTO sintomasxuser (id_user, id_sintomas)
    SELECT 
        d.id_user,
        d.id_sintomas
    FROM 
        diagnostico d;
        -- Mostrar el contenido de la tabla sintomasxuser
    SELECT * FROM sintomasxuser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-21 16:23:22
