-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 29 sep. 2022 à 16:44
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `animals_project`
--

-- --------------------------------------------------------

--
-- Structure de la table `adopter`
--

CREATE TABLE `adopter` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_adopted_id` int(11) DEFAULT NULL,
  `is_adopted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

CREATE TABLE `animal` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `sex` varchar(11) NOT NULL,
  `refuge` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `specie_id` int(11) NOT NULL,
  `race_id` int(11) NOT NULL,
  `animal_code_id` varchar(20) NOT NULL,
  `is_adopted_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `animal`
--

INSERT INTO `animal` (`id`, `name`, `date_of_birth`, `sex`, `refuge`, `image`, `specie_id`, `race_id`, `animal_code_id`, `is_adopted_id`, `created_at`) VALUES
(6, 'Ikaros', '2019-02-15', 'male', 'SPA Aix en Provence', '', 2, 3, '123456789123463', NULL, '2022-07-02'),
(7, 'Champion', '2009-01-01', 'male', 'SPA Aix en Provence\r\n', '', 2, 9, '4561237894562', NULL, '2022-07-02'),
(8, 'Chipy', '2006-01-01', 'femelle', 'SPA Aix en Provence\r\n', '', 1, 3, '564689843', NULL, '0000-00-00'),
(10, 'Guizmo', '2012-07-12', 'male', 'SPA Aix en Provence', '', 1, 3, '65413987564', NULL, '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `animal_abuse`
--

CREATE TABLE `animal_abuse` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `address_zipcode_city` text NOT NULL,
  `phone` varchar(10) NOT NULL,
  `accused_name` varchar(100) NOT NULL,
  `accused_address` text NOT NULL,
  `accused_relationship` text NOT NULL,
  `animal_situation` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `animal_abuse`
--

INSERT INTO `animal_abuse` (`id`, `firstname`, `lastname`, `mail`, `address_zipcode_city`, `phone`, `accused_name`, `accused_address`, `accused_relationship`, `animal_situation`, `created_at`) VALUES
(1, 'Rudy', 'Saksik', 'Rudy.saksik@gmail.com', 'Les pavillons sous bois', '13545343', 'Morgon Le méchant', 'Dans sa caravane Amiens 15456', 'Voisin', 'Animal mal au point blalblalblzlgjslfdjsdlfhqdKJFHBKQHfFHKLHFKJehfkelqdhfiehfkjsdhbfjksdfgfskjdhfkjsdhflsjhflskhflksdhfhklsfhsjkfhskj', '2022-04-11 16:20:37');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `phone` int(10) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `name`, `mail`, `phone`, `subject`, `content`, `created_at`) VALUES
(1, 'Albert', 'sdqdqsd@dqsqsd.com', 12456454, 'SALUT', 'TEST 1', '2021-03-04 14:43:12'),
(2, 'Frank', 'fdfsd@dsfsdf.com', 1564685456, 'BONJOUR', 'BONJOUR ENREVOIR', '2022-04-04 14:43:12'),
(3, 'Rudy', 'rudy@test.com', 15643534, 'Test', 'Ceci est un message test', '2022-04-08 15:38:40');

-- --------------------------------------------------------

--
-- Structure de la table `is_adopted`
--

CREATE TABLE `is_adopted` (
  `id` int(11) NOT NULL,
  `adopter_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `adopted_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `user_id`, `title`, `content`, `created_at`) VALUES
(1, 14, 'test', 'test123\r\n', '2022-07-02 16:44:49'),
(2, 14, 'Luttez contre l\'abandon', 'Chaque années plus de 45 000 animaux sont abandonnés, réagissez !', '2022-07-17 14:08:27');

-- --------------------------------------------------------

--
-- Structure de la table `race`
--

CREATE TABLE `race` (
  `id` int(11) NOT NULL,
  `race` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `race`
--

INSERT INTO `race` (`id`, `race`) VALUES
(1, 'Berger Allemand'),
(2, 'Berger Australien '),
(3, 'Croisement'),
(5, 'Berger Belge Malinois'),
(6, 'Rottweiler'),
(9, 'Beauceron'),
(13, 'Bengal'),
(14, 'Sphynx'),
(15, 'Ragdoll'),
(16, 'Norvégien');

-- --------------------------------------------------------

--
-- Structure de la table `specie`
--

CREATE TABLE `specie` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `specie`
--

INSERT INTO `specie` (`id`, `name`) VALUES
(1, 'Chat'),
(2, 'Chien');

-- --------------------------------------------------------

--
-- Structure de la table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `file_location` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `uploads`
--

INSERT INTO `uploads` (`id`, `animal_id`, `file_location`, `created_at`) VALUES
(6, 6, 'public/assets/images/uploads/Chien/117330811_10207587342079181_8325970211935779520_n.jpg', '2022-07-02 17:39:06'),
(7, 6, 'public/assets/images/uploads/Chien/ika bb.jpg', '2022-07-02 17:39:06'),
(8, 7, 'public/assets/images/uploads/Chien/^hotos diveres 2009 475 - Copie.png', '2022-07-02 17:52:52'),
(9, 8, 'public/assets/images/uploads/Chat/20150117_130730_Richtone(HDR).jpg', '2022-07-06 12:13:30'),
(10, 10, 'public/assets/images/uploads/Chat/20170820_151942.jpg', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zipcode` int(5) NOT NULL,
  `password` varchar(300) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `mail`, `phone`, `address`, `city`, `zipcode`, `password`, `isAdmin`) VALUES
