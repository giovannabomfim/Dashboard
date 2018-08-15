-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 15-Ago-2018 às 23:47
-- Versão do servidor: 5.7.21
-- PHP Version: 7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `searchotel`
--
CREATE DATABASE IF NOT EXISTS `searchotel` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `searchotel`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_cors`
--

DROP TABLE IF EXISTS `adms_cors`;
CREATE TABLE IF NOT EXISTS `adms_cors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cor` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_cors`
--

INSERT INTO `adms_cors` (`id`, `nome`, `cor`, `created`, `modified`) VALUES
(1, 'Azul', 'primary', '2018-06-21 00:00:00', NULL),
(2, 'Cinza', 'secondary', '2018-06-21 00:00:00', NULL),
(3, 'Verde', 'success', '2018-06-21 00:00:00', NULL),
(4, 'Vermelho', 'danger', '2018-06-21 00:00:00', NULL),
(5, 'Laranjado', 'warning', '2018-06-21 00:00:00', NULL),
(6, 'Azul claro', 'info', '2018-06-21 00:00:00', NULL),
(7, 'Claro', 'light', '2018-06-21 00:00:00', NULL),
(8, 'Cinza escuro', 'dark', '2018-06-21 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_menus`
--

DROP TABLE IF EXISTS `adms_menus`;
CREATE TABLE IF NOT EXISTS `adms_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `icone` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ordem` int(11) NOT NULL,
  `adms_sits_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_menus`
--

INSERT INTO `adms_menus` (`id`, `nome`, `icone`, `ordem`, `adms_sits_id`, `created`, `modified`) VALUES
(1, 'Dashboard', 'fas fa-tachometer-alt', 1, 1, '2018-07-16 00:00:00', NULL),
(2, 'Usuario', 'fas fa-user', 2, 1, '2018-07-16 00:00:00', NULL),
(3, 'Menu', 'fas fa-list-ul', 3, 1, '2018-07-16 00:00:00', NULL),
(4, 'Hotel', 'far fa-building', 4, 1, '2018-07-16 00:00:00', NULL),
(5, 'Sair', 'fas fa-sign-out-alt', 5, 1, '2018-07-28 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_nivacs_pgs`
--

DROP TABLE IF EXISTS `adms_nivacs_pgs`;
CREATE TABLE IF NOT EXISTS `adms_nivacs_pgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissao` int(11) NOT NULL,
  `ordem` int(11) NOT NULL,
  `dropdown` int(11) NOT NULL,
  `lib_menu` int(11) NOT NULL DEFAULT '2',
  `adms_menu_id` int(11) NOT NULL,
  `adms_niveis_acesso_id` int(11) NOT NULL,
  `adms_pagina_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_nivacs_pgs`
--

INSERT INTO `adms_nivacs_pgs` (`id`, `permissao`, `ordem`, `dropdown`, `lib_menu`, `adms_menu_id`, `adms_niveis_acesso_id`, `adms_pagina_id`, `created`, `modified`) VALUES
(1, 1, 1, 2, 1, 1, 1, 1, '2018-06-21 00:00:00', NULL),
(2, 1, 2, 1, 1, 2, 1, 5, '2018-07-16 00:00:00', NULL),
(3, 1, 3, 1, 1, 2, 1, 6, '2018-07-28 00:00:00', NULL),
(4, 1, 4, 1, 1, 3, 1, 7, '2018-07-28 00:00:00', NULL),
(5, 1, 5, 1, 1, 3, 1, 8, '2018-07-28 00:00:00', NULL),
(6, 1, 6, 2, 1, 4, 1, 9, '2018-07-28 00:00:00', NULL),
(7, 1, 7, 2, 1, 5, 1, 4, '2018-07-28 00:00:00', NULL),
(8, 1, 8, 2, 2, 2, 1, 10, '2018-07-30 00:00:00', NULL),
(9, 1, 9, 2, 2, 2, 1, 11, '2018-07-30 00:00:00', NULL),
(10, 1, 10, 2, 2, 2, 1, 12, '2018-07-30 00:00:00', NULL),
(11, 1, 11, 2, 2, 2, 1, 13, '2018-07-30 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_niveis_acessos`
--

DROP TABLE IF EXISTS `adms_niveis_acessos`;
CREATE TABLE IF NOT EXISTS `adms_niveis_acessos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ordem` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_niveis_acessos`
--

INSERT INTO `adms_niveis_acessos` (`id`, `nome`, `ordem`, `created`, `modified`) VALUES
(1, 'Super Administrador', 1, '2018-06-21 00:00:00', '2018-06-21 00:00:00'),
(2, 'Administrador', 2, '2018-06-21 00:00:00', NULL),
(3, 'Colaborador', 3, '2018-06-21 00:00:00', NULL),
(4, 'Cliente', 4, '2018-06-21 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_paginas`
--

DROP TABLE IF EXISTS `adms_paginas`;
CREATE TABLE IF NOT EXISTS `adms_paginas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pagina` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `endereco` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `obs` text COLLATE utf8_unicode_ci,
  `keywords` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tp_pagina` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lib_publico` int(11) NOT NULL DEFAULT '2',
  `icone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depend_pg` int(11) NOT NULL DEFAULT '0',
  `adms_robot_id` int(11) NOT NULL DEFAULT '4',
  `adms_sits_pg_id` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_paginas`
--

INSERT INTO `adms_paginas` (`id`, `nome_pagina`, `endereco`, `obs`, `keywords`, `descricao`, `author`, `tp_pagina`, `lib_publico`, `icone`, `depend_pg`, `adms_robot_id`, `adms_sits_pg_id`, `created`, `modified`) VALUES
(1, 'Home', 'visualizar/home', 'Pagina home', 'home', 'Pagina home', 'sh', 'adms', 2, 'fas fa-tachometer-alt', 0, 4, 1, '2018-06-20 00:00:00', NULL),
(4, 'Sair', 'acesso/sair', 'sair do ADM', 'sair do ADM', 'sair do ADM', 'sh', 'adms', 1, 'fas fa-sign-out-alt', 0, 4, 1, '2018-06-20 00:00:00', NULL),
(2, 'Login', 'acesso/login', 'Pagina de login do adm', 'sh pagina login', 'sh pagina login', 'sh', 'adms', 1, NULL, 0, 1, 1, '2018-06-20 00:00:00', NULL),
(3, 'Validar Login', 'acesso/valida', 'validar login', 'validar login', 'validar login', 'sh', 'adms', 1, NULL, 2, 4, 1, '2018-06-20 00:00:00', NULL),
(5, 'Usuarios', 'listar/list_usuario', 'Página para listar os usuários', 'listar usuarios', 'listar usuarios', 'sh', 'adms', 2, 'fas fa-users', 0, 4, 1, '2018-07-16 00:00:00', NULL),
(6, 'Nivel de Acesso', 'listar/list_niv_aces', 'Pagina para listar nivel de acesso', 'Listar nivel de acesso', 'Listar nivel de acesso', 'sh', 'adms', 2, 'fas fa-key', 0, 4, 1, '2018-07-28 00:00:00', NULL),
(7, 'Paginas', 'listar/list_pagina', 'Pagina para listar as paginas do adm', 'Listar pagina', 'Listar pagina', 'sh', 'adms', 2, 'fas fa-file-alt', 0, 4, 1, '2018-07-28 00:00:00', NULL),
(8, 'Menu', 'listar/list_menu', 'Pagina para listar os itens do menu', 'Pagina para listar os itens do menu', 'Pagina para listar os itens do menu', 'sh', 'adms', 2, 'fab fa-elementor', 0, 4, 1, '2018-07-28 00:00:00', NULL),
(9, 'Hotel', 'listar/list_hotel', 'Pagina para listar hoteis', 'Pagina para listar hoteis', 'Pagina para listar hoteis', 'sh', 'adms', 2, 'far fa-building', 0, 4, 1, '2018-07-28 00:00:00', NULL),
(10, 'Cadastrar Nivel de Acesso', 'cadastrar/cad_niv_aces', 'Página para cadastrar nivel de acesso', 'Página para cadastrar nivel de acesso', 'Página para cadastrar nivel de acesso', 'sh', 'adms', 2, NULL, 0, 4, 1, '2018-07-30 00:00:00', NULL),
(11, 'Visualizar Nivel de Acesso', 'visualizar/vis_niv_aces', 'Pagina para visualizar nivel de acesso', 'Pagina para visualizar nivel de acesso', 'Pagina para visualizar nivel de acesso', 'sh', 'adms', 2, NULL, 0, 4, 1, '2018-07-30 00:00:00', NULL),
(12, 'Editar nivel de Acesso', 'editar/edit_niv_aces', 'Pagina para editar nivel de acesso', 'Pagina para editar nivel de acesso', 'Pagina para editar nivel de acesso', 'sh', 'adms', 2, NULL, 0, 4, 1, '2018-07-30 00:00:00', NULL),
(13, 'Apagar nivel de acesso', 'processa/apagar_niv_aces', 'Pagina para apagar nivel de acesso', 'Pagina para apagar nivel de acesso', 'Pagina para apagar nivel de acesso', 'sh', 'adms', 2, NULL, 0, 4, 1, '2018-07-30 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_robots`
--

DROP TABLE IF EXISTS `adms_robots`;
CREATE TABLE IF NOT EXISTS `adms_robots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_robots`
--

INSERT INTO `adms_robots` (`id`, `nome`, `tipo`, `created`, `modified`) VALUES
(1, 'Indexar a pagina e seguir os links', 'index, follow', '2018-06-20 00:00:00', '2018-06-20 00:00:00'),
(2, 'Não indexar a pagina mas seguir os links', 'noindex, follow', '2018-06-20 00:00:00', '2018-06-20 00:00:00'),
(3, 'Indexar a pagina mas não seguir os links', 'index, nofollow', '2018-06-20 00:00:00', '2018-06-20 00:00:00'),
(4, 'Não indexe a pagina e nem seguir os links', 'noindex, nofollow', '2018-06-20 00:00:00', '2018-06-20 00:00:00'),
(5, 'Não exibir a versão em cache da pagina', 'noarchive', '2018-06-20 00:00:00', '2018-06-20 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_sits`
--

DROP TABLE IF EXISTS `adms_sits`;
CREATE TABLE IF NOT EXISTS `adms_sits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cor` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_sits`
--

INSERT INTO `adms_sits` (`id`, `nome`, `cor`, `created`, `modified`) VALUES
(1, 'Ativo', '3', '2018-07-16 00:00:00', NULL),
(2, 'Inativo', '4', '2018-07-16 00:00:00', NULL),
(3, 'Analise', '1', '2018-07-16 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_sits_pgs`
--

DROP TABLE IF EXISTS `adms_sits_pgs`;
CREATE TABLE IF NOT EXISTS `adms_sits_pgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cor` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_sits_pgs`
--

INSERT INTO `adms_sits_pgs` (`id`, `nome`, `cor`, `created`, `modified`) VALUES
(1, 'Ativo', 'success', '2018-06-20 00:00:00', NULL),
(2, 'Inativo', 'danger', '2018-06-20 00:00:00', NULL),
(3, 'Analise', 'primary', '2018-06-20 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_sits_usuarios`
--

DROP TABLE IF EXISTS `adms_sits_usuarios`;
CREATE TABLE IF NOT EXISTS `adms_sits_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `adms_cor_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_sits_usuarios`
--

INSERT INTO `adms_sits_usuarios` (`id`, `nome`, `adms_cor_id`, `created`, `modified`) VALUES
(1, 'Ativo', 3, '2018-06-21 00:00:00', NULL),
(2, 'Inativo', 5, '2018-06-21 00:00:00', NULL),
(3, 'Aguardando confirmação', 1, '2018-06-21 00:00:00', NULL),
(4, 'Spam', 4, '2018-06-21 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adms_usuarios`
--

DROP TABLE IF EXISTS `adms_usuarios`;
CREATE TABLE IF NOT EXISTS `adms_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `apelido` varchar(220) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `recuperar_senha` varchar(220) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chave_descadastro` varchar(220) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagem` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `adms_sits_usuario_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `adms_niveis_acesso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adms_usuarios`
--

INSERT INTO `adms_usuarios` (`id`, `nome`, `apelido`, `email`, `usuario`, `senha`, `recuperar_senha`, `chave_descadastro`, `imagem`, `adms_sits_usuario_id`, `created`, `modified`, `adms_niveis_acesso_id`) VALUES
(1, 'Giovanna', NULL, 'giovanna@sh.com.br', 'giovanna@sh.com.br', '$2y$10$XudXWyF71r7Gh969eMeiuOUtMwfmhhdMrGRFin9R2pG5yAjtrTbti', NULL, NULL, 'icon.png', 1, '2018-06-20 00:00:00', '2018-06-20 00:00:00', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
