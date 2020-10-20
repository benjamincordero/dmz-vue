INSERT INTO "types" ("id", "name", "created_at", "updated_at") VALUES
(1,	'Carpa',	NULL,	NULL),
(2,	'Imprenta',	NULL,	NULL);


INSERT INTO "users" ("id", "name", "email", "email_verified_at", "password", "profile_photo_path", "role", "status", "remember_token", "current_team_id", "created_at", "updated_at", "two_factor_secret", "two_factor_recovery_codes") VALUES
(1,	'Benjamin Cordero',	'ingbenjamincordero@gmail.com',	NULL,	'$2y$10$nIBAnBIjlzoZF7tb6sfJDunURmgA0pwTjURcdBSiQMbiF7R8SnVJm',	NULL,	'root',	'1',	NULL,	NULL,	'2020-10-19 20:17:50',	'2020-10-19 20:18:07',	NULL,	NULL);

INSERT INTO "transfers" ("id", "amount", "rate", "in_dollars", "date", "type_id", "created_at", "updated_at") VALUES
(1,	1455000,	153119,	9.5024131557808,	'2020-04-22',	1,	'2020-04-22 17:54:14',	'2020-04-22 17:54:14'),
(2,	1810225,	178000,	10.169803370787,	'2020-05-07',	1,	'2020-05-07 13:20:05',	'2020-05-07 13:20:05'),
(3,	1230977.5,	178000,	6.9156039325843,	'2020-05-07',	0,	'2020-05-07 13:20:23',	'2020-05-07 13:20:23'),
(4,	2600000,	205882,	12.628593077588,	'2020-05-22',	1,	'2020-05-22 20:49:57',	'2020-05-22 20:49:57'),
(5,	3340000,	205882,	16.222884953517,	'2020-05-22',	0,	'2020-05-22 20:50:07',	'2020-05-22 20:50:07'),
(6,	2733000,	196000,	13.94387755102,	'2020-06-03',	0,	'2020-06-03 14:39:51',	'2020-06-03 14:39:51'),
(7,	2146000,	196000,	10.948979591837,	'2020-06-03',	1,	'2020-06-03 14:40:44',	'2020-06-03 14:40:44'),
(8,	3876600,	205000,	18.910243902439,	'2020-06-18',	0,	'2020-06-18 12:54:50',	'2020-06-18 12:54:50'),
(9,	3725000,	205000,	18.170731707317,	'2020-06-18',	1,	'2020-06-18 12:55:08',	'2020-06-18 12:55:08'),
(10,	3800000,	210047,	18.091189114817,	'2020-07-03',	1,	'2020-07-03 16:35:14',	'2020-07-03 16:35:14'),
(11,	3800000,	210047,	18.091189114817,	'2020-07-03',	1,	'2020-07-03 16:35:14',	'2020-07-03 16:35:14'),
(12,	3833000,	210047,	18.248296809762,	'2020-07-03',	0,	'2020-07-03 16:35:29',	'2020-07-03 16:35:29'),
(13,	3820610,	235012,	16.257084744609,	'2020-07-17',	0,	'2020-07-17 19:18:31',	'2020-07-17 19:18:31'),
(14,	3524000,	235012,	14.994978979797,	'2020-07-17',	1,	'2020-07-17 19:18:44',	'2020-07-17 19:18:44'),
(15,	5157800,	270259,	19.084655830148,	'2020-08-05',	0,	'2020-08-05 13:26:46',	'2020-08-05 13:26:46'),
(16,	3400000,	270259,	12.580524607876,	'2020-08-05',	1,	'2020-08-05 13:27:04',	'2020-08-05 13:27:04'),
(17,	3350000,	289000,	11.59169550173,	'2020-08-17',	1,	'2020-08-17 19:54:52',	'2020-08-17 19:54:52'),
(18,	5070200,	289000,	17.543944636678,	'2020-08-17',	0,	'2020-08-17 19:55:03',	'2020-08-17 19:55:03'),
(19,	6200000,	341118,	18.175528702678,	'2020-09-02',	1,	'2020-09-02 00:08:22',	'2020-09-02 00:08:22'),
(20,	7814000,	341118,	22.907029239149,	'2020-09-02',	0,	'2020-09-02 00:09:15',	'2020-09-02 00:09:15'),
(21,	15835900,	380000,	41.673421052632,	'2020-09-16',	0,	'2020-09-16 19:41:07',	'2020-09-16 19:41:07'),
(22,	2542000,	380000,	6.6894736842105,	'2020-09-16',	1,	'2020-09-16 19:41:35',	'2020-09-16 19:41:35'),
(23,	490400,	440000,	1.1145454545455,	'2020-10-05',	0,	'2020-10-05 20:29:17',	'2020-10-05 20:29:17'),
(24,	5705300,	440000,	12.966590909091,	'2020-10-05',	1,	'2020-10-05 20:29:29',	'2020-10-05 20:29:29'),
(25,	10025000,	455000,	22.032967032967,	'2020-10-17',	1,	'2020-10-17 13:38:52',	'2020-10-17 13:38:52'),
(26,	20363500,	455000,	44.754945054945,	'2020-10-17',	0,	'2020-10-17 13:39:02',	'2020-10-17 13:39:02');

