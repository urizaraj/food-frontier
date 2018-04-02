# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (User has many Reviews) 
- [x] Include at least one belongs_to relationship (Review belongs to User)
- [x] Include at least one has_many through relationship (Restaurant has many Items through MenuItems)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (menu_items.entrees)
- [x] Include reasonable validations for simple model objects (User, Item, ItemTag, MenuItem, Restaurant, Review)
- [x] Include a class level ActiveRecord scope method (Restaurant.most_reviewed URL: restaurants/most_reviewed)
- [x] Include signup (Devise)
- [x] Include login (Devise)
- [x] Include logout (Devise)
- [x] Include third party signup/login (Devise/OmniAuth)
- [x] Include nested resource show or index (users/2/reviews)
- [x] Include nested resource "new" form (restaurants/1/menu_items/new)
- [x] Include form display of validation errors (/restaurants/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate