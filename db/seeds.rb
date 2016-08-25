User.destroy_all
Skill.destroy_all

puts 'Clean users'

avatars = %w(119 120 121 122 123 124 125 126 127 128 129)
skills = ["video editing","piloting", "color correction"]

skills.each do |skill|
  Skill.create(name: skill)
end

20.times do
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

  if !user.pilot?
    user.requests.create!(location: "#{Faker::Address.street_address} #{Faker::Address.city} #{Faker::Address.zip} #{Faker::Address.country}",
                          due_date: Date.today + rand(1..10).days, category: 'marketing')
  else
    operator_profile = user.create_operator_profile!(company_name: Faker::Company.name,
                                                     description: Faker::Lorem.sentence(3)
                                                     )
    puts "Create operator_profile for #{user.email}"
    3.times do
      operator_profile.videos.create!(url: 'https://www.youtube.com/watch?v=XQu8TTBmGhA')
      # operator_profile.images.create!(image: 'http://lorempixel.com/400/200/city')
      operator_profile.operator_skills.create(skill: Skill.all.sample)
    end
    puts 'Add photos and videos'
  end
end

User.where(pilot: true).each do |user|
  user.proposals.create(price: rand(100..200),
                        content: Faker::Lorem.sentence(3),
                        request: Request.all.sample
                        )
end


puts 'Create proposals'

