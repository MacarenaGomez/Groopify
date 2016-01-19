# (1..5).each do |num|
#   User.create(
#     name: "User #{num.to_s}",
#     email: "#{num}@#{num}.com",
#     password: '12345678',
#     password_confirmation: '12345678'
#   )
# end


# (1..12).each do |num|
#   Pet.create(
#     name: "User #{num.to_s}",
#     species: ['Perro','Gato','Rata','Chinchilla','Otros'].sample,
#     age: Random.new.rand(1..12),
#     user_id: Random.new.rand(1..5),
#     image: nil
#   )
# end