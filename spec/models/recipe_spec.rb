require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe 'methods' do
    it 'returns total cost' do
      pasta = Recipe.create!(name: 'spaghetti', complexity: 1, genre: 'italian')
      noodles = Ingredient.create!(name: 'spaghetti noodles', cost: 2)
      chicken = Ingredient.create!(name: 'grilled chicken', cost: 3)
      sauce = Ingredient.create!(name: 'red sauce', cost: 4)

      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: pasta.id, ingredient_id: noodles.id)
      recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: pasta.id, ingredient_id: chicken.id)
      recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: pasta.id, ingredient_id: sauce.id)

      expect(pasta.total_cost).to eq(9)
    end

    it 'orders by name alphabetically' do
      pasta = Recipe.create!(name: 'spaghetti', complexity: 1, genre: 'italian')
      sandwhich = Recipe.create!(name: 'pulled pork', complexity: 2, genre: 'bbq')
      chicken = Recipe.create!(name: 'chicken salad', complexity: 3, genre: 'salad')

      expect(Recipe.order_by_name).to match_array([chicken, sandwhich, pasta])
    end
  end
end
