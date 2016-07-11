require 'faker'

3.times do
  Post.create({
    :body => Faker::Lorem.paragraph(8, false, 2),
    :hometown => Faker::Address.city,
    :guest_name => Faker::Name.first_name,
    :likes_count => rand(5)
  })
end
