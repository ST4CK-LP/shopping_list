SELECT `name`,`message` FROM `User` INNER JOIN `Message` ON User.id=Message.user WHERE Message.list=LIST;
