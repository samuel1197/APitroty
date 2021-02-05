-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 05 fév. 2021 à 12:06
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `troty`
--

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE `evaluation` (
  `id` int(11) NOT NULL,
  `username_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `description` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `trajet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `evaluation`
--

INSERT INTO `evaluation` (`id`, `username_id`, `score`, `description`, `created_at`, `trajet_id`) VALUES
(3, 1, 5, 'Super', '2021-02-04 10:23:54', 10);

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

CREATE TABLE `promotion` (
  `id` int(11) NOT NULL,
  `code` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale` int(11) NOT NULL,
  `usecode` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `promotion`
--

INSERT INTO `promotion` (`id`, `code`, `category`, `sale`, `usecode`, `created_at`) VALUES
(1, '00E21', 'anniversaire', 2, 1, '2021-02-02 17:27:54');

-- --------------------------------------------------------

--
-- Structure de la table `trajet`
--

CREATE TABLE `trajet` (
  `id` int(11) NOT NULL,
  `username_id` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `finish` datetime NOT NULL,
  `time` int(11) NOT NULL,
  `cout` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trajet`
--

INSERT INTO `trajet` (`id`, `username_id`, `start`, `finish`, `time`, `cout`) VALUES
(10, 1, '2021-02-04 08:00:46', '2021-02-04 08:05:46', 5, 0.75),
(11, 1, '2021-02-04 08:00:46', '2021-02-04 08:10:46', 10, 1.5),
(12, 1, '2021-02-04 08:00:46', '2021-02-04 08:15:46', 15, 2.25),
(13, 1, '2021-02-04 08:00:46', '2021-02-04 08:20:46', 20, 3),
(14, 1, '2021-02-04 08:00:46', '2021-02-04 08:25:46', 25, 3.75),
(15, 1, '2021-02-04 08:00:46', '2021-02-04 08:30:46', 30, 4.5);

-- --------------------------------------------------------

--
-- Structure de la table `trotinette`
--

CREATE TABLE `trotinette` (
  `id` int(11) NOT NULL,
  `matricule` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trotinette`
--

INSERT INTO `trotinette` (`id`, `matricule`, `prix`, `created_at`) VALUES
(1, '09-11181', 1, '2021-02-02 16:49:19'),
(2, '556-T666', 1, '2021-02-02 17:19:14'),
(3, 'ff-67YU', 1, '2021-02-03 08:42:29'),
(4, '04-RT56', 1, '2021-02-04 07:29:38');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `firstname`, `phone`, `birthday`, `created_at`) VALUES
(1, 'samuel.martinsv@gmail.com', '[\"ROLE_ADMIN\"]', 'azertqsdfg12', 'samuel', 'Martins Vieira', '0657890543', '1997-11-09 16:38:47', '2021-02-02 16:38:47'),
(2, 'sam.uel@gmail.com', '[\"ROLE_TEST\"]', 'aqwxszer321', 'sam', 'uel', '0768943201', '2000-02-02 17:29:51', '2021-02-02 17:29:51'),
(3, 'usertest@gmail.com', '[\"ROLE_TEST\"]', 'azertqsdfg12!', 'test', 'samuel', '0678904321', '2001-02-04 07:27:49', '2021-02-04 07:27:49');

-- --------------------------------------------------------

--
-- Structure de la table `user_promotion`
--

CREATE TABLE `user_promotion` (
  `user_id` int(11) NOT NULL,
  `promotion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_promotion`
--

INSERT INTO `user_promotion` (`user_id`, `promotion_id`) VALUES
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_trotinette`
--

CREATE TABLE `user_trotinette` (
  `user_id` int(11) NOT NULL,
  `trotinette_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_trotinette`
--

INSERT INTO `user_trotinette` (`user_id`, `trotinette_id`) VALUES
(1, 2),
(1, 3),
(3, 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1323A575D12A823` (`trajet_id`),
  ADD KEY `IDX_1323A575ED766068` (`username_id`);

--
-- Index pour la table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `trajet`
--
ALTER TABLE `trajet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2B5BA98CED766068` (`username_id`);

--
-- Index pour la table `trotinette`
--
ALTER TABLE `trotinette`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_promotion`
--
ALTER TABLE `user_promotion`
  ADD PRIMARY KEY (`user_id`,`promotion_id`),
  ADD KEY `IDX_C1FDF035A76ED395` (`user_id`),
  ADD KEY `IDX_C1FDF035139DF194` (`promotion_id`);

--
-- Index pour la table `user_trotinette`
--
ALTER TABLE `user_trotinette`
  ADD PRIMARY KEY (`user_id`,`trotinette_id`),
  ADD KEY `IDX_54845F22A76ED395` (`user_id`),
  ADD KEY `IDX_54845F2264F0FC18` (`trotinette_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `evaluation`
--
ALTER TABLE `evaluation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `trajet`
--
ALTER TABLE `trajet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `trotinette`
--
ALTER TABLE `trotinette`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `FK_1323A575D12A823` FOREIGN KEY (`trajet_id`) REFERENCES `trajet` (`id`),
  ADD CONSTRAINT `FK_1323A575ED766068` FOREIGN KEY (`username_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `trajet`
--
ALTER TABLE `trajet`
  ADD CONSTRAINT `FK_2B5BA98CED766068` FOREIGN KEY (`username_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user_promotion`
--
ALTER TABLE `user_promotion`
  ADD CONSTRAINT `FK_C1FDF035139DF194` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C1FDF035A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_trotinette`
--
ALTER TABLE `user_trotinette`
  ADD CONSTRAINT `FK_54845F2264F0FC18` FOREIGN KEY (`trotinette_id`) REFERENCES `trotinette` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_54845F22A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
