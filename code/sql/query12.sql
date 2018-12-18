SELECT User.name, Permission.permission FROM `User` INNER JOIN `Permission` ON User.id=Permission.user WHERE Permission.list=LIST;
