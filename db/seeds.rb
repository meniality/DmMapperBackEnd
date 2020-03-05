Card.destroy_all
User.destroy_all


u1 = User.create(username: "Patrick", password: "1234")

Card.create(name: "Rastburg", short_description: "Town on the continent of Thulman", text:"A small village that contains approximetly 600 people. It has a small forge and an even smaller traders building.", user: u1)