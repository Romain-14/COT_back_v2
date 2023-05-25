-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 01 fév. 2023 à 08:37
-- Version du serveur : 8.0.29
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cup_of_tea`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `image_alt` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `title`, `description`, `image_name`, `image_alt`) VALUES
(1, 'Thé noir', 'Le thé noir, que les chinois appellent thé rouge en référence à la couleur cuivrée de sont infusion, est un thé complètement oxydé. La fabrication du thé noir se fait en cinq étapes : le flétrissage, le roulage, l\'oxydation, la torréfaction et le triage. Cette dernière opération permet de différencier les différents grades.', '1.jpg', ''),
(2, 'Thé vert', 'Réputé pour ses nombreuses vertus grâce à sa richesse en antioxydants, le thé vert désaltère, tonifie, apaise, fortifie, et procure une incontestable sensation de bien-être. Délicat et peu amer, il est apprécié à tout moment de la journée et propose une palette d\'arômes très variés: végétal, floral, fruité.', '2.jpg', ''),
(3, 'Oolong', 'Les Oolong, que les chinois appellent thés bleu-vert en référence à la couleur de leurs feuilles infusées, sont des thés semi-oxydés: leur oxydation n\'a pas été menée à son terme. Spécialités de Chine et de Taïwan , il en existe une grande variété, en fonction de la région de culture, de l\'espèce du théier ou encore du processus de fabrication.', '3.jpg', ''),
(4, 'Thé blanc', 'Le thé blanc est une spécialité de la province chinoise du Fujian. De toutes les familles de thé, c\'est celle dont la feuille est la moins transformée par rapport à son état naturel. Non oxydé, le thé blanc ne subit que deux opérations: un flétrissage et une dessication, il existe deux grands types de thés blancs: les aiguilles d\'Argent et Bai Mu Dan.', '4.jpg', ''),
(5, 'Rooibos', 'Le Rooibos (appelé thé rouge bien qu\'il ne s\'agisse pas de thé) est une plante poussant uniquement en Afrique du Sud et qui ne contient pas du tout de théine. Son infusion donne un boisson très agréable, ronde et légérement sucrée. Riche en antioxydants, faible en tanins et dénué de theine, le Rooibos peut être dégusté en journée comme en soirée.', '5.jpg', '');

-- --------------------------------------------------------

--
-- Structure de la table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
CREATE TABLE IF NOT EXISTS `customer_order` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `total_price` decimal(8,2) UNSIGNED NOT NULL,
  `is_payed` tinyint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_tea`
--

DROP TABLE IF EXISTS `order_tea`;
CREATE TABLE IF NOT EXISTS `order_tea` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity` tinyint UNSIGNED NOT NULL,
  `total_itemPrice` decimal(8,2) UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `tea_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_tea_ibfk_1` (`order_id`),
  KEY `tea_id` (`tea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `packaging`
--

DROP TABLE IF EXISTS `packaging`;
CREATE TABLE IF NOT EXISTS `packaging` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `weight` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `packaging`
--

INSERT INTO `packaging` (`id`, `weight`) VALUES
(1, '100gr'),
(2, '500gr'),
(3, '1kg');

-- --------------------------------------------------------

--
-- Structure de la table `tea`
--

