User.destroy_all
puts 'Clean users'


5.times do
  user = User.create!(email: Faker::Internet.email,
                      address: "#{Faker::Address.street_address} #{Faker::Address.city} #{Faker::Address.zip} #{Faker::Address.country}",
                      last_name: Faker::Name.last_name,
                      first_name: Faker::Name.first_name,
                      pilot: [true, false].sample,
                      avatar: open(Faker::Avatar.image)
                      )
end