INSERT INTO "offerings" ("id", "amount", "person", "date", "is_current", "type_id", "transfer_id", "created_at", "updated_at", "currency") VALUES
(1,	255000,	'Mamá & Julisbeth',	'2020-04-22',	'0',	1,	1,	'2020-04-22 17:49:20',	'2020-04-22 17:54:14',	'Bs'),
(2,	200000,	'Carmen',	'2020-04-22',	'0',	1,	1,	'2020-04-22 17:49:46',	'2020-04-22 17:54:14',	'Bs'),
(3,	1000000,	'Yo - Benjamin Cordero',	'2020-04-22',	'0',	1,	1,	'2020-04-22 17:50:25',	'2020-04-22 17:54:14',	'Bs'),
(4,	400000,	'Carmen',	'2020-04-22',	'0',	1,	2,	'2020-04-22 23:37:26',	'2020-05-07 13:20:05',	'Bs'),
(5,	410225,	'Mamá, Judith & Julisbeth',	'2020-05-06',	'0',	1,	2,	'2020-05-06 17:44:09',	'2020-05-07 13:20:05',	'Bs'),
(6,	1000000,	'Yo - Benjamin Cordero',	'2020-05-07',	'0',	1,	2,	'2020-05-07 13:10:58',	'2020-05-07 13:20:05',	'Bs'),
(7,	300000,	'Carmen',	'2020-05-15',	'0',	1,	4,	'2020-05-15 00:40:01',	'2020-05-22 20:49:57',	'Bs'),
(8,	300000,	'Mamá',	'2020-05-22',	'0',	1,	4,	'2020-05-22 20:48:26',	'2020-05-22 20:49:57',	'Bs'),
(9,	2000000,	'Yo - Benjamin Cordero',	'2020-05-22',	'0',	1,	4,	'2020-05-22 20:49:12',	'2020-05-22 20:49:57',	'Bs'),
(10,	250000,	'Migdaly Garcia',	'2020-05-24',	'0',	1,	7,	'2020-05-24 14:10:10',	'2020-06-03 14:40:44',	'Bs'),
(11,	200000,	'Carmen',	'2020-05-28',	'0',	1,	7,	'2020-05-28 00:33:46',	'2020-06-03 14:40:44',	'Bs'),
(12,	196000,	'Rosy',	'2020-06-03',	'0',	1,	7,	'2020-06-03 14:37:00',	'2020-06-03 14:40:44',	'Bs'),
(13,	1500000,	'Yo - Benjamin Cordero',	'2020-06-03',	'0',	1,	7,	'2020-06-03 14:40:28',	'2020-06-03 14:40:44',	'Bs'),
(14,	300000,	'Carmen',	'2020-06-07',	'0',	1,	9,	'2020-06-07 13:08:15',	'2020-06-18 12:55:08',	'Bs'),
(15,	400000,	'Dignora',	'2020-06-07',	'0',	1,	9,	'2020-06-07 13:10:23',	'2020-06-18 12:55:08',	'Bs'),
(16,	200000,	'Julisbeth',	'2020-06-07',	'0',	1,	9,	'2020-06-07 13:10:39',	'2020-06-18 12:55:08',	'Bs'),
(17,	300000,	'Migdaly Garcia',	'2020-06-11',	'0',	1,	9,	'2020-06-11 13:23:53',	'2020-06-18 12:55:08',	'Bs'),
(18,	1025000,	'Rosy',	'2020-06-18',	'0',	1,	9,	'2020-06-18 12:51:55',	'2020-06-18 12:55:08',	'Bs'),
(19,	1500000,	'Yo - Benjamin Cordero',	'2020-06-18',	'0',	1,	9,	'2020-06-18 12:54:25',	'2020-06-18 12:55:08',	'Bs'),
(20,	200000,	'Mamá',	'2020-06-21',	'0',	1,	10,	'2020-06-21 14:20:39',	'2020-07-03 16:35:14',	'Bs'),
(26,	2500000,	'Yo - Benjamin Cordero',	'2020-07-17',	'0',	1,	14,	'2020-07-17 19:17:35',	'2020-07-17 19:18:44',	'Bs'),
(21,	550000,	'Mamá',	'2020-07-03',	'0',	1,	11,	'2020-07-03 16:31:16',	'2020-07-03 16:35:14',	'Bs'),
(24,	300000,	'Carmen',	'2020-07-05',	'0',	1,	14,	'2020-07-05 20:56:38',	'2020-07-17 19:18:44',	'Bs'),
(22,	50000,	'Julisbeth',	'2020-07-03',	'0',	1,	11,	'2020-07-03 16:31:34',	'2020-07-03 16:35:14',	'Bs'),
(25,	724000,	'Migdaly',	'2020-07-09',	'0',	1,	14,	'2020-07-09 14:56:20',	'2020-07-17 19:18:44',	'Bs'),
(23,	3000000,	'Yo - Benjamin Cordero',	'2020-07-03',	'0',	1,	11,	'2020-07-03 16:33:24',	'2020-07-03 16:35:14',	'Bs'),
(27,	400000,	'Migdaly',	'2020-07-19',	'0',	1,	16,	'2020-07-19 14:09:02',	'2020-08-05 13:27:04',	'Bs'),
(28,	1000000,	'Carmen',	'2020-07-23',	'0',	1,	16,	'2020-07-23 22:09:57',	'2020-08-05 13:27:04',	'Bs'),
(29,	1000000,	'Carmen',	'2020-08-02',	'0',	1,	16,	'2020-08-02 00:32:21',	'2020-08-05 13:27:04',	'Bs'),
(30,	300000,	'Migdaly',	'2020-08-04',	'0',	1,	16,	'2020-08-04 14:27:30',	'2020-08-05 13:27:04',	'Bs'),
(31,	700000,	'Mama',	'2020-08-05',	'0',	1,	16,	'2020-08-05 13:11:25',	'2020-08-05 13:27:04',	'Bs'),
(32,	350000,	'Migdaly',	'2020-08-12',	'0',	1,	17,	'2020-08-12 12:52:35',	'2020-08-17 19:54:52',	'Bs'),
(33,	3000000,	'Yo - Benjamin Cordero',	'2020-08-17',	'0',	1,	17,	'2020-08-17 19:54:32',	'2020-08-17 19:54:52',	'Bs'),
(34,	1000000,	'Mamá',	'2020-08-22',	'0',	1,	19,	'2020-08-22 12:51:37',	'2020-09-02 00:08:22',	'Bs'),
(35,	1000000,	'Carmen',	'2020-08-29',	'0',	1,	19,	'2020-08-29 22:00:41',	'2020-09-02 00:08:22',	'Bs'),
(36,	3000000,	'Yo - Benjamin Cordero',	'2020-09-01',	'0',	1,	19,	'2020-09-01 19:02:09',	'2020-09-02 00:08:22',	'Bs'),
(37,	100000,	'Julisbeth',	'2020-09-01',	'0',	1,	19,	'2020-09-01 23:10:19',	'2020-09-02 00:08:22',	'Bs'),
(38,	1100000,	'Mamá',	'2020-09-01',	'0',	1,	19,	'2020-09-01 23:10:35',	'2020-09-02 00:08:22',	'Bs'),
(39,	1200000,	'Mamá',	'2020-09-04',	'0',	1,	22,	'2020-09-04 14:22:24',	'2020-09-16 19:41:35',	'Bs'),
(40,	230000,	'Migdaly',	'2020-09-12',	'0',	1,	22,	'2020-09-12 01:13:57',	'2020-09-16 19:41:35',	'Bs'),
(41,	1032000,	'Mamá',	'2020-09-16',	'0',	1,	22,	'2020-09-16 19:39:19',	'2020-09-16 19:41:35',	'Bs'),
(42,	80000,	'Julisbeth',	'2020-09-16',	'0',	1,	22,	'2020-09-16 19:39:34',	'2020-09-16 19:41:35',	'Bs'),
(43,	200000,	'Migdaly',	'2020-09-21',	'0',	1,	24,	'2020-09-21 00:14:46',	'2020-10-05 20:29:29',	'Bs'),
(44,	200000,	'Migdaly',	'2020-09-29',	'0',	1,	24,	'2020-09-29 00:12:46',	'2020-10-05 20:29:29',	'Bs'),
(45,	1500000,	'Judith',	'2020-10-02',	'0',	1,	24,	'2020-10-02 20:28:10',	'2020-10-05 20:29:29',	'Bs'),
(46,	805300,	'Judith',	'2020-10-03',	'0',	1,	24,	'2020-10-03 00:14:34',	'2020-10-05 20:29:29',	'Bs'),
(47,	1000000,	'Daisy',	'2020-10-03',	'0',	1,	24,	'2020-10-03 00:17:07',	'2020-10-05 20:29:29',	'Bs'),
(48,	2000000,	'Yo - Benjamin Cordero',	'2020-10-05',	'0',	1,	24,	'2020-10-05 20:28:39',	'2020-10-05 20:29:29',	'Bs'),
(51,	1000000,	'Mama y Judith',	'2020-10-17',	'0',	1,	25,	'2020-10-17 01:46:49',	'2020-10-17 13:38:52',	'Bs'),
(50,	4550000,	'Rosy',	'2020-10-12',	'0',	1,	25,	'2020-10-12 19:35:56',	'2020-10-17 13:38:52',	'Bs'),
(49,	2275000,	'Claudio',	'2020-10-12',	'0',	1,	25,	'2020-10-12 19:35:37',	'2020-10-17 13:38:52',	'Bs'),
(52,	2200000,	'Yo - Benjamin Cordero',	'2020-10-17',	'0',	1,	25,	'2020-10-17 13:35:55',	'2020-10-17 13:38:52',	'Bs');


