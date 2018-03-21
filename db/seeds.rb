# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

restaurants = [['Burger Planet',
                'The best burgers on the planet'],
               ['Pizza That!',
                'Pizza with all the toppings you can think of'],
               ['Ooh, Organic',
                'Fresh and delicious organic food'],
               ['Breakfast & Breakloose',
                'Great breakfast foods'],
               ['SubSolutions',
                'Subs and sandwiches']]

restaurants.each do |name, description|
  Restaurant.create(name: name, description: description)
end

items = ['Hamburger',
         'Cheeseburger',
         'Hotdog',
         'Fries',
         'Iced Tea',
         'Soda',
         'Pizza',
         'Salad',
         'Bean Burger',
         'Omelette',
         'Pancakes',
         'Juice',
         'Coffee',
         'Sub Sandwhich',
         'Club Sandwhich']

items.each do |item|
  Item.create(name: item)
end
