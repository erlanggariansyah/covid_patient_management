-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Nov 2022 pada 17.15
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `covid_patient`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `entry_records`
--

CREATE TABLE `entry_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `entry_at` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `entry_records`
--

INSERT INTO `entry_records` (`id`, `patient_id`, `entry_at`, `created_at`, `updated_at`) VALUES
(3, 6, '2022-11-12', '2022-11-12 07:05:01', '2022-11-12 07:05:01'),
(5, 8, '2022-11-12', '2022-11-12 07:05:20', '2022-11-12 07:05:20'),
(6, 6, '2022-09-09', '2022-11-12 08:35:27', '2022-11-12 08:35:27'),
(7, 6, '2022-09-09', '2022-11-12 08:35:30', '2022-11-12 08:35:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_11_11_113932_create_patients_table', 1),
(6, '2022_11_11_114614_create_entry_records_table', 1),
(7, '2022_11_11_120238_create_out_records_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `out_records`
--

CREATE TABLE `out_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `entry_id` bigint(20) UNSIGNED NOT NULL,
  `out_at` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `out_records`
--

INSERT INTO `out_records` (`id`, `entry_id`, `out_at`, `created_at`, `updated_at`) VALUES
(2, 6, '2020-09-13', '2022-11-12 09:07:49', '2022-11-12 09:07:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('recovered','positive','death') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `patients`
--

INSERT INTO `patients` (`id`, `name`, `phone`, `address`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Ramdani Setiawansyah', 6185693734762, 'Jalan Raya Puspiptek No. 89', 'death', '2022-11-12 04:19:07', '2022-11-12 06:25:54'),
(6, 'Ramdani Setiawan', 6285693734762, 'Jl. Raya Narogong No. 42, Bogor', 'recovered', '2022-11-12 07:05:01', '2022-11-12 07:05:01'),
(7, 'Ramdani Setiawan', 6285693734763, 'Jl. Raya Narogong No. 42, Bogor', 'death', '2022-11-12 07:05:12', '2022-11-12 07:05:12'),
(8, 'Ramdani Setiawan', 6285693734764, 'Jl. Raya Narogong No. 42, Bogor', 'positive', '2022-11-12 07:05:20', '2022-11-12 07:05:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 5, 'auth_token', 'a4f4ef0bdbfa49511843829d02087d26593927074aa5574de66785f09bca7729', '[\"*\"]', NULL, NULL, '2022-11-11 20:50:03', '2022-11-11 20:50:03'),
(2, 'App\\Models\\User', 5, 'auth_token', '4a468801e67c1dcb71753378947ad0b662696afdb4a24726b6033b6480351454', '[\"*\"]', NULL, NULL, '2022-11-11 20:50:17', '2022-11-11 20:50:17'),
(3, 'App\\Models\\User', 5, 'auth_token', '7e4a4c7e8a541831dc4ec3af4bce06387b9996f4f16830695790eaa73607ed98', '[\"*\"]', NULL, NULL, '2022-11-11 20:51:37', '2022-11-11 20:51:37'),
(4, 'App\\Models\\User', 5, 'auth_token', 'e4280a2e4c322e7afd490d174b76ec609a2d5216c8c72bd795c661af1edc7fcf', '[\"*\"]', NULL, NULL, '2022-11-11 22:32:47', '2022-11-11 22:32:47'),
(5, 'App\\Models\\User', 6, 'auth_token', 'ec15ae943ef3e4b164a41d55b1a45ff037dd97e411b8afbf68438b88f74d7289', '[\"*\"]', '2022-11-12 09:08:15', NULL, '2022-11-11 22:34:14', '2022-11-12 09:08:15'),
(6, 'App\\Models\\User', 6, 'auth_token', '38ed167daba5a728dc6cc6c92a6361f54d387d0c1616ee155f404be393ea905e', '[\"*\"]', NULL, NULL, '2022-11-11 23:56:14', '2022-11-11 23:56:14'),
(7, 'App\\Models\\User', 6, 'auth_token', '3417bd31ba415a7c1a40f92144ebd20fda4dd7f7943a8e7cc044d8fd0f791a98', '[\"*\"]', NULL, NULL, '2022-11-12 07:36:06', '2022-11-12 07:36:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'Erlangga Riansyah', 'erlanggariansyahjuergen@gmail.com', NULL, '$2y$10$7hVt0D.grs003b5ex2Eofunc.3glGy6mS3/wVOpv9fIA0L4jZpcuS', NULL, '2022-11-11 22:34:04', '2022-11-11 22:34:04'),
(7, 'Erlangga Riansyah', 'erlanggariansyah@gmail.com', NULL, '$2y$10$1A1U3J6UVwutDyzI96Pb/u7nty0mK7P4RlkBbG4WNguYkdZ0UkaIS', NULL, '2022-11-12 07:36:18', '2022-11-12 07:36:18');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `entry_records`
--
ALTER TABLE `entry_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_records_patient_id_foreign` (`patient_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `out_records`
--
ALTER TABLE `out_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `out_records_entry_id_foreign` (`entry_id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `entry_records`
--
ALTER TABLE `entry_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `out_records`
--
ALTER TABLE `out_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `entry_records`
--
ALTER TABLE `entry_records`
  ADD CONSTRAINT `entry_records_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `out_records`
--
ALTER TABLE `out_records`
  ADD CONSTRAINT `out_records_entry_id_foreign` FOREIGN KEY (`entry_id`) REFERENCES `entry_records` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
