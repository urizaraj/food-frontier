# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

restaurants = [
  ['Burger Planet', 'The best burgers on the planet'],
  ['Pizza That!', 'Pizza with all the toppings you can think of'],
  ['Ooh, Organic', 'Fresh and delicious organic food'],
  ['Breakfast & Breakloose', 'Great breakfast foods'],
  ['SubSolutions', 'Subs and sandwiches']
]

restaurants.each do |name, description|
  Restaurant.create(name: name, description: description)
end

entree = ItemTag.create(name: 'Entree')
side = ItemTag.create(name: 'Side')
drink = ItemTag.create(name: 'Drink')

entrees = [
  'Hamburger',
  'Cheeseburger',
  'Hotdog',
  'Pizza',
  'Bean Burger',
  'Salad',
  'Omelette',
  'Pancakes',
  'Sub Sandwich',
  'Club Sandwich'
]

drinks = [
  'Soda',
  'Iced Tea',
  'Juice',
  'Coffee',
]

entrees.each do |name|
  item = Item.new(name: name)
  item.item_tags << entree
  item.save
end

drinks.each do |name|
  item = Item.new(name: name)
  item.item_tags << drink
  item.save
end

fries = Item.new(name: 'Fries')
fries.item_tags << side
fries.save