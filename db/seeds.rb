require 'faker'

#create users
5.times do 
  user = User.new(
    name:   Faker::Name.name,
    email:  Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

15.times do 
  Topic.create!(
    name:   Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
    )
end

topics = Topic.all


#create posts
50.times do 
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end

posts = Post.all

#create comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end


#Adding test users
#Test Admin User
admin = User.new(
  name:       'Admin User',
  email:      'admin@example.com',
  password:   'testtest',
  role:       'admin'
)
admin.skip_confirmation!
admin.save!

#Test moderator
moderator = User.new(
  name:       'moderator User',
  email:      'moderator@example.com',
  password:   'testtest',
  role:       'moderator'
)
moderator.skip_confirmation!
moderator.save!

#Test member
member = User.new(
  name:       'Member User',
  email:      'member@example.com',
  password:   'testtest'
)
member.skip_confirmation!
member.save!


puts "#{User.first.email} 1st email"
puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"