INSERT INTO "tithes" ("id", "amount", "tithe", "person", "date", "is_current", "transfer_id", "created_at", "updated_at", "currency") VALUES
(1,	280000,	28000,	'Carmen',	'2020-04-22',	'0',	3,	'2020-04-22 23:37:48',	'2020-05-07 13:20:23',	'Bs'),
(2,	115000,	11500,	'Daisy',	'2020-04-28',	'0',	3,	'2020-04-28 17:08:06',	'2020-05-07 13:20:23',	'Bs'),
(3,	250000,	25000,	'Migdaly Garcia',	'2020-04-30',	'0',	3,	'2020-04-30 12:13:45',	'2020-05-07 13:20:23',	'Bs'),
(4,	10500000,	1050000,	'Yo - Benjamin Cordero',	'2020-05-02',	'0',	3,	'2020-05-02 16:56:05',	'2020-05-07 13:20:23',	'Bs'),
(5,	475000,	47500,	'Daisy',	'2020-05-06',	'0',	3,	'2020-05-06 15:12:25',	'2020-05-07 13:20:23',	'Bs'),
(6,	689775,	68977.5,	'Mamá, Judith & Julisbeth',	'2020-05-06',	'0',	3,	'2020-05-06 17:43:19',	'2020-05-07 13:20:23',	'Bs'),
(7,	500000,	50000,	'Carmen',	'2020-05-15',	'0',	5,	'2020-05-15 00:39:43',	'2020-05-22 20:50:07',	'Bs'),
(8,	16000000,	1600000,	'Yo - Benjamin Cordero',	'2020-05-19',	'0',	5,	'2020-05-19 17:03:45',	'2020-05-22 20:50:07',	'Bs'),
(9,	16000000,	1600000,	'Yo - Benjamin Cordero',	'2020-05-21',	'0',	5,	'2020-05-21 12:36:21',	'2020-05-22 20:50:07',	'Bs'),
(10,	900000,	90000,	'Mamá y Judith',	'2020-05-22',	'0',	5,	'2020-05-22 20:48:08',	'2020-05-22 20:50:07',	'Bs'),
(11,	450000,	45000,	'Migdaly Garcia',	'2020-05-24',	'0',	6,	'2020-05-24 14:09:51',	'2020-06-03 14:39:51',	'Bs'),
(12,	1000000,	100000,	'Daisy',	'2020-05-27',	'0',	6,	'2020-05-27 19:03:30',	'2020-06-03 14:39:51',	'Bs'),
(13,	300000,	30000,	'Carmen',	'2020-05-28',	'0',	6,	'2020-05-28 00:33:12',	'2020-06-03 14:39:51',	'Bs'),
(14,	25384000,	2538400,	'Yo - Benjamin Cordero',	'2020-06-03',	'0',	6,	'2020-06-03 14:21:26',	'2020-06-03 14:39:51',	'Bs'),
(15,	196000,	19600,	'Rosy',	'2020-06-03',	'0',	6,	'2020-06-03 14:36:16',	'2020-06-03 14:39:51',	'Bs'),
(21,	666000,	66600,	'Daisy',	'2020-06-16',	'0',	8,	'2020-06-16 13:19:28',	'2020-06-18 12:54:50',	'Bs'),
(22,	26250000,	2625000,	'Yo - Benjamin Cordero',	'2020-06-18',	'0',	8,	'2020-06-18 12:45:29',	'2020-06-18 12:54:50',	'Bs'),
(16,	300000,	30000,	'Carmen',	'2020-06-07',	'0',	8,	'2020-06-07 13:07:56',	'2020-06-18 12:54:50',	'Bs'),
(17,	200000,	20000,	'Migdaly Garcia',	'2020-06-07',	'0',	8,	'2020-06-07 13:09:25',	'2020-06-18 12:54:50',	'Bs'),
(18,	930000,	93000,	'Dignora',	'2020-06-07',	'0',	8,	'2020-06-07 13:09:43',	'2020-06-18 12:54:50',	'Bs'),
(19,	70000,	7000,	'Julisbeth',	'2020-06-07',	'0',	8,	'2020-06-07 13:10:00',	'2020-06-18 12:54:50',	'Bs'),
(20,	100000,	10000,	'Migdaly Garcia',	'2020-06-11',	'0',	8,	'2020-06-11 13:23:41',	'2020-06-18 12:54:50',	'Bs'),
(23,	1025000,	102500,	'Rosy',	'2020-06-18',	'0',	8,	'2020-06-18 12:49:14',	'2020-06-18 12:54:50',	'Bs'),
(24,	9225000,	922500,	'Yo',	'2020-06-18',	'0',	8,	'2020-06-18 12:49:36',	'2020-06-18 12:54:50',	'Bs'),
(25,	200000,	20000,	'Carmen',	'2020-06-20',	'0',	12,	'2020-06-20 20:20:22',	'2020-07-03 16:35:29',	'Bs'),
(26,	1200000,	120000,	'Mamá & Judith',	'2020-06-21',	'0',	12,	'2020-06-21 14:20:07',	'2020-07-03 16:35:29',	'Bs'),
(27,	150000,	15000,	'Carmen',	'2020-06-27',	'0',	12,	'2020-06-27 16:30:41',	'2020-07-03 16:35:29',	'Bs'),
(28,	480000,	48000,	'Migdaly Garcia',	'2020-07-02',	'0',	12,	'2020-07-02 16:33:54',	'2020-07-03 16:35:29',	'Bs'),
(29,	35000000,	3500000,	'Yo - Benjamin Cordero',	'2020-07-02',	'0',	12,	'2020-07-02 16:42:02',	'2020-07-03 16:35:29',	'Bs'),
(30,	205000,	20500,	'Judith',	'2020-07-03',	'0',	12,	'2020-07-03 16:29:27',	'2020-07-03 16:35:29',	'Bs'),
(31,	92000,	9200,	'Julisbeth',	'2020-07-03',	'0',	12,	'2020-07-03 16:29:51',	'2020-07-03 16:35:29',	'Bs'),
(32,	1003000,	100300,	'Mamá',	'2020-07-03',	'0',	12,	'2020-07-03 16:30:26',	'2020-07-03 16:35:29',	'Bs'),
(37,	29700000,	2970000,	'Yo - Benjamin Cordero',	'2020-07-17',	'0',	13,	'2020-07-17 14:38:25',	'2020-07-17 19:18:31',	'Bs'),
(33,	15100,	1510,	'Lolo',	'2020-07-05',	'0',	13,	'2020-07-05 20:56:11',	'2020-07-17 19:18:31',	'Bs'),
(34,	300000,	30000,	'Carmen',	'2020-07-05',	'0',	13,	'2020-07-05 20:56:23',	'2020-07-17 19:18:31',	'Bs'),
(35,	6475000,	647500,	'Yo - Benjamin Cordero',	'2020-07-07',	'0',	13,	'2020-07-07 19:41:40',	'2020-07-17 19:18:31',	'Bs'),
(36,	416000,	41600,	'Migdaly',	'2020-07-09',	'0',	13,	'2020-07-09 14:55:53',	'2020-07-17 19:18:31',	'Bs'),
(38,	1300000,	130000,	'Mama y Judith',	'2020-07-17',	'0',	13,	'2020-07-17 14:39:00',	'2020-07-17 19:18:31',	'Bs'),
(39,	600000,	60000,	'Migdaly',	'2020-07-19',	'0',	15,	'2020-07-19 14:08:23',	'2020-08-05 13:26:46',	'Bs'),
(40,	1000000,	100000,	'Carmen',	'2020-07-23',	'0',	15,	'2020-07-23 22:09:31',	'2020-08-05 13:26:46',	'Bs'),
(41,	46000000,	4600000,	'Yo - Benjamin Cordero',	'2020-08-01',	'0',	15,	'2020-08-01 00:24:12',	'2020-08-05 13:26:46',	'Bs'),
(42,	600000,	60000,	'Carmen',	'2020-08-02',	'0',	15,	'2020-08-02 00:32:00',	'2020-08-05 13:26:46',	'Bs'),
(43,	1000000,	100000,	'Yo - Benjamin Cordero',	'2020-08-03',	'0',	15,	'2020-08-03 13:32:33',	'2020-08-05 13:26:46',	'Bs'),
(44,	700000,	70000,	'Migdaly',	'2020-08-04',	'0',	15,	'2020-08-04 14:27:08',	'2020-08-05 13:26:46',	'Bs'),
(45,	1200000,	120000,	'Mamá',	'2020-08-05',	'0',	15,	'2020-08-05 13:10:48',	'2020-08-05 13:26:46',	'Bs'),
(46,	100000,	10000,	'Julisbeth',	'2020-08-05',	'0',	15,	'2020-08-05 13:11:04',	'2020-08-05 13:26:46',	'Bs'),
(47,	378000,	37800,	'Mamá y Judith',	'2020-08-05',	'0',	15,	'2020-08-05 13:12:26',	'2020-08-05 13:26:46',	'Bs'),
(48,	11132000,	1113200,	'Yo - Benjamin Cordero',	'2020-08-07',	'0',	18,	'2020-08-07 14:02:36',	'2020-08-17 19:55:03',	'Bs'),
(49,	300000,	30000,	'Migdaly',	'2020-08-12',	'0',	18,	'2020-08-12 19:42:30',	'2020-08-17 19:55:03',	'Bs'),
(50,	1670000,	167000,	'Daisy',	'2020-08-14',	'0',	18,	'2020-08-14 16:25:01',	'2020-08-17 19:55:03',	'Bs'),
(51,	550000,	55000,	'Daisy',	'2020-08-17',	'0',	18,	'2020-08-17 17:22:13',	'2020-08-17 19:55:03',	'Bs'),
(52,	37050000,	3705000,	'Yo - Benjamin Cordero',	'2020-08-17',	'0',	18,	'2020-08-17 18:57:35',	'2020-08-17 19:55:03',	'Bs'),
(54,	200000,	20000,	'Judith',	'2020-08-22',	'0',	20,	'2020-08-22 12:54:40',	'2020-09-02 00:09:15',	'Bs'),
(53,	1430000,	143000,	'Mamá',	'2020-08-22',	'0',	20,	'2020-08-22 12:52:14',	'2020-09-02 00:09:15',	'Bs'),
(55,	610000,	61000,	'Daisy',	'2020-08-23',	'0',	20,	'2020-08-23 14:03:05',	'2020-09-02 00:09:16',	'Bs'),
(56,	14000000,	1400000,	'Yo - Benjamin Cordero',	'2020-08-28',	'0',	20,	'2020-08-28 01:41:34',	'2020-09-02 00:09:16',	'Bs'),
(57,	200000,	20000,	'Migdaly',	'2020-08-28',	'0',	20,	'2020-08-28 01:42:40',	'2020-09-02 00:09:16',	'Bs'),
(58,	1000000,	100000,	'Carmen',	'2020-08-29',	'0',	20,	'2020-08-29 22:00:19',	'2020-09-02 00:09:16',	'Bs'),
(59,	58800000,	5880000,	'Yo - Benjamin Cordero',	'2020-09-01',	'0',	20,	'2020-09-01 14:05:19',	'2020-09-02 00:09:16',	'Bs'),
(60,	1880000,	188000,	'Mamá',	'2020-09-01',	'0',	20,	'2020-09-01 23:09:48',	'2020-09-02 00:09:16',	'Bs'),
(61,	20000,	2000,	'Julisbeth',	'2020-09-01',	'0',	20,	'2020-09-01 23:10:03',	'2020-09-02 00:09:16',	'Bs'),
(62,	651000,	65100,	'Daisy',	'2020-09-04',	'0',	21,	'2020-09-04 14:22:00',	'2020-09-16 19:41:07',	'Bs'),
(63,	170000,	17000,	'Migdaly',	'2020-09-12',	'0',	21,	'2020-09-12 01:13:42',	'2020-09-16 19:41:07',	'Bs'),
(64,	155650000,	15565000,	'Yo - Benjamin Cordero',	'2020-09-15',	'0',	21,	'2020-09-15 19:38:19',	'2020-09-16 19:41:07',	'Bs'),
(65,	1828000,	182800,	'Mamá',	'2020-09-16',	'0',	21,	'2020-09-16 19:38:42',	'2020-09-16 19:41:07',	'Bs'),
(66,	60000,	6000,	'judith',	'2020-09-16',	'0',	21,	'2020-09-16 19:38:53',	'2020-09-16 19:41:07',	'Bs'),
(69,	300000,	30000,	'Migdaly',	'2020-09-21',	'0',	23,	'2020-09-21 00:14:25',	'2020-10-05 20:29:17',	'Bs'),
(67,	874000,	87400,	'Daisy',	'2020-09-17',	'0',	23,	'2020-09-17 00:09:30',	'2020-10-05 20:29:17',	'Bs'),
(68,	500000,	50000,	'Judith',	'2020-09-21',	'0',	23,	'2020-09-21 00:14:08',	'2020-10-05 20:29:17',	'Bs'),
(70,	440000,	44000,	'Daisy',	'2020-09-21',	'0',	23,	'2020-09-21 14:29:16',	'2020-10-05 20:29:17',	'Bs'),
(71,	100000,	10000,	'Migdaly',	'2020-09-29',	'0',	23,	'2020-09-29 00:12:24',	'2020-10-05 20:29:17',	'Bs'),
(72,	2100000,	210000,	'Mama',	'2020-10-02',	'0',	23,	'2020-10-02 20:27:47',	'2020-10-05 20:29:17',	'Bs'),
(73,	90000,	9000,	'Judith',	'2020-10-03',	'0',	23,	'2020-10-03 00:14:15',	'2020-10-05 20:29:17',	'Bs'),
(74,	500000,	50000,	'Daisy',	'2020-10-03',	'0',	23,	'2020-10-03 00:17:50',	'2020-10-05 20:29:18',	'Bs'),
(77,	2275000,	227500,	'Claudio',	'2020-10-12',	'0',	26,	'2020-10-12 19:35:22',	'2020-10-17 13:39:02',	'Bs'),
(75,	910000,	91000,	'Migdaly',	'2020-10-12',	'0',	26,	'2020-10-12 19:35:00',	'2020-10-17 13:39:02',	'Bs'),
(78,	3400000,	340000,	'Mama y Judith',	'2020-10-17',	'0',	26,	'2020-10-17 01:46:16',	'2020-10-17 13:39:02',	'Bs'),
(79,	192500000,	19250000,	'Yo - Benjamin Cordero',	'2020-10-17',	'0',	26,	'2020-10-17 13:31:47',	'2020-10-17 13:39:02',	'Bs'),
(76,	4550000,	455000,	'Rosy',	'2020-10-12',	'0',	26,	'2020-10-12 19:35:13',	'2020-10-17 13:39:02',	'Bs');





