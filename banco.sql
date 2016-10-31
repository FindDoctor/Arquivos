/*
Navicat MySQL Data Transfer

Source Server         : PDS
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : banco

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2016-10-31 20:08:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for avalia
-- ----------------------------
DROP TABLE IF EXISTS `avalia`;
CREATE TABLE `avalia` (
  `paciente_cpf` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `crm` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comentarios` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nota` int(11) NOT NULL,
  PRIMARY KEY (`paciente_cpf`),
  KEY `avalia_crm_foreign` (`crm`),
  CONSTRAINT `avalia_crm_foreign` FOREIGN KEY (`crm`) REFERENCES `medicos` (`crm`) ON DELETE CASCADE,
  CONSTRAINT `avalia_paciente_cpf_foreign` FOREIGN KEY (`paciente_cpf`) REFERENCES `pacientes` (`cpf`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of avalia
-- ----------------------------

-- ----------------------------
-- Table structure for consulta
-- ----------------------------
DROP TABLE IF EXISTS `consulta`;
CREATE TABLE `consulta` (
  `consultorio_id` int(10) unsigned NOT NULL,
  `medico_crm` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `paciente_cpf` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hora` time NOT NULL,
  `data` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`medico_crm`,`paciente_cpf`,`consultorio_id`),
  KEY `consulta_consultorio_id_foreign` (`consultorio_id`),
  KEY `consulta_paciente_cpf_foreign` (`paciente_cpf`),
  CONSTRAINT `consulta_consultorio_id_foreign` FOREIGN KEY (`consultorio_id`) REFERENCES `consultorio` (`id_consultorio`) ON DELETE CASCADE,
  CONSTRAINT `consulta_medico_crm_foreign` FOREIGN KEY (`medico_crm`) REFERENCES `medicos` (`crm`) ON DELETE CASCADE,
  CONSTRAINT `consulta_paciente_cpf_foreign` FOREIGN KEY (`paciente_cpf`) REFERENCES `pacientes` (`cpf`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of consulta
-- ----------------------------

-- ----------------------------
-- Table structure for consultorio
-- ----------------------------
DROP TABLE IF EXISTS `consultorio`;
CREATE TABLE `consultorio` (
  `id_consultorio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `medico_crm` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefone` int(11) NOT NULL,
  `cep` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `endereco` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numero` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `complemento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bairro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cidade` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_consultorio`),
  KEY `consultorio_medico_crm_foreign` (`medico_crm`),
  CONSTRAINT `consultorio_medico_crm_foreign` FOREIGN KEY (`medico_crm`) REFERENCES `medicos` (`crm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of consultorio
-- ----------------------------

-- ----------------------------
-- Table structure for convenio
-- ----------------------------
DROP TABLE IF EXISTS `convenio`;
CREATE TABLE `convenio` (
  `id_convenio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_convenio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of convenio
-- ----------------------------

-- ----------------------------
-- Table structure for especialidade
-- ----------------------------
DROP TABLE IF EXISTS `especialidade`;
CREATE TABLE `especialidade` (
  `id_especialidade` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_especialidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of especialidade
-- ----------------------------

-- ----------------------------
-- Table structure for medicos
-- ----------------------------
DROP TABLE IF EXISTS `medicos`;
CREATE TABLE `medicos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crm` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cep` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `endereco` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numero` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `complemento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bairro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cidade` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `medicos_crm_unique` (`crm`),
  UNIQUE KEY `medicos_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of medicos
-- ----------------------------
INSERT INTO `medicos` VALUES ('1', '73413', 'Luiz Marcelo Aiello Viarengo', 'drluizmarcel@gmail.com', null, '1145864444', '13208056', 'Av Nove de Julho', '1717', 'Conj 42 Ed Saint Georges', 'Vila Boaventura', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('2', '26195', 'Marco Antonio Herculano', 'drmarcoantonio@gmail.com', null, '1145834776', '13209000', 'Rua do Retiro', '424', null, 'Vila Virginia', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('3', '96233', 'Fábio Luis Fujita', 'drfabioluis@gmail.com', null, '1144970651', '13201843', 'Av Antonio Segre', '333', null, 'Jardim Brasil', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('4', '83762', 'Elizeu de Sousa Santos', 'drelizeu@gmail.com', null, '1198367886', '13208761', 'Rua Barão de Teffé', '1000', '2 andar, sala 21', 'Jardim Ana Maria', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('5', '88579', 'João Carlos Gonzalez Gonzalez', 'drjoao@gmail.com', null, '1145869288', '13207130', 'Rua Atilio Vianelo', '310', null, 'Vianelo', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('6', '63151', 'João Augusto Fernandes Gonçalves', 'drjoaoaugusto@gmail.com', null, '1145227237', '13208140', 'Rua Abilio Figueiredo', '92', null, 'Anhangabau', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('7', '113297', 'Pedro Guilherme Meinberg', 'drpedro@gmail.com', null, '1145213155', '13209000', 'Rua do Retiro', '432', null, 'Anhangabau', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('8', '67787', 'Wilson Scappini Junior', 'drwilson@gmail.com', null, '1145230595', '13201098', 'Rua Vasco da Gama', '23', null, 'Vila Municipal', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('9', '137141', 'Eder Deivis Fistarol', 'dreder@gmail.com', null, '1148071024', '13201838', 'Rua Sócrates Fernandes de Oliveira', '45', null, 'Chacara Urbana', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('10', '115386', 'Luciano Takenori Nishimaru', 'drluciano@gmail.com', null, '1145213155', '13208761', 'Rua Barão de Teffé', '1000', 'sala 52', 'Jardim Ana Maria', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('11', '98709', 'José Antônio Ustra Zaquia Alam', 'drjose@gmail.com', null, '1145834776', '13209000', 'Rua do Retiro', '424', null, 'Vila Virginia', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('12', '102002', 'Alessandro Nakanishi Bastos', 'dralessandro@gmail.com', null, '1148071024', '13200000', 'Rua Socrates Fernandes de Oliveira', '45', null, 'Chacara Urbana', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('13', '66463', 'Maurício Baldissin', 'drmauricio@gmail.com', null, '1145217121', '13208760', 'Rua Barão de Teffe', '160', null, 'Anhangabau', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('14', '104139', 'Patricia Ferreira de Carvalho', 'drapatricia@gmail.com', null, '1148072240', '13208060', 'Av Amadeu Ribeiro', '265', null, 'Anhangabau', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('15', '124262', 'Erika Vick Fernandes Gomes', 'draerika@gmail.com', null, '11984974855', '13201796', 'Rua Ademar Pereira de Barros', '21', null, 'Centro', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('16', '129483', 'Camila de Melo Campos', 'dracamila@gmail.com', null, '1148072240', '13208060', 'Av Amadeu Ribeiro', '265', null, 'Anhangabau', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('17', '79998', 'Marcelo Brancalhao Tojar', 'drmarcelo@gmail.com', null, '1148052700', '13201043', 'Rua Conrado Augusto Offa', '80', null, 'Chacara Urbana', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('18', '108576', 'Lauro Schledorn de Camargo', 'drlauro@gmail.com', null, '11944450022', '13208056', 'Av 9 de julho', '2575', null, 'Anhangabau', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('19', '26252', 'Edmir Américo Lourenço', 'dredmir@gmail.com', null, '1145211697', '13209000', 'Rua do Retiro', '424', null, 'Vilia VIirginia', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('20', '114657', 'Alexandre Cabral Zilli', 'dralexandre@gmail.com', null, '1145261837', '13206810', 'Rua Portugal', '295', null, 'Jardim Cica', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('21', '108742', 'Maurilio Jorge Cruz Junior', 'drmaurilio@gmail.com', null, '1128162705', '13207270', 'Rua Bom Jesus de Pirapora', '315', null, 'Vianelo', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('22', '139810', 'Roberto Giordano', 'drroberto@gmail.com', null, '1148072240', '13208060', 'Rua Amadeu Ribeiro', '265', null, 'Anhangabau', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('23', '147503', 'Marcella Ledo Martins Costa', 'dramarcela@gmail.com', null, '1144970033', '13201796', 'Av 9 de julho', '32', null, 'Anhangabau', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('24', '116494', 'Bianca Zanchetta Buani Miguel', 'drabianca@gmail.com', null, '1145214798', '13209090', 'Rua Eduardo Tomanik', '900', null, 'Chacara Urbana', 'Jundiai', 'SP', null, null, null, null);
INSERT INTO `medicos` VALUES ('25', '140984', 'Elias Flato', 'drelias@gmail.com', null, '11940130333', '13207060', 'Rua Conde de Monsanto', '483', null, 'Vianelo', 'Jundiai', 'SP', null, null, null, null);

-- ----------------------------
-- Table structure for medico_convenio
-- ----------------------------
DROP TABLE IF EXISTS `medico_convenio`;
CREATE TABLE `medico_convenio` (
  `convenio_id` int(10) unsigned NOT NULL,
  `medico_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`convenio_id`),
  KEY `medico_convenio_medico_id_foreign` (`medico_id`),
  CONSTRAINT `medico_convenio_convenio_id_foreign` FOREIGN KEY (`convenio_id`) REFERENCES `convenio` (`id_convenio`) ON DELETE CASCADE,
  CONSTRAINT `medico_convenio_medico_id_foreign` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of medico_convenio
-- ----------------------------

-- ----------------------------
-- Table structure for medico_especialidade
-- ----------------------------
DROP TABLE IF EXISTS `medico_especialidade`;
CREATE TABLE `medico_especialidade` (
  `especialidade_id` int(10) unsigned NOT NULL,
  `medico_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`especialidade_id`),
  KEY `medico_especialidade_medico_id_foreign` (`medico_id`),
  CONSTRAINT `medico_especialidade_especialidade_id_foreign` FOREIGN KEY (`especialidade_id`) REFERENCES `especialidade` (`id_especialidade`) ON DELETE CASCADE,
  CONSTRAINT `medico_especialidade_medico_id_foreign` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of medico_especialidade
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2016_10_05_210909_create_medicos_table', '1');
INSERT INTO `migrations` VALUES ('2016_10_05_210933_create_pacientes_table', '1');
INSERT INTO `migrations` VALUES ('2016_10_05_211108_create_consultorio_table', '1');
INSERT INTO `migrations` VALUES ('2016_10_05_211206_create_convenio_table', '1');
INSERT INTO `migrations` VALUES ('2016_10_05_211357_create_especialidade_table', '1');
INSERT INTO `migrations` VALUES ('2016_10_05_211618_create_consulta_table', '1');
INSERT INTO `migrations` VALUES ('2016_10_05_222137_create_avalia_table', '1');
INSERT INTO `migrations` VALUES ('2016_10_15_015136_medico_especialidade', '1');
INSERT INTO `migrations` VALUES ('2016_10_15_022944_medico_convenio', '1');
INSERT INTO `migrations` VALUES ('2016_10_17_132332_create_social_accounts_table', '1');

-- ----------------------------
-- Table structure for pacientes
-- ----------------------------
DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE `pacientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cpf` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cep` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `endereco` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numero` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `complemento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bairro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cidade` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pacientes_cpf_unique` (`cpf`),
  UNIQUE KEY `pacientes_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pacientes
-- ----------------------------

-- ----------------------------
-- Table structure for social_accounts
-- ----------------------------
DROP TABLE IF EXISTS `social_accounts`;
CREATE TABLE `social_accounts` (
  `user_id` int(11) NOT NULL,
  `provider_user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of social_accounts
-- ----------------------------
