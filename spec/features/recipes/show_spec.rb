require 'rails_helper'

RSpec.describe 'recipe show page' do
    it 'lists ingredients in recipe' do
        pasta = Recipe.create!(name: 'spaghetti', complexity: 1, genre: 'italian')
        sandwhich = Recipe.create!(name: 'pulled pork', complexity: 2, genre: 'bbq')

        noodles = Ingredient.create!(name: 'spaghetti noodles', cost: 2)
        chicken = Ingredient.create!(name: 'grilled chicken', cost: 3)
        bread = Ingredient.create!(name: 'white bread', cost: 4)

        recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: pasta.id, ingredient_id: noodles.id)
        recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: pasta.id, ingredient_id: chicken.id)
        recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: sandwhich.id, ingredient_id: chicken.id)
        recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: sandwhich.id, ingredient_id: bread.id)

        visit "/recipes/#{pasta.id}"

        expect(page).to have_content("spaghetti noodles")
        expect(page).to have_content("grilled chicken")
        expect(page).to_not have_content("white bread")
    end
end