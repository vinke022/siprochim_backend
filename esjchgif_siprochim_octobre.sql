-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 01, 2026 at 02:05 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `esjchgif_siprochim`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` bigint UNSIGNED NOT NULL,
  `job_offer_id` bigint UNSIGNED DEFAULT NULL,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `cv_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lettre_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` enum('nouvelle','en_cours','acceptee','refusee') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'nouvelle',
  `notes_rh` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_offers`
--

CREATE TABLE `job_offers` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poste` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lieu` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Abidjan',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CDI',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `missions` json DEFAULT NULL,
  `profil` json DEFAULT NULL,
  `avantages` json DEFAULT NULL,
  `date_publication` date NOT NULL DEFAULT (curdate()),
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_offers`
--

INSERT INTO `job_offers` (`id`, `slug`, `poste`, `lieu`, `type`, `description`, `missions`, `profil`, `avantages`, `date_publication`, `active`, `created_at`, `updated_at`) VALUES
(1, 'responsable-qualite', 'Responsable Qualité', 'Abidjan', 'CDI', 'Nous recherchons un(e) Responsable Qualité pour garantir la conformité de nos processus et produits aux normes internationales.', '[\"Définir et mettre en œuvre la politique qualité de l\'entreprise\", \"Superviser les audits internes et externes\", \"Assurer la conformité aux normes ISO 9001\", \"Former et sensibiliser les équipes aux procédures qualité\", \"Analyser les non-conformités et proposer des actions correctives\", \"Gérer la documentation qualité et les certifications\"]', '[\"Diplôme Bac+5 en Qualité, Chimie ou équivalent\", \"Minimum 5 ans d\'expérience en management qualité\", \"Maîtrise des normes ISO 9001\", \"Excellentes capacités d\'analyse et de synthèse\", \"Leadership et esprit d\'équipe\", \"Maîtrise du français et de l\'anglais\"]', '[\"Salaire attractif selon profil\", \"Prime de performance\", \"Assurance santé\", \"Formations continues\", \"Environnement de travail moderne\"]', '2026-01-15', 1, '2026-03-25 14:44:10', '2026-03-25 14:44:10'),
(2, 'charge-communication', 'Chargé(e) de Communication', 'Abidjan', 'CDI', 'Rejoignez notre équipe marketing en tant que Chargé(e) de Communication pour développer notre image de marque et notre présence sur les différents canaux.', '[\"Élaborer et mettre en œuvre la stratégie de communication\", \"Gérer les réseaux sociaux et la présence digitale\", \"Créer du contenu (textes, visuels, vidéos)\", \"Organiser des événements et relations presse\", \"Analyser les performances des campagnes\", \"Coordonner avec les agences externes\"]', '[\"Bac+4/5 en Communication, Marketing ou équivalent\", \"2 à 5 ans d\'expérience\", \"Maîtrise des réseaux sociaux et des outils digitaux\", \"Créativité et sens de l\'esthétique\", \"Excellentes compétences rédactionnelles\"]', '[\"Salaire compétitif\", \"Environnement créatif et dynamique\", \"Projets variés et stimulants\", \"Opportunités de développement professionnel\"]', '2026-01-10', 1, '2026-03-25 14:44:11', '2026-03-25 14:44:11'),
(3, 'technicien-laboratoire-abidjan', 'Technicien(ne) Laboratoire', 'Abidjan', 'CDI', 'Nous recherchons un(e) Technicien(ne) Laboratoire rigoureux(se) pour renforcer notre équipe R&D.', '[\"Réaliser des analyses physico-chimiques\", \"Contrôler la qualité des matières premières et produits finis\", \"Participer au développement de nouvelles formulations\", \"Maintenir les équipements de laboratoire\", \"Rédiger les rapports d\'analyses\"]', '[\"BTS/DUT Chimie ou Analyses Biologiques\", \"1 à 3 ans d\'expérience en laboratoire industriel\", \"Maîtrise des techniques d\'analyse (HPLC, GC, spectrophotométrie)\", \"Rigueur et précision\"]', '[\"Formation continue\", \"Équipements modernes\", \"Environnement de travail stimulant\"]', '2026-01-08', 1, '2026-03-25 14:44:11', '2026-03-25 14:44:11'),
(4, 'technicien-laboratoire-san-pedro', 'Technicien(ne) Laboratoire', 'San-Pédro', 'CDI', 'Poste basé à San-Pédro pour renforcer notre capacité analytique sur le site secondaire.', '[\"Réaliser des analyses physico-chimiques\", \"Contrôler la qualité des matières premières et produits finis\", \"Maintenir les équipements de laboratoire\", \"Rédiger les rapports d\'analyses\"]', '[\"BTS/DUT Chimie ou Analyses Biologiques\", \"Expérience en laboratoire souhaitée\", \"Mobilité géographique à San-Pédro\"]', '[\"Logement de fonction possible\", \"Prime de déplacement\", \"Formation continue\"]', '2026-01-12', 1, '2026-03-25 14:44:11', '2026-03-25 14:44:11');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_01_165926_create_product_families_table', 1),
(5, '2025_07_01_165934_create_products_table', 1),
(6, '2025_07_01_165943_create_product_analytics_table', 1),
(7, '2025_07_01_165949_create_product_accordions_table', 1),
(8, '2025_07_01_184924_create_posts_table', 1),
(9, '2025_07_01_213404_add_category_to_product_families_table', 1),
(10, '2025_07_08_000001_create_product_categories_table', 1),
(11, '2025_07_08_000002_create_product_subcategories_table', 1),
(12, '2025_07_08_000003_update_products_table_hierarchy', 1),
(13, '2025_07_08_000004_remove_category_from_product_families', 1),
(14, '2026_03_25_000001_create_job_offers_table', 2),
(15, '2026_03_25_000002_add_badge_to_products_table', 3),
(16, '2026_03_25_153350_create_job_offers_table', 4),
(17, '2026_03_25_000003_create_job_applications_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `content`, `image`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Aromate, la mayonnaise qui réveille vos plats', 'aromate-la-mayonnaise-qui-reveille-vos-plats', '<p>Chez Aromate, on ne fait pas que de la mayonnaise. On crée des instants savoureux, des sauces qui rassemblent, et des recettes qui font parler les papilles.</p><p>🌿 Une recette simple, un goût qui marque</p><p>Notre mayonnaise Aromate est née d’un équilibre subtil entre tradition et audace. Des œufs frais, une huile végétale de qualité, une pointe de moutarde, et ce petit twist maison qui fait toute la différence. Le résultat ? Une texture onctueuse, un goût franc, et une polyvalence qui s’adapte à toutes vos envies.</p><p><br></p><p>🧴 Un format pensé pour le quotidien</p><p>Flacon souple, bouchon refermable, design épuré : Aromate s’invite dans votre cuisine avec style et praticité. Que ce soit pour un burger maison, une salade fraîche ou une grillade improvisée, elle est toujours prête à servir.</p><p>🌍 Une mayonnaise responsable</p><p>Chez Aromate, nous croyons que bien manger va de pair avec bien produire. Nos emballages sont recyclables, notre chaîne de fabrication respecte des normes strictes, et nous collaborons avec des fournisseurs locaux pour limiter notre empreinte.</p><p>🍽️ Des déclinaisons pour tous les goûts</p><p>Classique, épicée, citronnée, ou vegan — Aromate se décline pour satisfaire toutes les préférences. Et ce n’est que le début : notre labo créatif travaille déjà sur de nouvelles saveurs pour surprendre les gourmets.</p><p><br></p><p>Tu veux que je t’aide à décliner ça en posts pour les réseaux sociaux, en accroches pour packaging, ou en version plus humoristique ? Je peux aussi t’aider à créer une série d’articles autour de l’univers Aromate.</p>', 'posts/68d6804b0bf61.png', 1, '2025-09-26 16:00:11', '2025-09-26 16:00:11');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `badge` enum('nouveau','premium') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_subcategory_id` bigint UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `image`, `description`, `badge`, `created_at`, `updated_at`, `product_subcategory_id`) VALUES
(301, 'AROMATE Epices Sachet 50g', 'aromate-epices-sachet-50g', 'products/696fefc51834d.png', '<p>Les bouillons AROMATE, avec leurs 5 arômes distincts (épices, tomate, poulet, crevette et piment), transforment les repas quotidiens en authentiques festins. </p><p><br></p><p>C’est la touche qui change tout : ils rehaussent merveilleusement le goût des sauces, soupes et ragoûts.</p><p><br></p><p>Faciles à utiliser, en tablettes, en sticks ou en sachets, ils promettent des repas à partager sans compter !</p>', NULL, '2025-07-16 01:27:03', '2026-01-27 01:51:10', 18),
(302, 'AROMATE Epices Stick 10g', 'aromate-epices-stick-10g', 'products/696fefb30a56d.png', '<p>Les bouillons AROMATE, avec leurs 5 arômes distincts (épices, tomate, poulet, crevette et piment), transforment les repas quotidiens en authentiques festins. </p><p><br></p><p>C’est la touche qui change tout : ils rehaussent merveilleusement le goût des sauces, soupes et ragoûts.</p><p><br></p><p>Faciles à utiliser, en tablettes, en sticks ou en sachets, ils promettent des repas à partager sans compter !</p>', NULL, '2025-07-16 01:27:35', '2026-01-27 01:51:00', 18),
(313, 'AROMATE Moutarde Bocal 270g', 'aromate-moutarde-bocal-270g', 'products/696fed242ab8b.png', '<p>Forte et délicieuse, la moutarde AROMATE allie parfaitement finesse et caractère.</p><p><br></p><p>Pour les marinades, sauces, sandwichs, vinaigrettes…</p><p><br></p><p>Son piquant relève et réveille aussi bien les plats chauds que froids ! Au quotidien, elle se savoure à chaque instant grâce à ses grands ou petits formats malins, toujours à portée de main.</p>', NULL, '2025-07-16 01:35:22', '2026-01-27 01:55:43', 22),
(312, 'AROMATE Moutarde Squeeze 380g', 'aromate-moutarde-squeeze-380g', 'products/696fed627af8c.png', '<p>Forte et délicieuse, la moutarde AROMATE allie parfaitement finesse et caractère.</p><p><br></p><p>Pour les marinades, sauces, sandwichs, vinaigrettes…</p><p><br></p><p>Son piquant relève et réveille aussi bien les plats chauds que froids ! Au quotidien, elle se savoure à chaque instant grâce à ses grands ou petits formats malins, toujours à portée de main.</p>', NULL, '2025-07-16 01:34:38', '2026-01-27 01:56:05', 22),
(242, 'COSMO Bleu 400g', 'cosmo-bleu-400g', 'products/696ffa967632a.png', '<p>Pour un linge impeccable et délicatement parfumé, la lessive en poudre COSMO est d’une incroyable efficacité.</p><p><br></p><p>Sa formule agit au cœur des fibres pour éliminer les taches difficiles et neutraliser les odeurs corporelles imprégnées.</p><p><br></p><p>Adaptée au lavage à la main, elle assure une propreté inégalée, préserve la douceur des tissus et offre à coup sûr une fraîcheur qui dure.</p>', NULL, '2025-07-15 22:17:03', '2026-01-27 03:13:03', 44),
(314, 'AROMATE Piment Sachet 50g', 'aromate-piment-sachet-50g', 'products/696fed11b3fbe.png', '<p>Les bouillons AROMATE, avec leurs 5 arômes distincts (épices, tomate, poulet, crevette et piment), transforment les repas quotidiens en authentiques festins. </p><p><br></p><p>C’est la touche qui change tout : ils rehaussent merveilleusement le goût des sauces, soupes et ragoûts.</p><p><br></p><p>Faciles à utiliser, en tablettes, en sticks ou en sachets, ils promettent des repas à partager sans compter !</p>', NULL, '2025-07-16 01:36:58', '2026-01-27 01:50:11', 18),
(303, 'AROMATE Ketchup 4,5kg', 'aromate-ketchup-45kg', 'products/696fef108f035.png', '<p>Sans colorant ni conservateur, le ketchup AROMATE au bon goût de tomates mûres met de la saveur et de la couleur dans les assiettes ! Sa texture onctueuse et son arôme naturel apportent une touche gourmande et subtilement sucrée à chaque bouchée.</p><p><br></p><p>Disponible en différents formats c’est, pour tous et toutes les occasions, l’atout pratique et économique.</p>', NULL, '2025-07-16 01:28:29', '2026-01-27 17:06:31', 55),
(304, 'AROMATE Ketchup 11g', 'aromate-ketchup-11g', 'products/696feefeca990.png', '<p>Sans colorant ni conservateur, le ketchup AROMATE au bon goût de tomates mûres met de la saveur et de la couleur dans les assiettes ! Sa texture onctueuse et son arôme naturel apportent une touche gourmande et subtilement sucrée à chaque bouchée.</p><p><br></p><p>Disponible en différents formats c’est, pour tous et toutes les occasions, l’atout pratique et économique.</p>', NULL, '2025-07-16 01:29:46', '2026-01-27 17:06:41', 55),
(305, 'AROMATE Ketchup 275 ml BEC', 'aromate-ketchup-275-ml-bec', 'products/696feedadb54a.png', '<p>Sans colorant ni conservateur, le ketchup AROMATE au bon goût de tomates mûres met de la saveur et de la couleur dans les assiettes ! Sa texture onctueuse et son arôme naturel apportent une touche gourmande et subtilement sucrée à chaque bouchée.</p><p><br></p><p>Disponible en différents formats c’est, pour tous et toutes les occasions, l’atout pratique et économique.</p>', NULL, '2025-07-16 01:30:17', '2026-01-27 17:06:52', 55),
(306, 'AROMATE Moutard Bocal 490g', 'aromate-moutard-bocal-490g', 'products/696fee92c204d.png', '<p>Forte et délicieuse, la moutarde AROMATE allie parfaitement finesse et caractère.</p><p><br></p><p>Pour les marinades, sauces, sandwichs, vinaigrettes…</p><p><br></p><p>Son piquant relève et réveille aussi bien les plats chauds que froids ! Au quotidien, elle se savoure à chaque instant grâce à ses grands ou petits formats malins, toujours à portée de main.</p>', NULL, '2025-07-16 01:30:55', '2026-01-27 01:57:55', 22),
(307, 'AROMATE Moutarde 1 kg', 'aromate-moutarde-1-kg', 'products/696fedb8679c1.png', '<p>Forte et délicieuse, la moutarde AROMATE allie parfaitement finesse et caractère.</p><p><br></p><p>Pour les marinades, sauces, sandwichs, vinaigrettes…</p><p><br></p><p>Son piquant relève et réveille aussi bien les plats chauds que froids ! Au quotidien, elle se savoure à chaque instant grâce à ses grands ou petits formats malins, toujours à portée de main.</p>', NULL, '2025-07-16 01:31:29', '2026-01-27 01:57:46', 22),
(308, 'AROMATE Moutarde sachet 25ml', 'aromate-moutarde-sachet-25ml', 'products/696feda73b1c9.png', '<p>Forte et délicieuse, la moutarde AROMATE allie parfaitement finesse et caractère.</p><p><br></p><p>Pour les marinades, sauces, sandwichs, vinaigrettes…</p><p><br></p><p>Son piquant relève et réveille aussi bien les plats chauds que froids ! Au quotidien, elle se savoure à chaque instant grâce à ses grands ou petits formats malins, toujours à portée de main.</p>', NULL, '2025-07-16 01:32:09', '2026-01-27 01:57:38', 22),
(309, 'AROMATE Moutarde Seau 2kg', 'aromate-moutarde-seau-2kg', 'products/696fed9771574.png', '<p>Forte et délicieuse, la moutarde AROMATE allie parfaitement finesse et caractère.</p><p><br></p><p>Pour les marinades, sauces, sandwichs, vinaigrettes…</p><p><br></p><p>Son piquant relève et réveille aussi bien les plats chauds que froids ! Au quotidien, elle se savoure à chaque instant grâce à ses grands ou petits formats malins, toujours à portée de main.</p>', NULL, '2025-07-16 01:32:51', '2026-01-27 01:57:21', 22),
(310, 'AROMATE Moutarde Seau 5kg', 'aromate-moutarde-seau-5kg', 'products/696fed8331814.png', '<p>Forte et délicieuse, la moutarde AROMATE allie parfaitement finesse et caractère.</p><p><br></p><p>Pour les marinades, sauces, sandwichs, vinaigrettes…</p><p><br></p><p>Son piquant relève et réveille aussi bien les plats chauds que froids ! Au quotidien, elle se savoure à chaque instant grâce à ses grands ou petits formats malins, toujours à portée de main.</p>', NULL, '2025-07-16 01:33:26', '2026-01-27 01:56:38', 22),
(311, 'AROMATE Moutarde Squeeze 270g', 'aromate-moutarde-squeeze-270g', 'products/696fed6fbb37b.png', '<p>Forte et délicieuse, la moutarde AROMATE allie parfaitement finesse et caractère.</p><p><br></p><p>Pour les marinades, sauces, sandwichs, vinaigrettes…</p><p><br></p><p>Son piquant relève et réveille aussi bien les plats chauds que froids ! Au quotidien, elle se savoure à chaque instant grâce à ses grands ou petits formats malins, toujours à portée de main.</p>', NULL, '2025-07-16 01:34:11', '2026-01-27 01:56:15', 22),
(291, 'AROMATE Mayonnaise Bocal 900ml', 'aromate-mayonnaise-bocal-900ml', 'products/696ff243f3b39.png', '<p>Iconique, la mayonnaise originale AROMATE accompagne depuis plus de 15 ans tous les plats à la perfection.</p><p><br></p><p>Sa recette unique, à base d’huile de tournesol et de jaune d’œuf, lui apporte une texture légère pour une incroyable sensation de finesse en bouche.</p><p><br></p><p>Idéale pour sublimer les différents mets, fritures et sandwichs, elle permet aussi de préparer de délicieuses sauces et vinaigrettes.</p>', NULL, '2025-07-16 01:19:37', '2026-01-27 02:25:57', 16),
(292, 'AROMATE Mayonnaise Sauce Barbecue 350ml', 'aromate-mayonnaise-sauce-barbecue-350ml', 'products/696ff23516ab6.png', '<p>Concoctées à partir d’ingrédients de qualité supérieure, les sauces Barbecue et Burger AROMATE rehaussent les grillades, les frites et les pizzas pour le plus grand bonheur des grands gourmands et pour ne pas en perdre une goutte, son bouchon, conçu pour rester toujours impeccable, en préserve toute la saveur.</p>', NULL, '2025-07-16 01:20:14', '2026-01-27 02:25:35', 19),
(293, 'AROMATE Mayonnaise Squeeze Ail 350ml', 'aromate-mayonnaise-squeeze-ail-350ml', 'products/696ff2252bea5.png', '<p>Concoctées à partir d’ingrédients de qualité supérieure, les sauces Barbecue et Burger AROMATE rehaussent les grillades, les frites et les pizzas pour le plus grand bonheur des grands gourmands et pour ne pas en perdre une goutte, son bouchon, conçu pour rester toujours impeccable, en préserve toute la saveur.</p>', NULL, '2025-07-16 01:20:47', '2026-01-27 02:25:15', 19),
(294, 'AROMATE Mayonnaise Squeeze Piment 350ml', 'aromate-mayonnaise-squeeze-piment-350ml', 'products/696ff212062f1.png', '<p>Concoctées à partir d’ingrédients de qualité supérieure, les sauces Barbecue et Burger AROMATE rehaussent les grillades, les frites et les pizzas pour le plus grand bonheur des grands gourmands et pour ne pas en perdre une goutte, son bouchon, conçu pour rester toujours impeccable, en préserve toute la saveur.</p>', NULL, '2025-07-16 01:21:27', '2026-01-27 02:25:00', 19),
(295, 'AROMATE Mayonnaise Squeeze Poivre 350ml', 'aromate-mayonnaise-squeeze-poivre-350ml', 'products/696ff202a8016.png', '<p>Concoctées à partir d’ingrédients de qualité supérieure, les sauces Barbecue et Burger AROMATE rehaussent les grillades, les frites et les pizzas pour le plus grand bonheur des grands gourmands et pour ne pas en perdre une goutte, son bouchon, conçu pour rester toujours impeccable, en préserve toute la saveur.</p>', NULL, '2025-07-16 01:22:42', '2026-01-27 02:24:47', 19),
(296, 'AROMATE Mayonnaise Sauce Burger 350ml', 'aromate-mayonnaise-sauce-burger-350ml', 'products/696ff1ae0374c.png', '<p>Concoctées à partir d’ingrédients de qualité supérieure, les sauces Barbecue et Burger AROMATE rehaussent les grillades, les frites et les pizzas pour le plus grand bonheur des grands gourmands et pour ne pas en perdre une goutte, son bouchon, conçu pour rester toujours impeccable, en préserve toute la saveur.</p>', NULL, '2025-07-16 01:23:24', '2026-01-27 02:24:30', 19),
(298, 'AROMATE Crevette Sachet 50g', 'aromate-crevette-sachet-50g', 'products/696ff15f6accc.png', '<p>Les bouillons AROMATE, avec leurs 5 arômes distincts (épices, tomate, poulet, crevette et piment), transforment les repas quotidiens en authentiques festins. </p><p><br></p><p>C’est la touche qui change tout : ils rehaussent merveilleusement le goût des sauces, soupes et ragoûts.</p><p><br></p><p>Faciles à utiliser, en tablettes, en sticks ou en sachets, ils promettent des repas à partager sans compter !</p>', NULL, '2025-07-16 01:25:11', '2026-01-27 01:52:23', 18),
(299, 'AROMATE Crevette Stick 10g', 'aromate-crevette-stick-10g', 'products/696ff0c1eec4b.png', '<p>Les bouillons AROMATE, avec leurs 5 arômes distincts (épices, tomate, poulet, crevette et piment), transforment les repas quotidiens en authentiques festins. </p><p><br></p><p>C’est la touche qui change tout : ils rehaussent merveilleusement le goût des sauces, soupes et ragoûts.</p><p><br></p><p>Faciles à utiliser, en tablettes, en sticks ou en sachets, ils promettent des repas à partager sans compter !</p>', NULL, '2025-07-16 01:25:46', '2026-01-27 01:51:50', 18),
(286, 'AROMATE Mayonnaise 25ml', 'aromate-mayonnaise-25ml', 'products/696ff2cfa0387.png', '<p>Iconique, la mayonnaise originale AROMATE accompagne depuis plus de 15 ans tous les plats à la perfection.</p><p><br></p><p>Sa recette unique, à base d’huile de tournesol et de jaune d’œuf, lui apporte une texture légère pour une incroyable sensation de finesse en bouche.</p><p><br></p><p>Idéale pour sublimer les différents mets, fritures et sandwichs, elle permet aussi de préparer de délicieuses sauces et vinaigrettes..</p>', NULL, '2025-07-16 01:16:08', '2026-01-27 02:48:23', 16),
(287, 'AROMATE Mayonnaise 3.8L', 'aromate-mayonnaise-38l', 'products/696ff28e39676.png', '<p>Iconique, la mayonnaise originale AROMATE accompagne depuis plus de 15 ans tous les plats à la perfection.</p><p><br></p><p>Sa recette unique, à base d’huile de tournesol et de jaune d’œuf, lui apporte une texture légère pour une incroyable sensation de finesse en bouche.</p><p><br></p><p>Idéale pour sublimer les différents mets, fritures et sandwichs, elle permet aussi de préparer de délicieuses sauces et vinaigrettes.</p>', NULL, '2025-07-16 01:16:59', '2026-01-27 02:27:28', 16),
(288, 'AROMATE Mayonnaise 250ml', 'aromate-mayonnaise-250ml', 'products/696ff27a28376.png', '<p>Iconique, la mayonnaise originale AROMATE accompagne depuis plus de 15 ans tous les plats à la perfection.</p><p><br></p><p>Sa recette unique, à base d’huile de tournesol et de jaune d’œuf, lui apporte une texture légère pour une incroyable sensation de finesse en bouche.</p><p><br></p><p>Idéale pour sublimer les différents mets, fritures et sandwichs, elle permet aussi de préparer de délicieuses sauces et vinaigrettes.</p>', NULL, '2025-07-16 01:17:48', '2026-01-27 02:27:13', 16),
(289, 'AROMATE Mayonnaise 350ml', 'aromate-mayonnaise-350ml', 'products/696ff26776d4f.png', '<p>Iconique, la mayonnaise originale AROMATE accompagne depuis plus de 15 ans tous les plats à la perfection.</p><p><br></p><p>Sa recette unique, à base d’huile de tournesol et de jaune d’œuf, lui apporte une texture légère pour une incroyable sensation de finesse en bouche.</p><p><br></p><p>Idéale pour sublimer les différents mets, fritures et sandwichs, elle permet aussi de préparer de délicieuses sauces et vinaigrettes.</p>', NULL, '2025-07-16 01:18:26', '2026-01-27 02:26:55', 16),
(290, 'AROMATE Mayonnaise Bocal 450ml', 'aromate-mayonnaise-bocal-450ml', 'products/696ff256351d9.png', '<p>Iconique, la mayonnaise originale AROMATE accompagne depuis plus de 15 ans tous les plats à la perfection.</p><p><br></p><p>Sa recette unique, à base d’huile de tournesol et de jaune d’œuf, lui apporte une texture légère pour une incroyable sensation de finesse en bouche.</p><p><br></p><p>Idéale pour sublimer les différents mets, fritures et sandwichs, elle permet aussi de préparer de délicieuses sauces et vinaigrettes.</p>', NULL, '2025-07-16 01:18:54', '2026-01-27 02:26:12', 16),
(223, 'ARC Cyan 400g', 'arc-cyan-400g', 'products/697002052f9ea.png', '<p>Avec sa composition unique, la lessive en poudre ARC c’est le choix malin pour un lavage à la main.</p><p><br></p><p>Elle combat les taches les plus résistantes tout en protégeant les couleurs des textiles. </p><p><br></p><p>Disponible en plusieurs formats, elle enveloppe d’une note de fraîcheur et de douceur le linge de toute la maison !</p>', NULL, '2025-07-15 21:41:49', '2026-01-27 03:18:37', 17),
(224, 'ARC Cyan 850g', 'arc-cyan-850g', 'products/697001e72443b.png', '<p>Avec sa composition unique, la lessive en poudre ARC c’est le choix malin pour un lavage à la main.</p><p><br></p><p>Elle combat les taches les plus résistantes tout en protégeant les couleurs des textiles. </p><p><br></p><p>Disponible en plusieurs formats, elle enveloppe d’une note de fraîcheur et de douceur le linge de toute la maison !</p>', NULL, '2025-07-15 21:42:35', '2026-01-27 03:18:13', 17),
(228, 'ARC Magenta 80g', 'arc-magenta-80g', 'products/697001d4e548f.png', '<p>Avec sa composition unique, la lessive en poudre ARC c’est le choix malin pour un lavage à la main.</p><p><br></p><p>Elle combat les taches les plus résistantes tout en protégeant les couleurs des textiles. </p><p><br></p><p>Disponible en plusieurs formats, elle enveloppe d’une note de fraîcheur et de douceur le linge de toute la maison !</p>', NULL, '2025-07-15 21:46:41', '2026-01-27 03:16:46', 17),
(229, 'ARC Magenta 400g', 'arc-magenta-400g', 'products/697001959a259.png', '<p>Avec sa composition unique, la lessive en poudre ARC c’est le choix malin pour un lavage à la main.</p><p><br></p><p>Elle combat les taches les plus résistantes tout en protégeant les couleurs des textiles. </p><p><br></p><p>Disponible en plusieurs formats, elle enveloppe d’une note de fraîcheur et de douceur le linge de toute la maison !</p>', NULL, '2025-07-15 21:48:23', '2026-01-27 03:16:37', 17),
(230, 'ARC Magenta 850g', 'arc-magenta-850g', 'products/696ffcc000a13.png', '<p>Avec sa composition unique, la lessive en poudre ARC c’est le choix malin pour un lavage à la main.</p><p><br></p><p>Elle combat les taches les plus résistantes tout en protégeant les couleurs des textiles. </p><p><br></p><p>Disponible en plusieurs formats, elle enveloppe d’une note de fraîcheur et de douceur le linge de toute la maison !</p>', NULL, '2025-07-15 21:49:26', '2026-01-27 03:16:26', 17),
(231, 'ARC Rouge 40g', 'arc-rouge-40g', 'products/696ffca5db227.png', '<p>Avec sa composition unique, la lessive en poudre ARC c’est le choix malin pour un lavage à la main.</p><p><br></p><p>Elle combat les taches les plus résistantes tout en protégeant les couleurs des textiles. </p><p><br></p><p>Disponible en plusieurs formats, elle enveloppe d’une note de fraîcheur et de douceur le linge de toute la maison !</p>', NULL, '2025-07-15 21:53:24', '2026-01-27 03:16:08', 17),
(232, 'ARC Rouge 80g', 'arc-rouge-80g', 'products/696ffc691558d.png', '<p>Avec sa composition unique, la lessive en poudre ARC c’est le choix malin pour un lavage à la main.</p><p><br></p><p>Elle combat les taches les plus résistantes tout en protégeant les couleurs des textiles. </p><p><br></p><p>Disponible en plusieurs formats, elle enveloppe d’une note de fraîcheur et de douceur le linge de toute la maison !</p>', NULL, '2025-07-15 21:54:35', '2026-01-27 03:15:46', 17),
(233, 'ARC Rouge 850g', 'arc-rouge-850g', 'products/696ffc4ebd8b3.png', '<p>Avec sa composition unique, la lessive en poudre ARC c’est le choix malin pour un lavage à la main.</p><p><br></p><p>Elle combat les taches les plus résistantes tout en protégeant les couleurs des textiles. </p><p><br></p><p>Disponible en plusieurs formats, elle enveloppe d’une note de fraîcheur et de douceur le linge de toute la maison !</p>', NULL, '2025-07-15 21:55:50', '2026-01-27 03:15:37', 17),
(234, 'ARC Rouge Originale 400g', 'arc-rouge-originale-400g', 'products/696ffc3c240ef.png', '<p>Avec sa composition unique, la lessive en poudre ARC c’est le choix malin pour un lavage à la main.</p><p><br></p><p>Elle combat les taches les plus résistantes tout en protégeant les couleurs des textiles. </p><p><br></p><p>Disponible en plusieurs formats, elle enveloppe d’une note de fraîcheur et de douceur le linge de toute la maison !</p>', NULL, '2025-07-15 21:56:44', '2026-01-27 03:15:25', 17),
(222, 'ARC Cyan 80g', 'arc-cyan-80g', 'products/6970021613fbf.png', '<p>Avec sa composition unique, la lessive en poudre ARC c’est le choix malin pour un lavage à la main.</p><p><br></p><p>Elle combat les taches les plus résistantes tout en protégeant les couleurs des textiles. </p><p><br></p><p>Disponible en plusieurs formats, elle enveloppe d’une note de fraîcheur et de douceur le linge de toute la maison !</p>', NULL, '2025-07-15 21:40:57', '2026-01-27 03:19:16', 17),
(163, 'BÊKO Machine 2,97kg', 'beko-machine-297kg', 'products/697023fd9ea28.png', '<p>La lessive poudre BÊKO donne une nouvelle dimension au lavage en machine.</p><p><br></p><p>Sa formule soigneusement élaborée élimine efficacement les taches tout en respectant la douceur et les couleurs des textiles. Avec BÊKO, c’est du nettoyage haut niveau !</p>', NULL, '2025-07-15 20:18:13', '2026-01-27 04:00:14', 24),
(159, 'BÊKO Coussin Poudre à Laver 400g', 'beko-coussin-poudre-a-laver-400g', 'products/696fe6667f1e4.png', '<p>La lessive poudre lavage à la main BÊKO offre au linge une toute nouvelle jeunesse. Jour après jour, lavage après lavage, les vêtements, draps, rideaux et tous types de textiles sont revitalisés,</p><p>frais et délicatement parfumés.</p>', NULL, '2025-07-15 20:12:52', '2026-01-27 04:05:22', 24),
(160, 'BÊKO Coussin Poudre à Laver 850g', 'beko-coussin-poudre-a-laver-850g', 'products/696fe67b0b4c4.png', '<p>La lessive poudre lavage à la main BÊKO offre au linge une toute nouvelle jeunesse.</p><p><br></p><p>Jour après jour, lavage après lavage, les vêtements, draps, rideaux et tous types de textiles sont revitalisés, frais et délicatement parfumés.</p><p><br></p>', NULL, '2025-07-15 20:13:43', '2026-01-27 04:03:03', 24),
(161, 'BÊKO Lessive Liquide Parfumée 2L', 'beko-lessive-liquide-parfumee-2l', 'products/696fe69bf1da7.png', '<p>Avec la lessive liquide BÊKO, les taches tenaces n’ont plus leur place !</p><p><br></p><p>Sa formule riche en agents actifs garantit aux textiles éclat et propreté.</p><p><br></p><p>Les couleurs brillent, le parfum séduit et le linge est toujours plus beau avec BÊKO !</p>', NULL, '2025-07-15 20:15:25', '2026-01-27 04:01:17', 26),
(162, 'BÊKO Machine 1,4kg', 'beko-machine-14kg', 'products/697024110c437.png', '<p>La lessive poudre BÊKO donne une nouvelle dimension au lavage en machine. Sa formule soigneusement élaborée élimine efficacement les taches tout en respectant la douceur et les couleurs des textiles.</p><p><br></p><p>Avec BÊKO, c’est du nettoyage haut niveau !</p>', NULL, '2025-07-15 20:17:16', '2026-01-27 04:00:40', 24),
(158, 'BÊKO Coussin Poudre à Laver 80g', 'beko-coussin-poudre-a-laver-80g', 'products/696fe6417416a.png', '<p>La lessive poudre lavage à la main BÊKO offre au linge une toute nouvelle jeunesse. Jour après jour, lavage après lavage, les vêtements, draps, rideaux et tous types de textiles sont revitalisés,</p><p>frais et délicatement parfumés.</p>', NULL, '2025-07-15 20:12:11', '2026-01-27 04:05:39', 24),
(156, 'BÊKO Assouplissant Douceur Florale 1L', 'beko-assouplissant-douceur-florale-1l', 'products/696fe62acacfa.png', '<p>Innovant, l’assouplissant BÊKO contient des microcapsules qui libèrent en continu un doux parfum floral sous l’effet des frictions et des mouvements.</p><p><br></p><p>Grâce à cette technologie, le linge diffuse une senteur fraîche pour une longue durée, même après plusieurs semaines.</p><p><br></p><p>Utilisé en complément de la lessive BÊKO, les couleurs et fibres textiles sont protégées, les vêtements sont doux et plus faciles à repasser !</p>', NULL, '2025-07-15 20:09:20', '2026-01-27 04:06:49', 45),
(157, 'BÊKO Assouplissant Douceur Florale 2L', 'beko-assouplissant-douceur-florale-2l', 'products/696fe60e54595.png', '<p>Innovant, l’assouplissant BÊKO contient des microcapsules qui libèrent en continu un doux parfum floral sous l’effet des frictions et des mouvements. Grâce à cette technologie, le linge diffuse une senteur fraîche pour une longue durée, même après plusieurs semaines.</p><p><br></p><p>Utilisé en complément de la lessive BÊKO, les couleurs et fibres textiles sont protégées, les vêtements sont doux et plus faciles à repasser !</p>', NULL, '2025-07-15 20:11:13', '2026-01-27 04:06:15', 45),
(199, 'SUPER CLEAN Liquide Vaisselle citron 450ml', 'super-clean-liquide-vaisselle-citron-450ml', 'products/69701430c7a26.png', '<p>Pour une vaisselle impeccablement éclatante et qui sent bon la fraîcheur, le liquide vaisselle SUPER CLEAN se décline en différentes senteurs : citron, mandarine, fraise, lavande, pomme et marine.</p><p><br></p><p>Il élimine en profondeur les graisses les plus tenaces tout en préservant la brillance de tous les ustensiles de la cuisine.</p>', NULL, '2025-07-15 21:06:39', '2026-01-27 03:36:23', 52),
(197, 'SUPER CLEAN Gel WC Pin & Eucalyptus 850ml', 'super-clean-gel-wc-pin-eucalyptus-850ml', 'products/69701455daae3.png', '<p>SUPER CLEAN Gel WC garantit une hygiène irréprochable. Sa formule adhérente combat efficacement le tartre, les bactéries et les salissures.</p><p><br></p><p>Disponible en trois parfums rafraîchissants Pin &amp; Eucalyptus, Fresh Ocean et Citron.</p><p><br></p><p>Il nettoie en profondeur, désodorise et laisse une sensation de fraîcheur durable.</p><p><br></p><p>Sa texture gel facilite l’application et assure une propreté impeccable au quotidien.</p>', NULL, '2025-07-15 21:04:13', '2026-01-27 16:57:35', 33),
(198, 'SUPER CLEAN Lave-Glace 4L', 'super-clean-lave-glace-4l', 'products/69701445848e2.png', '<p>Le nettoyant vitres SUPER CLEAN permet de laver facilement et de faire briller toutes les surfaces vitrées.</p><p><br></p><p>Sa formule unique, aux propriétés nettoyantes surpuissantes, élimine efficacement la poussière, les salissures et les traces de doigts.</p><p><br></p><p>Il se décline en spray 800 ML doté d’un pulvérisateur à large diffusion pour une utilisation en intérieur et en bidon de 4 L, pour les vitres et pare-brise de tous les véhicules.</p>', NULL, '2025-07-15 21:05:03', '2026-01-27 16:44:42', 28),
(195, 'SUPER CLEAN Gel WC Citron 850ml', 'super-clean-gel-wc-citron-850ml', 'products/6970153c6d2fe.png', '<p>SUPER CLEAN Gel WC garantit une hygiène irréprochable. Sa formule adhérente combat efficacement le tartre, les bactéries et les salissures.</p><p><br></p><p>Disponible en trois parfums rafraîchissants Pin &amp; Eucalyptus, Fresh Ocean et Citron il nettoie en profondeur, désodorise et laisse une sensation de fraîcheur durable.</p><p><br></p><p>Sa texture gel facilite l’application et assure une propreté impeccable au quotidien.</p>', NULL, '2025-07-15 21:02:37', '2026-01-27 03:39:22', 33),
(196, 'SUPER CLEAN Gel WC Fresh Ocean 850ml', 'super-clean-gel-wc-fresh-ocean-850ml', 'products/69701467cc91d.png', '<p>SUPER CLEAN Gel WC garantit une hygiène irréprochable. Sa formule adhérente combat efficacement le tartre, les bactéries et les salissures.</p><p><br></p><p>Disponible en trois parfums rafraîchissants Pin &amp; Eucalyptus, Fresh Ocean et Citron il nettoie en profondeur, désodorise et laisse une sensation de fraîcheur durable.</p><p><br></p><p>Sa texture gel facilite l’application et assure une propreté impeccable au quotidien.</p>', NULL, '2025-07-15 21:03:19', '2026-01-27 03:39:13', 33),
(194, 'SUPER CLEAN Eau de Javel 12° 350ml', 'super-clean-eau-de-javel-12-350ml', 'products/697015543e88c.png', '<p>Inégalable dans le domaine de la propreté, l’eau de javel SUPER CLEAN se décline en deux concentrations : 12° pour un nettoyage intensif et 8° pour une désinfection usuelle.</p><p><br></p><p>Éliminant 99,9 % des germes, moisissures et taches tenaces, elle assainit les sols, surfaces de travail, sanitaires et équipements de cuisine.</p><p><br></p><p>Sa polyvalence et ses formats pratiques facilitent au quotidien chaque tâche, ménagère ou professionnelle</p>', NULL, '2025-07-15 21:01:39', '2026-01-27 03:40:39', 31),
(184, 'SUPER CLEAN Déboucheur 1L', 'super-clean-deboucheur-1l', 'products/69701bd9b9edf.png', '<p>Le déboucheur SUPER CLEAN est la solution idéale pour éliminer rapidement et efficacement les bouchons dans vos canalisations.</p><p><br></p><p>Sa formule concentrée, aux propriétés ultra-dissolvantes, agit en profondeur pour désagréger graisses, résidus alimentaires, cheveux et autres impuretés, garantissant un écoulement fluide et durable.</p><p><br></p><p>Conditionné en flacon de 1 L, il est parfaitement adapté pour un usage domestique régulier, offrant puissance et praticité pour l’entretien des éviers, lavabos, douches et toilettes.</p>', NULL, '2025-07-15 20:49:45', '2026-01-27 17:02:37', 35),
(185, 'SUPER CLEAN DÉSINFECTANT 800ml', 'super-clean-desinfectant-800ml', 'products/69701b4b15bfe.png', '<p>Le désinfectant SUPER CLEAN offre une solution pratique et efficace pour un environnement sain.</p><p><br></p><p>Sans rinçage, il élimine la saleté du quotidien et les virus en un tour de main.</p><p><br></p><p>Utilisé dans un logement, dans les collectivités ou lieux accueillant du public, il garantit une désinfection en profondeur de toutes les surfaces.</p>', NULL, '2025-07-15 20:50:28', '2026-01-27 16:42:26', 29),
(186, 'SUPER CLEAN Eau de Javel 8° 2L', 'super-clean-eau-de-javel-8-2l', 'products/69701b07994ac.png', '<p>Inégalable dans le domaine de la propreté, l’eau de javel SUPER CLEAN se décline en deux concentrations : 12° pour un nettoyage intensif et 8° pour une désinfection usuelle.</p><p><br></p><p>Éliminant 99,9 % des germes, moisissures et taches tenaces, elle assainit les sols, surfaces de travail, sanitaires et équipements de cuisine.</p><p><br></p><p>Sa polyvalence et ses formats pratiques facilitent au quotidien chaque tâche, ménagère ou professionnelle</p>', NULL, '2025-07-15 20:51:11', '2026-01-27 03:44:08', 31),
(187, 'SUPER CLEAN Eau de Javel 8° 3L', 'super-clean-eau-de-javel-8-3l', 'products/69701adc7cd7e.png', '<p>Inégalable dans le domaine de la propreté, l’eau de javel SUPER CLEAN se décline en deux concentrations : 12° pour un nettoyage intensif et 8° pour une désinfection usuelle.</p><p><br></p><p>Éliminant 99,9 % des germes, moisissures et taches tenaces, elle assainit les sols, surfaces de travail, sanitaires et équipements de cuisine.</p><p><br></p><p>Sa polyvalence et ses formats pratiques facilitent au quotidien chaque tâche, ménagère ou professionnelle</p>', NULL, '2025-07-15 20:52:23', '2026-01-27 03:43:54', 31),
(188, 'SUPER CLEAN Eau de Javel 8° 4L', 'super-clean-eau-de-javel-8-4l', 'products/697017d7868dc.png', '<p>Inégalable dans le domaine de la propreté, l’eau de javel SUPER CLEAN se décline en deux concentrations : 12° pour un nettoyage intensif et 8° pour une désinfection usuelle.</p><p><br></p><p>Éliminant 99,9 % des germes, moisissures et taches tenaces, elle assainit les sols, surfaces de travail, sanitaires et équipements de cuisine.</p><p><br></p><p>Sa polyvalence et ses formats pratiques facilitent au quotidien chaque tâche, ménagère ou professionnelle</p>', NULL, '2025-07-15 20:53:07', '2026-01-27 03:43:22', 31),
(189, 'SUPER CLEAN Eau de Javel 8° 4L BLEU', 'super-clean-eau-de-javel-8-4l-bleu', 'products/6970177749ed2.png', '<p>Inégalable dans le domaine de la propreté, l’eau de javel SUPER CLEAN se décline en deux concentrations : 12° pour un nettoyage intensif et 8° pour une désinfection usuelle.</p><p><br></p><p>Éliminant 99,9 % des germes, moisissures et taches tenaces, elle assainit les sols, surfaces de travail, sanitaires et équipements de cuisine.</p><p><br></p><p>Sa polyvalence et ses formats pratiques facilitent au quotidien chaque tâche, ménagère ou professionnelle</p>', NULL, '2025-07-15 20:56:00', '2026-01-27 03:42:16', 31),
(190, 'SUPER CLEAN Eau de Javel 8° 350ml_Bidon', 'super-clean-eau-de-javel-8-350ml-bidon', 'products/6970175d24f99.png', '<p>Inégalable dans le domaine de la propreté, l’eau de javel SUPER CLEAN se décline en deux concentrations : 12° pour un nettoyage intensif et 8° pour une désinfection usuelle.</p><p><br></p><p>Éliminant 99,9 % des germes, moisissures et taches tenaces, elle assainit les sols, surfaces de travail, sanitaires et équipements de cuisine.</p><p><br></p><p>Sa polyvalence et ses formats pratiques facilitent au quotidien chaque tâche, ménagère ou professionnelle</p>', NULL, '2025-07-15 20:57:03', '2026-01-27 03:42:02', 31),
(191, 'SUPER CLEAN Eau de Javel 12° 1L', 'super-clean-eau-de-javel-12-1l', 'products/6970170e85aff.png', '<p>Inégalable dans le domaine de la propreté, l’eau de javel SUPER CLEAN se décline en deux concentrations : 12° pour un nettoyage intensif et 8° pour une désinfection usuelle.</p><p><br></p><p>Éliminant 99,9 % des germes, moisissures et taches tenaces, elle assainit les sols, surfaces de travail, sanitaires et équipements de cuisine.</p><p><br></p><p>Sa polyvalence et ses formats pratiques facilitent au quotidien chaque tâche, ménagère ou professionnelle</p>', NULL, '2025-07-15 20:58:14', '2026-01-27 03:41:51', 31),
(192, 'SUPER CLEAN Eau de Javel 12° 2L', 'super-clean-eau-de-javel-12-2l', 'products/697015a155a59.png', '<p>Inégalable dans le domaine de la propreté, l’eau de javel SUPER CLEAN se décline en deux concentrations : 12° pour un nettoyage intensif et 8° pour une désinfection usuelle.</p><p><br></p><p>Éliminant 99,9 % des germes, moisissures et taches tenaces, elle assainit les sols, surfaces de travail, sanitaires et équipements de cuisine.</p><p><br></p><p>Sa polyvalence et ses formats pratiques facilitent au quotidien chaque tâche, ménagère ou professionnelle</p>', NULL, '2025-07-15 20:59:42', '2026-01-27 03:41:01', 31),
(193, 'SUPER CLEAN Eau de Javel 12° 3L', 'super-clean-eau-de-javel-12-3l', 'products/697015827b9ee.png', '<p>Inégalable dans le domaine de la propreté, l’eau de javel SUPER CLEAN se décline en deux concentrations : 12° pour un nettoyage intensif et 8° pour une désinfection usuelle.</p><p><br></p><p>Éliminant 99,9 % des germes, moisissures et taches tenaces, elle assainit les sols, surfaces de travail, sanitaires et équipements de cuisine.</p><p><br></p><p>Sa polyvalence et ses formats pratiques facilitent au quotidien chaque tâche, ménagère ou professionnelle</p>', NULL, '2025-07-15 21:01:01', '2026-01-27 03:40:52', 31),
(176, 'ZEN BREEZE Brume d\'Ambiance Premium Rose 400ml', 'super-clean-bactericide-desodorisant-rose-4l', 'products/69701eb6c2ec0.png', '<p>Les nettoyants bactéricides disponibles en 5 senteurs (citron, pomme, rose, marine et savon noir), neutralisent efficacement les mauvaises odeurs, les virus et les bactéries.</p><p><br></p><p>Ils assainissent l’atmosphère pour créer un environnement sain et accueillant. SUPER CLEAN garantit toujours une propreté impeccable et une fraîcheur incomparable pour des moments agréables !</p>', NULL, '2025-07-15 20:41:00', '2026-03-25 14:44:11', 51),
(177, 'SUPER CLEAN Bactéricide Désodorisant savon de marine 4L', 'super-clean-bactericide-desodorisant-savon-de-marine-4l', 'products/69701ea5ee6b6.png', '<p>Les nettoyants bactéricides disponibles en 5 senteurs (citron, pomme, rose, marine et savon noir), neutralisent efficacement les mauvaises odeurs, les virus et les bactéries.</p><p><br></p><p>Ils assainissent l’atmosphère pour créer un environnement sain et accueillant. SUPER CLEAN garantit toujours une propreté impeccable et une fraîcheur incomparable pour des moments agréables !</p>', NULL, '2025-07-15 20:42:24', '2026-01-27 03:55:13', 51),
(178, 'SUPER CLEAN Bactéricide Désodorisant savon de marseille 4L', 'super-clean-bactericide-desodorisant-savon-de-marseille-4l', 'products/69701e912a103.png', '<p>Les nettoyants bactéricides disponibles en 5 senteurs (citron, pomme, rose, marine et savon noir), neutralisent efficacement les mauvaises odeurs, les virus et les bactéries.</p><p><br></p><p>Ils assainissent l’atmosphère pour créer un environnement sain et accueillant. SUPER CLEAN garantit toujours une propreté impeccable et une fraîcheur incomparable pour des moments agréables !</p>', NULL, '2025-07-15 20:43:24', '2026-01-27 03:55:02', 25),
(179, 'SUPER CLEAN Bactéricide marine 1L', 'super-clean-bactericide-marine-1l', 'products/69701cd7b2d23.png', '<p>Les nettoyants bactéricides disponibles en 5 senteurs (citron, pomme, rose, marine et savon noir), neutralisent efficacement les mauvaises odeurs, les virus et les bactéries.</p><p><br></p><p>Ils assainissent l’atmosphère pour créer un environnement sain et accueillant. SUPER CLEAN garantit toujours une propreté impeccable et une fraîcheur incomparable pour des moments agréables !</p>', NULL, '2025-07-15 20:44:02', '2026-01-27 03:54:51', 51),
(180, 'SUPER CLEAN Bactéricide marseille 1L', 'super-clean-bactericide-marseille-1l', 'products/69701cc61c158.png', '<p>Les nettoyants bactéricides disponibles en 5 senteurs (citron, pomme, rose, marine et savon noir), neutralisent efficacement les mauvaises odeurs, les virus et les bactéries.</p><p><br></p><p>Ils assainissent l’atmosphère pour créer un environnement sain et accueillant. SUPER CLEAN garantit toujours une propreté impeccable et une fraîcheur incomparable pour des moments agréables !</p>', NULL, '2025-07-15 20:44:54', '2026-01-27 03:54:38', 51),
(181, 'SUPER CLEAN Bactéricide Pomme 1L', 'super-clean-bactericide-pomme-1l', 'products/69701cb532b56.png', '<p>Les nettoyants bactéricides disponibles en 5 senteurs (citron, pomme, rose, marine et savon noir), neutralisent efficacement les mauvaises odeurs, les virus et les bactéries.</p><p><br></p><p>Ils assainissent l’atmosphère pour créer un environnement sain et accueillant. SUPER CLEAN garantit toujours une propreté impeccable et une fraîcheur incomparable pour des moments agréables !</p>', NULL, '2025-07-15 20:45:37', '2026-01-27 03:54:29', 51),
(182, 'SUPER CLEAN Bactéricide Rose 1L', 'super-clean-bactericide-rose-1l', 'products/69701c0222a08.png', '<p>Les nettoyants bactéricides disponibles en 5 senteurs (citron, pomme, rose, marine et savon noir), neutralisent efficacement les mauvaises odeurs, les virus et les bactéries.</p><p><br></p><p>Ils assainissent l’atmosphère pour créer un environnement sain et accueillant. SUPER CLEAN garantit toujours une propreté impeccable et une fraîcheur incomparable pour des moments agréables !</p>', NULL, '2025-07-15 20:46:15', '2026-01-27 03:54:16', 51),
(183, 'SUPER CLEAN Crème à Récurer 900ml', 'super-clean-creme-a-recurer-900ml', 'products/69701bef55e29.png', '<p>La crème à récurer SUPER CLEAN élimine les taches les plus tenaces sans abîmer les surfaces. Grâce à sa formule puissante, elle nettoie, dégraisse, récure et fait briller toute la maison : éviers, robinetterie, douches, inox, émail et céramique. </p><p><br></p><p>Son parfum citronné laisse une agréable odeur de fraîcheur et de propreté.</p>', NULL, '2025-07-15 20:48:55', '2026-01-27 03:52:33', 32),
(164, 'Savon Liquide 3L Bleu', 'savon-liquide-3l-bleu', 'products/697023df16571.png', '<p>Toutes les surfaces et objets de la maison brillent comme jamais avec le savon liquide SUPER CLEAN proposé en formats pratiques de 1 L, 2 L, 3 L et 4 L. Avec ses quatre parfums fruités ou floraux (citron, pomme, lavande et rose), il transforme chaque nettoyage en une vague de fraîcheur et d’éclat !</p>', NULL, '2025-07-15 20:23:10', '2026-01-27 03:59:53', 27),
(165, 'SAVON LIQUIDE 4L', 'savon-liquide-4l', 'products/697023b632784.png', '<p>Toutes les surfaces et objets de la maison brillent comme jamais avec le savon liquide SUPER CLEAN proposé en formats pratiques de 1 L, 2 L, 3 L et 4 L. Avec ses quatre parfums fruités ou floraux (citron, pomme, lavande et rose), il transforme chaque nettoyage en une vague de fraîcheur et d’éclat !</p>', NULL, '2025-07-15 20:24:00', '2026-01-27 03:59:42', 27),
(166, 'Savon Liquide Citron 1L Bleu', 'savon-liquide-citron-1l-bleu', 'products/69702395972f6.png', '<p>Toutes les surfaces et objets de la maison brillent comme jamais avec le savon liquide SUPER CLEAN proposé en formats pratiques de 1 L, 2 L, 3 L et 4 L. Avec ses quatre parfums fruités ou floraux (citron, pomme, lavande et rose), il transforme chaque nettoyage en une vague de fraîcheur et d’éclat !</p>', NULL, '2025-07-15 20:24:58', '2026-01-27 03:59:31', 27),
(167, 'SAVON LIQUIDE-1L Citron', 'savon-liquide-1l-citron', 'products/6970237d0bd0b.png', '<p>Toutes les surfaces et objets de la maison brillent comme jamais avec le savon liquide SUPER CLEAN proposé en formats pratiques de 1 L, 2 L, 3 L et 4 L. Avec ses quatre parfums fruités ou floraux (citron, pomme, lavande et rose), il transforme chaque nettoyage en une vague de fraîcheur et d’éclat !</p>', NULL, '2025-07-15 20:25:51', '2026-01-27 03:59:19', 27),
(168, 'SAVON LIQUIDE-1L Lavande', 'savon-liquide-1l-lavande', 'products/697022d41a850.png', '<p>Toutes les surfaces et objets de la maison brillent comme jamais avec le savon liquide SUPER CLEAN proposé en formats pratiques de 1 L, 2 L, 3 L et 4 L. Avec ses quatre parfums fruités ou floraux (citron, pomme, lavande et rose), il transforme chaque nettoyage en une vague de fraîcheur et d’éclat !</p>', NULL, '2025-07-15 20:26:49', '2026-01-27 03:59:10', 27),
(169, 'SAVON LIQUIDE-1L Pomme', 'savon-liquide-1l-pomme', 'products/697020ae1c41f.png', '<p>Toutes les surfaces et objets de la maison brillent comme jamais avec le savon liquide SUPER CLEAN proposé en formats pratiques de 1 L, 2 L, 3 L et 4 L. Avec ses quatre parfums fruités ou floraux (citron, pomme, lavande et rose), il transforme chaque nettoyage en une vague de fraîcheur et d’éclat !</p>', NULL, '2025-07-15 20:27:30', '2026-01-27 03:58:48', 27),
(170, 'SAVON LIQUIDE-1L', 'savon-liquide-1l', 'products/6970209cf0469.png', '<p>Toutes les surfaces et objets de la maison brillent comme jamais avec le savon liquide SUPER CLEAN proposé en formats pratiques de 1 L, 2 L, 3 L et 4 L. Avec ses quatre parfums fruités ou floraux (citron, pomme, lavande et rose), il transforme chaque nettoyage en une vague de fraîcheur et d’éclat !</p>', NULL, '2025-07-15 20:29:05', '2026-01-27 03:58:06', 27),
(171, 'SAVON LIQUIDE-2L', 'savon-liquide-2l', 'products/6970207f8fce4.png', '<p>Toutes les surfaces et objets de la maison brillent comme jamais avec le savon liquide SUPER CLEAN proposé en formats pratiques de 1 L, 2 L, 3 L et 4 L. Avec ses quatre parfums fruités ou floraux (citron, pomme, lavande et rose), il transforme chaque nettoyage en une vague de fraîcheur et d’éclat !</p>', NULL, '2025-07-15 20:30:30', '2026-01-27 03:57:10', 27),
(172, 'SUPER CLEAN Acide Muriatique', 'super-clean-acide-muriatique', 'products/69701f039259e.png', '<p>L’acide muriatique SUPER CLEAN est le secret d’un nettoyage intensif pour éliminer les dépôts de calcaire, de rouille et de ciment. Anticorrosif et efficace pour restaurer la brillance des surfaces en pierre, en béton, en carrelage et en métal, il est idéal pour les travaux de rénovation ou d’entretien.</p><p><br></p><p>Multi-usages, il peut tout aussi bien dépolir et préparer les surfaces pour l’application d’un revêtement ou faire baisser le niveau du pH de l’eau d’une piscine.</p>', NULL, '2025-07-15 20:32:07', '2026-01-27 16:59:06', 34),
(173, 'SUPER CLEAN Bactéricide Citron 1L', 'super-clean-bactericide-citron-1l', 'products/69701ef02716b.png', '<p>Les nettoyants bactéricides disponibles en 5 senteurs (citron, pomme, rose, marine et savon noir), neutralisent efficacement les mauvaises odeurs, les virus et les bactéries.</p><p><br></p><p>Ils assainissent l’atmosphère pour créer un environnement sain et accueillant. SUPER CLEAN garantit toujours une propreté impeccable et une fraîcheur incomparable pour des moments agréables !</p>', NULL, '2025-07-15 20:33:21', '2026-01-27 03:55:58', 51),
(174, 'SUPER CLEAN Bactéricide Désodorisant Citron 4L', 'super-clean-bactericide-desodorisant-citron-4l', 'products/69701edcb0968.png', '<p>Les nettoyants bactéricides disponibles en 5 senteurs (citron, pomme, rose, marine et savon noir), neutralisent efficacement les mauvaises odeurs, les virus et les bactéries.</p><p><br></p><p>Ils assainissent l’atmosphère pour créer un environnement sain et accueillant. SUPER CLEAN garantit toujours une propreté impeccable et une fraîcheur incomparable pour des moments agréables !</p>', NULL, '2025-07-15 20:35:01', '2026-01-27 03:55:43', 51),
(175, 'SUPER CLEAN Bactéricide Désodorisant Pomme 4L', 'super-clean-bactericide-desodorisant-pomme-4l', 'products/69701eca62c6f.png', '<p>Les nettoyants bactéricides disponibles en 5 senteurs (citron, pomme, rose, marine et savon noir), neutralisent efficacement les mauvaises odeurs, les virus et les bactéries.</p><p><br></p><p>Ils assainissent l’atmosphère pour créer un environnement sain et accueillant. SUPER CLEAN garantit toujours une propreté impeccable et une fraîcheur incomparable pour des moments agréables !</p>', NULL, '2025-07-15 20:40:07', '2026-01-27 03:55:33', 51),
(103, 'ZEN BREEZE Brume d\'Ambiance - Bouquet Floral 400ml', 'zen-breeze-brume-dambiance-bouquet-floral-400ml', 'products/696fd982e8abd.png', '<p>Envoûtante, <strong>ZEN BREEZE</strong> enveloppe vos sens d’une douceur apaisante…</p><p><br></p><p>Nul ne résiste à sa brume légère et raffinée, qui diffuse une atmosphère de sérénité instantanée.</p><p><br></p><p>Son parfum subtil, parfaitement équilibré, se mêle avec harmonie à chaque pièce de la maison.</p><p><br></p><p>Elle séduit les amateurs d’élégance et d’authenticité, transformant chaque respiration en un moment d’évasion et de bien-être absolu.</p>', NULL, '2025-07-14 23:01:31', '2026-03-25 16:02:52', 36),
(104, 'ZEN BREEZE Brume d\'Ambiance - Évasion Tropicale 400ml', 'zen-breeze-brume-dambiance-evasion-tropicale-400ml', 'products/696fd99bb469d.png', '<p>Envoûtante, <strong>ZEN BREEZE</strong> enveloppe vos sens d’une douceur apaisante…</p><p><br></p><p>Nul ne résiste à sa brume légère et raffinée, qui diffuse une atmosphère de sérénité instantanée.</p><p><br></p><p>Son parfum subtil, parfaitement équilibré, se mêle avec harmonie à chaque pièce de la maison.</p><p><br></p><p>Elle séduit les amateurs d’élégance et d’authenticité, transformant chaque respiration en un moment d’évasion et de bien-être absolu.</p>', NULL, '2025-07-14 23:09:29', '2026-01-27 04:08:45', 36),
(105, 'ZEN BREEZE Brume d\'Ambiance - Jardin d\'Été 400ml', 'zen-breeze-brume-dambiance-jardin-dete-400ml', 'products/696fd9b5bae07.png', '<p>Envoûtante, <strong>ZEN BREEZE</strong> enveloppe vos sens d’une douceur apaisante…</p><p><br></p><p>Nul ne résiste à sa brume légère et raffinée, qui diffuse une atmosphère de sérénité instantanée.</p><p><br></p><p>Son parfum subtil, parfaitement équilibré, se mêle avec harmonie à chaque pièce de la maison.</p><p><br></p><p>Elle séduit les amateurs d’élégance et d’authenticité, transformant chaque respiration en un moment d’évasion et de bien-être absolu.</p>', NULL, '2025-07-14 23:10:32', '2026-01-27 04:08:28', 36),
(106, 'ZEN BREEZE Brume d\'Ambiance - Mélodie Gourmande 400ml', 'zen-breeze-brume-dambiance-melodie-gourmande-400ml', 'products/696fd9ca8cde0.png', '<p>Envoûtante, <strong>ZEN BREEZE</strong> enveloppe vos sens d’une douceur apaisante…</p><p><br></p><p>Nul ne résiste à sa brume légère et raffinée, qui diffuse une atmosphère de sérénité instantanée.</p><p><br></p><p>Son parfum subtil, parfaitement équilibré, se mêle avec harmonie à chaque pièce de la maison.</p><p><br></p><p>Elle séduit les amateurs d’élégance et d’authenticité, transformant chaque respiration en un moment d’évasion et de bien-être absolu.</p>', NULL, '2025-07-14 23:15:45', '2026-01-27 04:08:12', 36),
(107, 'ZEN BREEZE Brume d\'Ambiance - Odyssée Fraîche 400ml', 'zen-breeze-brume-dambiance-odyssee-fraiche-400ml', 'products/696fd9ef3379a.png', '<p>Envoûtante, <strong>ZEN BREEZE</strong> enveloppe vos sens d’une douceur apaisante…</p><p><br></p><p>Nul ne résiste à sa brume légère et raffinée, qui diffuse une atmosphère de sérénité instantanée.</p><p><br></p><p>Son parfum subtil, parfaitement équilibré, se mêle avec harmonie à chaque pièce de la maison.</p><p><br></p><p>Elle séduit les amateurs d’élégance et d’authenticité, transformant chaque respiration en un moment d’évasion et de bien-être absolu.</p>', NULL, '2025-07-15 15:12:25', '2026-01-27 04:08:01', 36),
(108, 'ZEN BREEZE Brume d\'Ambiance - Souffle du Désert 400ml', 'zen-breeze-brume-dambiance-souffle-du-desert-400ml', 'products/696fda0b7ad87.png', '<p>Envoûtante, <strong>ZEN BREEZE</strong> enveloppe vos sens d’une douceur apaisante…</p><p><br></p><p>Nul ne résiste à sa brume légère et raffinée, qui diffuse une atmosphère de sérénité instantanée.</p><p><br></p><p>Son parfum subtil, parfaitement équilibré, se mêle avec harmonie à chaque pièce de la maison.</p><p><br></p><p>Elle séduit les amateurs d’élégance et d’authenticité, transformant chaque respiration en un moment d’évasion et de bien-être absolu.</p>', NULL, '2025-07-15 15:14:34', '2026-01-27 04:07:45', 36),
(258, 'NIL Couleurs 180g', 'nil-couleurs-180g', 'products/696ff8b968aa8.png', '<p>De belles couleurs et une incroyable senteur avec NIL COULEURS !</p><p><br></p><p>Adaptée à tous les textiles les plus précieux (pagne, bazin, coton, synthétique, etc.) la toute nouvelle formule innovante NIL pénètre au cœur du linge.</p><p><br></p><p>Elle élimine les taches, nettoie en profondeur et ravive les couleurs. Pour une longue durée, les vêtements sont éclatants et libèrent un délicat parfum de savon de Marseille.</p>', NULL, '2025-07-15 22:56:47', '2026-01-27 02:59:50', 41),
(259, 'NIL Couleurs 500g', 'nil-couleurs-500g', 'products/696ff8a4d4524.png', '<p>De belles couleurs et une incroyable senteur avec NIL COULEURS !</p><p><br></p><p>Adaptée à tous les textiles les plus précieux (pagne, bazin, coton, synthétique, etc.) la toute nouvelle formule innovante NIL pénètre au cœur du linge.</p><p><br></p><p>Elle élimine les taches, nettoie en profondeur et ravive les couleurs. Pour une longue durée, les vêtements sont éclatants et libèrent un délicat parfum de savon de Marseille.</p>', NULL, '2025-07-15 22:57:23', '2026-01-27 02:59:17', 41),
(260, 'NIL Couleurs FP 1Kg', 'nil-couleurs-fp-1kg', 'products/696ff8881bd5c.png', '<p>De belles couleurs et une incroyable senteur avec NIL COULEURS !</p><p><br></p><p>Adaptée à tous les textiles les plus précieux (pagne, bazin, coton, synthétique, etc.) la toute nouvelle formule innovante NIL pénètre au cœur du linge.</p><p><br></p><p>Elle élimine les taches, nettoie en profondeur et ravive les couleurs. Pour une longue durée, les vêtements sont éclatants et libèrent un délicat parfum de savon de Marseille.</p>', NULL, '2025-07-15 22:58:08', '2026-01-27 02:59:03', 41);
INSERT INTO `products` (`id`, `name`, `slug`, `image`, `description`, `badge`, `created_at`, `updated_at`, `product_subcategory_id`) VALUES
(261, 'NIL CALIN Lavande 1L', 'nil-calin-lavande-1l', 'products/696ff85658d70.png', '<p>Grâce à l’assouplissant NIL, chaque vêtement retrouve douceur et fraîcheur !</p><p><br></p><p>Disponible en quatre parfums (lavande, pêche, marine et savon de Marseille), il se décline en deux formats économiques : 1L et 2 L. Sa formule assouplit les fibres, préserve l’éclat des couleurs, parfume délicatement et facilite le repassage.</p><p><br></p><p>Chouchouter ces textiles n’a jamais été aussi facile avec NIL !</p>', NULL, '2025-07-16 00:05:12', '2026-01-27 02:57:30', 54),
(262, 'NIL Poudre à laver 20g', 'nil-poudre-a-laver-20g', 'products/696ff83e2ae87.png', '<p>La célèbre lessive en poudre NIL allie performance et soin lors de chaque lavage à la main. </p><p> </p><p>Grâce à sa formule multi action et ses agents lavant actifs, les taches disparaissent rapidement, les couleurs restent vives et son agréable parfum dure longtemps.</p><p><br></p><p>Pour un linge doux et propre avec un minimum d’effort, c’est NIL le plus fort !</p>', NULL, '2025-07-16 00:17:05', '2026-01-27 02:56:52', 41),
(263, 'NIL Poudre à Laver 40g', 'nil-poudre-a-laver-40g', 'products/696ff82c7532a.png', '<p>La célèbre lessive en poudre NIL allie performance et soin lors de chaque lavage à la main. </p><p> </p><p>Grâce à sa formule multi action et ses agents lavant actifs, les taches disparaissent rapidement, les couleurs restent vives et son agréable parfum dure longtemps.</p><p><br></p><p>Pour un linge doux et propre avec un minimum d’effort, c’est NIL le plus fort !</p>', NULL, '2025-07-16 00:17:51', '2026-01-27 02:56:44', 41),
(264, 'NIL CALIN Marine 1L', 'nil-calin-marine-1l', 'products/696ff818229cb.png', '<p>Grâce à l’assouplissant NIL, chaque vêtement retrouve douceur et fraîcheur !</p><p><br></p><p>Disponible en quatre parfums (lavande, pêche, marine et savon de Marseille), il se décline en deux formats économiques : 1L et 2 L. Sa formule assouplit les fibres, préserve l’éclat des couleurs, parfume délicatement et facilite le repassage.</p><p><br></p><p>Chouchouter ces textiles n’a jamais été aussi facile avec NIL !</p>', NULL, '2025-07-16 00:18:35', '2026-01-27 02:56:05', 54),
(265, 'NIL CALIN Pêche 1L', 'nil-calin-peche-1l', 'products/696ff8015b42e.png', '<p>Grâce à l’assouplissant NIL, chaque vêtement retrouve douceur et fraîcheur !</p><p><br></p><p>Disponible en quatre parfums (lavande, pêche, marine et savon de Marseille), il se décline en deux formats économiques : 1L et 2 L. Sa formule assouplit les fibres, préserve l’éclat des couleurs, parfume délicatement et facilite le repassage.</p><p><br></p><p>Chouchouter ces textiles n’a jamais été aussi facile avec NIL !</p>', NULL, '2025-07-16 00:19:11', '2026-01-27 02:55:52', 54),
(266, 'NIL Machine 1,4kg', 'nil-machine-14kg', 'products/696ff7a0aa821.png', '<p>La lessive poudre pour machine NIL offre un nettoyage en profondeur tout en préservant les tissus. Elle transforme le lavage machine en un véritable soin pour le linge car respectueuse des couleurs et fibres textiles délicates.</p><p><br></p><p>Disponible en version Originale et savon de Marseille, elle garantit un linge frais, propre et agréablement parfumé.</p>', NULL, '2025-07-16 00:19:52', '2026-01-27 02:55:18', 41),
(267, 'NIL Machine 1,4kg Savon de Marseille', 'nil-machine-14kg-savon-de-marseille', 'products/696ff77ae0162.png', '<p>La lessive poudre pour machine NIL offre un nettoyage en profondeur tout en préservant les tissus. Elle transforme le lavage machine en un véritable soin pour le linge car respectueuse des couleurs et fibres textiles délicates.</p><p><br></p><p>Disponible en version Originale et savon de Marseille, elle garantit un linge frais, propre et agréablement parfumé.</p>', NULL, '2025-07-16 00:21:11', '2026-01-27 02:55:09', 41),
(268, 'NIL Machine 2,970kg', 'nil-machine-2970kg', 'products/696ff75f6f0b8.png', '<p>La lessive poudre pour machine NIL offre un nettoyage en profondeur tout en préservant les tissus. Elle transforme le lavage machine en un véritable soin pour le linge car respectueuse des couleurs et fibres textiles délicates.</p><p><br></p><p>Disponible en version Originale et savon de Marseille, elle garantit un linge frais, propre et agréablement parfumé.</p>', NULL, '2025-07-16 00:21:50', '2026-01-27 02:54:59', 41),
(251, 'NIL Machine 2,970kg Savon de Marseille', 'nil-machine-2970kg-savon-de-marseille', 'products/696ff981b1747.png', '<p>La lessive poudre pour machine NIL offre un nettoyage en profondeur tout en préservant les tissus. Elle transforme le lavage machine en un véritable soin pour le linge car respectueuse des couleurs et fibres textiles délicates.</p><p><br></p><p>Disponible en version Originale et savon de Marseille, elle garantit un linge frais, propre et agréablement parfumé.</p>', NULL, '2025-07-15 22:51:09', '2026-01-27 03:08:56', 41),
(252, 'NIL Poudre à laver 1Kg', 'nil-poudre-a-laver-1kg', 'products/696ff96b7fc5a.png', '<p>La célèbre lessive en poudre NIL allie performance et soin lors de chaque lavage à la main.</p><p><br></p><p>Grâce à sa formule multi action et ses agents lavant actifs, les taches disparaissent rapidement, les couleurs restent vives et son agréable parfum dure longtemps.</p><p><br></p><p>Pour un linge doux et propre avec un minimum d’effort, c’est NIL le plus fort !</p>', NULL, '2025-07-15 22:51:57', '2026-01-27 03:03:59', 41),
(253, 'NIL Pâte Lavante 750g', 'nil-pate-lavante-750g', 'products/696ff94e7f525.png', '<p>La pâte lavante NIL élimine efficacement et rapidement les taches et graisses incrustées grâce à sa formule puissante. </p><p><br></p><p>Adaptée aux sols, à la vaisselle, aux casseroles, aux grilles de barbecue et aux textiles, elle nettoie en profondeur toutes les surfaces : même les résidus d’huile qui adhèrent sur les mains. Sa texture et sa consistance pratique assurent une application ciblée, offrant un résultat inégalé !</p>', NULL, '2025-07-15 22:52:49', '2026-01-27 03:08:03', 56),
(254, 'NIL Détachant 250ml', 'nil-detachant-250ml', 'products/696ff93e7cfad.png', '<p>Avec sa formule puissante à l’oxygène actif et ultra concentrée en agents dégraissants, le détachant textile NIL élimine rapidement les taches les plus tenaces (herbe, café, vin, graisse, rouille, etc.) sans laisser de trace. Facile à appliquer grâce à son système de diffusion en spray, il pénètre rapidement les fibres des tissus blancs, noirs ou colorés pour un résultat impeccable dès la première utilisation.</p>', NULL, '2025-07-15 22:53:40', '2026-01-27 03:07:26', 38),
(255, 'NIL Poudre à laver 80g', 'nil-poudre-a-laver-80g', 'products/696ff92e42945.png', '<p>La célèbre lessive en poudre NIL allie performance et soin lors de chaque lavage à la main.</p><p><br></p><p>Grâce à sa formule multi action et ses agents lavant actifs, les taches disparaissent rapidement, les couleurs restent vives et son agréable parfum dure longtemps.</p><p><br></p><p>Pour un linge doux et propre avec un minimum d’effort, c’est NIL le plus fort !</p>', NULL, '2025-07-15 22:54:31', '2026-01-27 03:03:49', 41),
(256, 'NIL Poudre à laver 180g_2024', 'nil-poudre-a-laver-180g-2024', 'products/696ff8f06b095.png', '<p>La célèbre lessive en poudre NIL allie performance et soin lors de chaque lavage à la main.</p><p><br></p><p>Grâce à sa formule multi action et ses agents lavant actifs, les taches disparaissent rapidement, les couleurs restent vives et son agréable parfum dure longtemps.</p><p><br></p><p>Pour un linge doux et propre avec un minimum d’effort, c’est NIL le plus fort !</p>', NULL, '2025-07-15 22:55:12', '2026-01-27 03:03:37', 41),
(257, 'NIL Poudre à laver 500g_2024', 'nil-poudre-a-laver-500g-2024', 'products/696ff8d65074b.png', '<p>La célèbre lessive en poudre NIL allie performance et soin lors de chaque lavage à la main.</p><p><br></p><p>Grâce à sa formule multi action et ses agents lavant actifs, les taches disparaissent rapidement, les couleurs restent vives et son agréable parfum dure longtemps.</p><p><br></p><p>Pour un linge doux et propre avec un minimum d’effort, c’est NIL le plus fort !</p>', NULL, '2025-07-15 22:56:02', '2026-01-27 03:03:18', 41),
(239, 'CROSS Jaune 80g', 'cross-jaune-80g', 'products/696ffb84da1ae.png', '<p>Des vêtements éclatants et un parfum envoûtant, c’est la promesse de CROSS.</p><p><br></p><p>La lessive poudre main fait disparaître les taches tenaces et sources de mauvaises odeurs en un tour demain.</p><p><br></p><p>Utilisée quotidiennement, elle assure un linge impeccablement propre et éclatant, jour après jour.</p>', NULL, '2025-07-15 22:08:03', '2026-01-27 03:14:12', 43),
(240, 'CROSS Jaune 400g', 'cross-jaune-400g', 'products/696ffb5aabdce.png', '<p>Des vêtements éclatants et un parfum envoûtant, c’est la promesse de CROSS.</p><p><br></p><p>La lessive poudre main fait disparaître les taches tenaces et sources de mauvaises odeurs en un tour demain.</p><p><br></p><p>Utilisée quotidiennement, elle assure un linge impeccablement propre et éclatant, jour après jour.</p>', NULL, '2025-07-15 22:10:37', '2026-01-27 03:14:02', 43),
(243, 'COSMO Bleu 850g', 'cosmo-bleu-850g', 'products/696ffa86f2167.png', '<p>Pour un linge impeccable et délicatement parfumé, la lessive en poudre COSMO est d’une incroyable efficacité.</p><p><br></p><p>Sa formule agit au cœur des fibres pour éliminer les taches difficiles et neutraliser les odeurs corporelles imprégnées.</p><p><br></p><p>Adaptée au lavage à la main, elle assure une propreté inégalée, préserve la douceur des tissus et offre à coup sûr une fraîcheur qui dure.</p>', NULL, '2025-07-15 22:18:12', '2026-01-27 03:12:45', 44),
(244, 'COSMO Vert 400g', 'cosmo-vert-400g', 'products/696ffa7495d89.png', '<p>Pour un linge impeccable et délicatement parfumé, la lessive en poudre COSMO est d’une incroyable efficacité.</p><p><br></p><p>Sa formule agit au cœur des fibres pour éliminer les taches difficiles et neutraliser les odeurs corporelles imprégnées.</p><p><br></p><p>Adaptée au lavage à la main, elle assure une propreté inégalée, préserve la douceur des tissus et offre à coup sûr une fraîcheur qui dure.</p>', NULL, '2025-07-15 22:19:46', '2026-01-27 03:12:37', 44),
(282, 'AROMATE huile de Tournesol de 0,9 L', 'aromate-huile-de-tournesol-de-09-l', 'products/696ff31296399.png', '<p>Iconique, la mayonnaise originale AROMATE accompagne depuis plus de 15 ans tous les plats à la perfection.</p><p><br></p><p>Sa recette unique, à base d’huile de tournesol et de jaune d’œuf, lui apporte une texture légère pour une incroyable sensation de finesse en bouche.</p><p><br></p><p>Idéale pour sublimer les différents mets, fritures et sandwichs, elle permet aussi de préparer de délicieuses sauces et vinaigrettes.</p>', NULL, '2025-07-16 01:12:28', '2026-01-27 02:29:09', 20),
(283, 'AROMATE Huile de Tournesol 3L', 'aromate-huile-de-tournesol-3l', 'products/696ff30290478.png', '<p>Iconique, la mayonnaise originale AROMATE accompagne depuis plus de 15 ans tous les plats à la perfection.</p><p><br></p><p>Sa recette unique, à base d’huile de tournesol et de jaune d’œuf, lui apporte une texture légère pour une incroyable sensation de finesse en bouche.</p><p><br></p><p>Idéale pour sublimer les différents mets, fritures et sandwichs, elle permet aussi de préparer de délicieuses sauces et vinaigrettes.</p>', NULL, '2025-07-16 01:13:48', '2026-01-27 02:28:58', 20),
(284, 'AROMATE  Mayonnaise 12ml', 'aromate-mayonnaise-12ml', 'products/696ff2f0b8c90.png', '<p>Iconique, la mayonnaise originale AROMATE accompagne depuis plus de 15 ans tous les plats à la perfection.</p><p><br></p><p>Sa recette unique, à base d’huile de tournesol et de jaune d’œuf, lui apporte une texture légère pour une incroyable sensation de finesse en bouche.</p><p><br></p><p>Idéale pour sublimer les différents mets, fritures et sandwichs, elle permet aussi de préparer de délicieuses sauces et vinaigrettes.</p>', NULL, '2025-07-16 01:14:55', '2026-01-27 02:28:05', 16),
(285, 'AROMATE Light Mayonnaise Bocal 250ml', 'aromate-light-mayonnaise-bocal-250ml', 'products/696ff2e31ee5c.png', '<p>Iconique, la mayonnaise originale AROMATE accompagne depuis plus de 15 ans tous les plats à la perfection.</p><p><br></p><p>Sa recette unique, à base d’huile de tournesol et de jaune d’œuf, lui apporte une texture légère pour une incroyable sensation de finesse en bouche.</p><p><br></p><p>Idéale pour sublimer les différents mets, fritures et sandwichs, elle permet aussi de préparer de délicieuses sauces et vinaigrettes.</p>', NULL, '2025-07-16 01:15:39', '2026-03-25 14:15:24', 57),
(328, 'MIA Mayonnaise 250ml', 'mia-mayonnaise-250ml', 'products/696feaba5a20a.png', '<p>Mamaaa Mia : la mayonnaise MIA, on n’en revient pas !</p><p><br></p><p>Préparée avec soin à base d’huile végétale et d’ingrédients rigoureusement sélectionnés,</p><p><br></p><p>Elle relève les salades fraîches, sandwichs gourmands et toutes autres préparations.</p><p><br></p><p>Délicieuse et onctueuse, elle éveille les papilles à chaque bouchée pour un plaisir inégalé !</p>', NULL, '2025-07-16 01:54:25', '2026-01-27 01:44:06', 46),
(329, 'MIA Mayonnaise 450ml', 'mia-mayonnaise-450ml', 'products/696feaa94232e.png', '<p>Mamaaa Mia : la mayonnaise MIA, on n’en revient pas !</p><p><br></p><p>Préparée avec soin à base d’huile végétale et d’ingrédients rigoureusement sélectionnés,</p><p><br></p><p>Elle relève les salades fraîches, sandwichs gourmands et toutes autres préparations.</p><p><br></p><p>Délicieuse et onctueuse, elle éveille les papilles à chaque bouchée pour un plaisir inégalé !</p>', NULL, '2025-07-16 01:54:57', '2026-01-27 01:43:57', 46),
(330, 'MIA Mayonnaise 950ml', 'mia-mayonnaise-950ml', 'products/696fea4679d1a.png', '<p>Mamaaa Mia : la mayonnaise MIA, on n’en revient pas ! </p><p><br></p><p>Préparée avec soin à base d’huile végétale et d’ingrédients rigoureusement sélectionnés, </p><p><br></p><p>Elle relève les salades fraîches, sandwichs gourmands et toutes autres préparations.</p><p><br></p><p>Délicieuse et onctueuse, elle éveille les papilles à chaque bouchée pour un plaisir inégalé !</p>', NULL, '2025-07-16 01:55:23', '2026-01-27 01:43:38', 46),
(333, 'AMERIGO Mayonnaise Stick 10ml', 'amerigo-mayonnaise-stick-10ml', 'products/696fe98ed3afb.png', '<p>Onctueuse et irrésistible, <strong>AMERIGO</strong> sublime chaque bouchée…</p><p><br></p><p>Sa texture généreuse et veloutée fond en bouche, tandis que son goût équilibré, fin et savoureux accompagne à merveille vos plats préférés : frites croustillantes, viandes grillées, poissons délicats ou salades fraîches.</p><p><br></p><p>Elle séduit les palais en quête d’authenticité et transforme chaque repas en un moment de pur plaisir gourmand.</p>', NULL, '2025-07-16 02:02:17', '2026-01-27 01:43:07', 48),
(334, 'AMERIGO Mayonnaise 3.8L', 'amerigo-mayonnaise-38l', 'products/696fe97e77d50.png', '<p>Onctueuse et irrésistible, <strong>AMERIGO</strong> sublime chaque bouchée…</p><p><br></p><p>Sa texture généreuse et veloutée fond en bouche, tandis que son goût équilibré, fin et savoureux accompagne à merveille vos plats préférés : frites croustillantes, viandes grillées, poissons délicats ou salades fraîches.</p><p><br></p><p>Elle séduit les palais en quête d’authenticité et transforme chaque repas en un moment de pur plaisir gourmand.</p>', NULL, '2025-07-16 02:02:44', '2026-01-27 01:42:59', 48),
(335, 'TOP MAYO Mayonnaise 250ml', 'top-mayo-mayonnaise-250ml', 'products/696fe96953835.png', '<p>TOP MAYO c’est tout simplement le top, du top !</p><p><br></p><p>Sa texture crémeuse et son goût incomparable la hissent au top des mayonnaises pour accompagner burgers, sandwichs, frites et bien d’autres délices.</p><p><br></p><p>À partager grâce à ses grands formats ou pour une seule utilisation dans sa version sachet, elle fait toujours son effet !</p>', NULL, '2025-07-16 02:10:50', '2026-01-27 01:41:47', 49),
(336, 'TOP MAYO Mayonnaise 475ml', 'top-mayo-mayonnaise-475ml', 'products/696fe94cc1459.png', '<p>TOP MAYO c’est tout simplement le top, du top !</p><p><br></p><p>Sa texture crémeuse et son goût incomparable la hissent au top des mayonnaises pour accompagner burgers, sandwichs, frites et bien d’autres délices.</p><p><br></p><p>À partager grâce à ses grands formats ou pour une seule utilisation dans sa version sachet, elle fait toujours son effet !</p>', NULL, '2025-07-16 02:11:32', '2026-01-27 01:38:21', 49),
(337, 'TOP MAYO Mayonnaise 950ml', 'top-mayo-mayonnaise-950ml', 'products/696fe93d69dda.png', '<p>TOP MAYO c’est tout simplement le top, du top !</p><p><br></p><p>Sa texture crémeuse et son goût incomparable la hissent au top des mayonnaises pour accompagner burgers, sandwichs, frites et bien d’autres délices.</p><p><br></p><p>À partager grâce à ses grands formats ou pour une seule utilisation dans sa version sachet, elle fait toujours son effet !</p>', NULL, '2025-07-16 02:12:03', '2026-01-27 01:35:13', 49),
(200, 'SUPER CLEAN Liquide Vaisselle Citron 900ml', 'super-clean-liquide-vaisselle-citron-900ml', 'products/6970141d2a44c.png', '<p>Pour une vaisselle impeccablement éclatante et qui sent bon la fraîcheur, le liquide vaisselle SUPER CLEAN se décline en différentes senteurs : citron, mandarine, fraise, lavande, pomme et marine.</p><p><br></p><p>Il élimine en profondeur les graisses les plus tenaces tout en préservant la brillance de tous les ustensiles de la cuisine.</p>', NULL, '2025-07-15 21:07:29', '2026-01-27 03:36:14', 52),
(201, 'SUPER CLEAN Liquide Vaisselle fraise 450ml', 'super-clean-liquide-vaisselle-fraise-450ml', 'products/697013f7a4cb7.png', '<p>Pour une vaisselle impeccablement éclatante et qui sent bon la fraîcheur, le liquide vaisselle SUPER CLEAN se décline en différentes senteurs : citron, mandarine, fraise, lavande, pomme et marine.</p><p><br></p><p>Il élimine en profondeur les graisses les plus tenaces tout en préservant la brillance de tous les ustensiles de la cuisine.</p>', NULL, '2025-07-15 21:08:18', '2026-01-27 03:34:56', 52),
(202, 'SUPER CLEAN Liquide Vaisselle fraise 900ml', 'super-clean-liquide-vaisselle-fraise-900ml', 'products/697013cd883ce.png', '<p>Pour une vaisselle impeccablement éclatante et qui sent bon la fraîcheur, le liquide vaisselle SUPER CLEAN se décline en différentes senteurs : citron, mandarine, fraise, lavande, pomme et marine.</p><p><br></p><p>Il élimine en profondeur les graisses les plus tenaces tout en préservant la brillance de tous les ustensiles de la cuisine.</p>', NULL, '2025-07-15 21:09:14', '2026-01-27 03:34:33', 52),
(203, 'SUPER CLEAN Liquide Vaisselle Lavande 900ml', 'super-clean-liquide-vaisselle-lavande-900ml', 'products/69700aafe59e5.png', '<p>Pour une vaisselle impeccablement éclatante et qui sent bon la fraîcheur, le liquide vaisselle SUPER CLEAN se décline en différentes senteurs : citron, mandarine, fraise, lavande, pomme et marine.</p><p><br></p><p>Il élimine en profondeur les graisses les plus tenaces tout en préservant la brillance de tous les ustensiles de la cuisine.</p>', NULL, '2025-07-15 21:09:50', '2026-01-27 03:34:21', 52),
(204, 'SUPER CLEAN Liquide Vaisselle madarine 900ml_Nouveau Bonchon 02', 'super-clean-liquide-vaisselle-madarine-900ml-nouveau-bonchon-02', 'products/69700a713fb6c.png', '<p>Pour une vaisselle impeccablement éclatante et qui sent bon la fraîcheur, le liquide vaisselle SUPER CLEAN se décline en différentes senteurs : citron, mandarine, fraise, lavande, pomme et marine.</p><p><br></p><p>Il élimine en profondeur les graisses les plus tenaces tout en préservant la brillance de tous les ustensiles de la cuisine.</p>', NULL, '2025-07-15 21:10:48', '2026-01-27 03:34:10', 52),
(205, 'SUPER CLEAN Liquide Vaisselle Marine 900ml', 'super-clean-liquide-vaisselle-marine-900ml', 'products/69700a4d2ad03.png', '<p>Pour une vaisselle impeccablement éclatante et qui sent bon la fraîcheur, le liquide vaisselle SUPER CLEAN se décline en différentes senteurs : citron, mandarine, fraise, lavande, pomme et marine.</p><p><br></p><p>Il élimine en profondeur les graisses les plus tenaces tout en préservant la brillance de tous les ustensiles de la cuisine.</p>', NULL, '2025-07-15 21:11:30', '2026-01-27 03:33:57', 52),
(206, 'SUPER CLEAN Liquide Vaisselle Peaux Sensibles Aloé Vera 900ml', 'super-clean-liquide-vaisselle-peaux-sensibles-aloe-vera-900ml', 'products/69700a2b2b5ee.png', '<p>Pour une vaisselle impeccablement éclatante et qui sent bon la fraîcheur, le liquide vaisselle SUPER CLEAN se décline en différentes senteurs : citron, mandarine, fraise, lavande, pomme et marine.</p><p><br></p><p>Il élimine en profondeur les graisses les plus tenaces tout en préservant la brillance de tous les ustensiles de la cuisine.</p>', NULL, '2025-07-15 21:12:20', '2026-01-27 03:32:30', 52),
(207, 'SUPER CLEAN Liquide Vaisselle Peaux Sensibles Fleur de Coton 900ml', 'super-clean-liquide-vaisselle-peaux-sensibles-fleur-de-coton-900ml', 'products/697009f2d9b11.png', '<p>Pour une vaisselle impeccablement éclatante et qui sent bon la fraîcheur, le liquide vaisselle SUPER CLEAN se décline en différentes senteurs : citron, mandarine, fraise, lavande, pomme et marine.</p><p><br></p><p>Il élimine en profondeur les graisses les plus tenaces tout en préservant la brillance de tous les ustensiles de la cuisine.</p>', NULL, '2025-07-15 21:17:39', '2026-01-27 03:32:21', 52),
(208, 'SUPER CLEAN Liquide Vaisselle Pomme 450ml', 'super-clean-liquide-vaisselle-pomme-450ml', 'products/697009d632145.png', '<p>Pour une vaisselle impeccablement éclatante et qui sent bon la fraîcheur, le liquide vaisselle SUPER CLEAN se décline en différentes senteurs : citron, mandarine, fraise, lavande, pomme et marine.</p><p><br></p><p>Il élimine en profondeur les graisses les plus tenaces tout en préservant la brillance de tous les ustensiles de la cuisine.</p>', NULL, '2025-07-15 21:18:47', '2026-01-27 03:31:55', 52),
(209, 'SUPER CLEAN Liquide Vaisselle Pomme 900ml', 'super-clean-liquide-vaisselle-pomme-900ml', 'products/697009c445ba1.png', '<p>Pour une vaisselle impeccablement éclatante et qui sent bon la fraîcheur, le liquide vaisselle SUPER CLEAN se décline en différentes senteurs : citron, mandarine, fraise, lavande, pomme et marine.</p><p><br></p><p>Il élimine en profondeur les graisses les plus tenaces tout en préservant la brillance de tous les ustensiles de la cuisine.</p>', NULL, '2025-07-15 21:19:26', '2026-01-27 03:31:42', 52),
(210, 'SUPER CLEAN Nettoyant Multi-Usages 1L', 'super-clean-nettoyant-multi-usages-1l', 'products/6970097e8ed36.png', '<p>Pour se débarrasser des microbes et de la saleté, SUPER CLEAN 3 en 1 est le meilleur allié.</p><p><br></p><p>Sans javel, sa formule puissante éradique 99,9 % des bactéries et virus.</p><p><br></p><p>Utilisé sur toutes les surfaces lavables, il nettoie, dégraisse et désinfecte efficacement pour un intérieur propre et une hygiène sans pareille !</p>', NULL, '2025-07-15 21:21:44', '2026-01-27 16:48:09', 30),
(211, 'SUPER CLEAN Nettoyant Multi surfaces 800ml', 'super-clean-nettoyant-multi-surfaces-800ml', 'products/6970096ca632d.png', '<p>Polyvalent et efficace, le nettoyant 5 en 1 SUPER CLEAN nettoie, désinfecte, dégraisse, parfume et fait briller l’intérieur en un clin d’œil !</p><p><br></p><p>Sans javel et non corrosif, il embellit chaque recoin de la maison, du plan de travail aux étagères et bien plus encore.</p><p><br></p><p>Avec SUPER CLEAN, c’est l’assurance d’un foyer toujours clean et soigné !</p>', NULL, '2025-07-15 21:26:42', '2026-01-27 17:05:09', 53),
(212, 'SUPER CLEAN Nettoyant Toutes Surfaces Citron 800ml', 'super-clean-nettoyant-toutes-surfaces-citron-800ml', 'products/6970092d35607.png', '<p>Plurivalent et efficace, le nettoyant 5 en 1 SUPER CLEAN nettoie, désinfecte, dégraisse, parfume et fait briller l’intérieur en un clin d’œil !</p><p><br></p><p>Sans javel et non corrosif, il embellit chaque recoin de la maison, du plan de travail aux étagères et bien plus encore.</p><p><br></p><p>Avec SUPER CLEAN, c’est l’assurance d’un foyer toujours clean et soigné !</p>', NULL, '2025-07-15 21:29:06', '2026-01-27 03:27:52', 53),
(213, 'SUPER CLEAN Nettoyant Toutes Surfaces Savon Noir 800ml', 'super-clean-nettoyant-toutes-surfaces-savon-noir-800ml', 'products/6970091a95e37.png', '<p>Plurivalent et efficace, le nettoyant 5 en 1 SUPER CLEAN nettoie, désinfecte, dégraisse, parfume et fait briller l’intérieur en un clin d’œil !</p><p><br></p><p>Sans javel et non corrosif, il embellit chaque recoin de la maison, du plan de travail aux étagères et bien plus encore.</p><p><br></p><p>Avec SUPER CLEAN, c’est l’assurance d’un foyer toujours clean et soigné !</p>', NULL, '2025-07-15 21:29:45', '2026-01-27 03:27:41', 53),
(214, 'SUPER CLEAN Nettoyant Vitres 800ml', 'super-clean-nettoyant-vitres-800ml', 'products/697008fe8249d.png', '<p>Le nettoyant vitres SUPER CLEAN permet de laver facilement et de faire briller toutes les surfaces vitrées.</p><p><br></p><p>Sa formule unique, aux propriétés nettoyantes surpuissantes, élimine efficacement la poussière, les salissures et les traces de doigts.</p><p><br></p><p>Il se décline en spray 800 ML doté d’un pulvérisateur à large diffusion pour une utilisation en intérieur et en bidon de 4 L, pour les vitres et pare-brise de tous les véhicules.</p>', NULL, '2025-07-15 21:30:53', '2026-01-27 03:26:49', 28),
(215, 'SUPER CLEAN Nettoyant Vitres 800ml La Recharge Bouteille(spot)', 'super-clean-nettoyant-vitres-800ml-la-recharge-bouteillespot', 'products/697008ecd313a.png', '<p>Le nettoyant vitres SUPER CLEAN permet de laver facilement et de faire briller toutes les surfaces vitrées.</p><p><br></p><p>Sa formule unique, aux propriétés nettoyantes surpuissantes, élimine efficacement la poussière, les salissures et les traces de doigts.</p><p><br></p><p>Il se décline en spray 800 ML doté d’un pulvérisateur à large diffusion pour une utilisation en intérieur et en bidon de 4 L, pour les vitres et pare-brise de tous les véhicules.</p>', NULL, '2025-07-15 21:31:49', '2026-01-27 03:26:39', 28),
(216, 'SUPER CLEAN Poudre à Récurer Citron 1Kg', 'super-clean-poudre-a-recurer-citron-1kg', 'products/697008d8bbdbc.png', '<p>La poudre à récurer SUPER CLEAN élimine efficacement la saleté incrustée sans rayer. Elle permet d’assainir et de récurer en toute sérénité les impuretés, le calcaire et les résidus sur les surfaces en acier (inoxydable), en céramique, en émail et même chromées.</p><p><br></p><p>Disponible en 3 senteurs, elle diffuse une agréable fraîcheur parfumée dans toute la maison.</p>', NULL, '2025-07-15 21:32:34', '2026-01-27 03:24:54', 32),
(217, 'SUPER CLEAN Poudre à Récurer Citron 500g', 'super-clean-poudre-a-recurer-citron-500g', 'products/697008addb274.png', '<p>La poudre à récurer SUPER CLEAN élimine efficacement la saleté incrustée sans rayer. Elle permet d’assainir et de récurer en toute sérénité les impuretés, le calcaire et les résidus sur les surfaces en acier (inoxydable), en céramique, en émail et même chromées.</p><p><br></p><p>Disponible en 3 senteurs, elle diffuse une agréable fraîcheur parfumée dans toute la maison.</p>', NULL, '2025-07-15 21:33:47', '2026-01-27 03:24:44', 32),
(218, 'SUPER CLEAN Poudre à Récurer Mandarine 1Kg', 'super-clean-poudre-a-recurer-mandarine-1kg', 'products/6970089cc5b2a.png', '<p>La poudre à récurer SUPER CLEAN élimine efficacement la saleté incrustée sans rayer. Elle permet d’assainir et de récurer en toute sérénité les impuretés, le calcaire et les résidus sur les surfaces en acier (inoxydable), en céramique, en émail et même chromées.</p><p><br></p><p>Disponible en 3 senteurs, elle diffuse une agréable fraîcheur parfumée dans toute la maison.</p>', NULL, '2025-07-15 21:34:44', '2026-01-27 03:24:34', 32),
(219, 'SUPER CLEAN Poudre à Récurer Mandarine 500g', 'super-clean-poudre-a-recurer-mandarine-500g', 'products/69700874af1d3.png', '<p>La poudre à récurer SUPER CLEAN élimine efficacement la saleté incrustée sans rayer. Elle permet d’assainir et de récurer en toute sérénité les impuretés, le calcaire et les résidus sur les surfaces en acier (inoxydable), en céramique, en émail et même chromées.</p><p><br></p><p>Disponible en 3 senteurs, elle diffuse une agréable fraîcheur parfumée dans toute la maison.</p>', NULL, '2025-07-15 21:35:25', '2026-01-27 03:22:47', 32),
(220, 'SUPER CLEAN Poudre à Récurer Eucalyptus', 'super-clean-poudre-a-recurer-eucalyptus', 'products/6970084f69d8a.png', '<p>La poudre à récurer SUPER CLEAN élimine efficacement la saleté incrustée sans rayer. Elle permet d’assainir et de récurer en toute sérénité les impuretés, le calcaire et les résidus sur les surfaces en acier (inoxydable), en céramique, en émail et même chromées.</p><p><br></p><p>Disponible en 3 senteurs, elle diffuse une agréable fraîcheur parfumée dans toute la maison.</p>', NULL, '2025-07-15 21:36:09', '2026-01-27 03:22:30', 32),
(221, 'SUPER CLEAN Poudre à Récurer Eucalyptus 500g', 'super-clean-poudre-a-recurer-eucalyptus-500g', 'products/697008313b26f.png', '<p>La poudre à récurer SUPER CLEAN élimine efficacement la saleté incrustée sans rayer. Elle permet d’assainir et de récurer en toute sérénité les impuretés, le calcaire et les résidus sur les surfaces en acier (inoxydable), en céramique, en émail et même chromées.</p><p><br></p><p>Disponible en 3 senteurs, elle diffuse une agréable fraîcheur parfumée dans toute la maison.</p>', NULL, '2025-07-15 21:37:25', '2026-01-27 03:22:20', 32),
(235, 'ARC Vert 80g', 'arc-vert-80g', 'products/696ffbeae6cd7.png', '<p>Avec sa composition unique, la lessive en poudre ARC c’est le choix malin pour un lavage à la main.</p><p><br></p><p>Elle combat les taches les plus résistantes tout en protégeant les couleurs des textiles. </p><p><br></p><p>Disponible en plusieurs formats, elle enveloppe d’une note de fraîcheur et de douceur le linge de toute la maison !</p>', NULL, '2025-07-15 21:57:43', '2026-01-27 03:15:08', 17),
(236, 'ARC Vert 400g', 'arc-vert-400g', 'products/696ffbd6dc00c.png', '<p>Avec sa composition unique, la lessive en poudre ARC c’est le choix malin pour un lavage à la main.</p><p><br></p><p>Elle combat les taches les plus résistantes tout en protégeant les couleurs des textiles. </p><p><br></p><p>Disponible en plusieurs formats, elle enveloppe d’une note de fraîcheur et de douceur le linge de toute la maison !</p>', NULL, '2025-07-15 21:58:53', '2026-01-27 03:14:59', 17),
(237, 'ARC Vert 850g', 'arc-vert-850g', 'products/696ffbb404192.png', '<p>Avec sa composition unique, la lessive en poudre ARC c’est le choix malin pour un lavage à la main.</p><p><br></p><p>Elle combat les taches les plus résistantes tout en protégeant les couleurs des textiles. </p><p><br></p><p>Disponible en plusieurs formats, elle enveloppe d’une note de fraîcheur et de douceur le linge de toute la maison !</p>', NULL, '2025-07-15 21:59:46', '2026-01-27 03:14:48', 17),
(241, 'CROSS Jaune 850g', 'cross-jaune-850g', 'products/696ffb7011869.png', '<p>Des vêtements éclatants et un parfum envoûtant, c’est la promesse de CROSS.</p><p><br></p><p>La lessive poudre main fait disparaître les taches tenaces et sources de mauvaises odeurs en un tour demain.</p><p><br></p><p>Utilisée quotidiennement, elle assure un linge impeccablement propre et éclatant, jour après jour.</p>', NULL, '2025-07-15 22:12:03', '2026-01-27 03:13:52', 43),
(245, 'COSMO Vert 850g', 'cosmo-vert-850g', 'products/696ffa6696d16.png', '<p>Pour un linge impeccable et délicatement parfumé, la lessive en poudre COSMO est d’une incroyable efficacité.</p><p><br></p><p>Sa formule agit au cœur des fibres pour éliminer les taches difficiles et neutraliser les odeurs corporelles imprégnées.</p><p><br></p><p>Adaptée au lavage à la main, elle assure une propreté inégalée, préserve la douceur des tissus et offre à coup sûr une fraîcheur qui dure.</p>', NULL, '2025-07-15 22:20:26', '2026-01-27 03:12:28', 44),
(246, 'COSMO Jaune 400g', 'cosmo-jaune-400g', 'products/696ffa43aa8eb.png', '<p>Pour un linge impeccable et délicatement parfumé, la lessive en poudre COSMO est d’une incroyable efficacité.</p><p><br></p><p>Sa formule agit au cœur des fibres pour éliminer les taches difficiles et neutraliser les odeurs corporelles imprégnées.</p><p><br></p><p>Adaptée au lavage à la main, elle assure une propreté inégalée, préserve la douceur des tissus et offre à coup sûr une fraîcheur qui dure.</p>', NULL, '2025-07-15 22:21:19', '2026-01-27 03:12:13', 44),
(247, 'COSMO Jaune 850g', 'cosmo-jaune-850g', 'products/696ffa2e37a80.png', '<p>Pour un linge impeccable et délicatement parfumé, la lessive en poudre COSMO est d’une incroyable efficacité.</p><p><br></p><p>Sa formule agit au cœur des fibres pour éliminer les taches difficiles et neutraliser les odeurs corporelles imprégnées.</p><p><br></p><p>Adaptée au lavage à la main, elle assure une propreté inégalée, préserve la douceur des tissus et offre à coup sûr une fraîcheur qui dure.</p>', NULL, '2025-07-15 22:22:02', '2026-01-27 03:12:00', 44),
(248, 'COSMO Rose 400g', 'cosmo-rose-400g', 'products/696ffa1948358.png', '<p>Pour un linge impeccable et délicatement parfumé, la lessive en poudre COSMO est d’une incroyable efficacité.</p><p><br></p><p>Sa formule agit au cœur des fibres pour éliminer les taches difficiles et neutraliser les odeurs corporelles imprégnées.</p><p><br></p><p>Adaptée au lavage à la main, elle assure une propreté inégalée, préserve la douceur des tissus et offre à coup sûr une fraîcheur qui dure.</p>', NULL, '2025-07-15 22:22:41', '2026-01-27 03:11:44', 44),
(249, 'COSMO Rose 850g', 'cosmo-rose-850g', 'products/696ff9ea28005.png', '<p>Pour un linge impeccable et délicatement parfumé, la lessive en poudre COSMO est d’une incroyable efficacité.</p><p><br></p><p>Sa formule agit au cœur des fibres pour éliminer les taches difficiles et neutraliser les odeurs corporelles imprégnées.</p><p><br></p><p>Adaptée au lavage à la main, elle assure une propreté inégalée, préserve la douceur des tissus et offre à coup sûr une fraîcheur qui dure.</p>', NULL, '2025-07-15 22:23:19', '2026-01-27 03:11:34', 44),
(250, 'COSMO Vert 50g', 'cosmo-vert-50g', 'products/696ffa04a472a.png', '<p>Pour un linge impeccable et délicatement parfumé, la lessive en poudre COSMO est d’une incroyable efficacité.</p><p><br></p><p>Sa formule agit au cœur des fibres pour éliminer les taches difficiles et neutraliser les odeurs corporelles imprégnées.</p><p><br></p><p>Adaptée au lavage à la main, elle assure une propreté inégalée, préserve la douceur des tissus et offre à coup sûr une fraîcheur qui dure.</p>', NULL, '2025-07-15 22:24:39', '2026-01-27 03:11:17', 44),
(269, 'NIL Câlin Assouplissant Lavande 550ml', 'nil-calin-assouplissant-lavande-550ml', 'products/696ff5c9718d1.png', '<p>Grâce à l’assouplissant NIL, chaque vêtement retrouve douceur et fraîcheur !</p><p><br></p><p>Disponible en quatre parfums (lavande, pêche, marine et savon de Marseille), il se décline en deux formats économiques : 1L et 2 L. Sa formule assouplit les fibres, préserve l’éclat des couleurs, parfume délicatement et facilite le repassage.</p><p><br></p><p>Chouchouter ces textiles n’a jamais été aussi facile avec NIL !</p>', NULL, '2025-07-16 00:22:28', '2026-01-27 02:54:32', 54),
(270, 'NIL Câlin Assouplissant Marine 550ml', 'nil-calin-assouplissant-marine-550ml', 'products/696ff5b151d10.png', '<p>Grâce à l’assouplissant NIL, chaque vêtement retrouve douceur et fraîcheur !</p><p><br></p><p>Disponible en quatre parfums (lavande, pêche, marine et savon de Marseille), il se décline en deux formats économiques : 1L et 2 L. Sa formule assouplit les fibres, préserve l’éclat des couleurs, parfume délicatement et facilite le repassage.</p><p><br></p><p>Chouchouter ces textiles n’a jamais été aussi facile avec NIL !</p>', NULL, '2025-07-16 00:23:24', '2026-01-27 02:54:14', 54),
(271, 'NIL Câlin Assouplissant Pêche 550ml', 'nil-calin-assouplissant-peche-550ml', 'products/696ff498a0dee.png', '<p>Grâce à l’assouplissant NIL, chaque vêtement retrouve douceur et fraîcheur !</p><p><br></p><p>Disponible en quatre parfums (lavande, pêche, marine et savon de Marseille), il se décline en deux formats économiques : 1L et 2 L. Sa formule assouplit les fibres, préserve l’éclat des couleurs, parfume délicatement et facilite le repassage.</p><p><br></p><p>Chouchouter ces textiles n’a jamais été aussi facile avec NIL !</p>', NULL, '2025-07-16 00:24:13', '2026-01-27 02:54:04', 54),
(272, 'NIL Câlin Assouplissant Savon de Marseille 550ml', 'nil-calin-assouplissant-savon-de-marseille-550ml', 'products/696ff4860fe4f.png', '<p>Grâce à l’assouplissant NIL, chaque vêtement retrouve douceur et fraîcheur !</p><p><br></p><p>Disponible en quatre parfums (lavande, pêche, marine et savon de Marseille), il se décline en deux formats économiques : 1L et 2 L. Sa formule assouplit les fibres, préserve l’éclat des couleurs, parfume délicatement et facilite le repassage.</p><p><br></p><p>Chouchouter ces textiles n’a jamais été aussi facile avec NIL !</p>', NULL, '2025-07-16 00:24:44', '2026-01-27 02:53:54', 54),
(273, 'NIL CALIN Lavande 2L', 'nil-calin-lavande-2l', 'products/696ff4592a302.png', '<p>Grâce à l’assouplissant NIL, chaque vêtement retrouve douceur et fraîcheur !</p><p><br></p><p>Disponible en quatre parfums (lavande, pêche, marine et savon de Marseille), il se décline en deux formats économiques : 1L et 2 L. Sa formule assouplit les fibres, préserve l’éclat des couleurs, parfume délicatement et facilite le repassage.</p><p><br></p><p>Chouchouter ces textiles n’a jamais été aussi facile avec NIL !</p>', NULL, '2025-07-16 00:25:31', '2026-01-27 02:53:45', 54),
(274, 'NIL CALIN Marine 2L', 'nil-calin-marine-2l', 'products/696ff44909bd8.png', '<p>Grâce à l’assouplissant NIL, chaque vêtement retrouve douceur et fraîcheur !</p><p><br></p><p>Disponible en quatre parfums (lavande, pêche, marine et savon de Marseille), il se décline en deux formats économiques : 1L et 2 L. Sa formule assouplit les fibres, préserve l’éclat des couleurs, parfume délicatement et facilite le repassage.</p><p><br></p><p>Chouchouter ces textiles n’a jamais été aussi facile avec NIL !</p>', NULL, '2025-07-16 00:26:00', '2026-01-27 02:53:37', 54),
(275, 'NIL CALIN Pêche 2L', 'nil-calin-peche-2l', 'products/696ff4372492b.png', '<p>Grâce à l’assouplissant NIL, chaque vêtement retrouve douceur et fraîcheur !</p><p><br></p><p>Disponible en quatre parfums (lavande, pêche, marine et savon de Marseille), il se décline en deux formats économiques : 1L et 2 L. Sa formule assouplit les fibres, préserve l’éclat des couleurs, parfume délicatement et facilite le repassage.</p><p><br></p><p>Chouchouter ces textiles n’a jamais été aussi facile avec NIL !</p>', NULL, '2025-07-16 00:26:33', '2026-01-27 02:53:28', 54),
(276, 'NIL CALIN Savon de Marseille 1L', 'nil-calin-savon-de-marseille-1l', 'products/696ff3e82f387.png', '<p>Grâce à l’assouplissant NIL, chaque vêtement retrouve douceur et fraîcheur !</p><p><br></p><p>Disponible en quatre parfums (lavande, pêche, marine et savon de Marseille), il se décline en deux formats économiques : 1L et 2 L. Sa formule assouplit les fibres, préserve l’éclat des couleurs, parfume délicatement et facilite le repassage.</p><p><br></p><p>Chouchouter ces textiles n’a jamais été aussi facile avec NIL !</p>', NULL, '2025-07-16 00:27:04', '2026-01-27 02:31:55', 54),
(277, 'NIL CALIN Savon de Marseille 2L', 'nil-calin-savon-de-marseille-2l', 'products/696ff3d4cdd7b.png', '<p>Grâce à l’assouplissant NIL, chaque vêtement retrouve douceur et fraîcheur !</p><p><br></p><p>Disponible en quatre parfums (lavande, pêche, marine et savon de Marseille), il se décline en deux formats économiques : 1L et 2 L. Sa formule assouplit les fibres, préserve l’éclat des couleurs, parfume délicatement et facilite le repassage.</p><p><br></p><p>Chouchouter ces textiles n’a jamais été aussi facile avec NIL !</p>', NULL, '2025-07-16 00:27:36', '2026-01-27 02:31:22', 54),
(278, 'NIL Désodorisant Textile Lavande 400ml', 'nil-desodorisant-textile-lavande-400ml', 'products/696ff3b5ed5ec.png', '<p>Le désodorisant textile NIL élimine efficacement les odeurs indésirables. </p><p><br></p><p>Grâce à sa formule unique et sa technologie microcapsules, sa brume légère imprègne délicatement les fibres textiles.</p><p><br></p><p>Il rafraîchit instantanément les vêtements, meubles ou encore les intérieurs de voiture pour créer une ambiance agréable et propre, toujours plus accueillante.</p>', NULL, '2025-07-16 00:28:02', '2026-01-27 02:30:43', 37),
(279, 'NIL Désodorisant Textile Marine 400ml', 'nil-desodorisant-textile-marine-400ml', 'products/696ff3a5a6471.png', '<p>Le désodorisant textile NIL élimine efficacement les odeurs indésirables. </p><p><br></p><p>Grâce à sa formule unique et sa technologie microcapsules, sa brume légère imprègne délicatement les fibres textiles.</p><p><br></p><p>Il rafraîchit instantanément les vêtements, meubles ou encore les intérieurs de voiture pour créer une ambiance agréable et propre, toujours plus accueillante.</p>', NULL, '2025-07-16 00:28:32', '2026-01-27 02:30:33', 37),
(280, 'NIL Désodorisant Textile Savon de Marseille 400ml.', 'nil-desodorisant-textile-savon-de-marseille-400ml', 'products/696ff394479e5.png', '<p>Le désodorisant textile NIL élimine efficacement les odeurs indésirables. </p><p><br></p><p>Grâce à sa formule unique et sa technologie microcapsules, sa brume légère imprègne délicatement les fibres textiles.</p><p><br></p><p>Il rafraîchit instantanément les vêtements, meubles ou encore les intérieurs de voiture pour créer une ambiance agréable et propre, toujours plus accueillante.</p>', NULL, '2025-07-16 00:29:01', '2026-01-27 02:30:21', 37),
(281, 'NIL Lessive Liquide Parfumée 2L', 'nil-lessive-liquide-parfumee-2l', 'products/696ff7c57a27b.png', '<p>Si réputée en poudre lavage à la main, la lessive NIL se décline désormais en liquide machine !</p><p><br></p><p>Quelques doses suffisent pour que tout le linge soit instantanément propre et subtilement parfumé.</p><p><br></p><p>Efficace même à basse température, la lessive machine allie performance et douceur : les taches sont éliminées, les couleurs ravivées et les textiles plus impeccables que jamais.</p>', NULL, '2025-07-16 00:30:01', '2026-01-27 02:29:36', 41),
(315, 'AROMATE Piment Stick 60g', 'aromate-piment-stick-60g', 'products/696fecfccfebf.png', '<p>Les bouillons AROMATE, avec leurs 5 arômes distincts (épices, tomate, poulet, crevette et piment), transforment les repas quotidiens en authentiques festins. </p><p><br></p><p>C’est la touche qui change tout : ils rehaussent merveilleusement le goût des sauces, soupes et ragoûts.</p><p><br></p><p>Faciles à utiliser, en tablettes, en sticks ou en sachets, ils promettent des repas à partager sans compter !</p>', NULL, '2025-07-16 01:37:39', '2026-03-25 14:15:24', 18),
(352, 'ZEN BREEZE Brume d\'Ambiance Premium Jasmin 400ml', 'zen-breeze-brume-dambiance-premium-jasmin-400ml', NULL, '<p>Parfum d\'ambiance haut de gamme Zen Breeze</p>', 'nouveau', '2026-03-25 14:44:11', '2026-03-25 15:15:46', 36),
(353, 'ZEN BREEZE Brume d\'Ambiance Premium Vanille 400ml', 'zen-breeze-brume-vanille', NULL, 'Parfum d\'ambiance haut de gamme Zen Breeze', NULL, '2026-03-25 14:44:11', '2026-03-25 14:44:11', 36),
(354, 'ZEN BREEZE Brume d\'Ambiance Premium Musc Blanc 400ml', 'zen-breeze-brume-musc', NULL, 'Parfum d\'ambiance haut de gamme Zen Breeze', NULL, '2026-03-25 14:44:11', '2026-03-25 14:44:11', 36),
(317, 'AROMATE Poulet Sachet 50g', 'aromate-poulet-sachet-50g', 'products/696febd031e7f.png', '<p>Les bouillons AROMATE, avec leurs 5 arômes distincts (épices, tomate, poulet, crevette et piment), transforment les repas quotidiens en authentiques festins. </p><p><br></p><p>C’est la touche qui change tout : ils rehaussent merveilleusement le goût des sauces, soupes et ragoûts.</p><p><br></p><p>Faciles à utiliser, en tablettes, en sticks ou en sachets, ils promettent des repas à partager sans compter !</p>', NULL, '2025-07-16 01:39:03', '2026-01-27 01:47:03', 18),
(318, 'AROMATE Poulet Stick 10g', 'aromate-poulet-stick-10g', 'products/696feba3610da.png', '<p>Les bouillons AROMATE, avec leurs 5 arômes distincts (épices, tomate, poulet, crevette et piment), transforment les repas quotidiens en authentiques festins. </p><p><br></p><p>C’est la touche qui change tout : ils rehaussent merveilleusement le goût des sauces, soupes et ragoûts.</p><p><br></p><p>Faciles à utiliser, en tablettes, en sticks ou en sachets, ils promettent des repas à partager sans compter !</p>', NULL, '2025-07-16 01:39:42', '2026-01-27 01:46:54', 18),
(348, 'TOP MOUTARDE Bocal 490g', 'top-moutarde-bocal-490g', NULL, 'Moutarde Top Moutarde bocal 490g', NULL, '2026-03-25 14:12:26', '2026-03-25 14:12:26', 58),
(349, 'TOP MOUTARDE 1kg', 'top-moutarde-1kg', NULL, 'Moutarde Top Moutarde 1kg', NULL, '2026-03-25 14:12:26', '2026-03-25 14:12:26', 58),
(350, 'TOP MOUTARDE Seau 2kg', 'top-moutarde-seau-2kg', NULL, 'Moutarde Top Moutarde seau 2kg (usage professionnel)', NULL, '2026-03-25 14:12:26', '2026-03-25 14:12:26', 58),
(351, 'TOP MOUTARDE Seau 5kg', 'top-moutarde-seau-5kg', NULL, 'Moutarde Top Moutarde seau 5kg (usage professionnel)', NULL, '2026-03-25 14:12:26', '2026-03-25 14:12:26', 58),
(344, 'TOP MOUTARDE Sachet 25ml', 'top-moutarde-sachet-25ml', NULL, 'Moutarde Top Moutarde sachet portion 25ml', NULL, '2026-03-25 14:12:26', '2026-03-25 14:12:26', 58),
(345, 'TOP MOUTARDE Squeeze 270g', 'top-moutarde-squeeze-270g', NULL, 'Moutarde Top Moutarde flacon squeeze 270g', NULL, '2026-03-25 14:12:26', '2026-03-25 14:12:26', 58),
(346, 'TOP MOUTARDE Squeeze 380g', 'top-moutarde-squeeze-380g', NULL, 'Moutarde Top Moutarde flacon squeeze 380g', NULL, '2026-03-25 14:12:26', '2026-03-25 14:12:26', 58),
(347, 'TOP MOUTARDE Bocal 270g', 'top-moutarde-bocal-270g', NULL, 'Moutarde Top Moutarde bocal 270g', NULL, '2026-03-25 14:12:26', '2026-03-25 14:12:26', 58),
(340, 'AROMATE Ketchup 350ml', 'aromate-ketchup-350ml', NULL, 'Ketchup Aromate bouteille squeeze 350ml', NULL, '2026-03-25 14:12:26', '2026-03-25 14:12:26', 55),
(341, 'TOP MAYO Mayonnaise 25ml', 'top-mayo-mayonnaise-25ml', NULL, 'Top Mayo Mayonnaise sachet 25ml', NULL, '2026-03-25 14:12:26', '2026-03-25 14:12:26', 49),
(342, 'TOP MAYO Mayonnaise 1,5L', 'top-mayo-mayonnaise-15l', NULL, 'Top Mayo Mayonnaise bidon 1,5L', NULL, '2026-03-25 14:12:26', '2026-03-25 14:12:26', 49),
(343, 'TOP MAYO Mayonnaise 3,8L', 'top-mayo-mayonnaise-38l', NULL, 'Top Mayo Mayonnaise seau 3,8L', NULL, '2026-03-25 14:12:26', '2026-03-25 14:12:26', 49),
(322, 'AROMATE Tomate Sachet 50g', 'aromate-tomate-sachet-50g', 'products/696feb4ed95e9.png', '<p>Les bouillons AROMATE, avec leurs 5 arômes distincts (épices, tomate, poulet, crevette et piment), transforment les repas quotidiens en authentiques festins. </p><p><br></p><p>C’est la touche qui change tout : ils rehaussent merveilleusement le goût des sauces, soupes et ragoûts.</p><p><br></p><p>Faciles à utiliser, en tablettes, en sticks ou en sachets, ils promettent des repas à partager sans compter !</p>', NULL, '2025-07-16 01:41:52', '2026-01-27 01:45:55', 18),
(323, 'AROMATE Tomate Stick 10g', 'aromate-tomate-stick-10g', 'products/696feb2a36d39.png', '<p>Les bouillons AROMATE, avec leurs 5 arômes distincts (épices, tomate, poulet, crevette et piment), transforment les repas quotidiens en authentiques festins. </p><p><br></p><p>C’est la touche qui change tout : ils rehaussent merveilleusement le goût des sauces, soupes et ragoûts.</p><p><br></p><p>Faciles à utiliser, en tablettes, en sticks ou en sachets, ils promettent des repas à partager sans compter !</p>', NULL, '2025-07-16 01:42:25', '2026-01-27 01:45:41', 18),
(324, 'AROMATE Vinaigre Blanc 300ml', 'aromate-vinaigre-blanc-300ml', 'products/696feb18e7783.png', '<p>Les vinaigres AROMATE combinent à la perfection pureté et touche d’acidité.</p><p><br></p><p>Le vinaigre rouge, plus riche et fruité est idéal pour les marinades et les sauces.</p><p><br></p><p>Quant au vinaigre blanc, neutre et légèrement acide, il apporte une bonne dose de fraîcheur aux salades et vinaigrettes légères.</p><p><br></p><p>Leur texture fluide et leur goût unique, en font d’excellents condiments pour différents types de préparations !</p>', NULL, '2025-07-16 01:42:58', '2026-01-27 01:45:15', 21),
(325, 'AROMATE Vinaigre Blanc 900ml', 'aromate-vinaigre-blanc-900ml', 'products/696feb0b4387a.png', '<p>Les vinaigres AROMATE combinent à la perfection pureté et touche d’acidité.</p><p><br></p><p>Le vinaigre rouge, plus riche et fruité est idéal pour les marinades et les sauces.</p><p><br></p><p>Quant au vinaigre blanc, neutre et légèrement acide, il apporte une bonne dose de fraîcheur aux salades et vinaigrettes légères.</p><p><br></p><p>Leur texture fluide et leur goût unique, en font d’excellents condiments pour différents types de préparations !</p>', NULL, '2025-07-16 01:43:27', '2026-01-27 01:45:04', 21),
(326, 'AROMATE Vinaigre Rouge 300ml', 'aromate-vinaigre-rouge-300ml', 'products/696feafc9abdf.png', '<p>Les vinaigres AROMATE combinent à la perfection pureté et touche d’acidité.</p><p><br></p><p>Le vinaigre rouge, plus riche et fruité est idéal pour les marinades et les sauces.</p><p><br></p><p>Quant au vinaigre blanc, neutre et légèrement acide, il apporte une bonne dose de fraîcheur aux salades et vinaigrettes légères.</p><p><br></p><p>Leur texture fluide et leur goût unique, en font d’excellents condiments pour différents types de préparations !</p>', NULL, '2025-07-16 01:44:03', '2026-01-27 01:44:53', 21),
(327, 'AROMATE Vinaigre Rouge 900ml', 'aromate-vinaigre-rouge-900ml', 'products/696feaeb45fb7.png', '<p>Les vinaigres AROMATE combinent à la perfection pureté et touche d’acidité.</p><p><br></p><p>Le vinaigre rouge, plus riche et fruité est idéal pour les marinades et les sauces.</p><p><br></p><p>Quant au vinaigre blanc, neutre et légèrement acide, il apporte une bonne dose de fraîcheur aux salades et vinaigrettes légères. </p><p><br></p><p>Leur texture fluide et leur goût unique, en font d’excellents condiments pour différents types de préparations !</p>', NULL, '2025-07-16 01:44:33', '2026-01-27 01:44:37', 21);

