class Ingredient < ApplicationRecord
    validates :name, presence: true
    validates :cost, presence: true

    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients

    def recipe_count
        recipes.count
    end

    def self.order_by_name
        Ingredient.order("name")
    end
end