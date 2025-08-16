CREATE DATABASE IF NOT EXISTS cards_test;
USE cards_test;

CREATE TABLE if NOT EXISTS card_data (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  type VARCHAR(255),
  brand VARCHAR(255),
  number VARCHAR(255),
  date VARCHAR(255),
  name VARCHAR(255),
  CVV VARCHAR(255),
  pin VARCHAR(255)
);

use cards_test;

#GRANT ALL PRIVILEGES ON cards_test TO 'cards_test'@'localhost' IDENTIFIED BY 'password';

INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4415 1715 1869 9236', '01/2030', 'Francie Didamo', '442', '9563');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'AMERICAN EXPRESS', '3783 028947 49369', '09/2030', 'Federico Wallin', '5533', '1711');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6284 0610 4814 5961', '10/2028', 'Elvina Palifka', '879', '1903');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 3007 2973 7795', '03/2026', 'Ileen Jerrel', '---', '2748');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2451 7415 7532 2275', '05/2025', 'Ida Tanigawa', '123', '1638');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 0944 3078 8456', '10/2026', 'Audry Burdin', '132', '4776');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 1581 4959 1675', '04/2025', 'Latonya Kranawetter', '---', '7546');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'AMERICAN EXPRESS', '3735 301447 05493', '10/2028', 'Julieann Bachta', '8590', '1723');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2533 1499 1785 1799', '06/2025', 'Mel Pennywell', '289', '4192');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2203 3564 2387 9052', '12/2024', 'Maurita Maclauchlan', '827', '2996');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 5431 7247 6847', '09/2025', 'Tawanna Gruhlke', '---', '4459');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'AMERICAN EXPRESS', '3719 611424 84660', '01/2025', 'Katheleen Reidherd', '9781', '7195');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3038 3001 1056 7959', '07/2030', 'Autumn Gravely', '171', '1246');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 5681 5398 4098', '06/2025', 'Delsie Creekmur', '680', '8809');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4595 9458 5458 1005', '11/2030', 'Pierre Morocco', '264', '7067');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6259 2350 7264 9608', '09/2026', 'Vada Walkner', '674', '1162');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4128 9751 9604 5332', '12/2030', 'Rudolf Ariel', '238', '1568');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2645 7926 8220 8813', '09/2026', 'Kym Crest', '945', '2296');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 1782 3931 1750', '03/2026', 'Ying Gimse', '---', '9743');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2204 7489 6485 0311', '03/2030', 'Lilli Kawamura', '271', '2233');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6200 7105 1733 5534', '07/2026', 'Hang Therrien', '982', '5923');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3946 6949 8526 9324', '10/2025', 'Lauralee Timpone', '146', '8773');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6304 8832 5732 0837', '10/2024', 'Tiana Castellonese', '764', '1876');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3745 684257 91443', '09/2030', 'Kaitlin Sabot', '5335', '6823');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 7681 4900 7570', '07/2026', 'Lauren Rivelli', '156', '2832');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 9082 3651 4117', '04/2026', 'Renda Migliaccio', '---', '2132');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3581 5981 2725 2413', '09/2024', 'Emerald Weissler', '778', '1193');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3046 0201 9767 6107', '12/2030', 'Pearly Alva', '913', '8760');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'AMERICAN EXPRESS', '3754 989266 29307', '01/2030', 'Ted Currie', '2228', '2633');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3581 6719 5271 6131', '02/2025', 'Linn Bueggens', '502', '6184');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 8560 9138 2346', '11/2031', 'Ghislaine Rudie', '---', '6372');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3536 7799 3443 1434', '10/2026', 'Quincy Conales', '319', '2726');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2203 3231 6059 5648', '07/2029', 'Alpha Bud', '462', '4472');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DISCOVER', '6011 1259 9975 2305', '09/2028', 'Mao Tua', '612', '8229');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6767 7447 1437 5758', '09/2024', 'Fransisca Ivanov', '498', '1415');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 8053 4075 0613', '09/2024', 'Arianna Twymon', '---', '1070');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6304 5578 6067 2418', '05/2026', 'Nia Lucht', '673', '7109');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6767 7485 8773 4694', '08/2029', 'Marcela Stratford', '766', '8052');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5038 4275 0372 9311', '02/2030', 'Leonore Griffen', '148', '5447');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 8957 2832 0896', '02/2026', 'Kristine Jesus', '---', '6824');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6257 1492 2911 9138', '11/2024', 'Sindy Duenes', '305', '3788');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'AMERICAN EXPRESS', '3726 937020 19680', '09/2028', 'Maybelle Gabrial', '7353', '9982');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'AMERICAN EXPRESS', '3759 279008 61981', '07/2029', 'Fredda Ruuska', '6806', '1456');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3857 5616 1343 5683', '11/2024', 'Odilia Craib', '325', '9689');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 3300 4108 7386', '04/2025', 'Chantel Margaitis', '---', '3996');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3583 2298 8512 1651', '03/2031', 'Aide Rattigan', '670', '3981');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4153 5519 0496 9036', '08/2024', 'Sylvie Seel', '598', '5653');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 3000 8020 2066', '04/2027', 'Amina Vasil', '---', '6953');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6468 3462 5613 7125', '11/2031', 'Christopher Howse', '743', '9453');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6467 1551 0445 7697', '01/2029', 'Chase Guagenti', '682', '7001');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 1381 1334 8490', '06/2025', 'Shona Scheman', '201', '9123');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 0832 2620 3903', '10/2024', 'Gay Hickle', '541', '9177');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3732 596058 11794', '02/2028', 'Jeanmarie Po', '7636', '8859');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4955 0717 9525 5882', '01/2025', 'Shelby Cobert', '571', '2707');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'AMERICAN EXPRESS', '3799 464800 93449', '08/2028', 'Bennie Gorham', '2376', '3365');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3416 755220 85585', '10/2026', 'Annette Quidley', '6332', '6067');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6264 7060 1837 7192', '03/2028', 'Dayle Martie', '750', '6208');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2203 7784 0607 4262', '05/2027', 'Margurite Provence', '463', '3515');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 8339 8193 6751', '12/2029', 'Josephine Burbank', '---', '7882');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4388 3543 0173 3064', '04/2028', 'Jayme Genetti', '858', '3584');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6291 4124 8104 6193', '10/2027', 'Bridgette Ponti', '794', '7118');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 4545 3614 6217', '06/2025', 'Hong Kirven', '154', '5426');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3473 005028 35867', '06/2028', 'Numbers Laun', '6268', '7736');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 4007 8619 8333', '04/2029', 'Maryann Derastel', '145', '4067');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4723 8129 4924 4715', '04/2027', 'Alix Peiper', '402', '4201');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6480 1309 9202 3532', '05/2031', 'Julietta Simpler', '565', '4034');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 6570 7598 4000', '10/2027', 'Louis Dabbs', '256', '6593');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 2637 1167 7033', '05/2031', 'Emelda Blatherwick', '---', '9843');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 7169 8716 2616', '10/2026', 'Elinore Meras', '361', '8740');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6262 7253 8576 5765', '06/2025', 'Terrell Chanin', '803', '3173');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6480 9278 9517 1189', '08/2031', 'Latia Otteson', '470', '1844');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 5594 5021 8329', '02/2028', 'Gino Dupriest', '184', '7406');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6296 8750 4247 3210', '08/2025', 'Shameka Schmuck', '366', '9513');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 0422 7945 5879', '07/2031', 'Evelynn Beaufort', '---', '2691');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6203 0907 7538 3485', '01/2025', 'Ruthie Weigel', '368', '3634');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6215 6842 4359 5823', '08/2029', 'Tashina Campolo', '701', '8080');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6499 7424 9386 3312', '12/2031', 'Harvey Daquino', '809', '7880');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3532 0348 0929 1743', '11/2024', 'Abe Burks', '250', '2901');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 3622 9095 0031', '04/2028', 'Clarence Vipond', '908', '9469');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 6384 2520 1958', '09/2028', 'Carmel Schwaller', '---', '1899');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2201 4078 9287 1849', '10/2027', 'Thresa Valletta', '572', '8392');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 2774 4371 2389', '08/2025', 'Myrle Marcin', '---', '9609');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5893 4142 5378 1514', '04/2027', 'Adell Vind', '199', '7417');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2320 0944 4265 6247', '01/2030', 'Kacie Belen', '872', '3316');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3774 567999 54507', '02/2031', 'Colin Lynge', '2363', '5214');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 7282 6616 5519', '03/2025', 'Val Roundabush', '---', '4886');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3044 8424 0316 3428', '06/2030', 'Breana Stroup', '612', '5248');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6763 6363 1069 5171', '04/2026', 'Tammie Mcteer', '410', '5203');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6448 6105 9909 1959', '05/2025', 'Merrill Doker', '695', '4230');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 9617 1977 7552', '04/2026', 'Tomi Rassman', '---', '3336');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6759 8863 1839 2380', '11/2025', 'Alonso Rieber', '425', '8777');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4541 5165 7328 9223', '08/2025', 'Stasia Alcide', '888', '2408');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3744 750780 21039', '09/2031', 'Alverta Schoborg', '5464', '2366');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5893 6232 6481 9945', '05/2031', 'Shanice Baumgarten', '621', '6580');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3010 3547 5128 7957', '05/2027', 'Rosalina Tugman', '549', '5462');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4499 5854 3556 4687', '04/2028', 'Cindi Geagan', '633', '2755');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6257 0158 8813 0544', '12/2029', 'Nida Winnie', '661', '2394');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4356 4904 4321 6457', '09/2027', 'Traci Kazunas', '741', '2709');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2200 2194 3313 1406', '08/2028', 'Candice Bedgood', '958', '4983');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4617 2073 9709 8540', '02/2026', 'Raisa Gleckler', '668', '6664');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 0501 2973 4564', '10/2029', 'Emery Sankoff', '---', '9657');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4661 4164 8747 5832', '08/2024', 'Mose Paullin', '155', '8940');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 7750 1259 2121', '11/2029', 'Kimiko Unch', '---', '1115');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3576 1075 2788 0034', '11/2024', 'Leigh Kost', '753', '2105');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 5967 5625 7935', '03/2027', 'Ellie Avolio', '123', '1892');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4544 0477 9261 2562', '08/2031', 'Shayla Dehan', '288', '3449');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3541 2492 9573 7939', '10/2028', 'Charline Rainville', '435', '5513');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 0474 2252 9122', '12/2027', 'Marnie Rementer', '421', '1031');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2200 5363 2837 4092', '11/2025', 'Jeromy Clary', '834', '5139');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 7188 6887 1573', '12/2028', 'Margaret Karnath', '947', '2946');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2201 3412 1270 0869', '03/2030', 'Sandy Hodnicki', '868', '8210');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2280 1970 7954 8120', '04/2029', 'Scottie Feret', '852', '5773');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6256 8184 9686 3450', '11/2025', 'Palmira Valle', '799', '4404');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6761 5568 5246 3998', '09/2024', 'Dusty Haberern', '926', '4680');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 5500 1298 6080', '02/2029', 'Luella Hannam', '---', '9952');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2201 5707 4841 8709', '09/2031', 'Julie Wank', '890', '4529');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2200 8898 1121 3099', '03/2027', 'Camie Vee', '858', '4218');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3532 0891 1701 6802', '11/2028', 'Edmundo Tojo', '981', '5113');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2200 3623 1982 0914', '01/2027', 'Jovan Sylve', '361', '2028');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 2244 5934 5424', '07/2027', 'Juliette Stephans', '519', '1711');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 8583 4978 4950', '01/2026', 'Georgie Vetter', '---', '4532');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3465 822879 84082', '10/2024', 'Orval Pappas', '3788', '5201');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 1020 6227 8065', '01/2030', 'Cortez Calway', '---', '5621');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3847 9190 2015 2007', '12/2024', 'Julia Linker', '277', '4333');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 9260 3286 1442', '11/2028', 'Hermina Frutos', '233', '8029');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2201 0621 7615 5821', '11/2030', 'Vena Claffey', '153', '6596');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3550 5305 1038 1639', '01/2026', 'Melynda Lueth', '681', '6134');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'AMERICAN EXPRESS', '3761 597859 67084', '02/2028', 'Laura Wichern', '7028', '8627');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5020 0337 3078 9456', '08/2028', 'Bettye Englebert', '521', '3986');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 3357 1437 6677', '05/2030', 'Ezra Bow', '---', '3925');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 2328 3570 6017', '04/2031', 'Georgetta Tabarez', '---', '1436');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5038 2453 4310 8664', '02/2028', 'Sonny Creselious', '447', '2576');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3095 9304 4397 3621', '12/2026', 'Emely Buchannan', '210', '5203');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3095 7642 2695 5764', '05/2031', 'Julian Burgamy', '194', '2994');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 1557 6953 6904', '07/2030', 'Luciano Waltermire', '---', '9625');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3535 2817 0771 3693', '11/2024', 'Werner Deaner', '917', '8667');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3586 9606 0330 6367', '01/2031', 'Bree Pitfield', '886', '6278');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3842 4506 1976 1805', '12/2029', 'Chana Dannelly', '546', '6752');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6256 7321 9031 2740', '01/2027', 'Blanche Folks', '112', '4240');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2203 8036 8645 8033', '04/2027', 'Khalilah Capello', '191', '9162');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3414 733263 21178', '08/2026', 'Lila Meager', '2196', '3911');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3095 5645 8379 3869', '05/2031', 'Gregorio Marrs', '372', '7635');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3571 1982 7464 3365', '07/2029', 'Valeria Martincic', '929', '7154');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4868 3516 4326 8196', '04/2028', 'Kyoko Jasperse', '776', '6305');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 7756 5808 0806', '11/2031', 'Judson Charif', '---', '5243');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3001 7150 3936 4670', '02/2026', 'Susanna Lutkins', '283', '3149');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 3527 7076 0224', '05/2027', 'Alana Nuessle', '898', '9424');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 0122 1799 4686', '03/2027', 'Elodia Obstfeld', '813', '6652');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3578 6910 2986 9619', '02/2026', 'Chante Yamaki', '922', '4114');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2491 1842 9023 0261', '04/2029', 'Eryn Dancer', '469', '2029');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 2060 0638 6601', '12/2030', 'Daysi Santoriella', '---', '1812');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3929 5199 3496 4843', '11/2031', 'Johnetta Dorval', '551', '4926');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 2625 2721 7460', '02/2029', 'Clark Schehl', '---', '9367');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 6631 1367 6098', '10/2027', 'Isabell Ewton', '558', '6233');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4757 0525 0016 6614', '12/2025', 'Valerie Shivel', '424', '6504');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 1300 6561 5257', '07/2029', 'Rickey Baumhoer', '161', '4447');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2203 5325 7092 2420', '02/2028', 'Delicia Turi', '259', '2987');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2201 6230 1245 8990', '02/2030', 'Alexis Mascorro', '767', '3407');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3487 599648 66885', '09/2028', 'Paola Woitowitz', '8230', '5422');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 2095 3053 6199', '03/2028', 'Charis Flatley', '---', '6068');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 8451 1262 1185', '11/2027', 'Don Decandia', '---', '9503');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6247 2985 7200 9413', '04/2029', 'Kasi Bellizzi', '547', '5747');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2250 4229 4495 4535', '12/2025', 'Deeann Probert', '728', '1348');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3566 1612 3702 1159', '07/2025', 'Tenisha Lipka', '414', '7415');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2648 4159 9107 8944', '03/2027', 'Shantae Berstler', '130', '8576');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6480 0926 8760 1693', '02/2031', 'Tommie Rash', '827', '9572');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4870 1482 8800 1924', '06/2026', 'Twana Hamel', '608', '8683');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2202 7592 6729 8019', '04/2027', 'Henriette Flatley', '909', '3087');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3684 0915 5631 7333', '07/2030', 'Gay Gregas', '461', '5016');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3021 3781 1218 7645', '03/2025', 'Marcene Murph', '278', '9437');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 7762 6901 9438', '09/2027', 'Britteny Mas', '---', '6947');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6462 6672 9413 3263', '11/2030', 'Greta Kreisher', '687', '8529');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2553 1423 3117 1980', '05/2027', 'Cornell Kesselring', '405', '8219');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3549 2973 4751 6076', '05/2028', 'Teresa Maniscalco', '450', '4022');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 9244 8339 3593', '07/2027', 'Rosana Hail', '580', '8988');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3490 461723 31699', '10/2030', 'Caroyln Montross', '3830', '8033');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3588 9141 8187 2991', '01/2026', 'Flossie Ramelli', '538', '2071');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3017 1219 1893 6922', '01/2031', 'William Jose', '422', '8038');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 6359 0236 9522', '04/2029', 'Yuki Bubar', '---', '1445');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6217 6976 5122 8800', '08/2031', 'Micheal Samaan', '676', '9731');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4695 9645 4821 4666', '06/2030', 'Ira Jolina', '358', '4583');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 7058 4968 3166', '06/2025', 'Jessenia Schauf', '677', '2138');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 3252 2268 3748', '01/2029', 'Theodora Gilles', '---', '2162');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 2126 6700 9949', '04/2027', 'Lashawn Decapua', '---', '8298');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 3957 8783 5728', '02/2026', 'Willie Avino', '---', '4090');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 1023 4995 5980', '06/2028', 'Deetta Bens', '---', '2476');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2596 6445 2196 6417', '04/2030', 'Pinkie Kawski', '778', '6210');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3530 5275 0156 9946', '09/2027', 'Ciara Gasaway', '719', '4807');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3456 311381 67701', '09/2024', 'Dina Callari', '8968', '5582');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2203 8400 9140 5217', '11/2030', 'Kasandra Mastronardi', '866', '3989');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3944 6650 9419 1031', '09/2024', 'Kori Eby', '975', '6780');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3530 0903 5714 2938', '08/2031', 'Marquita Jesko', '900', '2547');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2201 2834 4325 2155', '10/2031', 'Nakia Berger', '928', '9595');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2201 5400 9033 5439', '12/2030', 'Benny Barfoot', '253', '5483');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5038 6577 3262 1596', '11/2027', 'Miguelina Dine', '948', '1328');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6011 9479 6836 3545', '09/2024', 'Tifany Frederick', '482', '8782');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'AMERICAN EXPRESS', '3720 173164 09535', '05/2028', 'Armando Mazique', '5426', '5635');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3488 131622 61694', '09/2030', 'Carlene Brodigan', '8639', '9722');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6514 9739 6971 6608', '05/2028', 'Terrilyn Estis', '542', '4856');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 3380 0598 5670', '11/2024', 'Tam Ohair', '---', '2409');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'AMERICAN EXPRESS', '3715 215144 95213', '10/2030', 'Romelia Huish', '5830', '2905');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5020 9163 4109 1348', '09/2026', 'Yasmine Lenarz', '347', '5408');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2243 8766 2510 9323', '08/2024', 'Diann Petrowski', '178', '7823');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 2853 6170 9774', '07/2029', 'Mandie Merrbach', '---', '8777');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2403 8921 0196 4897', '12/2029', 'Oma Ravelo', '504', '9918');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6230 2771 8354 2995', '12/2025', 'Tinisha Sarraga', '776', '1174');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2200 2332 4261 0476', '01/2025', 'Adria Eddlemon', '413', '9067');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3481 193590 31373', '11/2031', 'Darci Darakjy', '8525', '7974');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 9872 1894 7203', '09/2025', 'Nanci Okada', '---', '9454');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4084 7295 8782 1690', '11/2029', 'Loyd Alverio', '836', '7978');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2204 9538 1028 9389', '09/2028', 'Ron Harver', '984', '8760');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3586 4264 1096 1042', '08/2028', 'Patrick Zuno', '863', '8970');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4467 8531 2641 4689', '07/2028', 'Norene Zepp', '429', '1191');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6229 4135 5189 2034', '06/2026', 'Elwood Sung', '857', '4062');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3016 3214 0098 7570', '03/2026', 'Delois Ny', '168', '8502');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3558 3058 8519 4517', '10/2024', 'Micki Greenhalge', '546', '2948');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2201 7507 5369 6791', '05/2027', 'Claribel Fleegle', '740', '4804');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 5832 7271 4127', '07/2026', 'Orlando Boody', '---', '4768');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6767 7044 1497 8657', '12/2030', 'Autumn Blose', '476', '5516');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6761 7312 1492 3076', '10/2025', 'Danika Ike', '687', '3131');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 8401 6636 9898', '12/2025', 'Jetta Lacayo', '---', '1878');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 2412 0062 3780', '09/2031', 'Sonya Knepper', '---', '1223');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6242 9724 1261 1506', '05/2031', 'Zulma Rakestrow', '479', '2132');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2200 1246 0101 8031', '08/2027', 'Claude Washor', '914', '6378');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3801 1188 9769 8242', '05/2031', 'Han Lindinha', '892', '3945');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 4947 8306 8955', '06/2030', 'Willis Ramento', '---', '7178');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 5885 5935 1417', '12/2026', 'Augustina Pagley', '---', '5629');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6447 5771 6018 0274', '05/2027', 'Evia Goyne', '630', '4914');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 6873 8858 6798', '11/2029', 'Anglea Swoyer', '---', '3412');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 7767 0236 3378', '08/2029', 'Virgina Bigwood', '396', '8586');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 7280 2937 2368', '03/2031', 'Shalon Shorr', '572', '1699');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3449 780566 84956', '02/2027', 'Kizzie Simitian', '7615', '9100');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 0722 8560 0470', '10/2028', 'Darleen Luelf', '---', '8142');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5020 6657 1073 1840', '10/2024', 'Min Roettgen', '582', '1937');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6011 0018 8687 5774', '08/2026', 'Leonard Sasao', '270', '5026');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 9509 5222 7318', '07/2027', 'Ted Allocco', '---', '9326');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3442 981609 64347', '09/2029', 'Micaela Herrington', '8453', '6948');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 2585 3499 3691', '11/2027', 'Mable Schweiner', '994', '8094');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4043 9158 5840 6275', '02/2030', 'Marti Kusch', '449', '4281');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 2890 9125 5121', '10/2024', 'Twanda Twiss', '---', '4038');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4576 5866 5436 8830', '01/2028', 'Vicky Pacquin', '310', '9141');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2203 6725 4255 5435', '12/2024', 'Tambra Simenson', '321', '9886');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2488 8113 6901 8293', '10/2029', 'Maida Pausch', '389', '3620');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3574 0219 7502 2100', '07/2027', 'Sharice Schaap', '776', '6700');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2601 6532 9714 8046', '09/2025', 'Francene Stolarski', '484', '7442');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2204 5430 4924 7629', '03/2031', 'Marcelene Datwyler', '907', '4965');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 3931 1460 2310', '09/2031', 'Maire Cipriano', '---', '5142');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4499 3114 5165 9891', '10/2024', 'Leanna Minerva', '954', '3576');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3095 2908 2487 5725', '03/2025', 'Delphine Contois', '818', '9729');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3419 599729 68460', '11/2029', 'Jarod Gohr', '9871', '4109');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4268 4406 1959 3103', '09/2027', 'Lenny Gosvener', '387', '8400');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 4458 4615 5418', '03/2025', 'Cyndi Lutgen', '---', '2225');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3570 5809 5487 9750', '07/2026', 'Lindy Allebach', '797', '3019');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5020 9300 7503 4887', '10/2029', 'Jimmie Benitone', '292', '5244');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 5000 3208 3111', '08/2024', 'Irina Semans', '---', '8785');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6232 2495 2660 4632', '08/2029', 'Simonne Chauffe', '567', '8992');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3001 2146 7762 5956', '06/2026', 'Steven Empson', '647', '3826');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3755 398400 36143', '10/2024', 'Deloise Golba', '9596', '3847');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6483 5818 9011 4087', '12/2024', 'Kaitlin Lapatra', '504', '4682');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6761 9654 1839 9259', '09/2025', 'Samira Chier', '273', '7704');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4482 1241 4987 0989', '10/2024', 'Kaylee Espadas', '126', '5141');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5018 2017 6416 2411', '01/2026', 'Pansy Winrow', '277', '2780');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 5481 1006 2416', '05/2031', 'Sammie Digangi', '---', '5272');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4147 7926 3663 2596', '02/2027', 'Rusty Kramm', '589', '8104');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6262 0534 3410 4773', '11/2029', 'Jessi Benthall', '319', '6338');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3420 751932 87181', '02/2028', 'Jone Majmundar', '5397', '5958');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3416 947426 52611', '08/2030', 'Glayds Lese', '9800', '7005');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 2278 1927 5774', '11/2029', 'Tabetha Labay', '131', '8121');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3538 3213 9657 0827', '08/2025', 'Mabel Amigo', '153', '1911');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3044 1571 4574 6038', '06/2030', 'Waneta Devinney', '133', '6612');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 0854 3209 2816', '02/2025', 'Darell Main', '---', '6401');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6220 8857 6679 4890', '03/2029', 'Kia Draghi', '881', '9031');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 5124 3727 4245', '08/2024', 'Avelina Mirando', '---', '7440');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 0605 7901 9614', '03/2026', 'Keiko Berlingeri', '---', '6957');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3003 6251 0803 8436', '09/2029', 'Gearldine Tobias', '509', '1745');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3543 6949 3817 5245', '09/2024', 'Napoleon Schiermeier', '661', '9383');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 0406 5649 5952', '04/2029', 'Elanor Dufner', '---', '6640');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5038 0187 1137 1051', '12/2025', 'Glennie Bargo', '874', '7083');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4610 5042 2627 2768', '10/2024', 'Jutta Boyden', '670', '4139');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6256 9617 9582 8020', '09/2029', 'Micki Blanchett', '343', '7888');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6446 8547 9260 2772', '09/2028', 'Paulina Kilday', '164', '4444');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 2682 5737 1462', '03/2031', 'Mitchel Klos', '427', '7069');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 0960 2464 6688', '11/2031', 'Ying Boatwright', '286', '9204');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 9489 2576 9158', '02/2025', 'Nicholle Hecox', '408', '3844');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DISCOVER', '6011 5598 5568 2612', '03/2030', 'Georgiana Sauveur', '395', '5200');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6207 9131 5205 8790', '11/2026', 'Justin Macrae', '454', '2687');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4421 7670 0065 4530', '05/2031', 'Kylee Seiley', '947', '3580');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3030 0631 5079 0117', '09/2031', 'Lorinda Palamara', '513', '5462');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3459 720282 93144', '11/2024', 'Fidelia Nasif', '8442', '2247');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6484 1591 7899 9021', '08/2024', 'Tayna Sprang', '716', '7295');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 8272 1437 2108', '02/2028', 'Tyler Langston', '656', '2626');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2202 0311 5180 5485', '02/2027', 'Napoleon Jach', '538', '5919');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5018 5428 9824 6269', '11/2029', 'Elden Randahl', '519', '2191');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3048 2414 6536 9336', '07/2026', 'Lakisha Coffland', '640', '2593');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6257 7903 0127 9702', '05/2025', 'Venus Partee', '319', '8027');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2202 9078 4985 7865', '09/2024', 'Johnetta Bortner', '506', '9310');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2281 0298 6676 0452', '12/2028', 'Dorie Gabak', '666', '6435');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3589 9655 4372 7025', '06/2031', 'Russel Bluitt', '413', '5548');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3532 8316 4427 2345', '05/2027', 'Rebbeca Osmun', '504', '5070');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3095 3967 2396 3171', '12/2025', 'Jasmine Detter', '218', '9586');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2202 4509 4755 9067', '06/2025', 'Era Frayne', '741', '1582');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4783 8181 7897 5462', '10/2031', 'Yvone Mccoun', '439', '5414');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3010 0511 7802 8184', '02/2026', 'Monserrate Newhouse', '212', '3145');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2201 9692 5870 6794', '01/2031', 'Andrew Lariccia', '733', '8125');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'JCB', '3567 1083 4255 1736', '04/2031', 'Zack Kujat', '726', '6829');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 7246 6852 7452', '08/2024', 'Rosia Spennicchia', '---', '7445');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3566 6604 6428 7789', '01/2025', 'Jackson Gombos', '603', '9713');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3531 0207 1874 2349', '09/2024', 'Brittanie Outler', '190', '8918');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3709 134229 41597', '01/2030', 'Jill Breckenstein', '3186', '3618');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6270 8713 1590 2365', '10/2029', 'Dion Nogueda', '258', '8867');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6762 3638 7991 7331', '10/2025', 'Candy Zylstra', '350', '4111');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4422 1020 9931 5828', '05/2030', 'Cassondra Rollyson', '570', '7261');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2672 9587 9888 1654', '08/2029', 'Coletta Mainella', '366', '9826');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 4739 4986 4441', '02/2029', 'Denver Caouette', '921', '2490');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2201 2235 7238 8743', '05/2028', 'Adrienne Bloomstrand', '283', '3933');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4906 4901 8943 7585', '09/2024', 'Elvis Muysenberg', '238', '4972');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3585 8725 8301 1985', '11/2027', 'Bernadette Genous', '198', '1718');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6496 1970 7381 2697', '09/2025', 'Cordell Tizon', '834', '7854');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 1015 5630 7570', '11/2027', 'Matilda Sueda', '---', '2464');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 7992 6632 6952', '07/2029', 'Layla Shifman', '---', '2664');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 0668 3966 9563', '06/2029', 'Aida Laher', '306', '9861');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6499 5322 6859 8759', '04/2026', 'Jewell Pomerleau', '167', '5827');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3542 3715 9754 3887', '12/2026', 'Tracey Mcmahon', '331', '5989');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3562 8897 5004 4505', '09/2030', 'Mirtha Abdou', '839', '5437');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3694 9960 4379 8853', '09/2024', 'Ozella Sibilia', '661', '4377');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3495 313483 35625', '04/2027', 'Ernestine Sallach', '4435', '3172');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 0968 3285 1583', '07/2030', 'Domonique Mihalick', '---', '4033');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6759 2489 9111 3742', '12/2028', 'Criselda Godshall', '387', '9958');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3415 178674 81575', '04/2031', 'Elliott Wigginton', '7649', '6074');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6274 8315 1964 3005', '05/2026', 'Julietta Efird', '521', '3618');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'JCB', '3563 1726 7686 4937', '11/2029', 'Hayden Warrior', '989', '2082');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6219 2797 2178 7780', '04/2030', 'Edda Schmahl', '994', '7521');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4632 4811 2735 7358', '03/2029', 'Letisha Basset', '836', '8178');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2671 8560 0930 2216', '12/2029', 'Bertha Morante', '878', '8519');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 1664 9785 3688', '04/2030', 'Adele Reader', '---', '2015');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3553 6128 2544 9678', '12/2030', 'Miguelina Leibold', '820', '2716');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6762 9135 3486 9622', '01/2028', 'Brooks Strub', '592', '9801');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6490 4393 5244 0303', '04/2030', 'Jamar Nigh', '847', '1284');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 3722 5469 1150', '05/2026', 'Eulalia Rublee', '---', '2341');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6767 7068 5592 3449', '09/2024', 'Tomeka Drzewicki', '750', '2794');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2201 3768 9539 6791', '10/2025', 'Kelly Jumper', '743', '8624');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 0041 5550 3823', '09/2024', 'Kandy Elmes', '---', '7191');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6246 7933 7029 2360', '11/2030', 'Clinton Bush', '672', '1647');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4886 2290 3752 4390', '09/2027', 'Usha Brocato', '703', '5167');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6759 0643 6177 8570', '02/2026', 'Denita Burt', '839', '1041');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6232 2307 7139 7650', '03/2027', 'Aiko Alvin', '630', '3742');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6440 4574 1924 0970', '11/2025', 'Christa Bisignano', '155', '4439');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 9972 1200 0803', '11/2028', 'Dorathy Mattoon', '---', '8381');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'JCB', '3540 1419 3954 3180', '10/2024', 'Nilsa Johar', '842', '7760');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6256 6072 5218 7182', '12/2031', 'Marivel Manire', '613', '1639');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6234 5864 3179 2301', '12/2027', 'Wilhelmina Bergfalk', '291', '1326');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5018 8792 9181 3752', '12/2030', 'Maryland Menas', '530', '5085');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5018 3850 6176 7046', '04/2025', 'Marshall Melnyk', '773', '6245');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 1338 9439 5169', '10/2031', 'Aubrey Lahr', '377', '3976');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6761 6251 0116 5058', '06/2028', 'Minta Howie', '309', '8308');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 9334 7676 9213', '04/2030', 'Donald Salfelder', '---', '4032');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3538 4578 3023 6151', '07/2030', 'Milagros Hineline', '566', '8709');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 7336 6672 0846', '11/2030', 'Tiffany Toothill', '260', '6742');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6762 1129 3152 6592', '05/2026', 'Carolynn Pacini', '102', '8625');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4206 1144 0106 2230', '01/2029', 'Kimiko Budhu', '905', '7670');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6271 2981 7271 0815', '02/2025', 'Marylouise Clennon', '288', '7955');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3478 545589 28091', '09/2029', 'Adrian Hiester', '1965', '1464');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 6792 1815 0173', '05/2027', 'Tracey Frederique', '---', '9544');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3966 6089 6686 6184', '01/2030', 'Tonette Margulis', '739', '7197');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4412 5464 2880 6802', '04/2026', 'Ira Calco', '292', '4507');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2202 6521 2637 0576', '08/2024', 'Jesica Turnbow', '964', '4366');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6482 1059 0268 5149', '05/2029', 'Sunny Raymundo', '288', '1885');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5020 9994 7630 5287', '08/2029', 'Beverly Caplette', '825', '3347');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 9125 2734 6500', '09/2025', 'Lonnie Burford', '159', '5077');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 3713 7778 7926', '06/2027', 'Elaine Chamley', '---', '2325');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2587 4973 0860 4045', '05/2030', 'Mervin Goldhaber', '711', '5788');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 9704 2631 7313', '07/2027', 'Rhea Brannock', '---', '7725');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 2516 7443 8048', '02/2028', 'Doloris Guinane', '---', '7890');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4779 2292 0043 4898', '09/2026', 'Hai Swee', '722', '2070');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 5019 0623 9048', '01/2027', 'Caroll Neves', '---', '4804');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3561 1280 7524 3562', '11/2031', 'Elois Acre', '833', '9816');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 9507 2343 6439', '05/2028', 'Tawanda Weismiller', '378', '8796');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'AMERICAN EXPRESS', '3747 203610 12363', '01/2028', 'Sueann Hafer', '6648', '7988');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2203 1123 2000 8356', '08/2031', 'Lakeshia Nalley', '198', '7935');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'AMERICAN EXPRESS', '3765 858132 86776', '10/2031', 'Ashely Harren', '7884', '1746');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6281 4829 1261 3749', '12/2024', 'Chong Pochiba', '886', '9457');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4849 4422 6769 8141', '10/2027', 'Abigail Byam', '725', '5195');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 6256 3409 6923', '07/2025', 'Edmundo Grabow', '---', '8456');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 2080 2513 1828', '07/2029', 'Jaquelyn Shall', '---', '6453');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'UNIONPAY', '6282 1692 6582 8102', '10/2031', 'Stepanie Suhar', '215', '1041');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3490 896512 19407', '05/2030', 'Michell Lenzen', '8594', '8416');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5038 7819 3769 3893', '07/2029', 'Raymonde Tappen', '589', '4920');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3576 1186 4203 2435', '02/2031', 'Jeanie Swanteck', '907', '4330');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 8454 7923 6776', '07/2027', 'Mallie Cabriales', '594', '4222');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 5449 1044 5042', '12/2031', 'Justine Honer', '---', '3251');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6231 0685 4998 2838', '05/2030', 'Maisha Waltemath', '628', '2303');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2680 9341 2225 0585', '10/2024', 'Shavonda Horth', '114', '8913');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 9748 9634 0673', '02/2031', 'Jc Barrish', '108', '7526');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6467 6969 1016 9661', '08/2028', 'Ami Tjandra', '907', '2517');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 9828 6035 0608', '09/2027', 'Earle Cutty', '---', '4475');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DISCOVER', '6536 3788 6523 9685', '10/2028', 'Elene Zmijewski', '463', '7119');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 5031 8392 2503', '10/2031', 'Jayne Manila', '759', '4929');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6767 7015 6394 0876', '07/2027', 'Precious Hallauer', '594', '6406');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2641 6446 9642 9626', '01/2027', 'Latashia Bartenfield', '534', '4460');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 7323 0246 7559', '09/2024', 'Shirleen Durfey', '425', '3155');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2204 4680 7323 2919', '01/2028', 'Stacie Bonar', '321', '5165');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3054 3055 7820 7716', '06/2029', 'Linnea Dossey', '660', '3851');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6496 0071 8862 8716', '12/2029', 'Tatyana Humerick', '800', '4615');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2201 1812 5248 7575', '05/2031', 'Jerri Goldrup', '903', '9953');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 0097 9900 4610', '04/2026', 'Rocky Fest', '---', '2651');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3491 979316 21753', '02/2030', 'Shay Camic', '1741', '3701');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3568 6026 6094 2823', '10/2025', 'Riva Krinke', '407', '3516');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3464 737996 58655', '02/2028', 'Anette Gollogly', '4042', '5993');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6245 1555 2753 1358', '08/2024', 'Dena Katayama', '743', '6673');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3542 2332 6353 5367', '09/2028', 'Nenita Mocarski', '122', '5025');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3029 0186 3641 9866', '04/2027', 'Lesha Fetterman', '488', '6035');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6761 7118 7830 7147', '08/2024', 'Remedios Bilsborough', '271', '3157');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3530 0730 0569 4211', '11/2025', 'Ayesha Tonini', '124', '6830');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 1433 9923 8406', '07/2025', 'Patrice Hornoff', '---', '1873');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6762 7243 5352 1958', '10/2027', 'Retha Shindledecker', '398', '4132');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6496 0231 6135 1275', '07/2030', 'Hilma Dandridge', '746', '9613');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 3171 8947 0808', '01/2026', 'Karena Mantz', '---', '1939');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3703 586185 17985', '05/2029', 'Lakiesha Bach', '8213', '5663');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2202 1417 5627 2948', '12/2026', 'Corrie Bazzi', '609', '3558');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 2273 1093 9729', '08/2024', 'Mikel Pytko', '---', '7193');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6487 9420 0764 1410', '02/2029', 'Maureen Fiely', '271', '3967');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2619 4605 7963 3103', '03/2029', 'Amalia Parchment', '978', '1030');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 2430 5605 3495', '05/2030', 'Torrie Herb', '---', '9996');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3580 1385 8430 0628', '03/2031', 'Jaimie Huckleberry', '417', '8976');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3562 5018 6784 3196', '04/2025', 'Willene Mowris', '657', '4630');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '6304 0219 6102 4052', '09/2026', 'Gabrielle Clausen', '741', '1280');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'AMERICAN EXPRESS', '3748 981356 50799', '09/2024', 'Joseph Windfield', '4315', '7026');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2204 2501 1880 9665', '10/2029', 'Vida Dobbins', '670', '6180');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2603 6807 1089 5349', '10/2024', 'Miss Blair', '635', '6219');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4773 2014 2205 2028', '05/2027', 'Starr Giannelli', '855', '8650');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3016 2456 5690 7273', '04/2029', 'Travis Kimbrow', '874', '4211');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 4434 8283 6524', '08/2024', 'Venice Novy', '---', '1923');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2230 0502 8088 7848', '05/2028', 'Tamesha Devenney', '735', '9337');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 0062 0534 2766', '05/2031', 'Lewis Rager', '---', '9131');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6462 1716 2167 7647', '06/2031', 'Hiroko Reio', '960', '7160');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2515 3735 7178 9762', '09/2024', 'Santa Bringard', '321', '8059');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2355 0117 6299 7926', '06/2030', 'Arturo Deacon', '910', '8317');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6200 7631 3513 0043', '12/2026', 'Freda Spiva', '871', '2968');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3893 5296 3429 2884', '07/2029', 'Jenell Tafelski', '258', '2390');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UNIONPAY', '6206 5354 1491 4147', '11/2024', 'Donn Lobasso', '718', '3599');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2203 8050 6512 1413', '09/2024', 'Renda Passero', '801', '6900');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'AMERICAN EXPRESS', '3413 296680 26439', '11/2026', 'Sidney Vandygriff', '5260', '2800');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3025 4477 3723 2007', '07/2025', 'Ardelia Brakstad', '291', '5516');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4165 0377 1125 3273', '02/2031', 'Sana Marentis', '112', '9985');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 3660 2194 9138', '10/2028', 'Miriam Mcmillin', '---', '6384');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'AMERICAN EXPRESS', '3773 611773 47615', '12/2029', 'Maxima Adkins', '9506', '2620');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2200 6521 1937 7630', '09/2024', 'Patrina Kruchten', '345', '9880');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6442 0910 3795 9923', '04/2027', 'Kacie Fritsche', '553', '1949');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3529 6816 6442 7906', '05/2027', 'Georgette Kirts', '840', '3813');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3542 5266 7922 0510', '05/2027', 'Willian Tomassi', '241', '6382');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 7654 8996 0789', '06/2028', 'Myrtis Ericson', '---', '7184');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 5736 6053 8329', '02/2030', 'Conrad Schuerholz', '---', '8098');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6481 3081 8063 6385', '05/2027', 'Jenise Conboy', '210', '6497');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2513 1575 5639 1872', '10/2027', 'Rufina Buskohl', '354', '6979');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6510 6184 2265 1397', '01/2028', 'Nicki Englund', '119', '1154');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 3186 4625 5896', '12/2025', 'Thuy Gentz', '---', '8028');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 4848 0493 5660', '09/2027', 'Kacey Kolar', '730', '7489');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 4694 6323 1493', '02/2029', 'Eun Guillen', '522', '2831');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'VISA', '4937 1416 4472 9651', '11/2031', 'Myrle Runco', '971', '6033');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3851 7681 1291 8004', '10/2024', 'Dante Plaza', '252', '6447');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 8469 4190 0790', '08/2028', 'Vashti Bilden', '---', '3441');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4724 4600 0238 8943', '07/2025', 'Otilia Wimbs', '696', '4953');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5018 2771 6644 0209', '11/2025', 'Megan Kletschka', '690', '6842');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6496 9327 2905 8463', '11/2026', 'Soila Salley', '243', '1042');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2406 3734 9158 6423', '01/2026', 'Georgine Buhoveckey', '268', '9308');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2440 3569 1112 4469', '01/2028', 'Julio Nonaka', '516', '9065');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'UNIONPAY', '6250 0766 4899 8783', '04/2027', 'Natosha Pastures', '390', '3683');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6512 1300 4259 6505', '09/2024', 'Alta Drelick', '311', '6598');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'AMERICAN EXPRESS', '3772 682183 85514', '03/2025', 'Erika Tobola', '1066', '5900');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '4571 0513 3989 3228', '10/2028', 'Sumiko Lobb', '833', '1027');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3052 1628 9111 6724', '12/2027', 'Heather Barasch', '550', '4344');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('CREDIT', 'DISCOVER', '6490 5668 4268 8446', '09/2026', 'Sheena Winslow', '186', '6993');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3095 6191 8583 9989', '04/2027', 'Leonard Bilis', '611', '9596');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 1973 9681 6047', '10/2026', 'Janina Faylor', '---', '8332');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4500 8549 8794 2445', '11/2027', 'Joe Saur', '504', '9438');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2202 4791 2401 9744', '07/2028', 'Florentina Mctighe', '889', '3533');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 0939 3941 6584', '11/2030', 'Pamula Cicora', '---', '3002');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'VISA', '4210 4160 8563 9850', '11/2029', 'Leda Evangelist', '540', '4531');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2688 3777 5944 9116', '09/2029', 'Garret Nanthanong', '924', '3799');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 7806 5694 3887', '09/2026', 'Ricardo Gass', '---', '6996');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 1477 6872 1945', '01/2028', 'Stasia Weaber', '---', '1261');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3557 2140 5493 1793', '12/2025', 'Erika Intriago', '321', '9117');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 6447 6034 3546', '07/2030', 'Sherita Bratchett', '---', '9794');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3059 9841 6289 4751', '09/2027', 'Sterling Speno', '979', '4358');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 3389 6389 1702', '11/2031', 'Lawanda Becton', '618', '5060');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 9870 5213 3753', '12/2024', 'Celesta Futral', '---', '4938');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 7684 6814 2965', '11/2024', 'Frida Forsch', '---', '1509');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 5192 9172 3160', '11/2031', 'Alexis Spang', '---', '7157');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2200 2594 2633 5960', '01/2029', 'Dale Child', '889', '9940');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MAESTRO', '5038 6414 2205 2486', '04/2031', 'Lanie Przekop', '217', '9349');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3095 9363 3488 1914', '06/2029', 'Ima Helems', '249', '2993');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MASTERCARD', '2622 0577 6287 7342', '10/2031', 'Fabiola Pekas', '325', '5417');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 8378 0996 0919', '08/2027', 'Alecia Sankar', '---', '6508');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DANKORT', '5019 1540 9164 2655', '03/2028', 'Ellsworth Thiry', '526', '1447');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3028 3098 2957 7631', '09/2024', 'Mistie Eaton', '161', '7161');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'HUMO', '9860 6140 2744 6176', '08/2024', 'Terrell Rout', '---', '4722');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'MIR', '2202 0737 8991 9890', '06/2026', 'Muriel Fly', '453', '5532');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'UZCARD', '8600 9670 5313 3192', '08/2024', 'Nickole Behnke', '---', '9176');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'JCB', '3548 4796 1904 1485', '10/2029', 'Vita Varon', '250', '9366');
INSERT INTO card_data (type, brand, number, date, name, CVV, pin) VALUES ('DEBIT', 'DINERS CLUB INTERNATIONAL', '3822 8597 4107 7613', '11/2026', 'Melody Purtee', '646', '2901');
