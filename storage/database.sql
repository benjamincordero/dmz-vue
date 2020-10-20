SELECT SETVAL('types_id_seq', (SELECT MAX(id) + 1 FROM types));
SELECT SETVAL('users_id_seq', (SELECT MAX(id) + 1 FROM users));
SELECT SETVAL('transfers_id_seq', (SELECT MAX(id) + 1 FROM transfers));
SELECT SETVAL('offerings_id_seq', (SELECT MAX(id) + 1 FROM offerings));
SELECT SETVAL('tithes_id_seq', (SELECT MAX(id) + 1 FROM tithes));
