# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category_list = [
    "Arts",
    "Entertainment",
    "Culture",
    "Equality",
    "Health",
    "Industry",
    "Personal Development",
    "Politics",
    "Programming",
    "Science",
    "Self",
    "Society",
    "Technology"
]

general = Category.create!(name: "General")

category_list.each { |category| Category.create!(name: category)}

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
    username: "cyercyer",
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

30.times {
    OpinionCategory.create!(
        opinion_id: Opinion.all.sample.id,
        category_id: Category.all.sample.id
    )
}

15.times {
    UserCategory.create!(
        user_id: User.all.sample.id,
        category_id: Category.all.sample.id
    )
}

Opinion.all.each do |opinion|
    if opinion.categories.length < 0
        OpinionCategory.create!(
            opinion_id: opinion.id,
            category_id: general.id
        )
    end
end