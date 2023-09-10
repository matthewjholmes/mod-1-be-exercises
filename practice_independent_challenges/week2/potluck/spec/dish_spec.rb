require 'rspec'
require './lib/dish'

describe Dish do 

    # Iteration 1

    describe '#initalize' do
        it 'is a Dish' do 
            dish = Dish.new("Couscous Salad", :appetizer)
            expect(dish).to be_a Dish
        end

        it 'can return name' do 
            dish = Dish.new("Couscous Salad", :appetizer)
            expect(dish.name).to eq "Couscous Salad"            
        end

        it 'can return category' do
            dish = Dish.new("Couscous Salad", :appetizer)
            expect(dish.category).to eq :appetizer
        end
    end
end