-- --------------------------------------------------------

--
-- Table structure for table `product_accordions`
--

CREATE TABLE `product_accordions` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_accordions`
--

INSERT INTO `product_accordions` (`id`, `product_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(108, 104, '4. Service client et assistance', '<p><strong>1. Comment contacter le service client ?</strong></p><p>Par téléphone, e-mail ou via le formulaire de contact sur notre site web.</p><p>Les coordonnées figurent sur l’emballage de chaque produit.</p><p><br></p><p><strong>2. Comment signaler un problème de qualité sur un produit ?</strong></p><p>Conserver le produit concerné, noter le numéro de lot et contacter le service client pour analyse et prise en charge rapide.</p>', '2026-01-21 00:35:29', '2026-01-21 00:35:29'),
(107, 104, 'III. Achat, livraison et disponibilité', '<p><strong>1. Nos produits sont-ils disponibles dans les grandes surfaces ?</strong></p><p>Oui, ils sont disponibles dans la plupart des grandes surfaces.</p><p><strong>2. Où puis-je acheter vos produits (boutiques, supermarchés, vente en ligne) ?</strong></p><p><strong><span class=\"ql-cursor\">﻿</span></strong>Nos produits sont disponibles en supermarché, dans nos boutiques partenaires et sur les plateformes de vente en ligne locales.</p>', '2026-01-21 00:32:50', '2026-01-21 00:32:50'),
(106, 104, 'II. Composition et sécurité', '<p><strong>1. Que doit ton faire avant d\'utliser les produits détergents pour le ménage ?</strong></p><p>Lire attentivement l’étiquette, porter des gants si nécessaire.</p><p><br></p><p><strong>2. Quel détergent utilisé pour la vaisselle si l’on a une peau sensible ?</strong></p><p>Choisir un liquide vaisselle doux,special peaux sensible .</p><p><br></p><p><strong>3. Que faire en cas de contact accidentel des produits détergents avec les yeux ou la bouche ?</strong></p><p><strong><span class=\"ql-cursor\">﻿</span></strong>Rincer immédiatement pendant plusieurs minutes et consulter un médecin si l’irritation persiste.</p>', '2026-01-21 00:30:53', '2026-01-21 00:30:53'),
(105, 104, 'I. Utilisation et dosage', '<p><strong>1. Quels produits adaptés selon les types de surfaces dans la maison ?Sols et carrelages </strong></p><p>Utiliser un détergent multi-usage ou un nettoyant sols parfumé. Il élimine la saleté et laisse une odeur fraîche.<strong>Cuisine et surfaces grasses </strong></p><p>Un dégraissant ou un liquide vaisselle. Ils dissolvent les graisses et résidus alimentaires .<strong>Salle de bain, lavabo et WC </strong></p><p>Eau de javel ou désinfectant. Ces produits éliminent les microbes et les bactéries.<strong>Vitres, miroirs et surfaces vitrées </strong></p><p>Nettoyant vitre pour un séchage rapide et sans traces.</p><p><br></p><p><strong>2. A quoi servent les bouchons sur les bouteilles de nos produits ?</strong></p><p>Ils servent à doser correctement le produit et à éviter le gaspillage.</p><p><br></p><p><strong>3. Peut-on mélanger l\'eau de javel avec d’autres détergents ?</strong></p><p>Non. Mélanger l’eau de javel avec d’autres produits, surtout acides ou ammoniacaux, dégage des gaz toxiques.</p><p><br></p><p><strong>4. Comment utiliser correctement l\'eau de javel ? Et sur quels surfaces ?</strong></p><p>Diluer selon les recommandations sur l’étiquette.Utiliser sur les surfaces dures non métalliques (carrelage, sanitaires). Éviter le bois, les tissus colorés et le métal.</p><p><br></p><p><strong>5. Quelles est la difference il y a entre l\'eau de javel 12° et 8° ?</strong></p><p>Le degré indique la concentration en chlore actif.<strong>12°</strong> : plus concentrée, adaptée à la désinfection.<strong>8° </strong>: plus douce, pour un usage domestique régulier.</p><p><br></p><p><strong>6. Quelle est la différence entre le savon liquide multi-usage et le liquide vaisselle ?</strong></p><p><strong>Le multi-usage</strong> nettoie plusieurs types de surfaces.<strong>Le liquide vaisselle</strong> est formulé spécialement pour éliminer la graisse et se rincer facilement sans laisser de résidu.</p><p><br></p><p><strong>7. Quelle est la différence entre les détergents liquides et en poudre ?</strong></p><p><strong>Le liquide</strong> est parfait pour le lavage quotidien et les couleurs<strong>La poudre</strong> est plus adaptée au linge très sale et au blanc.</p><p><br></p><p><strong>8. Quels produits recommandez-vous pour le linge blanc ou coloré ?</strong></p><p><strong>Linge blanc </strong>: lessive poudre avec agents blanchissants.<strong>Linge coloré </strong>: lessive liquide avec agents protecteurs de couleurs.</p><p><br></p><p><strong>9. En quoi la mousse est elle nécessaire pour une lessive à la main ?</strong></p><p>La mousse aide à décoller la saleté, facilite le frottement et donne une sensation de propreté.</p><p><br></p><p><strong>10 Peut -on utiliser la lessive en poudre main dans une machine à laver ?</strong></p><p>Non. La poudre pour lavage à la main mousse trop et peut endommager la machine. Utiliser une lessive spéciale machine.</p><p><br></p><p><strong>11. Quelle est la particularité des microcapsules dans l\'assouplissant ?</strong></p><p>Libere le parfun progressivement au frottement , prolonge la fraîcheur du linge plusieurs jours après le lavage.</p><p><br></p><p><strong>12. Peut-on utiliser l\'assouplissant lors d\'un lavage main ?</strong></p><p>Oui, mais en petite quantité. Diluer dans de l’eau claire avant le dernier rinçage pour éviter les traces.</p><p><br></p><p><strong>13. Comment éliminer les taches avec vos détergents sur un textile?</strong></p><p><strong><span class=\"ql-cursor\">﻿</span></strong>Appliquer un peu de détergent directement sur la tache, laisser agir quelques minutes, puis laver normalement.Utiliser un detachant textile avant lavage</p>', '2026-01-21 00:28:08', '2026-01-21 00:28:08'),
(104, 337, 'I. Utilisation et dosage', '<p><strong style=\"color: rgb(0, 0, 0);\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0);\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>', '2026-01-21 00:14:49', '2026-01-21 14:07:35'),
(103, 339, 'Conservation', '<p>Quelle est la durée de conservation après ouverture ?</p>', '2025-09-26 15:13:38', '2025-09-26 15:13:38'),
(102, 339, 'gluten', '<p>Ce produit est-il adapté aux régimes végétariens ou sans gluten ?</p>', '2025-09-26 15:12:54', '2025-09-26 15:12:54'),
(101, 339, 'Ingrédients', '<p>Quels sont les ingrédients principaux de ce produit ?</p>', '2025-09-26 15:10:12', '2025-09-26 15:10:12');

