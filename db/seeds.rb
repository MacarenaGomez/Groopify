
user = User.new
user.name = 'User1'
user.email = 'user1@raul.com'
user.password = '12345678'
user.password_confirmation = '12345678'
user.save!

user = User.new
user.name = 'User2'
user.email = 'user2@raul.com'
user.password = '12345678'
user.password_confirmation = '12345678'
user.save!

user = User.new
user.name = 'User3'
user.email = 'user3@raul.com'
user.password = '12345678'
user.password_confirmation = '12345678'
user.save!

user = User.new
user.name = 'User4'
user.email = 'user4@raul.com'
user.password = '12345678'
user.password_confirmation = '12345678'
user.save!

user = User.new
user.name = 'User5'
user.email = 'user5@raul.com'
user.password = '12345678'
user.password_confirmation = '12345678'
user.save!


Pet.create(name:"gos1",species:"perro",age:1,user_id:1)
Pet.create(name:"moix1",species:"gato",age:2,user_id:1)
Pet.create(name:"peix1",species:"pez",age:3,user_id:2)
Pet.create(name:"serp1",species:"serpiente",age:4,user_id:2)
Pet.create(name:"gos2",species:"perro",age:1,user_id:2)
Pet.create(name:"moix2",species:"gato",age:2,user_id:3)
Pet.create(name:"peix2",species:"pez",age:3,user_id:3)
Pet.create(name:"serp2",species:"serpiente",age:4,user_id:4)
Pet.create(name:"gos3",species:"perro",age:1,user_id:4)
Pet.create(name:"moix3",species:"gato",age:2,user_id:5)
Pet.create(name:"peix3",species:"pez",age:3,user_id:5)
Pet.create(name:"serp3",species:"serpiente",age:4,user_id:5)