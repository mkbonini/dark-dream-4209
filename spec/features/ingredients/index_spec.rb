require 'rails_helper'

RSpec.describe 'ingredients index page' do
    it 'lists all ingredients' do
        noodles = Ingredient.create!(name: 'spaghetti noodles', cost: 2)
        chicken = Ingredient.create!(name: 'grilled chicken', cost: 3)
        bread = Ingredient.create!(name: 'white bread', cost: 4)

        visit '/ingredients'

        expect(page).to have_content("spaghetti noodles")
        expect(page).to have_content("grilled chicken")
        expect(page).to have_content("white bread")
    end

    it 'shows the number of recipes an ingredient is used in' do
        noodles = Ingredient.create!(name: 'spaghetti noodles', cost: 2)
        chicken = Ingredient.create!(name: 'grilled chicken', cost: 3)
        bread = Ingredient.create!(name: 'white bread', cost: 4)

        pasta = Recipe.create!(name: 'spaghetti', complexity: 1, genre: 'italian')
        sandwhich = Recipe.create!(name: 'pulled pork', complexity: 2, genre: 'bbq')


        recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: pasta.id, ingredient_id: noodles.id)
        recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: pasta.id, ingredient_id: chicken.id)
        recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: sandwhich.id, ingredient_id: chicken.id)

        visit '/ingredients'

        expect(page).to have_content("spaghetti noodles: 1")
        expect(page).to have_content("grilled chicken: 2")
        expect(page).to have_content("white bread: 0")
    end
end