DROP TABLE IF EXISTS `tea`;
CREATE TABLE IF NOT EXISTS `tea` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `main_title` varchar(50) NOT NULL,
  `secondary_title` varchar(50) NOT NULL,
  `main_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `secondary_description` text NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `image_alt` varchar(100) NOT NULL,
  `avg_vote` tinyint UNSIGNED NOT NULL,
  `vote_count` smallint UNSIGNED NOT NULL,
  `ref_product` smallint UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `our_favorite` tinyint NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `tea`
--

INSERT INTO `tea` (`id`, `main_title`, `secondary_title`, `main_description`, `secondary_description`, `image_name`, `image_alt`, `avg_vote`, `vote_count`, `ref_product`, `created_at`, `our_favorite`, `category_id`) VALUES
(1, 'Blue of London', 'Thé noir à la bergamote', 'Blue of London est un Earl Grey d\'exception qui associe un des meilleurs thés noirs au monde, le Yunnan, et une bergamote fraîche et délicate. Unn mélange remarquable d\'équilibre et de finesse.', 'Le Earl Grey est un grand classique anglais, depuis que Charles Grey, comte (earl en anglais) de Falodon et Ministre des Affaires étrangères du Royaume britannique au milieu du XIXème siècle, reçut d\'un mandarin une vieille recette consistant à aromatiser son thé avec de la bergamote.', 'product3_big.jpg', 'Thé Blue of London disposé en un tas montrant ses feuilles vertes et violettes', 0, 0, 11333, '2023-01-31 14:03:24', 0, 1),
(2, 'Thés des Lords', 'Thé noir à la bergamote', 'Agrémenté de pétales de carthame, le Thé des Lords est le plus bergamoté des Earl Grey.', 'Le Earl Grey est un grand classique anglais, depuis que Charles Grey, comte (earl en anglais) de Falodon et Ministre des Affaires étrangères du Royaume britannique au milieu du XIXème siècle, reçut d\'un mandarin chinois une vieille recette consistant à aromatiser son thé avec de la bergamote.', 'product6_big.jpg', 'Thés des Lords disposé en un tas montrant ses feuilles brunes et oranges', 0, 0, 12356, '2023-01-31 15:05:25', 0, 1),
(3, 'Thés des Vahinés', 'Thé noir à la bergamote', 'Agrémenté de pétales de carthame, le Thé des Lords est le plus bergamoté des Earl Grey.', 'Le Earl Grey est un grand classique anglais, depuis que Charles Grey, comte (earl en anglais) de Falodon et Ministre des Affaires étrangères du Royaume britannique au milieu du XIXème siècle, reçut d\'un mandarin chinois une vieille recette consistant à aromatiser son thé avec de la bergamote.', 'product6_big.jpg', 'Thés des Lords disposé en un tas montrant ses feuilles brunes et oranges', 0, 0, 65532, '2023-01-31 15:07:25', 0, 1),
(4, 'Thés du hammam', 'Thé noir à la bergamote', 'Agrémenté de pétales de carthame, le Thé des Lords est le plus bergamoté des Earl Grey.', 'Le Earl Grey est un grand classique anglais, depuis que Charles Grey, comte (earl en anglais) de Falodon et Ministre des Affaires étrangères du Royaume britannique au milieu du XIXème siècle, reçut d\'un mandarin chinois une vieille recette consistant à aromatiser son thé avec de la bergamote.', 'product6_big.jpg', 'Thés des Lords disposé en un tas montrant ses feuilles brunes et oranges', 0, 0, 65533, '2023-01-31 15:07:50', 0, 2),
(5, 'Vive le thé !', 'Thé noir à la bergamote', 'Agrémenté de pétales de carthame, le Thé des Lords est le plus bergamoté des Earl Grey.', 'Le Earl Grey est un grand classique anglais, depuis que Charles Grey, comte (earl en anglais) de Falodon et Ministre des Affaires étrangères du Royaume britannique au milieu du XIXème siècle, reçut d\'un mandarin chinois une vieille recette consistant à aromatiser son thé avec de la bergamote.', 'product6_big.jpg', 'Thés des Lords disposé en un tas montrant ses feuilles brunes et oranges', 0, 0, 65534, '2023-01-31 15:08:08', 0, 2),
(6, 'Thé des alizés', 'Thé noir à la bergamote', 'Agrémenté de pétales de carthame, le Thé des Lords est le plus bergamoté des Earl Grey.', 'Le Earl Grey est un grand classique anglais, depuis que Charles Grey, comte (earl en anglais) de Falodon et Ministre des Affaires étrangères du Royaume britannique au milieu du XIXème siècle, reçut d\'un mandarin chinois une vieille recette consistant à aromatiser son thé avec de la bergamote.', 'product6_big.jpg', 'Thés des Lords disposé en un tas montrant ses feuilles brunes et oranges', 0, 0, 16683, '2023-01-31 15:08:22', 0, 2),
(7, 'Vive les fêtes', 'Thé noir à la bergamote', 'Agrémenté de pétales de carthame, le Thé des Lords est le plus bergamoté des Earl Grey.', 'Le Earl Grey est un grand classique anglais, depuis que Charles Grey, comte (earl en anglais) de Falodon et Ministre des Affaires étrangères du Royaume britannique au milieu du XIXème siècle, reçut d\'un mandarin chinois une vieille recette consistant à aromatiser son thé avec de la bergamote.', 'product6_big.jpg', 'Thés des Lords disposé en un tas montrant ses feuilles brunes et oranges', 0, 0, 65535, '2023-01-31 15:08:48', 0, 3),
(8, 'Fleur d\'oranger Oolong', 'Thé noir à la bergamote', 'Agrémenté de pétales de carthame, le Thé des Lords est le plus bergamoté des Earl Grey.', 'Le Earl Grey est un grand classique anglais, depuis que Charles Grey, comte (earl en anglais) de Falodon et Ministre des Affaires étrangères du Royaume britannique au milieu du XIXème siècle, reçut d\'un mandarin chinois une vieille recette consistant à aromatiser son thé avec de la bergamote.', 'product6_big.jpg', 'Thés des Lords disposé en un tas montrant ses feuilles brunes et oranges', 0, 0, 65535, '2023-01-31 15:08:58', 0, 3),
(9, 'Oolong 7 agrumes', 'Thé noir à la bergamote', 'Agrémenté de pétales de carthame, le Thé des Lords est le plus bergamoté des Earl Grey.', 'Le Earl Grey est un grand classique anglais, depuis que Charles Grey, comte (earl en anglais) de Falodon et Ministre des Affaires étrangères du Royaume britannique au milieu du XIXème siècle, reçut d\'un mandarin chinois une vieille recette consistant à aromatiser son thé avec de la bergamote.', 'product6_big.jpg', 'Thés des Lords disposé en un tas montrant ses feuilles brunes et oranges', 0, 0, 65535, '2023-01-31 15:09:05', 0, 3),
(10, 'Thé des songes blanc', 'Thé noir à la bergamote', 'Agrémenté de pétales de carthame, le Thé des Lords est le plus bergamoté des Earl Grey.', 'Le Earl Grey est un grand classique anglais, depuis que Charles Grey, comte (earl en anglais) de Falodon et Ministre des Affaires étrangères du Royaume britannique au milieu du XIXème siècle, reçut d\'un mandarin chinois une vieille recette consistant à aromatiser son thé avec de la bergamote.', 'product6_big.jpg', 'Thés des Lords disposé en un tas montrant ses feuilles brunes et oranges', 0, 0, 65535, '2023-01-31 15:09:18', 0, 4),
(11, 'Bai mu dan', 'Thé noir à la bergamote', 'Agrémenté de pétales de carthame, le Thé des Lords est le plus bergamoté des Earl Grey.', 'Le Earl Grey est un grand classique anglais, depuis que Charles Grey, comte (earl en anglais) de Falodon et Ministre des Affaires étrangères du Royaume britannique au milieu du XIXème siècle, reçut d\'un mandarin chinois une vieille recette consistant à aromatiser son thé avec de la bergamote.', 'product6_big.jpg', 'Thés des Lords disposé en un tas montrant ses feuilles brunes et oranges', 0, 0, 65535, '2023-01-31 15:09:26', 0, 4),
(12, 'Aiguilles d\'argent', 'Thé noir à la bergamote', 'Agrémenté de pétales de carthame, le Thé des Lords est le plus bergamoté des Earl Grey.', 'Le Earl Grey est un grand classique anglais, depuis que Charles Grey, comte (earl en anglais) de Falodon et Ministre des Affaires étrangères du Royaume britannique au milieu du XIXème siècle, reçut d\'un mandarin chinois une vieille recette consistant à aromatiser son thé avec de la bergamote.', 'product6_big.jpg', 'Thés des Lords disposé en un tas montrant ses feuilles brunes et oranges', 0, 0, 65535, '2023-01-31 15:09:49', 0, 4),
(13, 'Rooibos à la verveine', 'Thé noir à la bergamote', 'Agrémenté de pétales de carthame, le Thé des Lords est le plus bergamoté des Earl Grey.', 'Le Earl Grey est un grand classique anglais, depuis que Charles Grey, comte (earl en anglais) de Falodon et Ministre des Affaires étrangères du Royaume britannique au milieu du XIXème siècle, reçut d\'un mandarin chinois une vieille recette consistant à aromatiser son thé avec de la bergamote.', 'product6_big.jpg', 'Thés des Lords disposé en un tas montrant ses feuilles brunes et oranges', 0, 0, 65535, '2023-01-31 15:10:05', 0, 5),
(14, 'Spicy passion', 'Thé noir à la bergamote', 'Agrémenté de pétales de carthame, le Thé des Lords est le plus bergamoté des Earl Grey.', 'Le Earl Grey est un grand classique anglais, depuis que Charles Grey, comte (earl en anglais) de Falodon et Ministre des Affaires étrangères du Royaume britannique au milieu du XIXème siècle, reçut d\'un mandarin chinois une vieille recette consistant à aromatiser son thé avec de la bergamote.', 'product6_big.jpg', 'Thés des Lords disposé en un tas montrant ses feuilles brunes et oranges', 0, 0, 65535, '2023-01-31 15:10:14', 0, 5),
(15, 'Rooibos des amants', 'Thé noir à la bergamote', 'Agrémenté de pétales de carthame, le Thé des Lords est le plus bergamoté des Earl Grey.', 'Le Earl Grey est un grand classique anglais, depuis que Charles Grey, comte (earl en anglais) de Falodon et Ministre des Affaires étrangères du Royaume britannique au milieu du XIXème siècle, reçut d\'un mandarin chinois une vieille recette consistant à aromatiser son thé avec de la bergamote.', 'product6_big.jpg', 'Thés des Lords disposé en un tas montrant ses feuilles brunes et oranges', 0, 0, 65535, '2023-01-31 15:10:22', 0, 5);

-- --------------------------------------------------------

--
-- Structure de la table `tea_packaging`
--

DROP TABLE IF EXISTS `tea_packaging`;
CREATE TABLE IF NOT EXISTS `tea_packaging` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity_in_stock` smallint UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `tea_id` int UNSIGNED NOT NULL,
  `packaging_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `packaging_id` (`packaging_id`),
  KEY `tea_id` (`tea_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `tea_packaging`
