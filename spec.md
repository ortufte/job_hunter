# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project - Used Ruby on Rails 

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    User has_many opportunities and user_qualifications
    Opportunity has_many :opportunity_qualifications and :tasks
    Qualification has_many :opportunity_qualifications, and :user_qualifications

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) 
    Opportunity belongs_to :user
    Task belongs_to :opportunity
    OpportunityQualification belongs_to :opportunity and :qualification
    UserQualification belongs_to :user and :qualification 

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    User has_many :tasks, through: :opportunities and has_many :qualifications, through: :user_qualifications
    Opportunity has_many :qualifications, through: :opportunity_qualifications
    Qualification has_many :opportunities, through: :opportunity_qualifications and has_many :users, through: :user_qualifications 

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    Opportunity has_many :qualifications
    Qualification has_many :opportunities

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    User has_many :qualifications, through: :user_qualifications
    UserQualification includes a user submittable comment attribute

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    Validations on User, Opportunity, Qualification, and Task

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    scope method for Task, :urgent

- [x] Include signup (how e.g. Devise)
    built create method in users controller

- [x] Include login (how e.g. Devise)
    built create method in sessions controller

- [x] Include logout (how e.g. Devise)
    built destroy method in sessions controller

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    Omniauth Google

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    /users/:user_id/opportunities/:id

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    /users/:user_id/opportunities/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    signup and login validation error messages display on index page (where login and signup forms are located)

Confirm:
- [x] The application is pretty DRY - Planning to cleanup while waiting for review
- [x] Limited logic in controllers  - Planning to cleanup while waiting for review
- [x] Views use helper methods if appropriate - Planning to cleanup while waiting for review
- [x] Views use partials if appropriate - Planning to cleanup while waiting for review