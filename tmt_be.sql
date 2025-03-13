-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th3 13, 2025 lúc 06:43 AM
-- Phiên bản máy phục vụ: 8.2.0
-- Phiên bản PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tmt_be`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_03_10_133300_create_oauth_auth_codes_table', 1),
(5, '2025_03_10_133301_create_oauth_access_tokens_table', 1),
(6, '2025_03_10_133302_create_oauth_refresh_tokens_table', 1),
(7, '2025_03_10_133303_create_oauth_clients_table', 1),
(8, '2025_03_10_133304_create_oauth_personal_access_clients_table', 1),
(9, '2025_03_12_051526_add_role_user', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('601d5d43a6ce13a5be0cb6c542efcfeab27b8731b72f66d4d4818b5eaa2f06e4d1ef78c5c59ceed1', 1, 1, 'UserToken', '[]', 0, '2025-03-10 07:59:25', '2025-03-10 07:59:25', '2026-03-10 14:59:25'),
('8b9b7923691fc2e03b99c8ee84cf597596c12153abbbaa1132c68ac5526d000e07462243e74c88c7', 1, 1, 'UserToken', '[]', 0, '2025-03-10 08:02:57', '2025-03-10 08:02:57', '2026-03-10 15:02:57'),
('e562fdc87a2c1bd9f112a653d0d7f2d9745e1c543a6a28ec9bb2293224b697913fb38006b452f29b', 2, 1, 'UserToken', '[]', 0, '2025-03-10 08:03:58', '2025-03-10 08:03:58', '2026-03-10 15:03:58'),
('45578ee8c6ae42caa4df690d440bb886a2866acb1f178e34aa047440db05a8ab568da014c3de3341', 2, 1, 'UserToken', '[]', 0, '2025-03-10 08:04:06', '2025-03-10 08:04:06', '2026-03-10 15:04:06'),
('6e4ca71d7a60aefd36dad3046e0c6dd81d7c5088852942befdef7399c7162a1dc5ebdea5dd875cfd', 1, 1, 'UserToken', '[]', 0, '2025-03-10 08:14:10', '2025-03-10 08:14:10', '2026-03-10 15:14:10'),
('580faeef40773b1fce30f0c715c50f398045868b43dea0295712c778fa00b1a374d799ac1302aa70', 1, 1, 'LoginToken', '[]', 0, '2025-03-11 22:20:49', '2025-03-11 22:20:49', '2026-03-12 05:20:49'),
('06d9a5387b653f0d45844f524af7cce8d900ea58217a436c19a6c1509e283f0dd5816c9a5e0becd6', 2, 1, 'LoginToken', '[]', 0, '2025-03-11 22:21:00', '2025-03-11 22:21:00', '2026-03-12 05:21:00'),
('3e7ce4d5d372e638eba6d4942684e8c33fa2e0ccb41d78b2794e22c46f4af2115ae6b44240c61b0c', 1, 1, 'LoginToken', '[]', 0, '2025-03-11 22:41:49', '2025-03-11 22:41:49', '2026-03-12 05:41:49'),
('aa1afbde881ca62a5a9af2eae850c450a1ad9c984d77e561f97dac292a7535b56797b1e00f8d10c7', 2, 1, 'LoginToken', '[]', 0, '2025-03-11 22:43:02', '2025-03-11 22:43:02', '2026-03-12 05:43:02'),
('6f8eb0d18488be5da0f2293cd1bcd12a24b1a70207385d050f6fccbafc240c5d30e051092b923759', 1, 1, 'LoginToken', '[]', 0, '2025-03-11 23:31:31', '2025-03-11 23:31:31', '2026-03-12 06:31:31'),
('426028ee01cc626e2f9d70d86e99cebc60ed2433a77369adc3245dc3b95a1138e2d3e7d920089791', 1, 1, 'LoginToken', '[]', 0, '2025-03-11 23:31:47', '2025-03-11 23:31:47', '2026-03-12 06:31:47'),
('4e494aed45e4cfc6cfb21e3b9c650c44d826e85cb8d2728c453ce60e31ae7b67fdab58dbac0cbcf3', 2, 1, 'LoginToken', '[]', 0, '2025-03-11 23:34:14', '2025-03-11 23:34:14', '2026-03-12 06:34:14'),
('6b50d66d70c2ca70efaec977bbe1c4f140728cb3c8b90e0cea8deb516d563abb31512e9afc2eb58d', 1, 1, 'LoginToken', '[]', 0, '2025-03-11 23:34:21', '2025-03-11 23:34:21', '2026-03-12 06:34:21'),
('6d12f652e87075ed5553efb87c639bf6752c99e80d925714372bf44632d8f4a129b439c0140ce741', 1, 1, 'LoginToken', '[]', 0, '2025-03-11 23:35:18', '2025-03-11 23:35:18', '2026-03-12 06:35:18'),
('2e1301f3f8c840be8b21d818074cf930a0594703037c80c2d848bd4c120b4e25361b3f2d35d57d48', 1, 1, 'LoginToken', '[]', 0, '2025-03-11 23:39:35', '2025-03-11 23:39:35', '2026-03-12 06:39:35'),
('e545daa0ceda28a11b1dbc5ca1ff34680d5af782726a838f051acb1f04eaa916fb15ccda17a4c790', 1, 1, 'LoginToken', '[]', 0, '2025-03-11 23:40:57', '2025-03-11 23:40:57', '2026-03-12 06:40:57'),
('ecf474c99adeca84ed3def198c3012d7b5f66d8d2ed50f3d57f27ba44b896f1cc67acc35fb465a63', 1, 1, 'LoginToken', '[]', 0, '2025-03-11 23:43:21', '2025-03-11 23:43:21', '2026-03-12 06:43:21'),
('95520f8aeb90ec2a085d65145878b028619474b714227b399b7fbee872bcfded8eaa5b79656c1f94', 3, 1, 'UserToken', '[]', 0, '2025-03-11 23:45:33', '2025-03-11 23:45:33', '2026-03-12 06:45:33'),
('f9eb567fb917d3a0956be0ddcf8deb78933c3e28371e75c3bbba80b09172c64dd071f5ed3414eed8', 4, 1, 'UserToken', '[]', 0, '2025-03-11 23:46:43', '2025-03-11 23:46:43', '2026-03-12 06:46:43'),
('bdb0b7823df5e4fefa4440cd910a2599b01fb16c17e6ba4155a84599ca3dea5f35ad76cf7576a9cf', 5, 1, 'UserToken', '[]', 0, '2025-03-11 23:48:29', '2025-03-11 23:48:29', '2026-03-12 06:48:29'),
('cb9f0be544c9202cbd9d3ce19e78eee044cccb9d9863bf50ae509802283f929ba4b3cf8afedebd26', 6, 1, 'UserToken', '[]', 0, '2025-03-11 23:50:35', '2025-03-11 23:50:35', '2026-03-12 06:50:35'),
('d6ad922204e1a51455a4eb717056b829de121a0dbb5b054c96ea363c246bfd42116bf997aa5c2e4c', 6, 1, 'LoginToken', '[]', 0, '2025-03-11 23:50:48', '2025-03-11 23:50:48', '2026-03-12 06:50:48'),
('604abe6d255158aab07a9c5c7f17a23cb7155f20b1ef40b0c9a7bcc93868518af240e29669390cb5', 1, 1, 'LoginToken', '[]', 0, '2025-03-11 23:54:43', '2025-03-11 23:54:43', '2026-03-12 06:54:43'),
('8e963a5957579f8a907f34095a41fa2f4efc881b11bbb67284dc43b3f534f4d8554d389dc07f86f5', 1, 1, 'LoginToken', '[]', 0, '2025-03-11 23:55:35', '2025-03-11 23:55:35', '2026-03-12 06:55:35'),
('e23d5d7cd52ba631c82d544eccfe4df4395692b7804d2a9a942c6387db3cc58bfdf7b1c08e1501c8', 1, 1, 'LoginToken', '[]', 0, '2025-03-11 23:56:56', '2025-03-11 23:56:56', '2026-03-12 06:56:56'),
('916c9e8e6528d788e6266ed660afe0f0b3a49ee777396db188cd7a89388d94ee5f7a5378cdee1d4b', 1, 1, 'LoginToken', '[]', 0, '2025-03-11 23:57:47', '2025-03-11 23:57:47', '2026-03-12 06:57:47'),
('a8e006a6c60ff2dbcfa3da53bfc20a5346cbc5f30cbf30a8062b73d1f1699719a2326edac17b14e0', 1, 1, 'LoginToken', '[]', 0, '2025-03-12 00:00:43', '2025-03-12 00:00:43', '2026-03-12 07:00:43'),
('df97ac0eee846299b2311786446ab5faa8c7181ca501b2501317c84dd67b95e01310eb230a3f425e', 6, 1, 'LoginToken', '[]', 0, '2025-03-12 00:01:57', '2025-03-12 00:01:57', '2026-03-12 07:01:57'),
('bc0e6d1441b015e23073afceb32930d9dd3d274dc6c573662f0f1e4c423e187a7616008a93073b9d', 6, 1, 'LoginToken', '[]', 0, '2025-03-12 00:05:07', '2025-03-12 00:05:07', '2026-03-12 07:05:07'),
('0448718516b4a94294f68261f4df57171d6349ba7eda9cc33f0257a1ffc9a91c2b6d8ef30fbf75cf', 6, 1, 'LoginToken', '[]', 0, '2025-03-12 00:05:41', '2025-03-12 00:05:41', '2026-03-12 07:05:41'),
('d4a4474229874bb9398d23fbb9b452c95deceff73c3a3248d4d1e6f25e72ffe683cb4f291b3c1ca7', 6, 1, 'LoginToken', '[]', 0, '2025-03-12 00:06:16', '2025-03-12 00:06:16', '2026-03-12 07:06:16'),
('955a9660c688310195d9aca6b72493698fd15372ff0d9b52390690b33cfd00242740be4b8ca97f7a', 1, 1, 'LoginToken', '[]', 0, '2025-03-12 00:07:05', '2025-03-12 00:07:05', '2026-03-12 07:07:05'),
('a80718123722e591e3873aa3cc38b9f37e43e32a123e4963da86c65d4f7ea0db2eeeaf2ce7e5b5c7', 1, 1, 'LoginToken', '[]', 0, '2025-03-12 00:12:45', '2025-03-12 00:12:45', '2026-03-12 07:12:45'),
('79815cb5a5bff8eee7cc99a34d71056281b93fa7fcdcb74faf5efe5ddf9cd5811b107894c7a9735c', 6, 1, 'LoginToken', '[]', 0, '2025-03-12 00:26:11', '2025-03-12 00:26:11', '2026-03-12 07:26:11'),
('f1bd47ce9b47205d39449426d2def42cf53ffbae0f6568f5f23fe94be482eebaa7d10be369c193cf', 7, 1, 'UserToken', '[]', 0, '2025-03-12 00:27:44', '2025-03-12 00:27:44', '2026-03-12 07:27:44'),
('0746c06ddcbcd867cb09be1dbd859cee86d0b7153bc88c93de23c9e1a2d3be16172e66d584f4a7c6', 7, 1, 'LoginToken', '[]', 0, '2025-03-12 00:31:09', '2025-03-12 00:31:09', '2026-03-12 07:31:09'),
('c32c64be51b1bd57e0135a4913bcd75208c0cdc17a5819bf39992c8983cbf36d7563a74131392e8a', 1, 1, 'LoginToken', '[]', 0, '2025-03-12 00:31:23', '2025-03-12 00:31:23', '2026-03-12 07:31:23'),
('8bf1fd76aa66b4b1aacfd394b2aa2c5521879686977c61dbe8c4c4e54dd82c1a2f17e20f99b00f6a', 1, 1, 'LoginToken', '[]', 0, '2025-03-12 01:08:54', '2025-03-12 01:08:54', '2026-03-12 08:08:54'),
('facbc8c39b11da2420eb3f3416776b07c25c66ff93e1d42006a186ccfc36f6f321d1d662098cbe29', 1, 1, 'LoginToken', '[]', 0, '2025-03-12 01:13:08', '2025-03-12 01:13:08', '2026-03-12 08:13:08'),
('1707c721f744974284eda80f13ab20410c075f7b572bcbf06ac54d2f7b78a41b5ab9318d1ba8cbeb', 1, 1, 'LoginToken', '[]', 0, '2025-03-12 01:20:40', '2025-03-12 01:20:40', '2026-03-12 08:20:40'),
('1837e9af696e4c5057e11d23de030f674ef3a7678a2937a3ddd990ee6a69c7ac32a886de957155c4', 1, 1, 'LoginToken', '[]', 0, '2025-03-12 01:39:13', '2025-03-12 01:39:13', '2026-03-12 08:39:13'),
('6691f558189496a40a1c66395859c4076153fa02b45c562161ba34c1ae86cda013f6a4a85190cbaf', 1, 1, 'LoginToken', '[]', 0, '2025-03-12 01:42:29', '2025-03-12 01:42:29', '2026-03-12 08:42:29'),
('72400f720417b0f1283a65ee5c92f9e973307b2512e3bcdc879156e6d22e9125ed963bfc644d4a54', 1, 1, 'LoginToken', '[]', 0, '2025-03-12 01:44:57', '2025-03-12 01:44:57', '2026-03-12 08:44:57'),
('c0531571021ba0c16f2256b00ac2d3f25002c73e9635766a56f0ea1b3dbfc8062c4e7bd96914e5d5', 1, 1, 'LoginToken', '[]', 0, '2025-03-12 01:45:22', '2025-03-12 01:45:22', '2026-03-12 08:45:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'CsheIjwLjuddqBq3ZAKkGITMzYKXtZYtjcsHowpm', NULL, 'http://localhost', 1, 0, 0, '2025-03-10 06:33:06', '2025-03-10 06:33:06'),
(2, NULL, 'Laravel Password Grant Client', 'Bsa3kO56erP15KwNwnr0vCbnfMqDlyPMo6BkjERv', 'users', 'http://localhost', 0, 1, 0, '2025-03-10 06:33:06', '2025-03-10 06:33:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-03-10 06:33:06', '2025-03-10 06:33:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('N1ENds9VYfu15zjl998ZJgWUkIR2CHOwRxSLK0gR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXp6UUFGT2c2M0o4bndCb0F6RWFkb1ZhVmlqdmw2c1NwRjhYdTIyQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1741759658);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Thuan admina1', 'thuan1@gmail.com', NULL, '$2y$12$SZkPHFjBe40/WuuJGIm5uOTgloZqgFPzPNiH.TJVihkG6jixSfuFC', NULL, '2025-03-10 07:59:25', '2025-03-12 01:45:15', 'admin'),
(2, 'Thuan  2', 'thuan2@gmail.com', NULL, '$2y$12$lrOz.LW91LWU6v2y8p6V/uU0J0wjrR8EG6vkamIArBHkU5QAD/b5u', NULL, '2025-03-10 08:03:58', '2025-03-10 08:03:58', 'user'),
(3, 'thuan', 'thuan3@gmail.com', NULL, '$2y$12$VxsvxMfdr6BClPiJkkIy6ObbQJ3iqxlFrq/jxiKKFLb1JIlejAyCC', NULL, '2025-03-11 23:45:33', '2025-03-11 23:45:33', 'user'),
(4, 'thuan', 'thuan4@gmail.com', NULL, '$2y$12$mBOkBJ6pkWXMEhd1AAehCuYZVLq5COG4YupsgjZL4NgN1Ib1qZ0Nm', NULL, '2025-03-11 23:46:43', '2025-03-11 23:46:43', 'user'),
(6, 'thuan ne', 'thuan6@gmail.com', NULL, '$2y$12$PIpB1DJdYfoCv4HafeHinOPQVPgb7DqNm3E828aeQIWZ7q.3I6k1O', NULL, '2025-03-11 23:50:35', '2025-03-12 01:00:42', 'admin');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