--

INSERT INTO `tea_packaging` (`id`, `quantity_in_stock`, `price`, `tea_id`, `packaging_id`) VALUES
(1, 164, '9.00', 1, 1),
(3, 265, '42.75', 1, 2),
(4, 265, '42.75', 2, 2),
(5, 78, '42.75', 2, 1),
(6, 46, '85.50', 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isAdmin` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `isAdmin`) VALUES
(1, 'ro14@mail.com', '$2b$10$5E/LiP5tThlyW2mczbJpzuEdVagwg3OqD/UTDHG6kUdSMvq02g9GK', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `customer_order`
--
ALTER TABLE `customer_order`
  ADD CONSTRAINT `customer_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `order_tea`
--
ALTER TABLE `order_tea`
  ADD CONSTRAINT `order_tea_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_tea_ibfk_2` FOREIGN KEY (`tea_id`) REFERENCES `tea` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Contraintes pour la table `tea`
--
ALTER TABLE `tea`
  ADD CONSTRAINT `tea_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Contraintes pour la table `tea_packaging`
--
ALTER TABLE `tea_packaging`
  ADD CONSTRAINT `tea_packaging_ibfk_1` FOREIGN KEY (`packaging_id`) REFERENCES `packaging` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tea_packaging_ibfk_2` FOREIGN KEY (`tea_id`) REFERENCES `tea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