-- --------------------------------------------------------

--
-- Table structure for table `product_analytics`
--

CREATE TABLE `product_analytics` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_analytics`
--

INSERT INTO `product_analytics` (`id`, `product_id`, `label`, `value`, `unit`, `created_at`, `updated_at`) VALUES
(193, 249, 'POID', '850', 'g', '2025-09-11 15:58:42', '2025-09-11 15:58:42'),
(192, 250, 'POID', '50', 'g', '2025-09-11 15:58:13', '2025-09-11 15:58:13'),
(191, 251, 'POID', '2,97', 'kg', '2025-09-11 15:57:47', '2025-09-11 16:39:34'),
(190, 252, 'POID', '1', 'kg', '2025-09-11 15:56:44', '2025-09-11 15:56:44'),
(189, 253, 'POID', '750', 'g', '2025-09-11 15:56:24', '2025-09-11 15:56:24'),
(188, 254, 'VOLUME', '250', 'ml', '2025-09-11 15:55:58', '2025-09-11 16:43:03'),
(187, 255, 'POID', '80', 'g', '2025-09-11 15:55:33', '2025-09-11 15:55:33'),
(186, 256, 'POID', '180', 'g', '2025-09-11 15:54:38', '2025-09-11 15:54:38'),
(185, 257, 'POID', '500', 'g', '2025-09-11 15:54:05', '2025-09-11 15:54:05'),
(184, 258, 'POID', '180', 'g', '2025-09-11 15:53:35', '2025-09-11 15:53:35'),
(182, 260, 'POID', '1', 'kg', '2025-09-11 15:51:55', '2025-09-11 15:51:55'),
(183, 259, 'POID', '500', 'g', '2025-09-11 15:53:08', '2025-09-11 15:53:08'),
(180, 261, 'VOLUME', '1', 'L', '2025-09-11 15:49:03', '2025-09-11 15:49:03'),
(179, 262, 'POID', '20', 'g', '2025-09-11 15:48:46', '2025-09-11 15:48:46'),
(178, 263, 'POID', '40', 'g', '2025-09-11 15:48:09', '2025-09-11 15:48:09'),
(177, 264, 'VOLUME', '1', 'L', '2025-09-11 15:46:59', '2025-09-11 15:46:59'),
(176, 265, 'VOLUME', '1', 'L', '2025-09-11 15:44:17', '2025-09-11 15:44:17'),
(175, 266, 'POID', '1,4', 'kg', '2025-09-11 15:43:37', '2025-09-11 15:43:37'),
(174, 267, 'POID', '1,4', 'kg', '2025-09-11 15:42:44', '2025-09-11 15:42:44'),
(173, 268, 'POID', '2,970', 'kg', '2025-09-11 15:41:41', '2025-09-11 15:41:41'),
(172, 269, 'VOLUME', '550', 'ml', '2025-09-11 15:41:12', '2025-09-11 15:41:12'),
(171, 279, 'VOLUME', '400', 'ml', '2025-09-11 15:32:34', '2025-09-11 15:32:34'),
(170, 278, 'VOLUME', '400', 'ml', '2025-09-11 15:32:16', '2025-09-11 15:32:16'),
(169, 277, 'VOLUME', '2', 'L', '2025-09-11 15:31:43', '2025-09-11 15:31:43'),
(168, 276, 'VOLUME', '1', 'L', '2025-09-11 15:31:23', '2025-09-11 15:31:23'),
(167, 275, 'VOLUME', '2', 'L', '2025-09-11 15:30:48', '2025-09-11 15:30:48'),
(166, 274, 'VOLUME', '2', 'L', '2025-09-11 15:30:27', '2025-09-11 15:30:27'),
(165, 273, 'VOLUME', '2', 'L', '2025-09-11 15:29:49', '2025-09-11 15:29:49'),
(164, 272, 'VOLUME', '550', 'ml', '2025-09-11 15:29:30', '2025-09-11 15:29:30'),
(163, 271, 'VOLUME', '550', 'ml', '2025-09-11 15:28:47', '2025-09-11 15:28:47'),
(162, 270, 'VOLUME', '550', 'ml', '2025-09-11 15:28:28', '2025-09-11 15:28:28'),
(161, 280, 'VOLUME', '400', 'ml', '2025-09-11 15:00:09', '2025-09-11 15:00:09'),
(160, 281, 'VOLUME', '2', 'L', '2025-09-11 14:59:38', '2025-09-11 14:59:38'),
(159, 282, 'VOLUME', '0,9', 'L', '2025-09-11 14:57:09', '2025-09-11 14:57:09'),
(158, 283, 'VOLUME', '3', 'L', '2025-09-11 14:56:45', '2025-09-11 14:56:45'),
(157, 284, 'VOLUME', '12', 'ml', '2025-09-11 14:56:22', '2025-09-11 14:56:22'),
(156, 285, 'VOLUME', '250', 'ml', '2025-09-11 14:55:14', '2025-09-11 14:55:14'),
(155, 286, 'VOLUME', '25', 'ml', '2025-09-11 14:54:46', '2025-09-11 14:54:46'),
(154, 287, 'VOLUME', '3.8', 'L', '2025-09-11 14:54:20', '2025-09-11 14:54:20'),
(153, 288, 'VOLUME', '250', 'ml', '2025-09-11 14:53:29', '2025-09-11 14:53:29'),
(152, 289, 'VOLUME', '350', 'ml', '2025-09-11 14:52:59', '2025-09-11 14:52:59'),
(151, 290, 'VOLUME', '450', 'ml', '2025-09-11 14:48:35', '2025-09-11 14:48:35'),
(149, 296, 'VOLUME', '350', 'ml', '2025-09-11 14:46:03', '2025-09-11 14:46:03'),
(148, 295, 'VOLUME', '350', 'ml', '2025-09-11 14:45:42', '2025-09-11 14:45:42'),
(150, 291, 'VOLUME', '900', 'ml', '2025-09-11 14:48:12', '2025-09-11 14:48:12'),
(146, 293, 'VOLUME', '350', 'ml', '2025-09-11 14:44:00', '2025-09-11 14:44:00'),
(145, 292, 'VOLUME', '350', 'ml', '2025-09-11 14:43:34', '2025-09-11 14:43:34'),
(144, 294, 'VOLUME', '350', 'ml', '2025-09-11 14:42:16', '2025-09-11 14:44:33'),
(142, 298, 'POID', '50', 'g', '2025-09-11 14:35:41', '2025-09-11 14:35:41'),
(143, 297, 'POID', '60x10', 'g', '2025-09-11 14:36:19', '2025-09-11 14:36:19'),
(140, 299, 'POID', '10', 'g', '2025-09-11 14:35:19', '2025-09-11 14:35:19'),
(139, 305, 'VOLUME', '275', 'ml', '2025-09-11 14:32:29', '2025-09-11 14:32:29'),
(138, 304, 'POID', '11', 'g', '2025-09-11 14:31:56', '2025-09-11 14:31:56'),
(137, 303, 'POID', '4,5', 'kg', '2025-09-11 14:31:33', '2025-09-11 14:31:33'),
(136, 302, 'POID', '10', 'g', '2025-09-11 14:30:56', '2025-09-11 14:30:56'),
(135, 301, 'POID', '50', 'g', '2025-09-11 14:30:36', '2025-09-11 14:30:36'),
(134, 300, 'POID', '60x10', 'g', '2025-09-11 14:30:14', '2025-09-11 14:30:14'),
(133, 309, 'POID', '2', 'kg', '2025-09-11 05:16:30', '2025-09-11 05:16:30'),
(132, 308, 'VOLUME', '25', 'ml', '2025-09-11 05:15:56', '2025-09-11 05:15:56'),
(131, 307, 'POID', '1', 'kg', '2025-09-11 05:15:34', '2025-09-11 05:15:34'),
(130, 306, 'POID', '490', 'g', '2025-09-11 05:14:37', '2025-09-11 05:14:37'),
(129, 313, 'POID', '270', 'g', '2025-09-11 05:12:19', '2025-09-11 05:12:19'),
(128, 312, 'POID', '380', 'g', '2025-09-11 05:11:36', '2025-09-11 05:11:36'),
(127, 311, 'POID', '270', 'g', '2025-09-11 05:11:12', '2025-09-11 05:11:12'),
(126, 310, 'POID', '5', 'kg', '2025-09-11 05:10:35', '2025-09-11 05:10:35'),
(125, 314, 'POID', '50', 'g', '2025-09-11 05:07:54', '2025-09-11 05:07:54'),
(124, 315, 'POID', '10', 'g', '2025-09-11 05:07:25', '2025-09-11 05:07:25'),
(123, 316, 'POID', '60X10', 'g', '2025-09-11 05:06:48', '2025-09-11 05:06:48'),
(122, 317, 'POID', '50', 'g', '2025-09-11 05:05:23', '2025-09-11 05:05:23'),
(121, 318, 'POID', '10', 'g', '2025-09-11 05:04:48', '2025-09-11 05:04:48'),
(120, 319, 'POID', '10', 'g', '2025-09-11 05:01:45', '2025-09-11 05:01:45'),
(119, 320, 'POID', '10', 'g', '2025-09-11 05:01:09', '2025-09-11 05:01:09'),
(118, 321, 'POID', '10', 'g', '2025-09-11 05:00:32', '2025-09-11 05:00:32'),
(117, 322, 'POID', '50', 'g', '2025-09-11 04:59:12', '2025-09-11 04:59:37'),
(116, 323, 'POID', '10', 'g', '2025-09-11 04:42:15', '2025-09-11 04:58:03'),
(115, 326, 'VOLUME', '300', 'ml', '2025-09-11 04:39:24', '2025-09-11 04:54:43'),
(114, 327, 'VOLUME', '900', 'ml', '2025-09-11 04:38:42', '2025-09-11 04:54:06'),
(113, 325, 'VOLUME', '900', 'ml', '2025-09-11 04:37:59', '2025-09-11 04:55:12'),
(112, 324, 'VOLUME', '300', 'ml', '2025-09-11 04:37:24', '2025-09-11 04:56:19'),
(111, 328, 'VOLUME', '250', 'ml', '2025-09-11 04:32:32', '2025-09-11 04:53:38'),
(110, 329, 'VOLUME', '450', 'ml', '2025-09-11 04:30:47', '2025-09-11 04:49:18'),
(109, 330, 'VOLUME', '950', 'ml', '2025-09-11 04:26:45', '2025-09-11 04:53:06'),
(108, 331, 'VOLUME', '3.8', 'L', '2025-09-11 04:25:38', '2025-09-11 04:52:43'),
(107, 332, 'VOLUME', '25', 'ml', '2025-09-11 04:23:46', '2025-09-11 04:52:06'),
(106, 334, 'VOLUME', '3.8', 'L', '2025-09-11 04:22:17', '2025-09-11 04:51:45'),
(105, 335, 'VOLUME', '250', 'ml', '2025-09-11 04:21:25', '2025-09-11 04:51:24'),
(104, 336, 'VOLUME', '475', 'ml', '2025-09-11 04:20:31', '2025-09-11 04:51:04'),
(103, 337, 'VOLUME', '950', 'ml', '2025-09-11 04:19:03', '2025-09-11 04:50:47'),
(102, 339, 'VOLUME', '25', 'ml', '2025-09-11 04:18:07', '2025-09-11 04:49:43'),
(101, 338, 'VOLUME', '3800', 'ml', '2025-09-11 04:15:58', '2025-09-11 04:50:32'),
(194, 248, 'POID', '400', 'g', '2025-09-11 15:59:05', '2025-09-11 15:59:05'),
(195, 247, 'POID', '850', 'g', '2025-09-11 15:59:30', '2025-09-11 15:59:30'),
(196, 246, 'POID', '400', 'g', '2025-09-11 15:59:56', '2025-09-11 15:59:56'),
(197, 245, 'POID', '850', 'g', '2025-09-11 16:00:24', '2025-09-11 16:00:24'),
(198, 244, 'POID', '400', 'g', '2025-09-11 16:00:45', '2025-09-11 16:00:45'),
(199, 243, 'POID', '850', 'g', '2025-09-11 16:01:01', '2025-09-11 16:01:01'),
(200, 242, 'POID', '400', 'g', '2025-09-11 16:01:19', '2025-09-11 16:01:19'),
(201, 241, 'POID', '850', 'g', '2025-09-11 16:01:35', '2025-09-11 16:01:35'),
(202, 240, 'POID', '400', 'g', '2025-09-11 16:01:55', '2025-09-11 16:01:55'),
(203, 239, 'POID', '80', 'g', '2025-09-11 16:02:46', '2025-09-11 16:02:46'),
(204, 238, 'POID', '40', 'g', '2025-09-11 16:03:10', '2025-09-11 16:03:10'),
(205, 237, 'POID', '850', 'g', '2025-09-11 16:03:27', '2025-09-11 16:03:27'),
(206, 236, 'POID', '400', 'g', '2025-09-11 16:03:43', '2025-09-11 16:03:43'),
(207, 235, 'POID', '80', 'g', '2025-09-11 16:04:08', '2025-09-11 16:04:08'),
(208, 234, 'POID', '400', 'g', '2025-09-11 16:04:30', '2025-09-11 16:04:30'),
(209, 233, 'POID', '850', 'g', '2025-09-11 16:04:45', '2025-09-11 16:04:45'),
(210, 232, 'POID', '80', 'g', '2025-09-11 16:05:04', '2025-09-11 16:05:04'),
(211, 230, 'POID', '850', 'g', '2025-09-11 16:05:22', '2025-09-11 16:05:22'),
(212, 231, 'POID', '40', 'g', '2025-09-11 16:05:41', '2025-09-11 16:05:41'),
(213, 229, 'POID', '400', 'g', '2025-09-11 16:06:13', '2025-09-11 16:06:13'),
(214, 228, 'POID', '80', 'g', '2025-09-11 16:06:28', '2025-09-11 16:06:28'),
(215, 224, 'POID', '850', 'g', '2025-09-11 16:06:46', '2025-09-11 16:06:46'),
(216, 223, 'POID', '400', 'g', '2025-09-11 16:07:04', '2025-09-11 16:07:04'),
(217, 222, 'POID', '80', 'g', '2025-09-11 16:07:19', '2025-09-11 16:07:19'),
(218, 221, 'POID', '500', 'g', '2025-09-11 16:07:42', '2025-09-11 16:07:42'),
(219, 220, 'POID', '1', 'kg', '2025-09-11 16:08:41', '2025-09-11 16:08:41'),
(220, 219, 'POID', '500', 'g', '2025-09-11 16:09:11', '2025-09-11 16:09:11'),
(221, 218, 'POID', '1', 'kg', '2025-09-11 16:09:27', '2025-09-11 16:09:27'),
(222, 217, 'POID', '500', 'g', '2025-09-11 16:10:01', '2025-09-11 16:10:01'),
(223, 216, 'POID', '1', 'kg', '2025-09-11 16:10:23', '2025-09-11 16:10:23'),
(224, 215, 'VOLUME', '800', 'ml', '2025-09-11 16:10:46', '2025-09-11 16:43:51'),
(225, 214, 'VOLUME', '800', 'ml', '2025-09-11 16:11:13', '2025-09-11 16:44:04'),
(226, 213, 'VOLUME', '800', 'ml', '2025-09-11 16:11:40', '2025-09-11 16:44:17'),
(227, 212, 'VOLUME', '800', 'ml', '2025-09-11 16:12:05', '2025-09-11 16:44:31'),
(228, 211, 'VOLUME', '800', 'ml', '2025-09-11 16:12:34', '2025-09-11 16:44:54'),
(229, 210, 'VOLUME', '1', 'L', '2025-09-11 16:12:58', '2025-09-11 16:45:06'),
(230, 209, 'VOLUME', '900', 'ml', '2025-09-11 16:13:35', '2025-09-11 16:45:19'),
(231, 208, 'VOLUME', '450', 'ml', '2025-09-11 16:13:55', '2025-09-11 16:45:32'),
(232, 207, 'VOLUME', '900', 'ml', '2025-09-11 16:14:17', '2025-09-11 16:45:46'),
(233, 206, 'VOLUME', '900', 'ml', '2025-09-11 16:14:44', '2025-09-11 16:46:07'),
(234, 205, 'VOLUME', '900', 'ml', '2025-09-11 16:15:04', '2025-09-11 16:46:20'),
(235, 204, 'VOLUME', '900', 'ml', '2025-09-11 16:15:39', '2025-09-11 16:46:33'),
(236, 203, 'VOLUME', '900', 'ml', '2025-09-11 16:16:00', '2025-09-11 16:46:51'),
(237, 202, 'VOLUME', '900', 'ml', '2025-09-11 16:16:20', '2025-09-11 16:47:06'),
(238, 201, 'VOLUME', '450', 'ml', '2025-09-11 16:16:57', '2025-09-11 16:47:25'),
(239, 200, 'VOLUME', '900', 'ml', '2025-09-11 16:17:31', '2025-09-11 16:47:38'),
(240, 199, 'VOLUME', '450', 'ml', '2025-09-11 16:17:52', '2025-09-11 16:47:52'),
(241, 198, 'VOLUME', '4', 'L', '2025-09-11 16:18:11', '2025-09-11 16:48:08'),
(242, 197, 'VOLUME', '850', 'ml', '2025-09-11 16:18:30', '2025-09-11 16:48:21'),
(243, 196, 'VOLUME', '850', 'ml', '2025-09-11 16:18:50', '2025-09-11 16:48:38'),
(244, 195, 'VOLUME', '850', 'ml', '2025-09-11 16:19:07', '2025-09-11 16:48:51'),
(245, 194, 'VOLUME', '350', 'ml', '2025-09-11 16:19:28', '2025-09-11 16:49:03'),
(246, 193, 'VOLUME', '3', 'L', '2025-09-11 16:19:46', '2025-09-11 16:49:23'),
(247, 192, 'VOLUME', '2', 'L', '2025-09-11 16:20:03', '2025-09-11 16:49:35'),
(248, 191, 'VOLUME', '1', 'L', '2025-09-11 16:20:24', '2025-09-11 16:49:59'),
(249, 190, 'VOLUME', '350', 'ml', '2025-09-11 16:20:47', '2025-09-11 16:50:18'),
(250, 189, 'VOLUME', '4', 'L', '2025-09-11 16:21:08', '2025-09-11 16:50:30'),
(251, 188, 'VOLUME', '4', 'L', '2025-09-11 16:21:28', '2025-09-11 16:50:47'),
(252, 187, 'VOLUME', '3', 'L', '2025-09-11 16:21:47', '2025-09-11 16:51:02'),
(253, 186, 'VOLUME', '2', 'L', '2025-09-11 16:22:22', '2025-09-11 16:51:21'),
(254, 185, 'VOLUME', '800', 'ml', '2025-09-11 16:22:48', '2025-09-11 16:51:32'),
(255, 184, 'VOLUME', '1', 'L', '2025-09-11 16:23:05', '2025-09-11 16:51:48'),
(256, 183, 'VOLUME', '900', 'ml', '2025-09-11 16:23:26', '2025-09-11 16:52:02'),
(257, 182, 'VOLUME', '1', 'L', '2025-09-11 16:23:47', '2025-09-11 16:52:14'),
(258, 181, 'VOLUME', '1', 'L', '2025-09-11 16:24:07', '2025-09-11 16:52:50'),
(259, 180, 'VOLUME', '1', 'L', '2025-09-11 16:24:25', '2025-09-11 16:53:03'),
(260, 179, 'VOLUME', '1', 'L', '2025-09-11 16:24:39', '2025-09-11 16:53:20'),
(261, 178, 'VOLUME', '4', 'L', '2025-09-11 16:24:59', '2025-09-11 16:53:33'),
(262, 177, 'VOLUME', '4', 'L', '2025-09-11 16:25:18', '2025-09-11 16:54:19'),
(263, 176, 'VOLUME', '4', 'L', '2025-09-11 16:25:46', '2025-09-11 16:54:42'),
(264, 175, 'VOLUME', '4', 'L', '2025-09-11 16:26:03', '2025-09-11 16:54:55'),
(265, 174, 'VOLUME', '4', 'L', '2025-09-11 16:26:19', '2025-09-11 16:55:09'),
(266, 173, 'VOLUME', '1', 'L', '2025-09-11 16:26:37', '2025-09-11 16:55:22'),
(267, 172, 'VOLUME', '1', 'L', '2025-09-11 16:28:07', '2025-09-11 16:55:38'),
(268, 171, 'VOLUME', '2', 'L', '2025-09-11 16:28:30', '2025-09-11 16:55:56'),
(269, 170, 'VOLUME', '1', 'L', '2025-09-11 16:28:52', '2025-09-11 16:56:17'),
(270, 169, 'VOLUME', '1', 'L', '2025-09-11 16:29:21', '2025-09-11 16:56:30'),
(271, 168, 'VOLUME', '1', 'L', '2025-09-11 16:29:39', '2025-09-11 16:56:45'),
(272, 167, 'VOLUME', '1', 'L', '2025-09-11 16:29:57', '2025-09-11 16:57:07'),
(273, 166, 'VOLUME', '1', 'L', '2025-09-11 16:30:16', '2025-09-11 16:57:37'),
(274, 165, 'VOLUME', '4', 'L', '2025-09-11 16:30:35', '2025-09-11 16:57:53'),
(275, 164, 'VOLUME', '3', 'L', '2025-09-11 16:31:07', '2025-09-11 16:58:06'),
(276, 163, 'POID', '2,97', 'kg', '2025-09-11 16:31:33', '2025-09-11 16:31:33'),
(277, 162, 'POID', '1,4', 'kg', '2025-09-11 16:32:34', '2025-09-11 16:32:34'),
(278, 161, 'VOLUME', '2', 'L', '2025-09-11 16:32:53', '2025-09-11 16:58:22'),
(279, 160, 'POID', '850', 'g', '2025-09-11 16:33:29', '2025-09-11 16:33:40'),
(280, 159, 'POID', '400', 'g', '2025-09-11 16:34:03', '2025-09-11 16:34:03'),
(281, 158, 'POID', '80', 'g', '2025-09-11 16:34:21', '2025-09-11 16:34:21'),
(282, 157, 'VOLUME', '2', 'L', '2025-09-11 16:34:39', '2025-09-11 16:58:39'),
(283, 156, 'VOLUME', '1', 'L', '2025-09-11 16:35:03', '2025-09-11 16:58:59'),
(284, 155, 'VOLUME', '1000', 'ml', '2025-09-11 16:35:32', '2025-09-11 16:59:11'),
(285, 154, 'VOLUME', '450', 'ml', '2025-09-11 16:35:58', '2025-09-11 16:59:28'),
(286, 153, 'VOLUME', '235', 'ml', '2025-09-11 16:36:17', '2025-09-11 16:59:40'),
(287, 108, 'VOLUME', '400', 'ml', '2025-09-11 16:36:32', '2025-09-11 16:59:59'),
(288, 107, 'VOLUME', '400', 'ml', '2025-09-11 16:36:50', '2025-09-11 17:00:17'),
(289, 106, 'VOLUME', '400', 'ml', '2025-09-11 16:37:06', '2025-09-11 17:00:30'),
(290, 105, 'VOLUME', '400', 'ml', '2025-09-11 16:37:22', '2025-09-11 16:41:25'),
(291, 104, 'VOLUME', '400', 'ml', '2025-09-11 16:37:38', '2025-09-11 17:00:47'),
(292, 103, 'VOLUME', '400', 'ml', '2025-09-11 16:37:54', '2025-09-11 17:01:01'),
(293, 333, 'VOLUME', '10', 'ml', '2025-09-25 16:22:31', '2025-09-25 16:22:31');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `product_family_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_family_id`, `name`, `slug`, `image`, `description`, `created_at`, `updated_at`) VALUES
(13, 4, 'Amerigo', 'amerigo', 'product_categories/68ac5b576b628.png', NULL, '2025-07-08 21:54:46', '2025-08-25 16:47:19'),
(12, 4, 'Mia', 'mia', 'product_categories/68ac5b6a94c4c.png', NULL, '2025-07-08 21:54:23', '2025-08-25 16:47:38'),
(11, 5, 'Super Clean', 'super-clean', 'product_categories/68ac5b7a86541.png', NULL, '2025-07-08 21:37:45', '2025-08-25 16:47:54'),
(10, 5, 'Bêko', 'beko', 'product_categories/68ac5b8ee050c.png', NULL, '2025-07-08 21:36:41', '2025-09-25 04:02:13'),
(9, 5, 'Arc', 'arc', 'product_categories/68ac5ba079f32.png', NULL, '2025-07-08 21:00:05', '2025-08-25 16:48:32'),
(8, 4, 'Aromate', 'aromate', 'product_categories/68ac5baf517ab.png', NULL, '2025-07-08 19:18:28', '2025-08-25 16:48:47'),
(14, 4, 'Top Mayo', 'top-mayo', 'product_categories/68ac5b3f713e0.png', NULL, '2025-07-08 21:55:05', '2025-08-25 16:46:55'),
(15, 4, 'Top Moutarde', 'top-moutarde', 'product_categories/68ac5b2b6326d.png', NULL, '2025-07-08 21:55:29', '2025-08-25 16:46:35'),
(17, 5, 'Nil', 'nil', 'product_categories/68ac5b0a32fac.png', NULL, '2025-07-14 19:18:25', '2025-09-25 04:00:26'),
(20, 5, 'Cosmo', 'cosmo', 'product_categories/68ac5af616e3f.png', NULL, '2025-07-14 19:21:22', '2025-09-25 04:00:07'),
(21, 5, 'Cross', 'cross', 'product_categories/68ac5ae76c469.png', NULL, '2025-07-14 19:21:39', '2025-09-25 03:59:49'),
(22, 5, 'Zen breeze', 'zen-breeze', 'product_categories/68ac5ada6e9ec.png', NULL, '2025-07-14 22:51:22', '2025-09-25 03:59:23');

-- --------------------------------------------------------

--
-- Table structure for table `product_families`
--

CREATE TABLE `product_families` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_families`
--

