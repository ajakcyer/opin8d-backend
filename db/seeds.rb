# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ajak = User.create!(
    first_name: "Ajak",
    last_name: "Cyer",
    username: "ajakcyer",
    password: "123",
    email: "ajak97@gmail.com"
)

Cyer = User.create!(
    first_name: "Cyer",
    last_name: "Cyer",
    username: "cyeryer",
    password: "123",
    email: "cyercyer@gmail.com"
)

3.times {
    User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name ,
        username: Faker::Internet.username,
        password: "123",
        email: Faker::Internet.free_email
        )
}

15.times {
    Opinion.create!(
        user_id: User.all.sample.id,
        title: Faker::Book.title,
        content: Faker::Lorem.paragraphs.join(" ")
    )
}