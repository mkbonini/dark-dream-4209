# Hells Kitchen
### by: Mike Bonini
#### Completed all user stories and extentions

Fork this repository and clone your newly created repository. 

## Be sure to read all user stories BEFORE beginning your work
---

## Setup

* Fork this repository
* Clone down your forked repository
* Perform the usual setup steps after cloning a Rails application:
  - `bundle install`
  - `rails db:{create,migrate,seed}`
---
### Submission

When you have completed this challenge, At the end of the challenge, DM all three instructors with your repository link. Include a reflection on how you felt you did with this challenge and what story you got through

---
### Requirements

* TDD all new work
* any model METHODS you write must be fully tested.
* any model RELATIONSHIPS you create must be fully tested.
---

### Not Required

* No visual styling is required or expected
* No model testing for validations are required
---

When you run rspec, you should have 11 failing tests to start.  

###  Overview

We will be creating an application to track recipes and ingredients at Hell's Kitchen. 

Recipes will have a name, complexity and genre. For example Pasta, 2 (integer), Italian.

Ingredients will have a name and a cost stored as an integer.

 
### User Stories
 
```
User Story 1 of 4
As a visitor,
When I visit '/recipes',
I see a list of recipes with the following information:
-Name
-Complexity
-Genre
(e.g. "Name: Spaghetti, Complexity: 2, Genre: Italian")
```
```
User Story 2 of 4
As a visitor,
When I visit '/recipes/:id'
I see a list of the names of the ingredients the recipe has.
(e.g. "Pasta, Meat, Cheese")
```
```
User Story 3 of 4
As a visitor,
When I visit '/ingredients'
I see a list of ingredients and the number of recipes each ingredient is used in.
(e.g. "Ground Beef: 2"
     "Salt: 4")
```
```
User Story 4 of 4
As a visitor,
When I visit '/recipes/:id'
I see the total cost of all of the ingredients in the recipe.
(e.g. "Total Cost: 22")
```
---
### Extension
```
User Story Extension
On all index pages, all information is listed alphabetically.
	