INSERT INTO `product_families` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(5, 'Détergent', 'detergent', NULL, '2025-07-08 19:16:55', '2025-07-08 19:16:55'),
(4, 'Alimentaire', 'alimentaire', NULL, '2025-07-08 19:16:41', '2025-07-08 19:16:41');

-- --------------------------------------------------------

--
-- Table structure for table `product_subcategories`
--

CREATE TABLE `product_subcategories` (
  `id` bigint UNSIGNED NOT NULL,
  `product_category_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_subcategories`
--

INSERT INTO `product_subcategories` (`id`, `product_category_id`, `name`, `slug`, `image`, `description`, `created_at`, `updated_at`) VALUES
(30, 11, 'Nettoyant Multi-Usages', 'super-clean-nettoyant-multi-usages', 'product_subcategories/psc_68cac36a5a974.webp', NULL, '2025-07-08 21:40:04', '2026-01-27 16:48:38'),
(29, 11, 'Désinfectant', 'super-clean-desinfectant', 'product_subcategories/psc_68cac3a7d5a72.webp', NULL, '2025-07-08 21:39:51', '2025-09-17 18:20:23'),
(28, 11, 'Nettoyant Vitre', 'super-clean-nettoyant-vitre', 'product_subcategories/psc_68cac3c5ecbc4.webp', NULL, '2025-07-08 21:39:36', '2025-09-17 18:20:53'),
(27, 11, 'Savon Liquide', 'super-clean-savon-liquide', 'product_subcategories/psc_68cac3ef2214e.webp', NULL, '2025-07-08 21:39:20', '2025-09-17 18:21:35'),
(26, 10, 'Lessive Liquide', 'beko-lessive-liquide', 'product_subcategories/psc_68cac4b156e8e.webp', NULL, '2025-07-08 21:38:59', '2025-09-17 18:24:49'),
(25, 11, 'Nettoyant Bacércide', 'super-clean-nettoyant-bacercide', 'product_subcategories/psc_68cac4716dd96.webp', NULL, '2025-07-08 21:38:41', '2026-01-27 16:38:17'),
(24, 10, 'Lessive', 'beko-lessive', 'product_subcategories/psc_68cac4f1a1f72.webp', NULL, '2025-07-08 21:37:21', '2025-09-17 18:25:53'),
(22, 8, 'Moutarde', 'aromate-moutarde', 'product_subcategories/psc_68cac523e6915.webp', NULL, '2025-07-08 21:30:03', '2025-09-17 18:26:43'),
(20, 8, 'Huiles', 'aromate-huiles', 'product_subcategories/psc_68cac56826346.webp', NULL, '2025-07-08 21:29:38', '2025-09-17 18:27:52'),
(21, 8, 'Vinaigre', 'aromate-vinaigre', 'product_subcategories/psc_68cac54d868d6.webp', NULL, '2025-07-08 21:29:50', '2025-09-17 18:27:25'),
(19, 8, 'Sauces', 'aromate-sauces', 'product_subcategories/psc_68cac6545446b.webp', NULL, '2025-07-08 21:29:25', '2025-09-17 18:31:48'),
(18, 8, 'Bouillons', 'aromate-bouillons', 'product_subcategories/psc_68cac67a54e18.webp', NULL, '2025-07-08 21:29:12', '2025-09-17 18:32:26'),
(17, 9, 'lessive', 'arc-lessive', 'product_subcategories/psc_68cac69db5466.webp', NULL, '2025-07-08 21:00:45', '2025-09-17 18:33:01'),
(16, 8, 'Mayo classique', 'aromate-mayo-classique', 'product_subcategories/psc_68d138d653445.webp', NULL, '2025-07-08 19:18:59', '2026-03-25 14:12:26'),
(31, 11, 'Eau de javel', 'super-clean-eau-de-javel', 'product_subcategories/psc_68cac33be7649.webp', NULL, '2025-07-08 21:40:24', '2025-09-17 18:18:35'),
(32, 11, 'Poudre à Récurer', 'super-clean-poudre-a-recurer', 'product_subcategories/psc_68cac31e24caa.webp', NULL, '2025-07-08 21:40:37', '2025-09-17 18:18:06'),
(33, 11, 'Gel WC', 'super-clean-gel-wc', 'product_subcategories/psc_68cac2f2857b6.webp', NULL, '2025-07-08 21:40:50', '2025-09-17 18:17:22'),
(34, 11, 'Acide muriatique', 'super-clean-acide-muriatique', 'product_subcategories/psc_68cac2c35595c.webp', NULL, '2025-07-08 21:41:07', '2026-01-23 17:57:15'),
(35, 11, 'Déboucheur', 'super-clean-deboucheur', 'product_subcategories/psc_68cac25b3e361.webp', NULL, '2025-07-08 21:41:20', '2025-09-17 18:14:51'),
(36, 22, 'Brumes d\'ambiance', 'zen-breeze-brumes-dambiance', 'product_subcategories/psc_68cac237cf2e5.webp', NULL, '2025-07-14 22:52:05', '2025-09-17 18:14:15'),
(37, 17, 'désodorisant', 'nil-desodorisant', 'product_subcategories/psc_68cac21b0bcdd.webp', NULL, '2025-07-15 15:20:05', '2025-09-17 18:13:47'),
(38, 17, 'detachant', 'nil-detachant', 'product_subcategories/psc_68cac1fd6b1f9.webp', NULL, '2025-07-15 15:21:06', '2025-09-17 18:13:17'),
(41, 17, 'lessive', 'nil-lessive', 'product_subcategories/psc_68cac1d1e63d3.webp', NULL, '2025-07-15 15:40:01', '2025-09-17 18:12:33'),
(44, 20, 'lessive', 'cosmo-lessive', 'product_subcategories/psc_68cabfc723ea7.webp', NULL, '2025-07-15 16:11:02', '2025-09-17 18:03:51'),
(43, 21, 'lessive', 'cross-lessive', 'product_subcategories/psc_68cac145543a1.webp', NULL, '2025-07-15 16:06:12', '2025-09-17 18:10:13'),
(45, 10, 'assouplissant', 'beko-assouplissant', 'product_subcategories/68c2ea0387c23.webp', NULL, '2025-07-15 16:17:13', '2025-09-17 12:00:54'),
(46, 12, 'Mayonnaise', 'mia-mayonnaise', 'product_subcategories/psc_696ed342cc63a.png', NULL, '2025-07-15 17:08:04', '2026-01-20 05:58:42'),
(48, 13, 'Mayonnaise', 'amerigo-mayonnaise', 'product_subcategories/psc_68cabf9824ce1.webp', NULL, '2025-07-15 17:21:16', '2025-09-17 18:03:04'),
(49, 14, 'Mayonnaise', 'top-mayo-mayonnaise', 'product_subcategories/psc_68cabfef22836.webp', NULL, '2025-07-15 17:23:01', '2025-09-17 18:04:31'),
(50, 16, 'Mayonnaise', 'santina-mayonnaise', 'product_subcategories/psc_68d1386b993a4.png', NULL, '2025-07-15 17:28:38', '2025-09-22 15:52:11'),
(51, 11, 'Bactéricide', 'super-clean-bactericide', 'product_subcategories/68c2e1fae5720.webp', NULL, '2025-07-15 20:37:50', '2025-09-17 12:00:54'),
(52, 11, 'Liquide Vaisselle', 'super-clean-liquide-vaisselle', 'product_subcategories/68c2e1be96bdc.webp', NULL, '2025-07-15 21:12:59', '2025-09-17 12:00:54'),
(53, 11, 'Nettoyant Multi surfaces', 'super-clean-nettoyant-multi-surfaces', 'product_subcategories/68c2e1855fa97.webp', NULL, '2025-07-15 21:27:19', '2025-09-17 12:00:54'),
(54, 17, 'assouplissant', 'nil-assouplissant', 'product_subcategories/psc_68cac1663cf54.webp', NULL, '2025-07-15 23:58:30', '2025-09-17 18:10:46'),
(55, 8, 'Ketchup', 'aromate-ketchup', 'product_subcategories/68c2e0dfe38c9.webp', NULL, '2025-07-16 01:28:52', '2025-09-17 12:00:54'),
(56, 17, 'Pâte Lavante', 'nil-pate-lavante', 'product_subcategories/psc_697379bcd9b02.png', NULL, '2026-01-23 18:35:07', '2026-01-23 18:38:04'),
(57, 8, 'Mayo aromatisée', 'aromate-mayo-aromatisee', NULL, 'Mayonnaises aromatisées Aromate (Light, Bocal…)', '2026-03-25 14:12:26', '2026-03-25 14:12:26'),
(58, 15, 'Moutarde', 'top-moutarde-moutarde', NULL, 'Gamme Moutarde Top Moutarde', '2026-03-25 14:12:26', '2026-03-25 14:12:26');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@siprochim.com', NULL, '$2y$12$Rsthu5WUlX82rOzAvQJoYu95dLgblPvcUC.E914w5qSXNj1nUU7u6', 'IB9gNZayq0Ivb8UzmsTUzmjXiDFkTRiE61zKZ0KpihZz42NV3RxY4e1tK8o5', '2025-07-08 19:11:59', '2025-07-08 19:11:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_applications_job_offer_id_foreign` (`job_offer_id`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_offers`
--
ALTER TABLE `job_offers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_offers_slug_unique` (`slug`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_product_subcategory_id_foreign` (`product_subcategory_id`);

--
-- Indexes for table `product_accordions`
--
ALTER TABLE `product_accordions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_accordions_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_analytics`
--
ALTER TABLE `product_analytics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_analytics_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_categories_slug_unique` (`slug`),
  ADD KEY `product_categories_product_family_id_foreign` (`product_family_id`);

--
-- Indexes for table `product_families`
--
ALTER TABLE `product_families`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_families_slug_unique` (`slug`);

--
-- Indexes for table `product_subcategories`
--
ALTER TABLE `product_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_slug_cat` (`product_category_id`,`slug`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_offers`
--
ALTER TABLE `job_offers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=355;

--
-- AUTO_INCREMENT for table `product_accordions`
--
ALTER TABLE `product_accordions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `product_analytics`
--
ALTER TABLE `product_analytics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product_families`
--
ALTER TABLE `product_families`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_subcategories`
--
ALTER TABLE `product_subcategories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD CONSTRAINT `job_applications_job_offer_id_foreign` FOREIGN KEY (`job_offer_id`) REFERENCES `job_offers` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
