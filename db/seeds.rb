last_user_id = User.last.id
100.times do |n|
  #n = 0~99
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.name 
  uid = SecureRandom.uuid
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    uid: uid,
    )

  Picture.create!(
    image: open("#{Rails.root}/db/data/sample.png"),
    user_id: last_user_id + 1 + n,
    )
end