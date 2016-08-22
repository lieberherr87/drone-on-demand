User.destroy_all
puts 'Clean users'

avatars = %w(119 120 121 122 123 124 125 126 127 128 129)


5.times do
  user = User.create!(email: Faker::Internet.email,
                      address: "#{Faker::Address.street_address} #{Faker::Address.city} #{Faker::Address.zip} #{Faker::Address.country}",
                      last_name: Faker::Name.last_name,
                      first_name: Faker::Name.first_name,
                      password: 'password',
                      password_confirmation: 'password',
                      pilot: [true, false].sample,
                      avatar: open(File.join(Rails.root, "db/images/#{avatars.sample}.jpg"))
                      )
  puts "Create user #{user.email}"
end
