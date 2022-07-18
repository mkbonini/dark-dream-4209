require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'methods' do
    it 'should return count of recipes for each ingredient' do
      noodles = Ingredient.create!(name: 'spaghetti noodles', cost: 2)
      chicken = Ingredient.create!(name: 'grilled chicken', cost: 3)
      bread = Ingredient.create!(name: 'white bread', cost: 4)

      pasta = Recipe.create!(name: 'spaghetti', complexity: 1, genre: 'italian')
      sandwhich = Recipe.create!(name: 'pulled pork', complexity: 2, genre: 'bbq')


      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: pasta.id, ingredient_id: noodles.id)
      recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: pasta.id, ingredient_id: chicken.id)
      recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: sandwhich.id, ingredient_id: chicken.id)

      expect(noodles.recipe_count).to eq(1)
      expect(chicken.recipe_count).to eq(2)
      expect(bread.recipe_count).to eq(0)
    end
  end
end
