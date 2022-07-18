require 'rails_helper'

RSpec.describe 'recipes index page' do
    it 'displays name/complexity/genre of recipes' do
        pasta = Recipe.create!(name: 'spaghetti', complexity: 1, genre: 'italian')
        sandwhich = Recipe.create!(name: 'pulled pork', complexity: 2, genre: 'bbq')
        chicken = Recipe.create!(name: 'chicken salad', complexity: 3, genre: 'salad')

        visit '/recipes'


        within "#recipes-#{pasta.id}" do
            expect(page).to have_content('spaghetti')
            expect(page).to have_content(1)
            expect(page).to have_content('italian')
        end

        within "#recipes-#{sandwhich.id}" do
            expect(page).to have_content('pulled pork')
            expect(page).to have_content(2)
            expect(page).to have_content('bbq')
        end

        within "#recipes-#{chicken.id}" do
            expect(page).to have_content('chicken salad')
            expect(page).to have_content(3)
            expect(page).to have_content('salad')
        end
    end
end