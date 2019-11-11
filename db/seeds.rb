# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  )
end

puts '10 blog posts created'

5.times { |skill| Skill.create!(title: "Rails #{skill}", percent_utilized: 15) }

puts '5 skills created'

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio item #{portfolio_item}",
    subtitle: 'Lorem ipsum dolor sit amet',
    body:
      'Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    main_image: 'http://placehold.it/600/400',
    thumb_image: 'http://placehold.it/300/150'
  )
end

puts '9 portfolio items created'
