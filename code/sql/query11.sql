SELECT ShoppingList.name, ShoppingListCategory.name,  ShoppingList.description, ShoppingList.image FROM `ShoppingList` INNER JOIN `ShoppingListCategory` ON ShoppingList.category=ShoppingListCategory.id WHERE ShoppingList.id=ID;
SELECT `name`,`notes` FROM `Product` INNER JOIN `ListProducts` ON Product.id=ListProducts.product WHERE ListProducts.list=ID;
