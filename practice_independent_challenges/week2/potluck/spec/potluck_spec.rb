require 'rspec'
require './lib/dish'
require './lib/potluck'

describe Potluck do

    # Iteration 2

    describe '#initialize' do
        it 'is a Potluck' do 
            potluck = Potluck.new("7-13-18")
            expect(potluck).to be_a Potluck
        end

        it 'can return date' do 
            potluck = Potluck.new("7-13-18")
            expect(potluck.date).to eq ("7-13-18")
        end

        it 'returns an empty array of dishes by default' do
            potluck = Potluck.new("7-13-18")
            expect(potluck.dishes).to eq []
        end
    end

    describe '#add_dish' do
        it 'can add dishes to potluck dishes arry' do 
            potluck = Potluck.new("7-13-18")
            couscous_salad = Dish.new("Couscous Salad", :appetizer)
            cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
            potluck.add_dish(couscous_salad)
            potluck.add_dish(cocktail_meatballs)

            expect(potluck.dishes).to eq [couscous_salad, cocktail_meatballs]
            expect(potluck.dishes.length).to eq 2
        end
    end

end