# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  Family has_many Users, Chore has_many Tasks, User has_many Tasks
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  User belongs_to Family, Task belongs_to Chore, Task belongs_to User
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  User has_many chores through tasks
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  Task.description
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  Chore - presence of name
  Family - uniqueness of name, length of password
  User - devise - adds presence of name
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  tasks/last_completed
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
  families/new creates a user with a nested form
- [x] Include signup (how e.g. Devise)
  Devise
- [x] Include login (how e.g. Devise)
  Devise
- [x] Include logout (how e.g. Devise)
  Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  Devise/Omniauth
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  families/:id/users
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  families/:id/chores/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  families/new
  families/:id/chores/new

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
