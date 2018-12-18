INSERT INTO `User`(`id`,`user_type`,`name`,`surname`,`avatar`,`email`,`password`)
VALUES
(1,0,'Lorenzo','Pilati','user1.jpg','lorenzo.pilati-3@studenti.unitn.it','b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86'),
(2,0,'Lorenzo','Chini','user2.jpg','lorenzo.chini@studenti.unitn.it','b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86'),
(3,0,'Amanda','Rossi','user3.jpg','amandarossi@gmail.com','b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86'),
(4,1,'Claudio','Verdi','user4.jpg','claudioverdi@gmail.com','b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86'),
(5,1,'Sara','Allegri','user5.jpg','sara.allegri@gmail.com','b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86'),
(6,1,'Chiara','Sarri','user6.jpg','chiara_sarri@gmail.com','b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86'),
(7,1,'Luca','Prandelli','user7.jpg','prandelliluca@gmail.com','b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86'),
(8,1,'Marco','Ventura','user8.jpg','mventura@gmail.com','b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86'),
(9,1,'Matteo','Conte','user9.jpg','matteo.conte@gmail.com','b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86'),
(10,1,'Lucia','Spalletti','user10.jpg','lucia_spalletti@gmail.com','b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86');

INSERT INTO `ShoppingListCategory`(`id`,`name`,`description`,`image`)
VALUES
(1,'Grocery Store','Where to buy food','slc1.jpg'),
(2,'Supermarket','Where to buy almost everything','slc2.jpg'),
(3,'Pharmacy','Where to buy everything regardings health','slc3.jpg'),
(4,'Hardware store','Where to buy nails and similars','slc4.jpg');

INSERT INTO `ShoppingList`(`id`,`name`,`description`,`image`,`category`)
VALUES
(1,'Birthday Party','Items for Saras birthday party','sl1.jpg',2),
(2,'Grandmas medicines','Medicines for grandma','sl2.jpg',3),
(3,'Hardware','Items to build the new railing','sl3.jpg',4);

INSERT INTO `ProductCategory`(`id`,`name`,`description`,`image`)
VALUES
(1,'Food','Food','pc1.jpg'),
(2,'Beverage','Drinks','pc2.jpg'),
(3,'Decorations','Decorations for parties','pc3.jpg'),
(4,'Medicines','Medicines','pc4.jpg'),
(5,'Hardware','Screw, nails and so on','pc5.jpg');

INSERT INTO `Product`(`id`,`name`,`logo`,`creator`,`category`)
VALUES
(1,'Chips','product1.jpg',NULL,1),
(2,'Pop-corn','product2.jpg',NULL,1),
(3,'Cake','product3.jpg',NULL,1),
(4,'Apples','product4.jpg',NULL,1),
(5,'Strawberries','product5.jpg',NULL,1),
(6,'Biscuits','product6.jpg',NULL,1),
(7,'Bread','product7.jpg',NULL,1),
(8,'Beef steak','product8.jpg',NULL,1),
(9,'Tuna','product9.jpg',NULL,1),
(10,'Pasta','product10.jpg',NULL,1),
(11,'Cola','product11.jpg',NULL,2),
(12,'Water','product12.jpg',NULL,2),
(13,'Sprite','product13.jpg',NULL,2),
(14,'Orange juice','product14.jpg',NULL,2),
(15,'Lemon juice','product15.jpg',NULL,2),
(16,'Fanta','product16.jpg',NULL,2),
(17,'Beer','product17.jpg',NULL,2),
(18,'White wine','product18.jpg',NULL,2),
(19,'Red wine','product19.jpg',NULL,2),
(20,'Ice tea','product20.jpg',NULL,2),
(21,'Flags','product21.jpg',NULL,3),
(22,'Hats','product22.jpg',NULL,3),
(23,'Ballons','product23.jpg',NULL,3),
(24,'Confetti','product24.jpg',NULL,3),
(25,'Forks','product25.jpg',NULL,3),
(26,'Plates','product26.jpg',NULL,3),
(27,'Glasses','product27.jpg',NULL,3),
(28,'Candles','product28.jpg',NULL,3),
(29,'Knifes','product29.jpg',NULL,3),
(30,'Table cloth','product30.jpg',NULL,3),
(31,'Aspirin','product31.jpg',NULL,4),
(32,'Vitamins','product32.jpg',NULL,4),
(33,'Excedrin','product33.jpg',NULL,4),
(34,'Theraflu','product34.jpg',NULL,4),
(35,'Dristan','product35.jpg',NULL,4),
(36,'Cepacol','product36.jpg',NULL,4),
(37,'Actifed','product37.jpg',NULL,4),
(38,'Vicks','product38.jpg',NULL,4),
(39,'Oxycodone','product39.jpg',NULL,4),
(40,'Endocet','product40.jpg',NULL,4),
(41,'Nails','product41.jpg',NULL,5),
(42,'Screw','product42.jpg',NULL,5),
(43,'Screwdriver','product43.jpg',NULL,5),
(44,'Iron bar','product44.jpg',NULL,5),
(45,'Hammer','product45.jpg',NULL,5),
(46,'Pincer','product46.jpg',NULL,5),
(47,'Nipper','product47.jpg',NULL,5),
(48,'Allen','product48.jpg',NULL,5),
(49,'Bolt','product49.jpg',NULL,5),
(50,'Washer','product50.jpg',NULL,5);

INSERT INTO `Photo`(`id`,`photo`,`product`)
VALUES
(1,'photo1.jpg',1),
(2,'photo2.jpg',1),
(3,'photo3.jpg',2),
(4,'photo4.jpg',2),
(5,'photo5.jpg',6),
(6,'photo6.jpg',6),
(7,'photo7.jpg',6),
(8,'photo8.jpg',11);

INSERT INTO `Permission`(`id`,`user`,`list`,`permission`)
VALUES
(1,1,1,1),
(2,3,1,0),
(3,2,2,1),
(4,4,2,0),
(5,1,3,1),
(6,2,3,0),
(7,6,3,0);

INSERT INTO `ListProducts`(`id`,`list`,`product`)
VALUES
(1,1,1),
(2,1,2),
(3,1,3),
(4,1,11),
(5,2,36),
(6,2,39),
(7,3,44),
(8,3,42),
(9,3,43),
(10,3,48);

INSERT INTO `Message`(`id`,`message`,`list`,`user`)
VALUES
(1,'List updtated, check it!',1,1),
(2,'Shopping made!',1,3),
(3,'List updtated, check it!',3,6);

