User.destroy_all

#drone pilots
user1 = User.create(first_name:"Samantha", last_name: "Banana", email: "test@mail.com", password: "password", pilot: true, address:"beirut")
user2 = User.create(first_name:"Alex", last_name: "White", email: "test2@mail.com", password: "password", pilot: true, address:"barcelona")
user3 = User.create(first_name:"Santa", last_name: "Claus", email: "test3@mail.com", password: "password", pilot: true, address:"paris")

#service seekers
user4 = User.create(first_name:"Hans", last_name: "Blue", pilot: false, email: "test4@mail.com", password: "password")
user5 = User.create(first_name:"jack", last_name: "Red", pilot: false, email: "test5@mail.com", password: "password")
user6 = User.create(first_name:"Kathrin", last_name: "Gray", pilot: false, email: "test6@mail.com", password: "password")

operator1 = OperatorProfile.create(skills:"editing, color correction", user: user1, company_name:"awesomesaus")
operator2 = OperatorProfile.create(skills:"editing, color correction", user: user2)
operator3 = OperatorProfile.create(skills:"editing, color correction", user: user3)

proposal1 = Proposal.create(operator_profile: operator1, user: user4, status:"confirmed", date:"7/12/2016", price_per_day: 250, content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe vel aperiam harum reiciendis velit, autem itaque pariatur deserunt at assumenda voluptates quasi laborum doloremque fuga aspernatur mollitia quaerat soluta ratione.")
proposal2 = Proposal.create(operator_profile: operator2, user: user5, status:"declined", date:"15/9/2016", price_per_day: 270, content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eveniet et dolor voluptate officia blanditiis eum numquam suscipit reiciendis, incidunt non, impedit, quibusdam velit praesentium nulla alias quis obcaecati nihil rerum.")
proposal3 = Proposal.create(operator_profile: operator3, user: user6, status:"in progress", date:"8/10/2016", price_per_day: 200, content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex repellat, vero optio deserunt. Molestias incidunt, at maxime cupiditate, dolorum pariatur veniam nostrum tempora corrupti et culpa non perspiciatis blanditiis sapiente.")


review1 = Review.create(content: "it was okay.", rating: 2, proposal: proposal1)
review2 = Review.create(content: "great view and amazing pictures!", rating: 4, proposal: proposal2)
review3 = Review.create(content: "Beautiful editing!", rating: 5, proposal: proposal3)

video1 = Video.create(operator_profile: operator1, url: "https://www.youtube.com/watch?v=XQu8TTBmGhA" )

# video1 = operator1.create(url: "https://www.youtube.com/watch?v=XQu8TTBmGhA" )
# video2 = operator2.create(url: "https://www.youtube.com/watch?v=XQu8TTBmGhA" )
# video3 = operator3.create(url: "https://www.youtube.com/watch?v=XQu8TTBmGhA" )

# image1 = operator1.create(url: "http://www.engraversnetwork.com/files/placeholder.jpg" )
# image2 = operator2.create(url: "http://www.engraversnetwork.com/files/placeholder.jpg" )
# image3 = operator3.create(url: "http://www.engraversnetwork.com/files/placeholder.jpg" )
