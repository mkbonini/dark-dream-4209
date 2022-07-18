class Recipe < ApplicationRecord
    validates :name, presence: true
    validates :complexity, presence: true
    validates :genre, presence: true
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    def total_cost 
        ingredients.pluck(:cost).sum
    end

    def self.order_by_name
        Recipe.order("name")
    end
end