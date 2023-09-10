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

    # Iteration 3

    describe '#get_all_from_category' do 
        it 'can filter potluck dishes by category' do
            potluck = Potluck.new("7-13-18")
            couscous_salad = Dish.new("Couscous Salad", :appetizer)            
            summer_pizza = Dish.new("Summer Pizza", :appetizer)            
            roast_pork = Dish.new("Roast Pork", :entre)
            cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
            candy_salad = Dish.new("Candy Salad", :dessert)

            potluck.add_dish(couscous_salad)
            potluck.add_dish(summer_pizza)
            potluck.add_dish(roast_pork)
            potluck.add_dish(cocktail_meatballs)
            potluck.add_dish(candy_salad)

            expect(potluck.get_all_from_category(:appetizer)).to eq [couscous_salad, summer_pizza]
            expect(potluck.get_all_from_category(:appetizer).first).to eq couscous_salad
            expect(potluck.get_all_from_category(:appetizer).first.name).to eq "Couscous Salad"
        end
    end
    
    # Iteration 4

    before(:each) do 
        @potluck = Potluck.new("7-13-18")
        couscous_salad = Dish.new("Couscous Salad", :appetizer)
        summer_pizza = Dish.new("Summer Pizza", :appetizer)
        roast_pork = Dish.new("Roast Pork", :entre)
        cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        candy_salad = Dish.new("Candy Salad", :dessert)
        bean_dip = Dish.new("Bean Dip", :appetizer)
        @potluck.add_dish(couscous_salad)
        @potluck.add_dish(summer_pizza)
        @potluck.add_dish(roast_pork)
        @potluck.add_dish(cocktail_meatballs)
        @potluck.add_dish(candy_salad)
        @potluck.add_dish(bean_dip)
    end

    describe '#menu' do
        it '#menu_categories helper method returns all represented categories as symbols' do
            expect(@potluck.menu_categories).to eq [:appetizer, :entre, :dessert]
            expect(@potluck.menu_categories.sample.class).to eq Symbol    
        end

        it '#menu returns a hash with categories as keys and dish names in arrays for values' do 
            expect(@potluck.menu.class).to eq Hash
            @potluck.menu_categories.each do |cat|
                expect(@potluck.menu.include?(cat)).to eq true
            end
            @potluck.menu_categories.each do |cat|
                expect(@potluck.menu[cat].class).to eq Array
            end
        end
        
        it 'menu categories are sorted alphabetically' do 
            expect(@potluck.menu).to eq({:appetizer=>["Bean Dip", "Couscous Salad", "Summer Pizza"],:entre=>["Cocktail Meatballs", "Roast Pork"],:dessert=>["Candy Salad"]})
        end
    end

    describe '#ratio' do
        it 'calculates the decimal fraction of a category dish count to the potluck total dish count' do 
            expect(@potluck.ratio(:appetizer)/100).to eq 0.5
        end
        
        it 'packages ratio as percentage Float' do 
            expect(@potluck.ratio(:appetizer).class).to eq Float
            expect(@potluck.ratio(:appetizer)).to eq 50.0
        end
    end
end