(14, 'Alyssa', 'T', 'test@test.com', '0102030105', 'qdsdsq', 'qsdqsd', 54562, '$2y$10$V4.xufb5jhEVA28gX4jX7.NyruGurjBBBj6YCwDaKvxlR/gFRwEbm', 1),
(15, 'Krystel', 'Thiebaut', 'thiebaut.krystel@hotmail.fr', '0601020304', '222 rue du deux', 'Deux', 22222, '$2y$10$ZAyER6k6Ar6Bz/.kaYetiOtKgWKUoKoF0BuudBtgDptLp2IcTSWr2', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adopter`
--
ALTER TABLE `adopter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_adopted_id` (`is_adopted_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_adopted_id` (`is_adopted_id`),
  ADD KEY `specie_id` (`specie_id`,`race_id`),
  ADD KEY `race_id` (`race_id`);

--
-- Index pour la table `animal_abuse`
--
ALTER TABLE `animal_abuse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `is_adopted`
--
ALTER TABLE `is_adopted`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adopter_id` (`adopter_id`),
  ADD KEY `animal_id` (`animal_id`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `race`
--
ALTER TABLE `race`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `specie`
--
ALTER TABLE `specie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `animal_id` (`animal_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adopter`
--
ALTER TABLE `adopter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `animal`
--
ALTER TABLE `animal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `animal_abuse`
--
ALTER TABLE `animal_abuse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `is_adopted`
--
ALTER TABLE `is_adopted`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `race`
--
ALTER TABLE `race`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `specie`
--
ALTER TABLE `specie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adopter`
--
ALTER TABLE `adopter`
  ADD CONSTRAINT `adopter_ibfk_1` FOREIGN KEY (`is_adopted_id`) REFERENCES `is_adopted` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `adopter_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`is_adopted_id`) REFERENCES `is_adopted` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`specie_id`) REFERENCES `specie` (`id`),
  ADD CONSTRAINT `animal_ibfk_3` FOREIGN KEY (`race_id`) REFERENCES `race` (`id`);

--
-- Contraintes pour la table `is_adopted`
--
ALTER TABLE `is_adopted`
  ADD CONSTRAINT `is_adopted_ibfk_1` FOREIGN KEY (`adopter_id`) REFERENCES `adopter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `is_adopted_ibfk_2` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `uploads`
--
ALTER TABLE `uploads`
  ADD CONSTRAINT `uploads_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
