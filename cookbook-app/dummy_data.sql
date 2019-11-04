USE ltucook_db;

# delete existing data before reinserting
DELETE FROM Tag WHERE recipe_id > 0;
DELETE FROM User WHERE id > 0;
DELETE FROM Pic WHERE id > 0;
DELETE FROM Recipe WHERE id > 0;
DELETE FROM Category WHERE id > 0;

# reset primary keys to increment from 1
ALTER TABLE User AUTO_INCREMENT = 1;
ALTER TABLE Pic AUTO_INCREMENT = 1;
ALTER TABLE Recipe AUTO_INCREMENT = 1;
ALTER TABLE Category AUTO_INCREMENT = 1;
ALTER TABLE Tag AUTO_INCREMENT = 1;

INSERT INTO User (email, username, password, is_admin) VALUES
  ("bob@bob.com", "scarface", "def123B-2", 0),
  ("goofy@hotmail.com", "goofy", "g00f8a11", 0),
  ("lala@tinkywinky.com", "lala", "ttsay88", 0),
  ("shushu@gmail.com", "shushu", "jiggy_66", 0),
  ("admin@ltucook.com", "admin", "pass123", 1);
    
INSERT INTO Recipe (user_id, title, cost_per_serving, num_servings, when_posted, short_desc, ingredients, instructions) VALUES
    (3, "Apple Pie", 0.50, 4, NOW(), "An apple pie is a pie in which the principal filling ingredient is apple. It is, on occasion, served with whipped cream, ice cream, or cheddar cheese. The pastry part is generally used top-and-bottom, making it a double-crust pie. (Wikipedia)", '["2 large Bramley apples", "400g plain flour", "2 tbsp caster sugar", "250g cold butter"]', '["For the pastry, place the flour and sugar into the bowl and rub in the butter until the mixture resembles breadcrumbs.", "Set aside one-third of the pastry for the lid. Roll out the remaining pastry on a lightly floured surface. Lift the pastry over the rolling pin and lower it into the pie dish.", "Press the pastry firmly into the dish and up the sides."]'),
    (1, "Lentil Curry", 1.00, 2, NOW(), "A fast, cheap and healthy vegetarian meal which is also low in fat and freezable.", '["2 tbsp sunflower oil", "2 medium onions", "4 tbsp curry paste", "vegetable stock cube", "750g frozen vegetables", "100g red lentils", "200g basmati rice", "turmeric"]', '["Heat the oil in a large pan. Add the onions and cook over a high heat for about 8 minutes or until they are golden brown.", "Stir the frozen vegetables, cover and simmer for 5 minutes.", "While the curry is simmering, cook the rice, adding the turmeric to the cooking water."]');

INSERT INTO Pic (recipe_id, url) VALUES
	(1, "https://upload.wikimedia.org/wikipedia/commons/4/4b/Apple_pie.jpg"),
	(2, "https://upload.wikimedia.org/wikipedia/commons/3/39/Daal_after_Tadka_Pulse_Soup_India.jpg");

INSERT INTO Category (name) VALUES
	("dessert"),
	("vegetarian"),
	("main"),
	("vegan"),
	("one-pot-wonder");
    
INSERT INTO Tag (recipe_id, cat_id) VALUES
	(1, 1),
    (1, 2),
	(2, 2),
	(2, 3),
	(2, 4);
