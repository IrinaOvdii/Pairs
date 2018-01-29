Pair.destroy_all
User.destroy_all

user1 = User.create!(name: "Irina", email: "user1@gmail.com", password: 123456, admin: true)
user2 = User.create!(name: "Erle", email: "user2@gmail.com", password: 123456, admin: false)
user3 = User.create!(name: "Oskar", email: "user3@gmail.com", password: 123456, admin: false)
user4 = User.create!(name: "Lillian", email: "user4@gmail.com", password: 123456, admin: false)
user5 = User.create!(name: "Arno", email: "user5@gmail.com", password: 123456, admin: false)
user6 = User.create!(name: "Bobby", email: "user6@gmail.com", password: 123456, admin: false)


pair1 = Pair.create!(student_id: 3, match_id: 2)
pair2 = Pair.create!(student_id: 3, match_id: 4)
pair3 = Pair.create!(student_id: 4, match_id: 5)
pair4 = Pair.create!(student_id: 4, match_id: 5)
